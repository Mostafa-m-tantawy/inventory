<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\CookedProduct;
use App\Http\Controllers\Controller;
use App\Models\inventory\Department;
use App\Models\inventory\PrepareHeader;
use App\Models\inventory\Product;
use App\Models\inventory\ProductRecipe;
use App\Models\inventory\Store;
use App\Models\inventory\Stock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class PrepareController extends Controller
{
    /**
     * @return cook log view
     */
    public function __constrator()
    {
        $this->middleware(['module:inventory']);
    }


    public function datatableData(Request  $request)
    {
        $PrepareHeaders = PrepareHeader::where('product_id',$request->product_id);
        return DataTables::eloquent($PrepareHeaders)

            ->addColumn('name', function ($row) {
                return $row->product->lang_name;
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })
            ->orderColumns(['quantity','created_at'], '-:column $1')
            ->make(true);
    }

    /*
     * @return process cooking
     */
    public function create($id)
    {
        try{

            $product = Product::findOrFail($id);
            $prepares = PrepareHeader::where('product_id',$id)->get();
            return view('veltrix.inventory.prepare.create')->with(compact('product', 'prepares'));
        }catch (\Exception $exception){

            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();
        }

    }

    /*
      * @return process cooking
      */
    public function cook(Request $request, $id)
    {

        try{

            DB::beginTransaction();

$product=Product::find($id);
            $prepareHeader=new PrepareHeader;
            $prepareHeader->user_id=Auth::user()->id;
            $prepareHeader->product_id=$id;
            $prepareHeader->quantity=$request->quantity;

            if($prepareHeader->save()){
                ProductCalculates($product);
                $recipes=ProductRecipe::where('prepared_product_id',$id)->get();
                foreach ($recipes as $rec) {
                    $rec_product=Product::find($rec->product_id);

                    $cooked = new CookedProduct();
                    $cooked->store_id = Auth::user()->store->id;
                    $cooked->prepare_header_id = $prepareHeader->id;
                    $cooked->product_id = $rec->product_id;
                    $cooked->quantity = $request->quantity * $rec->unit_quantity;
                    $cooked->cookable_id    =$id;
                    $cooked->cookable_type  = Product::class;
                    $cooked->save();

//                    $this->stockAdjustment( $cooked->product_id,$cooked->quantity);
                }

                $this->addStockAdjustment($id,$request->quantity);
                ProductCalculates($rec_product);

            }


            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return redirect()->back();
        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }

    }

    /**
     * check all product  recipes availability
     */
    public function productsAvailable(Request $request, $id)
    {

        try{


            $product = Product::findOrFail($id);

            $quantities = [];

            foreach ($product->recipes as $recipe) {
                $quantities[] = $recipe->product->quantity / $recipe->unit_quantity;
            }

            if (count($quantities) > 0) {
                return response()->json(['available' => min($quantities)], 200);

            } else {
                return response()->json(['available' => 0], 200);
            }

        }catch (\Exception $exception){
            \Log::debug($exception->getMessage());
            return response()->json(['status'=>false],422);

        }




    }


//    public function stockAdjustment($id,$quantity)
//    {
//        $product=Product::findOrFail($id);
//
//        $stock=Stock::where('stockable_type','Store::class')->where('stockable_id',Auth::user()->store->id)
//            ->where('product_id',$id)->first();
//
//        if ($stock){
//
//            $stock->quantity=$stock->quantity-$quantity;
//            $stock->cost=$product->calculateCost;
//            $stock->save();
//        }
//    }

    public function addStockAdjustment($id,$quantity)
    {
        $restaurant=Auth::user()->store;
        $product=Product::findOrFail($id);

        $stock=Stock::where('stockable_type',Store::class)->where('stockable_id',$restaurant->id)
            ->where('product_id',$id)->first();

        if ($stock){

            $stock->quantity=$stock->quantity+$quantity;
            $stock->cost=$product->calculateCost;
            $stock->save();

        }else{
            $stock=new Stock;
            $stock->stockable_type=Store::class;
            $stock->stockable_id=$restaurant->id;
            $stock->product_id  =$id;
            $stock->quantity    =$quantity;
            $stock->cost=$product->calculateCost;
            $stock->save();
        }
    }
}
