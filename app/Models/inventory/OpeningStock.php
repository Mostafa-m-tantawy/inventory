<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use App\Models\UploadFile;
use Illuminate\Database\Eloquent\Model;

class OpeningStock extends Model
{
    use uploadFileTrait,restaurantScopeTrait;


    public function openStockDetails(){
        return $this->hasMany(OpeningStockDetails::class,'opening_stock_id');
    }

    public function files(){
        return $this->morphMany(UploadFile::class,'filable');
    }
    public function getTotalAttribute()
    {

        return $this->openStockDetails->sum('total');

    }

}
