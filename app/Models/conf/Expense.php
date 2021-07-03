<?php

namespace App\Models\conf;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use App\Models\inventory\Store;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Expense extends Model
{
    use uploadFileTrait,baseTrait,restaurantScopeTrait,SoftDeletes;


    //
public function restaurant(){
    return $this->belongsTo(Store::class);
}

}
