<?php

namespace App\Http\Controllers\purchase;

use App\Http\Controllers\Controller;
use App\Http\Requests\purchase\CreateRefundPurses;
use App\Models\inventory\Product;
use App\Models\inventory\Purse;
use App\Models\inventory\PursesProduct;
use App\Models\inventory\RefundProduct;
use App\Models\inventory\Store;
use App\Models\inventory\Stock;
use App\Models\inventory\Supplier;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;
use Yajra\DataTables\Facades\DataTables;

class RefundController extends Controller
{

    public function __construct()
{        $this->middleware(['module:purchase']);

    $this->middleware(['permission:index refund'],['only'=>['index']]);
    $this->middleware(['permission:create refund'],['only'=>['newRefund','saveRefund']]);
    $this->middleware(['permission:delete refund'],['only'=>['deleteRefund']]);
}

    public function index()
    {
        $refunds = RefundProduct::all();

        return view('veltrix.purchase.refund.index')->with(compact('refunds'));
    }

    public function DatatableData()
    {
        $RefundProduct = RefundProduct::query();
        return DataTables::eloquent($RefundProduct)

            ->editColumn('supplier_id', function ($row) {
                return $row->supplier->user->name;
            })
            ->editColumn('product_id', function ($row) {
                return $row->product->lang_name;
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })

            ->addColumn('action', function ($row) {


                $btn = '&nbsp;<a href="#" data-url="' .url('stock/refund/delete/'.$row->id) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal"
              >' . trans('main.delete') . '</a>';

                return $btn;

            })
            ->rawColumns(['action'])

            ->orderColumns(['product_id','supplier_id','created_at','vat','quantity','total','unit_price'], '-:column $1')
            ->make(true);
    }
    public function newRefund()
    {
        $suppliers = Supplier::all();
        return view('veltrix.purchase.refund.new_refund')->with(compact('suppliers'));
    }


    public function saveRefund(CreateRefundPurses $request)
    {
        try{
            DB::beginTransaction();
            $user = auth()->user();
            $restaurant = $user->store;
            $supplier=Supplier::findOrFail($request->get('supplier_id'));

            foreach (json_decode($request->get('purses')) as $purse) {

                $product = $purse->product;
                $unit = $purse->unit;

                $refundProduct = new RefundProduct();
                $refundProduct->product_id = $product->productId;
                $refundProduct->supplier_id = $request->get('supplier_id');
                $refundProduct->store_id = Auth::user()->store->id;
                $refundProduct->quantity = $purse->quantity;
                $refundProduct->unit_price = $unit->unitPrice;
                $refundProduct->note = $purse->note;
                $refundProduct->vat = ($refundProduct->quantity * $refundProduct->unit_price)*($product->vat/100);
                $refundProduct->total = ($refundProduct->quantity * $refundProduct->unit_price) +$refundProduct->vat;
                $refundProduct->save();
                supplierCalculates($supplier);
                restaurantCalculates($restaurant);

                $this->stockAdjustment($purse);
                ProductCalculates(Product::find( $product->productId));
            }
            DB::commit();
            return response()->json('Ok', 200);

        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json('error', 422);

        }



    }

    public function deleteRefund($id)
    {
        try{
            DB::beginTransaction();
           $product=RefundProduct::findOrFail($id);
            $this->addStockAdjustment($product);
            $product->delete();
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

    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function stockAdjustment($item)
    {
        $restaurant=Auth::user()->store;
        $product=Product::findOrFail($item->product->productId);


        $stock=Stock::where('stockable_type',Store::class)->where('stockable_id',$restaurant->id)
            ->where('product_id',$item->product->productId)->first();


        if ($stock){
            $stock->quantity=$stock->quantity-$item->quantity;
            $stock->save();
        }
    }
    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function addStockAdjustment($item)
    {
        $restaurant=Auth::user()->store;
        $product=Product::findOrFail($item->product->id);


        $stock=Stock::where('stockable_type',Store::class)->where('stockable_id',$restaurant->id)
            ->where('product_id',$item->product->id)->first();


        if ($stock){
            $stock->quantity=$stock->quantity+$item->quantity;
            $stock->save();
        }
    }


}
