<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\Department;
use App\Http\Controllers\Controller;
use App\Models\inventory\Product;
use App\Models\inventory\SaleDetails;
use App\Models\inventory\SaleHeader;
use App\Models\inventory\Store;
use App\Models\inventory\RuinedHeader;
use App\Models\inventory\RuinedProduct;
use App\Models\inventory\Stock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class SalesController extends Controller
{
    public function __construct()
    {

    }

    public function index()
    {

        return view('veltrix.inventory.sales.index');
    }

    public function datatableData()
    {
        $ruineds = SaleDetails::query();
        return DataTables::eloquent($ruineds)
            ->editColumn('product_id', function ($row) {
                return $row->product->lang_name;

            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y');
            })
            ->orderColumns(['quantity', 'total', 'price_unit', 'product_id'], '-:column $1')
            ->make(true);
    }

    public function create()
    {
        return view('veltrix.inventory.sales.create');
    }

    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $saleHeader = new SaleHeader();
            $saleHeader->store_id = Auth::user()->store->id;
            $saleHeader->save();

            foreach (json_decode($request->get('purses')) as $purse) {

                $product = $purse->product;
                $unit = $purse->unit;

                $saleProduct = new SaleDetails();
                $saleProduct->product_id = $product->productId;
                $saleProduct->sale_header_id = $saleHeader->id;
                $saleProduct->quantity = $purse->quantity;
                $saleProduct->store_id = Auth::user()->store->id;
                $saleProduct->price_unit = $purse->unit_cost;
                $saleProduct->total = $purse->unit_cost * $purse->quantity;
                $saleProduct->note = $purse->note;
                $saleProduct->save();

                $this->stockAdjustment($purse, Store::class, Auth::user()->store->id);
            }
            DB::commit();
            return response()->json('Ok', 200);

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json(['status' => false], 422);

        }
    }

    public function getProductQuantity(Request $request, $id)
    {
        $stock = Stock::where('stockable_type', Store::class)
            ->where('stockable_id', Auth::user()->store->id)->where('product_id', $id)->first();

        if ($stock)
            return response()->json($stock->quantity, 200);
        else
            return response()->json(0, 200);
    }

    public function getProducts(Request $request)
    {
        $products = Product::
        WhereHas('stocks', function ($q) {
            $q->where('stockable_id', Auth::user()->store->id)
                ->where('stockable_type', Store::class);
        })->get();

        if ($products->count() > 0)
            return response()->json($products, 200);
        else
            return response()->json('false', 422);
    }

    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function stockAdjustment($item, $model, $model_id)
    {

        $stock = Stock::where('stockable_type', $model)->where('stockable_id', $model_id)
            ->where('product_id', $item->product->productId)->first();

        if ($stock) {
            $stock->quantity = $stock->quantity - $item->quantity;
            $stock->save();
        }
    }
}
