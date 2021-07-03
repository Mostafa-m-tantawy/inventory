<?php

namespace App\Models\conf;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Models\hr\HrEmployee;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SafePayments extends Model
{
    use restaurantScopeTrait;
    use baseTrait,SoftDeletes;

    public function safe(){
        return $this->belongsTo(Safe::class);
    }

    public function employee(){
        return $this->belongsTo(HrEmployee::class);
    }

    public function paymentable(){
        return $this->morphTo();
    }


}
