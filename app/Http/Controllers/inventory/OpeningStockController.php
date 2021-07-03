<?php

namespace App\Http\Controllers\inventory;

use App\Http\Controllers\Controller;
use App\Models\inventory\Department;
use App\Models\inventory\OpeningStock;
use App\Models\inventory\OpeningStockDetails;
use App\Models\inventory\Payment;
use App\Models\inventory\Product;
use App\Models\inventory\Purse;
use App\Models\inventory\PursesProduct;
use App\Models\inventory\Store;
use App\Models\inventory\Stock;
use App\Models\inventory\Supplier;
use App\Models\inventory\Unit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use PHPUnit\Exception;
use Yajra\DataTables\Facades\DataTables;

class OpeningStockController extends Controller
{
    public function __construct()
    {        $this->middleware(['module:purchase']);

//        $this->middleware(['permission:create purchase'],['only'=>['addPurchase','']]);
//        $this->middleware(['permission:update purchase'],['only'=>['editPurses','savePursesProduct']]);
//        $this->middleware(['permission:summery purchase'],['only'=>['SummeryIndex']]);
//        $this->middleware(['permission:details purchase'],['only'=>['detailedIndex']]);
    }




    public function index()
    {
        $opens = OpeningStock::all();

        return view('veltrix.inventory.openStock.summery_index',[
            'opens'            =>      $opens
        ]);
    }



    public function datatableData()
    {
        $OpeningStock = OpeningStock::query();
        return DataTables::eloquent($OpeningStock)

            ->addColumn('total', function ($row) {
               return $row->total;
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })
            ->addColumn('attachments', function ($row) {
//                return '';
                $btn='';
                foreach($row->files as $key=>$file) {
                    $btn .= '    <a   href = "'.url($file->url).' " download = "" >
                                                    '. ($key+1) .' <i class="fa fa-cloud-download-alt" ></i ></a >';
               }
                return $btn;
            })
            ->addColumn('action', function ($row) {

                $btn = ' <a title="Show" class="btn btn-warning" href=" '.route('open-stock.show',[$row->id]).'">
                                                 '.trans('main.show').'
                                            </a>';

                return $btn;

            })
            ->rawColumns(['action','attachments'])
            ->orderColumns(['created_at'], '-:column $1')
            ->make(true);
    }



    public function detailedDatatableData()
    {
        $OpeningStockDetails = OpeningStockDetails::query();
        return DataTables::eloquent($OpeningStockDetails)

            ->editColumn('product_id', function ($row) {
            return $row->product->lang_name;
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })
            ->orderColumns(['quantity','unit_price','total','product_id'], '-:column $1')
            ->make(true);
    }

    public function create()
    {
        $products = Product::orderBy('name')->where('is_prepared',0)->get();
        return view('veltrix.inventory.openStock.create')
            ->with(compact('products'));
    }

    public function detailedIndex()
    {

        $opens = OpeningStock::all();

        return view('veltrix.inventory.openStock.detailed_index',[
            'opens'            =>      $opens
        ]);
    }



    public function show($id)
    {
        $opens = OpeningStock::findOrFail($id);
        $products = Product::orderBy('name')->where('is_prepared',0)->get();

        return view('veltrix.inventory.openStock.show')
            ->with(compact('opens'));
    }


    /**
     * New purses store into database
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function store(Request $request)
    {
        try{
            DB::beginTransaction();

            $user=  auth()->user();
            $open = new OpeningStock();
            $open->user_id = $user->id;
            if($open->save()) {

                if ($request->hasfile('files')) {
                    $open->upload($request->file('files'));
                }
                foreach (json_decode($request->get('purses')) as $purse) {

                    $product = $purse->product;
                    $unit = $purse->unit;
                    $openDetails = new OpeningStockDetails();
                    $openDetails->opening_stock_id = $open->id;
                    $openDetails->product_id = $product->productId;
                    $openDetails->quantity = $purse->quantity;
                    $openDetails->unit_price = $unit->unitPrice;
                    $openDetails->total = $unit->unitPrice*$purse->quantity;
                    if ($openDetails->save()) {
                        $this->stockAdjustment($purse);
                        ProductCalculates(Product::find( $product->productId));
                    }
                }
            }
            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return response()->json('Ok',200);

        }catch (\Exception $exception){
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json('Internal Server Error',422);
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

            $stock->quantity=$stock->quantity+$item->quantity;
            $stock->cost=$product->calculateCost;
            $stock->save();

        }else{
            $stock=new Stock;
            $stock->stockable_type=Store::class;
            $stock->stockable_id=$restaurant->id;
            $stock->product_id  =$item->product->productId;
            $stock->quantity    =$item->quantity;
            $stock->cost=$product->calculateCost;
            $stock->save();
        }
    }

    /**
     * View purses details page
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */

    public function getPursesDetails($id)
    {
        $purses = OpeningStock::with('openStockDetails')->findOrFail($id);
        return response()->json($purses);
    }

}
