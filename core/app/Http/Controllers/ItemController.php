<?php

namespace App\Http\Controllers;

use App\Models\Job;
use App\Models\User;
use App\Models\JobBid;
use App\Models\Review;
use App\Models\Service;
use App\Models\Category;
use App\Models\Software;
use App\Models\SubCategory;
use App\Models\ExtraService;
use App\Http\Controllers\Controller;

class ItemController extends Controller
{
    public function service()
    {
        $pageTitle  = 'Service';
        $data       = $this->getOnlyItems("Service");
        $query      = $data['query'];
        $priceRange = $data['price_range'];
        $products   = $query->paginate(getPaginate());
        $type       = 'service';
        return view($this->activeTemplate . 'home', compact('pageTitle', 'products', 'priceRange', 'type'));
    }

    public function software()
    {
        $pageTitle  = 'Software';
        $data       = $this->getOnlyItems("Software");
        $query      = $data['query'];
        $priceRange = $data['price_range'];
        $products   = $query->paginate(getPaginate());
        $type       = 'software';
        return view($this->activeTemplate . 'home', compact('pageTitle', 'products', 'priceRange', 'type'));
    }

    public function job()
    {
        $pageTitle  = 'Job';
        $data       = $this->getOnlyItems("Job",'Skill');
        $query      = $data['query'];
        $priceRange = $data['price_range'];
        $products   = $query->paginate(getPaginate());
        $type       = 'job';
        return view($this->activeTemplate . 'home', compact('pageTitle', 'products', 'priceRange', 'type'));
    }

    public function serviceDetails($slug, $id)
    {
        $pageTitle        = 'Service Details';
        $productDetails   = Service::where('id', $id)->active()->userActiveCheck()->checkData()->with('user')->firstOrFail();
        $extraServices    = ExtraService::where('service_id', $productDetails->id)->active()->latest()->get();
        $seoContents      = seoContentSliced($productDetails->tag, $productDetails->name, $productDetails->description, getFilePath('service'), $productDetails->image, getFileSize('service'));
        return view($this->activeTemplate . 'service.service_details', compact('pageTitle', 'productDetails', 'extraServices', 'seoContents'));
    }

    public function softwareDetails($slug, $id)
    {
        $pageTitle        = 'Software Details';
        $productDetails   = Software::where('id', $id)->active()->userActiveCheck()->checkData()->firstOrFail();
        $seoContents      = seoContentSliced($productDetails->tag, $productDetails->name, $productDetails->description, getFilePath('software'), $productDetails->image, getFileSize('software'));
        return view($this->activeTemplate . 'software.software_details', compact('pageTitle', 'productDetails', 'seoContents'));
    }

    public function jobDetails($slug, $id)
    {
        $pageTitle           = 'Job Details';
        $productDetails      = Job::where('id', $id)->active()->userActiveCheck()->checkData()->with('jobBidings', 'jobBidings.user', 'jobBidings.user.level')->firstOrFail();
        $seoContents         = seoContentSliced($productDetails->skill, $productDetails->name, $productDetails->description, getFilePath('job'), $productDetails->image, getFileSize('job'));
        $existingJobBidCheck = JobBid::where('job_id', $productDetails->id)->where('user_id', auth()->id() ?? 0)->exists();
        return view($this->activeTemplate . 'job_details', compact('pageTitle', 'productDetails', 'seoContents', 'existingJobBidCheck'));
    }

    private function getOnlyItems($item, $jsonSearch = "tag")
    {
        $query = "App\\Models\\$item"::active()->userActiveCheck()->checkData()->latest()->with(['user', 'user.level']);

        if (request()->$jsonSearch) {
            $query->whereJsonContains($jsonSearch, request()->$jsonSearch);
        }
        return [
            'query' => $query,
            'price_range' => [
                $query->min('price'),$query->max('price')
            ]
        ];
    }


    public function categoryWiseProduct ($slug, $id)
    {
        $category  = Category::where('id', $id)->active()->with('subCategories', function ($subCategories) {
            $subCategories->active();
        })->firstOrFail();

        $pageTitle = $category->name;
        $items     = $this->getItems('category_id', $category->id,'checkSubCategory');
        return view($this->activeTemplate . 'products', compact('pageTitle', 'category', 'items'));
    }

    public function subcategoryWiseProduct ($slug, $id)
    {
        $subcategory = SubCategory::where('id', $id)->active()->whereHas('category', function ($category) {
            $category->active();
        })->firstOrFail();
        $pageTitle = $subcategory->name;
        $items     = $this->getItems('sub_category_id', $subcategory->id,'checkCategory');
        return view($this->activeTemplate . 'products', compact('pageTitle', 'subcategory', 'items'));
    }

    public function publicProfile($username)
    {
        $pageTitle = 'User Profile';
        $user      = User::where('username', $username)->active()->with('jobBids')->firstOrFail();
        $items     = $this->getItems('user_id', $user->id,'checkData');
        $reviews   = Review::where('to_id', $user->id)->latest()->with('user')->limit(6)->get();
        return view($this->activeTemplate . 'public_profile', compact('pageTitle', 'user', 'reviews','items'));
    }

    private function getItems($columnName, $columnValue, $scopeName = null)
    {
        $items    = ['Service', 'Software', 'Job'];
        $itemData = [];

        foreach ($items as $item) {
            $query = "App\\Models\\$item"::where($columnName, $columnValue)->active()->userActiveCheck();
            if ($scopeName) {
                $query->$scopeName();
            }
            $itemData[strtolower($item)] = $query->latest()->limit(10)->with('user')->get();
        }
        return $itemData;
    }
}
