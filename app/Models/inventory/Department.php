<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use baseTrait,restaurantScopeTrait;

    public function RuinedHeader(){
        return $this->morphTo(RuinedHeader::class,'ruinedable');
    }

    public function center(){
        return $this->belongsTo(Center::class);
    }


    public function getCanDeletedAttribute()
    {
        $quantity=Stock::where('stockable_type',Department::class)->where('stockable_id',$this->id)->sum('quantity');

        if ($quantity > 0 ) {
            return false;
        }
        return true;
    }


    public function getProductsAttribute(){

        $products=Product::
      WhereHas('assignDetails',function ($q){
            $q->whereHas('assignHeader',function ($qq){
                $qq->where('assignable_id',$this->id)->where('assignable_type',Department::class);
            });
        })->get()->where('quantity_available',true);

        return $products;
    }
}
