<?php

namespace App\Http\Controllers\inventory;

use App\Models\inventory\AssignStockDetails;
use App\Models\inventory\Department;
use App\Http\Controllers\Controller;
use App\Models\inventory\Product;
use App\Models\inventory\RefundProduct;
use App\Models\inventory\Store;
use App\Models\inventory\RuinedHeader;
use App\Models\inventory\RuinedProduct;
use App\Models\inventory\Stock;
use App\Models\inventory\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;
use Yajra\DataTables\Facades\DataTables;

class RuinedController extends Controller
{
    public function __construct()
    {    $this->middleware(['module:inventory']);

        $this->middleware(['permission:index ruined product'],['only'=>['index']]);
        $this->middleware(['permission:create ruined product'],['only'=>['newRuined']]);
        $this->middleware(['permission:delete ruined product'],['only'=>['destroy']]);
    }

    public function index()
    {
        $ruineds = RuinedProduct::all();

        return view('veltrix.inventory.ruined.index', [
            'ruineds' => $ruineds
        ]);
    }
    public function datatableData()
    {
        $ruineds = RuinedProduct::query();
        return DataTables::eloquent($ruineds)
            ->editColumn('product_id', function ($row) {
                return $row->product->lang_name;

            })
            ->addColumn('ruinedable', function ($row) {
                return $row->ruinedHeader->ruinedable->name . ' (' . __('main.' . substr(strrchr($row->ruinedHeader->ruinedable_type, '\\'), 1)). ')' ;
            })

            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y');
            })
                ->addColumn('action', function ($row) {


                    $btn = '&nbsp;<a href="#" data-url="' . route('ruined.destroy', [$row->id]) . '"
                     class="btn btn-danger" title="' . trans('main.delete') . '" data-toggle="modal" data-target="#deleteModal"
              >' . trans('main.delete') . '</a>';

                    return $btn;

                })
                    ->rawColumns(['action'])
            ->orderColumns(['quantity', 'total','price_unit', 'product_id'], '-:column $1')
            ->make(true);
    }

    public function newRuined()
    {
        return view('veltrix.inventory.ruined.new_ruined');
    }



  public function destroy($id)
    {
        $product = RuinedProduct::findOrFail($id);
        $product->delete();
        $header=$product->ruinedHeader;
        if($header->products->count() ==0){
           $header->delete();
       }
            return redirect()->back();

    }

    public function getAssignable($from)
    {
        if ($from == 'restaurant') {
            $branches = Store::where('parent_id', Auth::user()->id)
                ->orWhere('user_id', Auth::user()->id)
                ->with('user')
                ->get();

            if ($branches->count() > 0)
                return response()->json($branches, 200);
            else
                return response()->json('false', 422);
        } elseif ($from == 'department') {
            $departments = Department::all();

            if ($departments->count() > 0)
                return response()->json($departments, 200);
            else
                return response()->json('false', 422);
        }

    }

    public function ruinedProducts(Request $request)
    {
        $type = $request->type;
        $from = $request->from;

        if ($type == 'restaurant') {
            $restaurant = Store::findOrFail($from);

            $products = Product::
          WhereHas('stocks', function ($q) use ($restaurant) {
                    $q->where('stockable_id', $restaurant->id)
                        ->where('stockable_type', Store::class);
            })->get();

        }
        elseif($type == 'department'){
        $department=Department::findOrFail($from);
            $products = Product::
            WhereHas('stocks', function ($q) use ($department) {
                $q->where('stockable_id', $department->id)
                    ->where('stockable_type', Department::class);
            })->get();

        }

        if ($products->count() > 0)
            return response()->json($products, 200);
        else
            return response()->json('false', 422);
    }


        public function saveRuined(Request $request)
        {
            try{
                DB::beginTransaction();
                $ruinedHeader=new RuinedHeader();
            $ruinedHeader->ruinedable_id=$request->ruined_from;
            $ruinedHeader->ruinedable_type=($request->type=='restaurant')?Store::class:Department::class;
            $ruinedHeader->store_id = Auth::user()->store->id;
            $ruinedHeader->save();

            foreach (json_decode($request->get('purses')) as $purse) {

                $product = $purse->product;
                $unit = $purse->unit;

                $ruinedProduct = new RuinedProduct();
                $ruinedProduct->product_id = $product->productId;
                $ruinedProduct->ruined_header_id	 = $ruinedHeader->id;
                $ruinedProduct->quantity = $purse->quantity;
                $ruinedProduct->price_unit = $purse->unit_cost;
                $ruinedProduct->total = $purse->unit_cost*$purse->quantity;
                $ruinedProduct->note = $purse->note;
                $ruinedProduct->save();
                $this->stockAdjustment( $purse,$ruinedHeader->ruinedable_type,$request->ruined_from);
            }
                DB::commit();
                return response()->json('Ok', 200);

            }catch (\Exception $exception){
                 DB::rollBack();
                \Log::debug($exception->getMessage());
                return response()->json(['status'=>false], 422);

            }



        }

        public function getProductQuantity(Request $request,$id)
        {
            if($request->ruined_type=='restaurant'){
                $stock=Stock::where('stockable_type',Store::class)
                ->where('stockable_id',$request->ruined_from)->where('product_id',$id)->first();


            }else{
                $stock=Stock::where('stockable_type',Department::class)
                    ->where('stockable_id',$request->ruined_from)
                    ->where('product_id',$id)->first();

            }

            if($stock)
                return response()->json($stock->quantity, 200);
            else
                return response()->json(0, 200);
            }


    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function stockAdjustment($item,$model,$model_id)
    {

        $product=Product::findOrFail($item->product->productId);

        $stock=Stock::where('stockable_type',$model)->where('stockable_id',$model_id)
            ->where('product_id',$item->product->productId)->first();

        if ($stock){
            $stock->quantity=$stock->quantity - $item->quantity;
            $stock->save();
        }
    }
    }
