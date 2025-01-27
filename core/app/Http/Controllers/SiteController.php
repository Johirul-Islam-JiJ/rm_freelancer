<?php

namespace App\Http\Controllers;

use Exception;
use Carbon\Carbon;
use App\Models\Chat;
use App\Models\Message;
use App\Models\Service;
use App\Models\Frontend;
use App\Models\Language;
use App\Models\Software;
use App\Models\WorkFile;
use App\Constants\Status;
use App\Models\Subscriber;
use Illuminate\Http\Request;
use App\Models\Advertisement;
use App\Models\SupportTicket;
use App\Models\SupportMessage;
use App\Models\AdminNotification;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Validator;

class SiteController extends Controller
{
    public function index()
    {
        $reference = @$_GET['reference'];
        if ($reference) {
            session()->put('reference', $reference);
        }
        $pageTitle  = 'Home';
        $products   = Service::active()->sorting()->featured()->userActiveCheck()->checkData()->with(['user', 'user.level']);
        $priceRange = $this->priceRangeCalc($products);
        $products   = $products->paginate(getPaginate());
        $type       = 'service';
        return view($this->activeTemplate . 'home', compact('pageTitle', 'products', 'priceRange', 'type'));
    }

    public function fileDownload($fileName, $type)
    {

        try {
            $fileName = decrypt($fileName);
        } catch (Exception $ex) {
            $notify[] = ['error', "Invalid URL."];
            return back()->withNotify($notify);
        }
        if ($type == 'file') {
            $file = Software::where('software_file', $fileName)->firstOrFail();
            return response()->download(getFilePath('softwareFile') . '/' . $file->software_file);
        } elseif ($type == 'documentation') {
            $file = Software::where('document_file', $fileName)->firstOrFail();
            return response()->download(getFilePath('documentFile') . '/' . $file->document_file);
        } elseif ($type == 'workFile') {
            $file = WorkFile::where('file', $fileName)->firstOrFail();
            return response()->download(getFilePath('workFile') . '/' . $file->file);
        } elseif ($type == 'chatFile') {
            $file = Chat::where('file', $fileName)->firstOrFail();
            return response()->download(getFilePath('chatFile') . '/' . $file->file);
        } elseif ($type == 'messageFile') {
            $file = Message::where('file', $fileName)->firstOrFail();
            return response()->download(getFilePath('messageFile') . '/' . $file->file);
        } else {
            $notify[] = ['error', 'Invalid file download request'];
            return back()->withNotify($notify);
        }
    }

    public function adRedirect($id)
    {
        $id         = decrypt($id);
        $ad         = Advertisement::findOrFail($id);
        $ad->click += 1;
        $ad->save();

        if ($ad->type == 'image') {
            return redirect($ad->redirect_url);
        }

        return back();
    }

    public function contact()
    {
        $pageTitle = "Contact Us";
        $user = auth()->user();
        return view($this->activeTemplate . 'contact', compact('pageTitle', 'user'));
    }

    public function contactSubmit(Request $request)
    {
        $this->validate($request, [
            'name'    => 'required',
            'email'   => 'required',
            'subject' => 'required|string|max:255',
            'message' => 'required',
        ]);

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        $request->session()->regenerateToken();

        $random = getNumber();

        $ticket           = new SupportTicket();
        $ticket->user_id  = auth()->id() ?? 0;
        $ticket->name     = $request->name;
        $ticket->email    = $request->email;
        $ticket->priority = Status::PRIORITY_MEDIUM;

        $ticket->ticket     = $random;
        $ticket->subject    = $request->subject;
        $ticket->last_reply = Carbon::now();
        $ticket->status     = Status::TICKET_OPEN;
        $ticket->save();

        $adminNotification            = new AdminNotification();
        $adminNotification->user_id   = auth()->user() ? auth()->user()->id : 0;
        $adminNotification->title     = 'A new contact message has been submitted';
        $adminNotification->click_url = urlPath('admin.ticket.view', $ticket->id);
        $adminNotification->save();

        $message                    = new SupportMessage();
        $message->support_ticket_id = $ticket->id;
        $message->message           = $request->message;
        $message->save();

        $notify[] = ['success', 'Ticket created successfully!'];

        return to_route('ticket.view', [$ticket->ticket])->withNotify($notify);
    }

