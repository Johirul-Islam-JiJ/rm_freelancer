<?php

namespace App\Traits;

use App\Constants\Status;
use Illuminate\Database\Eloquent\Casts\Attribute;

trait GlobalStatus
{
    public static function changeStatus($id, $column = 'status')
    {
        $modelName = get_class();
        $query     = $modelName::findOrFail($id);
        if ($query->$column == Status::ENABLE) {
            $query->$column = Status::DISABLE;
        } else {
            $query->$column = Status::ENABLE;
        }
        $message       = keyToTitle($column) . ' changed successfully';

        $query->save();
        $notify[] = ['success', $message];
        return back()->withNotify($notify);
    }

    public function statusBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';
            if ($this->status == Status::ENABLE) {
                $html = '<span class="badge badge--success">' . trans('Enabled') . '</span>';
            } else {
                $html = '<span class="badge badge--warning">' . trans('Disabled') . '</span>';
            }
            return $html;
        });
    }

    public function customStatusBadge(): Attribute
    {
        return new Attribute(function () {
            $html = '';

            if ($this->status == Status::APPROVED) {
                $html = '<span class="badge badge--success">' . trans("Approved") . '</span>';
            } elseif ($this->status == Status::PENDING) {
                $html = '<span class="badge badge--warning">' . trans("Pending") . '</span> <br> ' . diffforhumans($this->updated_at);
            } elseif ($this->status == Status::CLOSED) {
                $html = '<span class="badge badge--primary">' . trans("Closed") . '</span>';
            } else {
                $html = '<span class="badge badge--danger">' . trans("Canceled") . '</span>';
            }

            return $html;
        });
    }

    public function scopeActive($query)
    {
        return $query->where('status', Status::ENABLE);
    }

    public function scopeInactive($query)
    {
        return $query->where('status', Status::DISABLE);
    }

    public function scopeFeatured($query)
    {
        return $query->where('featured', Status::YES);
    }
}
