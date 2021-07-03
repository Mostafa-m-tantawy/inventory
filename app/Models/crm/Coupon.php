<?php

namespace App\Models\crm;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    use baseTrait, restaurantScopeTrait;

    protected $rules = array(

    );

    /**
     * Scope a query to only include popular users.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeValid($query)
    {
        return $query->whereDate('from','<=',Carbon::now()->toDate())->whereDate('to','>=',Carbon::now()->toDate())->get();
    }
}
