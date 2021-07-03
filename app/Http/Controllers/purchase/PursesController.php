<?php

namespace App\Http\Controllers\purchase;

use App\Http\Controllers\Controller;
use App\Http\Requests\purchase\CreatePurses;
use App\Models\inventory\OpeningStock;
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

class PursesController extends Controller
{
    public function __construct()
    {
        $this->middleware(['module:purchase']);

        $this->middleware(['permission:create purchase'], ['only' => ['addPurchase', '']]);
        $this->middleware(['permission:update purchase'], ['only' => ['editPurses', 'savePursesProduct']]);
        $this->middleware(['permission:summery purchase'], ['only' => ['SummeryIndex']]);
        $this->middleware(['permission:details purchase'], ['only' => ['detailedIndex']]);
    }






    public function summeryDatatableData()
    {
        $Purses = Purse::query();
        return DataTables::eloquent($Purses)

            ->editColumn('supplier_id', function ($row) {
                return $row->supplier->user->name;
            })
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
                $btn = ' <a title="Show" class="btn btn-warning" href=" '.url('stock/purchase/show/'.$row->id).'">
                                                 '.trans('main.show').'
                                            </a>';
                return $btn;

            })
            ->rawColumns(['action','attachments'])
            ->orderColumns(['created_at','supplier_id'], '-:column $1')
            ->make(true);
    }

    public function detailedDatatableData()
    {
        $OpeningStock = PursesProduct::query();
        return DataTables::eloquent($OpeningStock)

            ->addColumn('supplier', function ($row) {
                return $row->purse->supplier->user->name;
            })
            ->editColumn('product_id', function ($row) {
                return $row->product->lang_name;
            })
            ->editColumn('created_at', function ($row) {
                return $row->created_at->format('d/m/Y H:i');
            })

            ->orderColumns(['created_at','vat','quantity','total','unit_price'], '-:column $1')
            ->make(true);
    }

    public function addPurchase()
    {
        $products = Product::orderBy('name')->get();
        $suppliers = Supplier::all();
        $units = Unit::all();

        return view('veltrix.purchase.purchase.new-purses')
            ->with(compact('products', 'units', 'suppliers'));
    }


    public function SummeryIndex()
    {
        $purses = Purse::where('store_id', Auth::user()->store->id)->get();

        return view('veltrix.purchase.purchase.summery_index', [
            'purses' => $purses
        ]);
    }


    public function detailedIndex()
    {

        $purses = Purse::all();

        return view('veltrix.purchase.purchase.detailed_index', [
            'purses' => $purses
        ]);
    }


    public function editPurses($id)
    {
        $purses = Purse::findOrFail($id);
        $products = $purses->supplier->products;
        $suppliers = Supplier::all();
        $unit = Unit::all();
        return view('veltrix.purchase.purchase.edit-purses')
            ->with(compact('purses', 'products', 'suppliers', 'unit'));
    }


    /**
     * New purses store into database
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function savePurses(CreatePurses $request)
    {
        try {
            DB::beginTransaction();
            $user = auth()->user();
            $supplier = Supplier::findOrFail($request->get('supplier_id'));
            $restaurant = $user->store;
            $purses = new Purse();
            $purses->supplier_id = $request->get('supplier_id');
            $purses->user_id = $user->id;
            $purses->store_id = $user->store->id;
            $purses->discount = $request->get('discount');
            if ($purses->save()) {

                if ($request->hasfile('files')) {
                    $purses->upload($request->file('files'));
                }
                foreach (json_decode($request->get('purses')) as $purse) {

                    $product = $purse->product;
                    $unit = $purse->unit;
                    $pursesProduct = new PursesProduct();
                    $pursesProduct->purse_id = $purses->id;
                    $pursesProduct->product_id = $product->productId;
                    $pursesProduct->quantity = $purse->quantity;
                    $pursesProduct->unit_price = $unit->unitPrice;
;
                    $pursesProduct->discount_percentage = $purse->discount_percentage ? ($purse->quantity * $unit->unitPrice)*($purse->discount_percentage/100) : 0;
                    $pursesProduct->vat = (($purse->quantity * $unit->unitPrice ) -$pursesProduct->discount_percentage )*($product->vat/100);
                    $pursesProduct->total =($unit->unitPrice*$purse->quantity)-$pursesProduct->discount_percentage +$pursesProduct->vat;

                    if ($pursesProduct->save()) {

                        $this->stockAdjustment($purse);
                        ProductCalculates(Product::find( $product->productId));

                    } else {
                        PursesProduct::where('purses_id', $purses->id)->delete();
                        Purse::destroy($purse->id);
                        return response()->json('Internal Server Error', 422);
                    }
                }

                if ($request->get('payment') == 'cash') {
                    $payment = new Payment;
                    $payment->store_id = $user->store->id;;
                    $payment->payment_amount = $purses->total;
                    $payment->payment_method = 'cash';
                    $payment->sender_id = $user->store->id;;;
                    $payment->receiver_id = $request->get('supplier_id');;
                    $payment->save();

                    supplierCalculates($supplier);
                    restaurantCalculates($restaurant);
                }
            }

            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return response()->json('Ok', 200);

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json('Internal Server Error', 422);

        }

    }

    /**
     *  stock adjustment  is a static numbers to solve performance issues
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function stockAdjustment($item)
    {
        $restaurant = Auth::user()->store;
        $product = Product::findOrFail($item->product->productId);

        $stock = Stock::where('stockable_type', Store::class)->where('stockable_id', $restaurant->id)
            ->where('product_id', $item->product->productId)->first();

        if ($stock) {

            $stock->quantity = $stock->quantity + $item->quantity;
            $stock->cost = $product->calculateCost;
            $stock->save();

        } else {
            $stock = new Stock;
            $stock->stockable_type = Store::class;
            $stock->stockable_id = $restaurant->id;
            $stock->product_id = $item->product->productId;
            $stock->quantity = $item->quantity;
            $stock->cost = $product->calculateCost;
            $stock->save();
        }
    }

    /**
     * Get products unit by id
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getUnitOfProduct($id)
    {
        $product = Product::where('id', $id)->with('unit')->first();
        return response()->json($product);
    }

    /**
     * View purses details page
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */

    public function getPursesDetails($id)
    {
        $purses = Purse::with('pursesProducts')->with('pursesPayments')->findOrFail($id);
        return response()->json($purses);
    }


    /**
     * Delete purses product
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function deletePursesProduct($id)
    {
        PursesProduct::destroy($id);
        return redirect()->back();
    }

    /**
     * Save purses product
     * @param Request $request
     * @param $purses_id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function savePursesProduct(Request $request, $id)
    {
        try {
            DB::beginTransaction();

            $pursesProduct = new PursesProduct();
            $pursesProduct->purse_id = $id;
            $pursesProduct->product_id = $request->get('product_id');
            $pursesProduct->quantity = $request->get('quantity');
            $pursesProduct->unit_price = $request->get('unit_price');
            $pursesProduct->discount_percentage = $request->get('percentage_discount');
            $pursesProduct->vat = $request->get('vat');
            if ($pursesProduct->save()) {
                $restaurant = Auth::user()->store;
                $product = Product::findOrFail($pursesProduct->product_id);

                $stock = Stock::where('stockable_type', Store::class)->where('stockable_id', $restaurant->id)
                    ->where('product_id', $pursesProduct->product_id)->first();

                if ($stock) {

                    $stock->quantity = $stock->quantity + $pursesProduct->quantity;
                    $stock->cost = $product->calculateCost;
                    $stock->save();

                } else {
                    $stock = new Stock;
                    $stock->stockable_type = Store::class;
                    $stock->stockable_id = $restaurant->id;
                    $stock->product_id = $pursesProduct->product_id;
                    $stock->quantity = $pursesProduct->quantity;
                    $stock->cost = $product->calculateCost;
                    $stock->save();
                }
            }
            DB::commit();
            toastr()->success(__('toastr.record added successfully'));
            return redirect()->back();

        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            toastr()->error(__('toastr.Error!! please try again'));
            return redirect()->back();

        }


    }

    /**
     * Delete purses
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */


    public function supplierProducts($id)
    {
        $products = Supplier::findOrFail($id)->products()->where('is_prepared', 0)->get()->append('langName');
        return response()->json($products, 200);

    }


}
