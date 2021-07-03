<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    use baseTrait,restaurantScopeTrait;

    public function stockable(){
        return $this->morphTo();
    }
    public  function product(){
        return $this->belongsTo(Product::class);
    }
}
