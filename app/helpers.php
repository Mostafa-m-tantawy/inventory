<?php


use App\Models\conf\Systemconf;
use App\Models\inventory\CookedProduct;
use App\Models\inventory\Product;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

if (!function_exists('getAttrName')) {

    function getAttrName($attr)
    {

        $default = 'en';
        $curruntLocale = app()->getLocale();

        $locales = ['ar', 'en'];

        foreach ($locales as $val) {
            if ($curruntLocale == $default) {
                return $attr;
            } elseif ($curruntLocale == 'ar') {
                $name = $attr . '_ar';
                return $name;
            }
        }
    }
}


if (!function_exists('getOppositeAttrName')) {
    function getOppositeAttrName($attr)
    {
        $curruntLocale = app()->getLocale();
        if ($curruntLocale === 'en')
            return $attr . '_ar';
        return $attr;
    }
}


if (!function_exists('storeOrderLog')) {
    function storeOrderLog($data)
    {
        \App\Models\OrderLog::create($data);
    }
}

if (!function_exists('supplierCalculates')) {
    function supplierCalculates($supplier)
    {
        $purses_amount = 0;
        $purchases = $supplier->purchases;
        foreach ($purchases as $purchase) {
            $purses_amount += $purchase->pursesProducts->sum(function ($t) {
                return ($t->quantity * $t->unit_price) + ($t->quantity * $t->unit_price) * ($t->vat / 100);
            });;
        }
        $payment_amount = $supplier->payment->sum('payment_amount');
        $refunds = $supplier->refunds->where('store_id', Auth::user()->store->id)->sum(function ($t) {
            return ($t->quantity * $t->unit_price) + ($t->quantity * $t->unit_price) * ($t->vat / 100);
        });
        $credit = $supplier->start_balance + $purses_amount - $refunds - $payment_amount;
        $supplier->purchases_amount = $purses_amount;
        $supplier->refunds_amount = $refunds;
        $supplier->paid_amount = $payment_amount;
        $supplier->credit_amount = $credit;
        $supplier->save();

    }
}
if (!function_exists('restaurantCalculates')) {
    function restaurantCalculates($restaurant)
    {
        $supplier_credit_amount = $restaurant->suppliers()->sum('credit_amount');
        $purses_amount = 0;
        $payment_amount = $restaurant->paySupplier->sum('payment_amount');
        $refunds = $restaurant->refunds->sum(function ($t) {
            return ($t->quantity * $t->unit_price) + ($t->quantity * $t->unit_price) * ($t->vat / 100);
        });
        $purchases = $restaurant->purchases;
        foreach ($purchases as $purchase) {
            $purses_amount += $purchase->pursesProducts->sum(function ($t) {
                return ($t->quantity * $t->unit_price) + ($t->quantity * $t->unit_price) * ($t->vat / 100);
            });;
        }
        $dept = $restaurant->suppliers->sum('start_balance') + $purses_amount - $refunds - $payment_amount;
//        supplier_credit_amount
        $restaurant->supplier_credit_amount = $supplier_credit_amount;
        $restaurant->purchases_amount = $purses_amount;
        $restaurant->refunds_amount = $refunds;
        $restaurant->paid_amount = $payment_amount;
        $restaurant->dept_amount = $dept;
        $restaurant->save();

    }
}
if (!function_exists('ProductCalculates')) {
    function ProductCalculates($product)
    {
        $stock = $product->MainStoreQuantity( Auth::user()->store);
        $cooked = CookedProduct::where('cookable_type', Product::class)
            ->where('product_id', $product->id)
            ->sum('quantity');
        $quantity = $stock - $cooked;
        $cost = 0;

        if ($product->is_prepared) {
            $cost = preparedCost($product);
        } else {

            $cost = notPreparedCost($product);
        }
        $product->cost = $cost;
        $product->quantity = $quantity;
        $product->save();
    }
}


/// price with 2 method last_price && avg_price
/// between dates if method average price
///
if (!function_exists('preparedCost')) {
    function preparedCost($product)
    {
        $quantity = 0;
        $recipes = $product->recipes;
        foreach ($recipes as $recipe) {
            $quantity += $recipe->product->cost * $recipe->unit_quantity;
        }
        return $quantity;
    }
}


if (!function_exists('notPreparedCost')) {
    function notPreparedCost($product)
    {

        // method of calculations
        $sysyemConf = Systemconf::all();
        $method = $sysyemConf->where('name', 'method')->first()->value;
        $from = '';
        $to = '';
        $vat=0;

        //purchases
        $openStock= $product->openStockProduct;
        //purchases
        $purchases = $product->purchasedProduct;
        //refund
        $refunds = $product->refund;


        if ($method == 'avg_cost') {
            $from = Carbon::now()->subMonth($sysyemConf->where('name', 'months')->first()->value)->toDateString();
            $to = Carbon::now()->toDateString();
        }

        if ($method == 'last_price' && $purchases->count() > 0) {
            return $purchases->orderByDesc('created_at')->first()?$purchases->orderByDesc('created_at')->first()->unit_price:$openStock->orderByDesc('created_at')->first()?$openStock->orderByDesc('created_at')->first():0;

        } elseif ($method == 'avg_cost' && ($purchases->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])->count() > 0  || $openStock->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])->count() > 0  )) {

            /// purchase
            $purchasescost = $purchases->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum(function ($t) {
                    return $t->unit_price * $t->quantity;
                });
            $purchasesquantity = $purchases->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum('quantity');

            /// open Stock
            $openStockCost = $openStock->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum(function ($t) {
                    return $t->unit_price * $t->quantity;
                });
            $openStockQuantity = $openStock->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum('quantity');


        if($purchases->count())
            $vat = $purchases->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                    ->sum('vat') / $purchases->count();


            $refundsCost = $refunds->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum(function ($t) {
                    return $t->unit_price * $t->quantity;
                });

            $refundsQuantity = $refunds->whereBetween('created_at', [$from . ' 00:00:00', $to . ' 23:59:59'])
                ->sum('quantity');


            $totalcost = $purchasescost + $openStockCost - $refundsCost;
            $totalquantity = $purchasesquantity + $openStockQuantity - $refundsQuantity;
            if ($totalquantity <= 0 )
                return 0;

            return ($totalcost / $totalquantity) + (($totalcost / $totalquantity) * ($vat / 100));

        }
    }
}


if (!function_exists('moduleAccess')) {
    function moduleAccess($module)
    {
        return  true ;
    }
}


