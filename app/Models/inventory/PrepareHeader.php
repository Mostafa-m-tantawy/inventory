<?php

namespace App\Models\inventory;

use App\Http\Traits\restaurantScopeTrait;
use Illuminate\Database\Eloquent\Model;

class PrepareHeader extends Model
{
    use restaurantScopeTrait;
    public  function  product(){
        return $this->belongsTo(Product::class );
    }
}
