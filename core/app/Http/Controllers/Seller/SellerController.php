<?php

namespace App\Http\Controllers\Seller;

use App\Models\Chat;
use App\Models\User;
use App\Models\JobBid;
use App\Models\Booking;
use App\Models\Service;
use App\Models\Software;
use App\Models\WorkFile;
use App\Constants\Status;
use App\Models\Withdrawal;
use App\Models\Transaction;
use App\Http\Controllers\Controller;

class SellerController extends Controller
{
    public function home()
    {

        if (auth()->user()->user_type !== 1) {
            $notify[] = ['error', 'You do not have permission to access this page.'];
            return back()->withNotify($notify);
        }
        $pageTitle    = 'Seller Dashboard';
        $authId       = auth()->id();
        $transactions = Transaction::where('user_id', $authId)->orderBy('id','desc')->limit(10)->get();

        $totalServiceCount     = Service::where('user_id', $authId)->count();
        $totalSoftwareCount    = Software::where('user_id', $authId)->count();

        $totalSoftwareSales    = Booking::where('software_id', '!=', 0)->where('seller_id', $authId)->count();
        $totalServiceBooking   = Booking::where('service_id', '!=', 0)->where('seller_id', $authId)->count();
        $totalWithdrawalAmount = Withdrawal::where('user_id', $authId)->where('status', Status::PAYMENT_SUCCESS)->sum('amount');

        return view($this->activeTemplate . 'seller.dashboard', compact('pageTitle', 'transactions', 'totalServiceCount', 'totalSoftwareCount', 'totalServiceBooking', 'totalSoftwareSales', 'totalWithdrawalAmount'));
    }

    public function jobList()
    {
        $pageTitle   = 'Job List';
        $biddingList = JobBid::where('user_id', auth()->id())->with(['job', 'buyer'])->latest()->paginate(getPaginate());
        return view($this->activeTemplate . 'user.job.job_hiring' , compact('pageTitle', 'biddingList'));
    }

    public function jobDetails($id)
    {
        $pageTitle = 'Job Details';
        $details   = JobBid::where('id', $id)->where('user_id', auth()->id())->with(['job', 'disputer'])->firstOrFail();
        $workFiles = WorkFile::where('job_bid_id', $details->id)->latest()->with(['sender', 'receiver'])->paginate(getPaginate());
        $chats     = Chat::where('job_bid_id', $details->id)->with('user')->get();

        return view($this->activeTemplate . 'user.job.details', compact('pageTitle', 'details', 'workFiles', 'chats'));
    }
}
