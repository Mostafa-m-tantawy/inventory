<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Models\conf\Systemconf;
use App\Scopes\restaurantScope;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Product extends Model
{
    use baseTrait, restaurantScopeTrait;

    protected $guarded=[];

    protected $appends = [ 'lang_name','quantity_available'];

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


    public function stocks()
    {
        return $this->hasMany(Stock::class);
    }

    public function recipes()
    {
        return $this->hasMany(ProductRecipe::class, 'prepared_product_id');
    }

    public function supplier()
    {
        return $this->belongsToMany(Supplier::class, 'product_supplier')->withPivot('vat');
    }


    public function unit()
    {
        return $this->belongsTo(Unit::class,'unit_id');
    }


    public function category()
    {
        return $this->belongsTo(ProductCategory::class,'product_category_id');
    }


    public function purchasedProduct()
    {
        return $this->hasMany(PursesProduct::class);
    }

    public function openStockProduct()
    {
        return $this->hasMany(OpeningStockDetails::class);
    }


    public function assignDetails()
    {
        return $this->hasMany(AssignStockDetails::class);
    }


    public function refund()
    {
        return $this->hasMany(RefundProduct::class);
    }


    public function ruined()
    {
        return $this->hasMany(RuinedProduct::class);
    }


    public function cooked()
    {
        return $this->hasMany(CookedProduct::class);
    }

    public function prepared(){
        return $this->hasMany(PrepareHeader::class);
    }


    //check out if quantity more than 0
    // return boolian
    public function getQuantityAvailableAttribute()
    {
        if ($this->quantity > 0)
            return true;
        else
            return false;
    }

    public function departmentquantity($department)
    {
        $stock = $this->stocks()->where('stockable_id', $department->id)->where('stockable_type', get_class($department))->sum('quantity');

        return  $stock;


    }
    public function MainStoreQuantity($store)
    {
        $stock = $this->stocks()->where('stockable_id', $store->id)->where('stockable_type', get_class($store))->sum('quantity');
        $cooked = CookedProduct::where('cookable_type', Product::class)
            ->where('product_id', $this->id)
            ->sum('quantity');
        $quantity = $stock - $cooked;
        return  $quantity;
    }




    /// price with 2 method last_price && avg_price
    /// between dates if method avrege price
    public function getCalculateCostAttribute()
    {
        if ($this->is_prepared) {
            return preparedCost($this);
        }
        else {
            return notPreparedCost($this);
        }

    }



    // quantity assign_to_me
    public function assginedToMe($assignable)
    {
        $assign_to_me = $this->assignDetails()->whereHas('assignHeader', function ($q) use ($assignable) {
            $q->where('assignable_id', $assignable->id)->where('assignable_type', get_class($assignable));
        });
        $assign_quantity=$assign_to_me->sum('quantity');;

        return $assign_quantity;
    }

    // quantity assign_to_others
    public function assginedToOthers($assignable)
    {

        $assign_to_other = $this->assignDetails()->whereHas('assignHeader', function ($q) use ($assignable) {
            $q->where('sourceable_id', $assignable->id)->where('sourceable_type', get_class($assignable));
        });;

        $assign_quantity=$assign_to_other->sum('quantity');;

        return $assign_quantity;
    }




    //quantity ruined from me
    public function ruinedFromMe($ruinedable)
    {
        $ruind = $this->ruined()->whereHas('ruinedHeader', function ($q) use ($ruinedable) {
            $q->where('ruinedable_id', $ruinedable->id)->where('ruinedable_type', get_class($ruinedable));
        });;
        $ruind_quantity = $ruind->sum('quantity');

        return $ruind_quantity;
    }

    //quantity ruined from me
    public function cookedProduct($cookable)
    {
        $cooked = $this->cooked->where('department_id',$cookable->id);

        $cooked_quantity = $cooked->sum('quantity');

        return $cooked_quantity;
    }

}
