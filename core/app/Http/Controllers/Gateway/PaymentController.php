<?php

namespace App\Http\Controllers\Gateway;

use App\Constants\Status;
use App\Http\Controllers\Controller;
use App\Lib\FormProcessor;
use App\Models\AdminNotification;
use App\Models\Deposit;
use App\Models\GatewayCurrency;
use App\Models\Transaction;
use App\Models\User;
use App\Traits\BookingOrder;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    use BookingOrder;

    public function deposit()
    {
        $pageTitle       = 'Deposit Methods';
        $gatewayCurrency = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->where('status', Status::ENABLE);
        })->with('method')->orderby('method_code')->get();
        return view($this->activeTemplate . 'user.payment.deposit', compact('gatewayCurrency', 'pageTitle'));
    }

    public function depositInsert(Request $request, $orderNumber = null)
    {
        $request->validate([
            'amount'   => 'required|numeric|gt:0',
            'gateway'  => 'required',
            'currency' => 'required',
        ]);

        $user         = auth()->user();
        $amount       = $request->amount;
        $bookingId    = 0;
        $orderDetails = session('orderDetails');
        $gate         = GatewayCurrency::whereHas('method', function ($gate) {
            $gate->where('status', Status::ENABLE);
        })->where('method_code', $request->gateway)->where('currency', $request->currency)->first();
        if (!$gate) {
            $notify[] = ['error', 'Invalid gateway'];
            return back()->withNotify($notify);
        }

        if ($orderNumber) {
            if (!$orderDetails) {
                $notify[] = ['error', 'Order booking not found!'];
                return to_route('home')->withNotify($notify);
            }

            if ($orderDetails['orderNumber'] != $orderNumber) {
                $notify[] = ['error', 'Order booking not found!'];
                return to_route('home')->withNotify($notify);
            }

            $amount        = $orderDetails['grandTotal'];
            $bookingCreate = static::bookingCreate($orderDetails);

            if (!$bookingCreate) {
                $notify[] = ['error', 'Order booking not found!'];
                return to_route('home')->withNotify($notify);
            }
            $bookingId = $bookingCreate->id;
        } else {

            if ($gate->min_amount > $amount || $gate->max_amount < $amount) {
                $notify[] = ['error', 'Please follow deposit limit'];
                return back()->withNotify($notify);
            }
        }

        $charge      = $gate->fixed_charge + ($amount * $gate->percent_charge / 100);
        $payable     = $amount + $charge;
        $finalAmount = $payable * $gate->rate;

        $data                  = new Deposit();
        $data->user_id         = $user->id;
        $data->order_number    = $orderNumber ? $orderNumber : null;
        $data->booking_id      = $bookingId;
        $data->method_code     = $gate->method_code;
        $data->method_currency = strtoupper($gate->currency);
        $data->amount          = $amount;
        $data->charge          = $charge;
        $data->rate            = $gate->rate;
        $data->final_amount    = $finalAmount;
        $data->btc_amo         = 0;
        $data->btc_wallet      = "";
        $data->trx             = $orderNumber ? $orderNumber : getTrx();
        $data->save();

        session()->put('Track', $data->trx);
        return to_route('user.deposit.confirm');
    }


    public function depositConfirm()
    {
        $track = session('Track');
        $deposit = Deposit::where('trx', $track)->where('status', Status::PAYMENT_INITIATE)->orderBy('id', 'DESC')->with('gateway')->firstOrFail();

        if ($deposit->method_code >= 1000) {
            return to_route('user.deposit.manual.confirm');
        }

        $dirName = $deposit->gateway->alias;
        $new = __NAMESPACE__ . '\\' . $dirName . '\\ProcessController';

        $data = $new::process($deposit);
        $data = json_decode($data);

        if (isset($data->error)) {
            $notify[] = ['error', $data->message];
            return to_route(gatewayRedirectUrl())->withNotify($notify);
        }
        if (isset($data->redirect)) {
            return redirect($data->redirect_url);
        }

        // for Stripe V3
        if (@$data->session) {
            $deposit->btc_wallet = $data->session->id;
            $deposit->save();
        }

        $pageTitle = 'Payment Confirm';
        return view($this->activeTemplate . $data->view, compact('data', 'pageTitle', 'deposit'));
    }

    public static function userDataUpdate($deposit, $isManual = null)
    {

        if ($deposit->status == Status::PAYMENT_INITIATE || $deposit->status == Status::PAYMENT_PENDING) {
            $deposit->status = Status::PAYMENT_SUCCESS;
            $deposit->save();

            $user = User::find($deposit->user_id);
            $user->balance += $deposit->amount;
            $user->save();

            $notificationTitle = 'Deposit successful via ' . $deposit->gatewayCurrency()->name;
            $clickUrl = urlPath('admin.deposit.successful');

            $transaction               = new Transaction();
            $transaction->user_id      = $deposit->user_id;
            $transaction->amount       = $deposit->amount;
            $transaction->post_balance = $user->balance;
            $transaction->charge       = $deposit->charge;
            $transaction->trx_type     = '+';
            $transaction->details      = 'Deposit Via ' . $deposit->gatewayCurrency()->name;
            $transaction->trx          = $deposit->order_number ? $deposit->order_number : $deposit->trx;
            $transaction->remark       = 'deposit';
            $transaction->save();

            $referral = User::where('id', $user->ref_by)->first();

            if ($referral && (gs()->referral_commission > 0)) {

                $refAmo             = ($deposit->amount * gs()->referral_commission) / 100;
                $referral->balance += $refAmo;
                $referral->save();

                $transaction               = new Transaction();
                $transaction->user_id      = $referral->id;
                $transaction->amount       = $refAmo;
                $transaction->post_balance = $referral->balance;
                $transaction->charge       = 0;
                $transaction->trx_type     = '+';
                $transaction->details      = 'Deposit Commission from ' . $user->username;
                $transaction->trx          = getTrx();
                $transaction->save();

                notify($referral, 'REFERRAL_COMMISSION', [
                    'amount'       => getAmount($refAmo),
                    'post_balance' => $referral->balance,
                    'trx'          => $transaction->trx,
                ]);
            }
            if (!$isManual) {
                $adminNotification            = new AdminNotification();
                $adminNotification->user_id   = $user->id;
                $adminNotification->title     = $notificationTitle;
                $adminNotification->click_url = $clickUrl;
                $adminNotification->save();
            }

            notify($user, $isManual ? 'DEPOSIT_APPROVE' : 'DEPOSIT_COMPLETE', [
                'method_name'     => $deposit->gatewayCurrency()->name,
                'method_currency' => $deposit->method_currency,
                'method_amount'   => showAmount($deposit->final_amount),
                'amount'          => showAmount($deposit->amount),
                'charge'          => showAmount($deposit->charge),
                'rate'            => showAmount($deposit->rate),
                'trx'             => $deposit->trx,
                'post_balance'    => showAmount($user->balance)
            ]);

            if ($deposit->order_number && $deposit->booking_id) {
                $booking = static::bookingStatusChange($deposit->booking_id);
                static::bookingTransactionCreate($booking, $user, $deposit);
                static::clearSessionData();
            }
        }
    }

    public function manualDepositConfirm()
    {
        $track = session('Track');
        $data = Deposit::with('gateway')->where('status', Status::PAYMENT_INITIATE)->where('trx', $track)->first();
        if (!$data) {
            return to_route(gatewayRedirectUrl());
        }
        if ($data->method_code > 999) {
            $pageTitle = 'Deposit Confirm';
            $method = $data->gatewayCurrency();
            $gateway = $method->method;
            return view($this->activeTemplate . 'user.payment.manual', compact('data', 'pageTitle', 'method', 'gateway'));
        }
        abort(404);
    }

    public function manualDepositUpdate(Request $request)
    {
        $track = session('Track');
        $data = Deposit::with('gateway')->where('status', Status::PAYMENT_INITIATE)->where('trx', $track)->first();
        if (!$data) {
            return to_route(gatewayRedirectUrl());
        }
        $gatewayCurrency = $data->gatewayCurrency();
        $gateway = $gatewayCurrency->method;
        $formData = $gateway->form->form_data;

        $formProcessor = new FormProcessor();
        $validationRule = $formProcessor->valueValidation($formData);
        $request->validate($validationRule);
        $userData = $formProcessor->processFormData($request, $formData);

        $data->detail = $userData;
        $data->status = Status::PAYMENT_PENDING;
        $data->save();

        $adminNotification = new AdminNotification();
        $adminNotification->user_id = $data->user->id;
        $adminNotification->title = 'Deposit request from ' . $data->user->username;
        $adminNotification->click_url = urlPath('admin.deposit.details', $data->id);
        $adminNotification->save();

        if ($data->order_number) {
            $productType = $data->booking->service_id ? 'service' : 'software';
            $productName = $data->booking->service_id ? $data->booking->service->name : $data->booking->software->name;

            notify($data->user, 'PAYMENT_REQUEST', [
                'method_name'     => $data->gatewayCurrency()->name,
                'method_currency' => $data->method_currency,
                'method_amount'   => showAmount($data->final_amount),
                'amount'          => showAmount($data->amount),
                'charge'          => showAmount($data->charge),
                'rate'            => showAmount($data->rate),
                'trx'             => $data->trx,
                'product_type'    => $productType,
                'product_name'    => $productName,
            ]);

            $notify[] = ['success', 'Your payment request has been taken'];
            return to_route('user.transactions')->withNotify($notify);
        } else {

            notify($data->user, 'DEPOSIT_REQUEST', [
                'method_name'     => $data->gatewayCurrency()->name,
                'method_currency' => $data->method_currency,
                'method_amount'   => showAmount($data->final_amount),
                'amount'          => showAmount($data->amount),
                'charge'          => showAmount($data->charge),
                'rate'            => showAmount($data->rate),
                'trx'             => $data->trx
            ]);

            $notify[] = ['success', 'Your deposit request has been taken'];
            return to_route('user.deposit.history')->withNotify($notify);
        }
    }
}