    public function policyPages($slug, $id)
    {
        $policy = Frontend::where('id', $id)->where('data_keys', 'policy_pages.element')->firstOrFail();
        $pageTitle = $policy->data_values->title;
        return view($this->activeTemplate . 'policy', compact('policy', 'pageTitle'));
    }

    public function changeLanguage($lang = null)
    {
        $language = Language::where('code', $lang)->first();
        if (!$language) $lang = 'en';
        session()->put('lang', $lang);
        return back();
    }

    public function blogs()
    {
        $blogs = Frontend::where('data_keys', 'blog.element')->paginate(getPaginate());
        $pageTitle = "Blogs";
        return view($this->activeTemplate . 'blogs', compact('blogs', 'pageTitle'));
    }

    public function blogDetails($slug, $id)
    {
        $blog        = Frontend::where('id', $id)->where('data_keys', 'blog.element')->firstOrFail();
        $pageTitle   = 'Blog Details';
        $seoContents = seoContentSliced($blog->meta_keywords, $blog->data_values->title, $blog->data_values->description, 'assets/images/frontend/blog/', $blog->data_values->image, '966x560');

        return view($this->activeTemplate . 'blog_details', compact('blog', 'pageTitle', 'seoContents'));
    }

    public function cookieAccept()
    {
        Cookie::queue('gdpr_cookie',gs('site_name') , 43200);
    }

    public function cookiePolicy()
    {
        $pageTitle = 'Cookie Policy';
        $cookie = Frontend::where('data_keys', 'cookie.data')->first();
        return view($this->activeTemplate . 'cookie', compact('pageTitle', 'cookie'));
    }

    public function subscriberStore(Request $request)
    {

        $validate = Validator::make($request->all(), [
            'email' => 'required|email|unique:subscribers',
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()->all()]);
        }

        $subscriber        = new Subscriber();
        $subscriber->email = $request->email;
        $subscriber->save();

        return response()->json(['success' => 'Subscribed successfully!']);
    }

    public function placeholderImage($size = null)
    {
        $imgWidth  = explode('x', $size)[0];
        $imgHeight = explode('x', $size)[1];
        $text      = $imgWidth . '×' . $imgHeight;
        $fontFile  = realpath('assets/font/RobotoMono-Regular.ttf');
        $fontSize  = round(($imgWidth - 50) / 8);

        if ($fontSize <= 9) {
            $fontSize = 9;
        }
        if ($imgHeight < 100 && $fontSize > 30) {
            $fontSize = 30;
        }

        $image     = imagecreatetruecolor($imgWidth, $imgHeight);
        $colorFill = imagecolorallocate($image, 100, 100, 100);
        $bgFill    = imagecolorallocate($image, 175, 175, 175);
        imagefill($image, 0, 0, $bgFill);

        $textBox    = imagettfbbox($fontSize, 0, $fontFile, $text);
        $textWidth  = abs($textBox[4] - $textBox[0]);
        $textHeight = abs($textBox[5] - $textBox[1]);
        $textX      = ($imgWidth - $textWidth) / 2;
        $textY      = ($imgHeight + $textHeight) / 2;

        header('Content-Type: image/jpeg');
        imagettftext($image, $fontSize, 0, $textX, $textY, $colorFill, $fontFile, $text);
        imagejpeg($image);
        imagedestroy($image);
    }

    public function maintenance()
    {
        $pageTitle = 'Maintenance Mode';

        if(gs('maintenance_mode') == Status::DISABLE){
            return to_route('home');
        }

        $maintenance = Frontend::where('data_keys', 'maintenance.data')->first();
        return view($this->activeTemplate . 'maintenance', compact('pageTitle', 'maintenance'));
    }

    protected function priceRangeCalc($products)
    {
        $minPrice = $products->min('price');
        $maxPrice = $products->max('price');

        return [$minPrice, $maxPrice];
    }
}
