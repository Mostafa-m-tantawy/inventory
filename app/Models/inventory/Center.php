<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;

class Center extends Model
{    use baseTrait,restaurantScopeTrait;

    public function stocks(){
        return $this->morphTo(Stock::class,'stockable');
    }
    public function departments(){
        return $this->hasMany(Department::class);
    }

}
