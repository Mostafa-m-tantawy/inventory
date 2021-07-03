<?php

namespace App\Models\inventory;

use App\Http\Traits\baseTrait;
use App\Http\Traits\restaurantScopeTrait;
use App\Models\User;
use App\Package;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Store extends Model
{    use baseTrait;
protected $guarded=[];

    public function packages(){
        return $this->belongsToMany(Package::class);
    }
    public function stocks(){
        return $this->morphTo(Stock::class,'stockable');
    }

    public function user (){
        return $this->belongsTo(User::class);
    }

    public function purchases()
    {
        return $this->hasMany(Purse::class,'store_id');
    }

//    public function paySupplier()
//    {
//        return $this->hasMany(Payment::class,'sender_id');
//    }
    public function paySupplier()
    {
        return $this->morphMany(Payment::class,'sender');
    }
    public function branches()
    {
        return $this->hasMany(Store::class,'parent_id','user_id');
    }
    public function departments()
    {
        return $this->hasMany(Department::class);
    }
   public function refunds()
    {
        return $this->hasMany(RefundProduct::class);
    }

  public function suppliers()
    {
        return $this->hasMany(Supplier::class);
    }


    public function getNameAttribute(){

        return $this->user->name;
    }

    public function getProductsAttribute(){

        $products=Product::
        whereHas('purchasedProduct',function ($q){
            $q->whereHas('purse',function ($qq){
                $qq->where('store_id',$this->id);
            });
        })-> OrWhereHas('assignDetails',function ($q){
            $q->whereHas('assignHeader',function ($qq){
                $qq->where('assignable_id',$this->id)->where('assignable_type',Store::class);
            });


        })->get()->where('quantity_available',true);

        return $products;
    }
//

}
