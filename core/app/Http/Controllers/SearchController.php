<?php

namespace App\Http\Controllers;

use App\Models\Job;
use App\Models\Service;
use App\Models\Software;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $search = $request->search;

        $pageTitle = "Search results for - $search";

        $items['service']  = Service::searchable(['name'])->active()->userActiveCheck()->checkData()->latest()->limit(1)->with('user')->get();
        $items['software'] = Software::searchable(['name'])->active()->userActiveCheck()->checkData()->latest()->limit(10)->with('user')->get();
        $items['job']      = Job::searchable(['name'])->active()->userActiveCheck()->checkData()->latest()->limit(10)->with('user')->get();

        return view($this->activeTemplate . 'products', compact('pageTitle', 'items', 'search'));
    }

    public function filter(Request $request)
    {
        $request->validate([
            'type'      => 'required|in:service,software,job',
            'level.*'   => 'nullable|integer|gt:0',
            'feature.*' => 'nullable|integer|gt:0',
        ]);

        $type       = $request->type;
        $features   = $request->feature;
        $levels     = $request->level;
        $range      = $request->price;
        $priceRange = [0,0];

        if ($type == 'service') {
            $products = Service::query();
        } elseif ($type == 'software') {
            $products = Software::query();
        } else {
            $products = Job::query();
        }

        if ($features) {
            $products = $products->whereJsonContains('features', $features);
        }

        if ($levels) {
            $products = $products->whereHas('user', function($q) use($levels) {
                            $q->whereIn('level_id', $levels);
                        });
        }

        if ($range) {
            $rangeArray = explode("-",filter_var($range,FILTER_SANITIZE_NUMBER_INT));
            $products   = $products->whereBetween('price', $rangeArray);
            $priceRange = $rangeArray;
        }

        $products  = $products->active()->userActiveCheck()->checkData()->latest()->with('user')->paginate(getPaginate());
        $pageTitle = 'Filter Result';

        return view($this->activeTemplate . 'home', compact('pageTitle', 'products', 'priceRange', 'type', 'features', 'levels'));
    }
}
