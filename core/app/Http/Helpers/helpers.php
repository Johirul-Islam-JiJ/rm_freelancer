<?php

use App\Constants\Status;
use App\Lib\Captcha;
use App\Lib\ClientInfo;
use App\Lib\CurlRequest;
use App\Lib\FileManager;
use App\Lib\GoogleAuthenticator;
use App\Models\Advertisement;
use App\Models\Extension;
use App\Models\Frontend;
use App\Models\GeneralSetting;
use App\Models\Level;
use App\Notify\Notify;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;

function systemDetails() {
    $system['name']          = 'viserlance';
    $system['version']       = '2.3';
    $system['build_version'] = '4.4.10';
    return $system;
}

function slug($string) {
    return Illuminate\Support\Str::slug($string);
}

function verificationCode($length) {
    if ($length == 0) {
        return 0;
    }

    $min = pow(10, $length - 1);
    $max = (int) ($min - 1) . '9';
    return random_int($min, $max);
}

function getNumber($length = 8) {
    $characters       = '1234567890';
    $charactersLength = strlen($characters);
    $randomString     = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function activeTemplate($asset = false) {
    $general  = gs();
    $template = session('template') ?? $general->active_template;
    if ($asset) {
        return 'assets/templates/' . $template . '/';
    }

    return 'templates.' . $template . '.';
}

function activeTemplateName() {
    $general  = gs();
    $template = session('template') ?? $general->active_template;
    return $template;
}

function siteLogo($type = null) {
    $name = $type ? "/logo_$type.png" : '/logo.png';
    return getImage(getFilePath('logoIcon') . $name);
}

function siteLogoDark($type = null) {
    $name = $type ? "/logo_$type.png" : '/logo_dark.png';
    return getImage(getFilePath('logoIcon') . $name);
}

function siteFavicon() {
    return getImage(getFilePath('logoIcon') . '/favicon.png');
}

function loadReCaptcha() {
    return Captcha::reCaptcha();
}

function loadCustomCaptcha($width = '100%', $height = 46, $bgColor = '#003') {
    return Captcha::customCaptcha($width, $height, $bgColor);
}

function verifyCaptcha() {
    return Captcha::verify();
}

function loadExtension($key) {
    $extension = Extension::where('act', $key)->where('status', Status::ENABLE)->first();
    return $extension ? $extension->generateScript() : '';
}

function getTrx($length = 12) {
    $characters       = 'ABCDEFGHJKMNOPQRSTUVWXYZ123456789';
    $charactersLength = strlen($characters);
    $randomString     = '';

    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }

    return $randomString;
}

function getAmount($amount, $length = 2) {
    $amount = round($amount ?? 0, $length);
    return $amount + 0;
}

function showAmount($amount, $decimal = 2, $separate = true, $exceptZeros = false) {
    $separator = '';
    if ($separate) {
        $separator = ',';
    }
    $printAmount = number_format($amount, $decimal, '.', $separator);
    if ($exceptZeros) {
        $exp = explode('.', $printAmount);
        if ($exp[1] * 1 == 0) {
            $printAmount = $exp[0];
        } else {
            $printAmount = rtrim($printAmount, '0');
        }
    }
    return $printAmount;
}

function removeElement($array, $value) {
    return array_diff($array, (is_array($value) ? $value : array($value)));
}

function cryptoQR($wallet) {
    return "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=$wallet&choe=UTF-8";
}

function keyToTitle($text) {
    return ucfirst(preg_replace("/[^A-Za-z0-9 ]/", ' ', $text));
}

function titleToKey($text) {
    return strtolower(str_replace(' ', '_', $text));
}

function strLimit($title = null, $length = 10) {
    return Str::limit($title, $length);
}

function getIpInfo() {
    $ipInfo = ClientInfo::ipInfo();
    return $ipInfo;
}

function osBrowser() {
    $osBrowser = ClientInfo::osBrowser();
    return $osBrowser;
}

function getTemplates() {
    $param['purchasecode'] = env("PURCHASECODE");
    $param['website']      = @$_SERVER['HTTP_HOST'] . @$_SERVER['REQUEST_URI'] . ' - ' . env("APP_URL");
    $url                   = 'https://license.viserlab.com/updates/templates/' . systemDetails()['name'];
    $response              = CurlRequest::curlPostContent($url, $param);
    if ($response) {
        return $response;
    } else {
        return null;
    }
}

function getPageSections($arr = false) {
    $jsonUrl  = resource_path('views/') . str_replace('.', '/', activeTemplate()) . 'sections.json';
    $sections = json_decode(file_get_contents($jsonUrl));
    if ($arr) {
        $sections = json_decode(file_get_contents($jsonUrl), true);
        ksort($sections);
    }
    return $sections;
}

