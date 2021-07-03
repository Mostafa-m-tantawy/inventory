<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use Illuminate\Database\Eloquent\Model;

class InventoryCount extends Model
{
    use uploadFileTrait, baseTrait,restaurantScopeTrait;

    public function details(){
        return $this->hasMany(OpeningStockDetails::class,'inventory_count_id');
    }

}
