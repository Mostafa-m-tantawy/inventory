<?php

namespace App\Models\crm;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ClientAccount extends Model
{
    use baseTrait,SoftDeletes;


public function client(){
    return $this->belongsTo(Client::class);
}
}