function getImage($image, $size = null) {
    $clean = '';
    if (file_exists($image) && is_file($image)) {
        return asset($image) . $clean;
    }
    if ($size) {
        return route('placeholder.image', $size);
    }
    return asset('assets/images/default.png');
}

function notify($user, $templateName, $shortCodes = null, $sendVia = null, $createLog = true) {
    $general = gs();

    $globalShortCodes = [
        'site_name'       => $general->site_name,
        'site_currency'   => $general->cur_text,
        'currency_symbol' => $general->cur_sym,
    ];

    if (gettype($user) == 'array') {
        $user = (object) $user;
    }

    $shortCodes = array_merge($shortCodes ?? [], $globalShortCodes);

    $notify               = new Notify($sendVia);
    $notify->templateName = $templateName;
    $notify->shortCodes   = $shortCodes;
    $notify->user         = $user;
    $notify->createLog    = $createLog;
    $notify->userColumn   = isset($user->id) ? $user->getForeignKey() : 'user_id';
    $notify->send();
}

function getPaginate($paginate = 20) {
    return $paginate;
}

function paginateLinks($data) {
    return $data->appends(request()->all())->links();
}

function menuActive($routeName, $type = null, $param = null) {
    if ($type == 3) {
        $class = 'side-menu--open';
    } else if ($type == 2) {
        $class = 'sidebar-submenu__open';
    } else if ($type == 4) {
        $class = 'open';
    } else {
        $class = 'active';
    }

    if (is_array($routeName)) {
        foreach ($routeName as $key => $value) {
            if (request()->routeIs($value)) {
                return $class;
            }

        }
    } else if (request()->routeIs($routeName)) {
        if ($param) {
            $routeParam = array_values(@request()->route()->parameters ?? []);
            if (strtolower(@$routeParam[0]) == strtolower($param)) {
                return $class;
            } else {
                return;
            }

        }
        return $class;
    }
}






function fileUploader($file, $location, $size = null, $old = null, $thumb = null) {
    $fileManager        = new FileManager($file);
    $fileManager->path  = $location;
    $fileManager->size  = $size;
    $fileManager->old   = $old;
    $fileManager->thumb = $thumb;
    $fileManager->upload();
    return $fileManager->filename;
}

function fileManager() {
    return new FileManager();
}

function getFilePath($key) {
    return fileManager()->$key()->path;
}

function getFileSize($key) {
    return fileManager()->$key()->size;
}

function getFileExt($key) {
    return fileManager()->$key()->extensions;
}

function diffForHumans($date) {
    $lang = session()->get('lang');
    Carbon::setlocale($lang);
    return Carbon::parse($date)->diffForHumans();
}

function showDateTime($date, $format = 'Y-m-d h:i A') {
    $lang = session()->get('lang');
    Carbon::setlocale($lang);
    return Carbon::parse($date)->translatedFormat($format);
}

function getContent($dataKeys, $singleQuery = false, $limit = null, $orderById = false) {

    $templateName = activeTemplateName();
    if ($singleQuery) {
        $content = Frontend::where('tempname', $templateName)->where('data_keys', $dataKeys)->orderBy('id', 'desc')->first();
    } else {
        $article = Frontend::where('tempname', $templateName);
        $article->when($limit != null, function ($q) use ($limit) {
            return $q->limit($limit);
        });
        if ($orderById) {
            $content = $article->where('data_keys', $dataKeys)->orderBy('id')->get();
        } else {
            $content = $article->where('data_keys', $dataKeys)->orderBy('id', 'desc')->get();
        }
    }
    return $content;
}

function gatewayRedirectUrl($type = false) {
    return 'user.transactions';
}

function verifyG2fa($user, $code, $secret = null) {
    $authenticator = new GoogleAuthenticator();
    if (!$secret) {
        $secret = $user->tsc;
    }
    $oneCode  = $authenticator->getCode($secret);
    $userCode = $code;
    if ($oneCode == $userCode) {
        $user->tv = 1;
        $user->save();
        return true;
    } else {
        return false;
    }
}

function urlPath($routeName, $routeParam = null) {
    if ($routeParam == null) {
        $url = route($routeName);
    } else {
        $url = route($routeName, $routeParam);
    }
    $basePath = route('home');
    $path     = str_replace($basePath, '', $url);
    return $path;
}

function showMobileNumber($number) {
    $length = strlen($number);
    return substr_replace($number, '***', 2, $length - 4);
}

function showEmailAddress($email) {
    $endPosition = strpos($email, '@') - 1;
    return substr_replace($email, '***', 1, $endPosition);
}

