<?php

namespace App\Models;

use App\Constants\Status;
use App\Traits\GlobalStatus;
use Illuminate\Database\Eloquent\Model;

class Gateway extends Model
{
    use GlobalStatus;

    protected $casts = [
        'code' => 'string',
        'extra' => 'object',
        'input_form'=> 'object',
        'supported_currencies'=>'object'
    ];

    protected $hidden = [
        'gateway_parameters','extra'
    ];

    public function currencies()
    {
        return $this->hasMany(GatewayCurrency::class, 'method_code', 'code');
    }

    public function form()
    {
        return $this->belongsTo(Form::class);
    }

    public function singleCurrency()
    {
        return $this->hasOne(GatewayCurrency::class, 'method_code', 'code')->orderBy('id','desc');
    }

    public function scopeCrypto($query)
    {
        return $query->crypto == Status::ENABLE ? 'crypto' : 'fiat';
    }

    public function scopeAutomatic($query)
    {
        return $query->where('code', '<', 1000);
    }

    public function scopeManual($query)
    {
        return $query->where('code', '>=', 1000);
    }
}
