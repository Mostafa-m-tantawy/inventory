<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\AssignStock;
use App\Models\inventory\AssignStockDetails;
use App\Models\inventory\Department;
use App\Http\Controllers\Controller;
use App\Models\inventory\Product;
use App\Models\inventory\Store;
use App\Models\inventory\Stock;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class AssignController extends Controller
{

    public function __construct()
    {
        $this->middleware(['module:inventory']);

        $this->middleware(['permission:index assign stock'], ['only' => ['index']]);
        $this->middleware(['permission:create assign stock'], ['only' => ['CreateAssign']]);
    }

    public function index()
    {

        $assigns = AssignStock::all();

        return view('veltrix.inventory.assign.index')->with(compact('assigns'));
    }

    public function datatableData()
    {
        $assigns = AssignStockDetails::query();
        return DataTables::eloquent($assigns)
            ->editColumn('product_id', function ($row) {
                return $row->product->lang_name;

            })
            ->addColumn('sourceable', function ($row) {
                return $row->assignHeader->sourceable->name . ' (' . __('main.' . substr(strrchr($row->assignHeader->sourceable_type, '\\'), 1)). ')' ;
            })
            ->addColumn('assignable', function ($row) {
                return $row->assignHeader->assignable->name . ' (' . __('main.' . substr(strrchr($row->assignHeader->assignable_type, '\\'), 1)). ')' ;

            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y');
            })
             ->orderColumns(['quantity', 'product_id'], '-:column $1')
            ->make(true);
    }

    public function CreateAssign()
    {
        $restaurant = Auth::user()->store;

        return view('veltrix.inventory.assign.create-assign')->with(compact('restaurant'));

    }

    public function getSource($type)
    {
        if ($type == 'restaurant') {
            $restaurant = Auth::user()->store;
            return response()->json($restaurant, 200);
        } elseif ($type == 'department') {
            $departments = Department::all();

            if ($departments->count() > 0)
                return response()->json($departments, 200);
            else
                return response()->json('false', 422);
        }

    }


    public function getSourceProducts(Request $request)
    {

        if ($request->type == 'restaurant') {

            $products = Product::whereHas('stocks', function ($q) use ($request) {
                $q->where('stockable_type', Store::class)->where('stockable_id', Auth::user()->store->id);
            })->get();

            $departments = Department::all();

            if ($products->count() > 0)
                return response()->json([$products, $departments], 200);
            else
                return response()->json('false', 422);

        } elseif ($request->type == 'department') {
            $department = Department::findOrFail($request->id);
            $restaurant = Auth::user()->store;
            $products = Product::whereHas('stocks', function ($q) use ($request) {
                $q->where('stockable_type', Department::class)->where('stockable_id', $request->id);
            })->get();
            if ($products->count() > 0)
                return response()->json([$products, [$restaurant]], 200);
            else
                return response()->json('false', 422);
        }

    }


    public function saveAssign(Request $request)

    {
        try {

            DB::beginTransaction();


            $assign = new AssignStock();
            $assign->store_id = Auth::user()->store->id;
            $assign->sourceable_id = $request->source_id;
            $assign->sourceable_type = ($request->source_type == 'restaurant') ? Store::class : Department::class;
            $assign->assignable_id = $request->assign_to;
            $assign->assignable_type = ($request->source_type == 'restaurant') ? Department::class : Store::class;
            if ($assign->save()) {

                foreach (json_decode($request->get('purses')) as $purse) {

                    $product = $purse->product;

                    $assign_details = new AssignStockDetails();
                    $assign_details->assign_stock_id = $assign->id;
                    $assign_details->product_id = $product->productId;
                    $assign_details->quantity = $purse->quantity;
                    $assign_details->save();

                    $this->stockAdjustment($assign->sourceable_type, $assign->sourceable_id,
                        $assign->assignable_type, $assign->assignable_id, $purse);
                }
            }


            DB::commit();
            return response()->json(['status' => true], 200);
        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json(['status' => false], 422);

        }


    }

    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function stockAdjustment($source, $source_id, $receive, $receive_id, $item)
    {

        $product = Product::findOrFail($item->product->productId);

        if ($source) {

            $stockSource = Stock::where('stockable_type', $source)->where('stockable_id', $source_id)
                ->where('product_id', $item->product->productId)->first();
            if ($stockSource) {
                $stockSource->quantity = $stockSource->quantity - $item->quantity;
                $stockSource->save();

            }
        }
        if ($receive) {

            $stockReceive = Stock::where('stockable_type', $receive)->where('stockable_id', $receive_id)
                ->where('product_id', $item->product->productId)->first();
            if ($stockReceive) {
                $stockReceive->quantity = $stockReceive->quantity + $item->quantity;
                $stockReceive->save();
            } else {
                $stockReceive = new Stock;
                $stockReceive->stockable_type = $receive;
                $stockReceive->stockable_id = $receive_id;
                $stockReceive->product_id = $item->product->productId;
                $stockReceive->quantity = $item->quantity;
                $stockReceive->cost = $product->calculateCost;
                $stockReceive->save();
            }
        }

    }
}
