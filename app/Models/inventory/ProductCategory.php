<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Scopes\restaurantScope;
use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    use baseTrait,restaurantScopeTrait;

    protected $appends=['lang_name'];

    public function getLangNameAttribute()
    {
        $thisAttr = 'name';
        $attr = getAttrName($thisAttr);

        if($this->$attr)
            return $this->$attr;
        else
        {
            $attr = getOppositeAttrName($thisAttr);
            return $this->$attr;
        }
    }

    public function products(){
        return $this->hasMany(Product::class);
    }


    public function getCanDeletedAttribute()
    {
        if ($this->products->count() > 0 ) {
            return false;
        }
        return true;
    }
}
