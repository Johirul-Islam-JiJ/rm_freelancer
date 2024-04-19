<?php

namespace App\Models;

use App\Traits\CustomStatus;
use App\Traits\GlobalStatus;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use Searchable, GlobalStatus,CustomStatus;

    protected $casts = [
        'tag'         => 'array',
        'features'    => 'array',
        'extra_image' => 'array'
    ];

    public function scopeSorting($query)
    {
        $query->orderBy('id', "DESC");

        if (request()->sorting) {
            if (request()->sorting == 'high') {
                $query->orderBy('price', "DESC");
            } elseif (request()->sorting == "low") {
                $query->orderBy('price', "ASC");
            }
        }
        return $query;
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class);
    }

    public function extraServices()
    {
        return $this->hasMany(ExtraService::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