function getRealIP() {
    $ip = $_SERVER["REMOTE_ADDR"];
    //Deep detect ip
    if (filter_var(@$_SERVER['HTTP_FORWARDED'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED'];
    }
    if (filter_var(@$_SERVER['HTTP_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    if (filter_var(@$_SERVER['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CLIENT_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_X_REAL_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_X_REAL_IP'];
    }
    if (filter_var(@$_SERVER['HTTP_CF_CONNECTING_IP'], FILTER_VALIDATE_IP)) {
        $ip = $_SERVER['HTTP_CF_CONNECTING_IP'];
    }
    if ($ip == '::1') {
        $ip = '127.0.0.1';
    }

    return $ip;
}

function appendQuery($key, $value) {
    return request()->fullUrlWithQuery([$key => $value]);
}

function dateSort($a, $b) {
    return strtotime($a) - strtotime($b);
}

function dateSorting($arr) {
    usort($arr, "dateSort");
    return $arr;
}

function gs($key = null) {
    $general = Cache::get('GeneralSetting');
    if (!$general) {
        $general = GeneralSetting::first();
        Cache::put('GeneralSetting', $general);
    }
    if ($key) {
        return @$general->$key;
    }

    return $general;
}

function showAd($size) {
    $ad = Advertisement::where('size', $size)->active()->inRandomOrder()->first();

    if ($ad) {
        $ad->impression += 1;
        $ad->save();

        if ($ad->type == 'image') {
            $html = '<a href="' . route('adRedirect', encrypt($ad->id)) . '" target="_blank"><img src="' . getImage(getFilePath('advertisement') . '/' . $ad->value, $size) . '"></a>';
            return $html;
        }

        return $ad->value;
    }

    return false;
}

function starRating($totalReview, $totalRating) {
    $ratings = '';

    if ($totalReview > 0) {
        $avgRating  = $totalRating / $totalReview;
        $integerVal = floor($avgRating);
        $fraction   = $avgRating - $integerVal;

        if ($fraction < .5) {
            $avgRating = intval($avgRating);
        }

        if ($fraction > .5) {
            $avgRating = intval($avgRating) + 1;
        }

        for ($i = 1; $i <= $avgRating; $i++) {
            $ratings .= '<i class="las la-star text-warning"></i>';
        }

        if ($fraction == .5) {
            $ratings .= '<i class="las la-star-half-alt text-warning"></i>';
        }
    } else {
        $avgRating = 0;
    }

    $nonStar = 5 - intval($avgRating);

    for ($k = 1; $k <= $nonStar; $k++) {
        $ratings .= '<i class="lar la-star text-warning"></i>';
    }

    return $ratings;
}

function userLevel($user) {
    $level = Level::active()->where('amount', '<=', $user->earning)->orderBy('amount', 'DESC')->where('id', '!=', $user->level_id)->first();
    if ($level) {
        $user->level_id = $level->id;
        $user->save();
        notify($user, 'USER_LEVEL_UPGRADE', [
            'username' => $user->fullname,
            'name'     => $level->name,
            'amount'   => showAmount($level->amount),
        ]);
    }
}

function permissionList() {
    return [
        "Manage Dashboard",
        "Manage Service Booking",
        "Manage Cron Job",
        "Manage Software Sales",
        "Manage Job Bidding",
        "Manage Users",
        "Manage Service",
        "Manage Software",
        "Manage Job",
        "Manage Advertisement",
        "Manage Category",
        "Manage Coupon",
        "Manage Deposit",
        "Manage Extension",
        "Manage Feature",
        "Manage Frontend Section",
        "Manage Gateway",
        "Manage GDPR Cookie",
        "Manage General Setting",
        "Manage KYC Setting",
        "Manage Language",
        "Manage Level",
        "Manage Logo And Favicon",
        "Manage Maintenance Mode",
        "Manage Notification Setting",
        "Manage Payment",
        "Manage Report",
        "Manage SEO Manager",
        "Manage Staff",
        "Manage Subcategory",
        "Manage Subscriber",
        "Manage Support Ticket",
        "Manage System Configuration",
        "Manage Template",
        "Manage Withdraw",
        "Manage Social",
        "Others",
    ];
}

function seoContentSliced($keywords, $socialTitle, $description, $imagePath, $image, $imageSize) {
    $seoContents['keywords']           = $keywords ?? [];
    $seoContents['social_title']       = $socialTitle;
    $seoContents['description']        = strLimit(strip_tags($description), 150);
    $seoContents['social_description'] = strLimit(strip_tags($description), 150);
    $seoContents['image']              = getImage($imagePath . '/' . $image, $imageSize);
    $seoContents['image_size']         = $imageSize;

    return $seoContents;
}

function isImage($string) {
    $allowedExtensions = array('jpg', 'jpeg', 'png', 'gif');
    $fileExtension     = pathinfo($string, PATHINFO_EXTENSION);
    if (in_array($fileExtension, $allowedExtensions)) {
        return true;
    } else {
        return false;
    }
}

function isHtml($string) {
    if (preg_match('/<.*?>/', $string)) {
        return true;
    } else {
        return false;
    }
}
