<?php

namespace App\Models;

use App\Traits\CustomStatus;
use App\Traits\GlobalStatus;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;

class Job extends Model
{

    use Searchable, GlobalStatus,CustomStatus;

    protected $casts = [
        'skill'       => 'array',
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

    public function jobBidings()
    {
        return $this->hasMany(JobBid::class);
    }

    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
