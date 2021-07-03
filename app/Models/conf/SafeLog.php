<?php

namespace App\Models\conf;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Models\hr\HrEmployee;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SafeLog extends Model
{
    use baseTrait,SoftDeletes,restaurantScopeTrait;

public function requester(){
    return $this->belongsTo(HrEmployee::class,'requester_id');
}

public function safe(){
    return $this->belongsTo(Safe::class);
}

public function approver(){
    return $this->belongsTo(HrEmployee::class,'approver_id');
}

public function payments(){

    return $this->hasMany(SafePayments::class);
}


}
