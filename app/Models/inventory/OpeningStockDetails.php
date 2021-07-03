<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Http\Traits\uploadFileTrait;
use Illuminate\Database\Eloquent\Model;

class OpeningStockDetails extends Model
{
    use  baseTrait;




    public function product()
    {
        return  $this->belongsTo(Product::class);

    }


}
