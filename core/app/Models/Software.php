<?php

namespace App\Models;

use App\Traits\Searchable;
use App\Traits\CustomStatus;
use App\Traits\GlobalStatus;
use Illuminate\Database\Eloquent\Model;

class Software extends Model
{
    use Searchable, GlobalStatus,CustomStatus;

    protected $casts = [
        'tag'          => 'array',
        'features'     => 'array',
        'extra_image'  => 'array',
        'file_include' => 'array',
    ];

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
