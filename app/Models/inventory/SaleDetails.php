<?php

namespace App\Models\inventory;

use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;

class SaleDetails extends Model
{use restaurantScopeTrait;
    public function saleHeader(){
        return $this->belongsTo(SaleHeader::class);
    }
    public function product(){
        return $this->belongsTo(Product::class);
    }
}
