<?php

namespace App\Models\inventory;

use Illuminate\Database\Eloquent\Model;

class ProductRecipe extends Model
{
    public  function  product()
    {
        return $this->belongsTo(Product::class);
    }
}
