<?php

namespace App\Http\Controllers\inventory;

use App\Http\Controllers\Controller;
use App\Models\inventory\Product;
use App\Models\inventory\ProductCategory;
use App\Models\inventory\ProductRecipe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;

class ProductRecipeController extends Controller
{
    public function __construct()
    {    $this->middleware(['module:inventory']);

    }

    /*
     * Show  Product Recipes
     */
    public  function show( $id){
        try{

            $product =Product::with('recipes')->findOrFail($id);
            $categories=ProductCategory::with(['products'=>function($q){
                $q->where('is_prepared',0);
            }])->whereHas('products',function($q){
                $q->where('is_prepared',0);
            })->get();

            return view('veltrix.inventory.products.recipe')->with(compact('categories','product'));

        }catch (\Exception $exception){
            \Log::debug($exception->getMessage());
            return redirect()->back();

        }

     }


    /*
     * store  Product Recipes
     */

    public  function store( Request $request,$id){
        $validatedData = $request->validate([
            'product' => ['required'],
            'quantity' => ['required', 'numeric'],
        ]);
        try{

            DB::beginTransaction();




            $recipe=  ProductRecipe::where('product_id',$request->product)->where('prepared_product_id',$id)->first();
            if(!$recipe){
                $recipe = new ProductRecipe();
            }

            $recipe->product_id = $request->product;
            $recipe->unit_quantity = $request->quantity;
            $recipe->child_unit_quantity = $request->child;
            $recipe->prepared_product_id = $id;
            $recipe->save();



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

    /*
     * store  Product Recipes
     */

    public  function delete( $id){
        try{

            DB::beginTransaction();

            ProductRecipe::destroy($id);

            DB::commit();
            toastr()->warning(__('toastr.record deleted successfully'));
            return redirect()->back();
        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }

    }



}
