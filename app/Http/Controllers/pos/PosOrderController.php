<?php

namespace App\Http\Controllers\pos;

use App\Http\Resources\pos\dishes\DishesResource;
use App\Http\Resources\pos\order\OrderResource;
use App\Models\crm\Client;
use App\Models\inventory\CookedProduct;
use App\Models\crm\Coupon;
use App\Models\cost\Dish;
use App\Models\cost\DishCategory;
use App\Models\cost\DishSize;
use App\Models\cost\DishSizeRecipe;
use App\Models\pos\Hall;
use App\Http\Controllers\Controller;
use App\Models\pos\Order;
use App\Models\pos\OrderDetails;
use App\Models\pos\OrderPayment;
use App\Models\inventory\Product;
use App\Models\inventory\Stock;
use App\Models\conf\SystemConf;
use App\Models\pos\Table;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PosOrderController extends Controller
{
    public function __construct()
    {        $this->middleware(['module:sales']);

        $this->middleware(['permission:index order'], ['only' => ['index']]);
        $this->middleware(['permission:create order'], ['only' => ['create', 'store']]);
        $this->middleware(['permission:update order'], ['only' => ['edit', 'update']]);
        $this->middleware(['permission:delete order'], ['only' => ['destroy']]);
        $this->middleware(['permission:close order'], ['only' => ['closeOrder']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->range) {
            // lenght 10 date = (01/01/2001) =10
            $from = substr($request->range, 0, 10);
            // start  13 date = (01/01/2001 */*)=13
            $to = substr($request->range, 13, 10);
        }else{

            // lenght 10 date = (01/01/2001) =10
            $from = \Carbon\Carbon::today()->format('Y-m-d');
            // start  13 date = (01/01/2001 */*)=13
            $to = \Carbon\Carbon::today()->format('Y-m-d');

        }
        $orders = Order::whereBetween('updated_at', [$from.' 00:00:00', $to.' 23:59:59'])->orderByDesc('updated_at')
            ->get();
        return view('pos.order.index')->with(compact('orders','from','to'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $categories = DishCategory::where('show', 1)->with(['dishes' => function ($q) {
            $q->where('status', 1)->whereHas('sizes');
        }])->get()->where('AvailableQuantity','>',0);


        $coupons = Coupon::valid();
        $clients = Client::all();

        $table = $request->table;
        $type = $request->type;
        $client = 0;
        if ($request->client)
            $client = Client::findOrFail($request->client);;

        if ($request->table)
            $table = Table::findOrFail($request->table);

        if ($request->type == 'restaurant' && $table->occupied) {

            return back();

        }
        return view('pos.order.create')
            ->with(compact('categories', 'type', 'table', 'client', 'clients', 'coupons'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();

            $conf = SystemConf::where('store_id', Auth::user()->store->id)->get();

            $order = new Order;
            $order->store_id = Auth::user()->store->id;
            $order->employee_id = Auth::user()->employee->id;
            $order->vat = $conf->where('name', 'vat')->first()->value / 100;;
            $order->type = $request->type;
//            $order->coupon = $request->coupon;
//            $order->discount = $request->discount;

            if ($request->type == 'delivery') {
                $order->delivery = $request->delivery;

            } elseif ($request->type == 'restaurant') {
                $order->service = $conf->where('name', 'service')->first()->value / 100;
            }
            if ($order->save()) {

                if ($request->type == 'restaurant') {
                    $order->tables()->syncWithoutDetaching($request->table);
                }


                foreach (json_decode($request->get('order')) as $orderDish) {


                    $size = $orderDish->size;
                    $extras = $orderDish->extras;
                    $sides = $orderDish->sides;

                    $dishSize = DishSize::findOrFail($size->id);
                    $Dish = $dishSize->dish;


                    $order_details = new OrderDetails;
                    $order_details->order_id = $order->id;
                    $order_details->dish_size_id = $dishSize->id;
                    $order_details->note = $orderDish->note;
                    $order_details->unit_cost = $dishSize->cost;
                    $order_details->unit_price = $size->price;
                    $order_details->quantity = $orderDish->quantity;
                    $order_details->dish_category_id = $Dish->category->id;
                    $order_details->dish_id = $Dish->id;
                    $order_details->department_id = $Dish->department_id;

                    if ($order_details->save()) {
                        $this->cookAdjustment($order_details);


                        foreach ($sides as $sideDish) {

                            $dishSize = DishSize::findOrFail($sideDish->sizeId);
                            $dish=$dishSize->dish;
                            $side = new OrderDetails;
                            $side->order_id         = $order->id;
                            $side->dish_size_id     = $dishSize->id;
                            $side->unit_cost        = $dishSize->cost;
                            $side->unit_price       = $sideDish->price;
                            $side->quantity         = $orderDish->quantity;

                            $side->dish_category_id = $dish->category->id;
                            $side->dish_id          = $dish->id;
                            $side->department_id    = $dish->department_id;

                            $side->parent_id        = $order_details->id;
                            $side->type = 'side';
                            if ($side->save()) {
                                $this->cookAdjustment($side);

                            }

                        }
                        foreach ($extras as $extraDish) {

                            $dishSize = DishSize::findOrFail($extraDish->sizeId);
                            $Dish = $dishSize->dish;

                            $extra = new OrderDetails;
                            $extra->order_id = $order->id;

                            $extra->dish_size_id = $dishSize->id;
                            $extra->unit_cost = $dishSize->cost;
                            $extra->unit_price = $extraDish->price;
                            $extra->quantity = $orderDish->quantity;

                            $extra->dish_category_id    = $Dish->category->id;
                            $extra->dish_id             = $Dish->id;
                            $extra->department_id       = $Dish->department_id;

                            $extra->parent_id = $order_details->id;
                            $extra->type = 'extra';
                            if ($extra->save()) {
                                $this->cookAdjustment($extra);

                            }
                        }

                    }

                }

                $data=[];
                $data['store_id']=Auth::user()->store->id;
                $data['order_id']=$order->id;
                $data['employee_id']=Auth::user()->employee->id;
                $data['details']='new order';
                storeOrderLog($data);
            }


            DB::commit();
            return response()->json($order->id, 200);
        } catch (\Exception $exception) {
            DB::rollBack();
            dd($exception->getMessage());
            \Log::debug($exception->getMessage());
            return response()->json('Internal Serer Error', 500);

        }


    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = DishCategory::where('show', 1)->with(['dishes' => function ($q) {
            $q->where('status', 1)->where('type', '<>','side')->whereHas('sizes');
        }])->get()->where('AvailableQuantity','>',0);//
        $order = Order::findOrFail($id);
        $coupons = Coupon::valid();
        $payments = OrderPayment::where('order_id', $order->id)->get();
        $clients = Client::all();
        $halls = Hall::with(['tables' => function ($q) {
            $q->where('status', 1);
        }])->where('status', 1)->get();


        return view('pos.order.edit')
            ->with(compact('categories', 'halls',
                'payments', 'order', 'clients', 'coupons'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        try {

            DB::beginTransaction();


            $conf = SystemConf::where('store_id', Auth::user()->store->id)->get();


            $order = Order::findOrFail($id);
            $order->employee_id = Auth::user()->employee->id;
            $order->vat = $conf->where('name', 'vat')->first()->value / 100;;
            if ($request->type == 'delivery') {
                $order->delivery = $request->delivery;

            }
            elseif ($request->type == 'restaurant') {
                $order->service = $conf->where('name', 'service')->first()->value / 100;
            }

            if ($order->save()) {
                foreach (json_decode($request->get('order')) as $orderDish) {
                    $size = $orderDish->size;
                    $extras = $orderDish->extras;
                    $sides = $orderDish->sides;
                    $dishSize = DishSize::findOrFail($size->id);
                    $Dish = $dishSize->dish;

                    if ($orderDish->id == ''||$orderDish->id == 0) {

                        $order_details = new OrderDetails;
                        $order_details->order_id = $order->id;
                        $order_details->dish_size_id = $size->id;
                        $order_details->dish_category_id = $Dish->category->id;
                        $order_details->dish_id = $Dish->id;
                        $order_details->department_id = $Dish->department_id;
                        $order_details->note = $orderDish->note;
                        $order_details->unit_cost = $dishSize->cost;
                        $order_details->unit_price = $dishSize->price;
                        $order_details->quantity = $orderDish->quantity;
                        $order_details->status = $orderDish->status;

                        if ($order_details->save()) {
                            $this->cookAdjustment($order_details);

                            foreach ($sides as $sideDish) {
                                $dishSize = DishSize::findOrFail($sideDish->sizeId);
                                $Dish = $dishSize->dish;

                                $side = new OrderDetails;
                                $side->order_id = $order->id;

                                $side->dish_size_id = $sideDish->sizeId;
                                $side->unit_cost = $dishSize->cost;
                                $side->unit_price = $dishSize->price;
                                $side->quantity = $orderDish->quantity;
                                $side->dish_category_id = $Dish->category->id;
                                $side->dish_id = $Dish->id;
                                $side->department_id = $Dish->department_id;

                                $side->parent_id = $order_details->id;
                                $side->type = 'side';
                                if ($side->save()) {
                                    $this->cookAdjustment($side);

                                }
                            }
                            foreach ($extras as $extraDish) {
                                $dishSize = DishSize::findOrFail($extraDish->sizeId);
                                $Dish = $dishSize->dish;

                                $extra = new OrderDetails;
                                $extra->order_id = $order->id;

                                $extra->dish_size_id = $extraDish->sizeId;
                                $extra->unit_cost = $dishSize->cost;
                                $extra->unit_price = $dishSize->price;
                                $extra->quantity = $orderDish->quantity;
                                $extra->dish_category_id = $Dish->category->id;
                                $extra->dish_id = $Dish->id;
                                $extra->department_id = $Dish->department_id;

                                $extra->parent_id = $order_details->id;
                                $extra->type = 'extra';

                                if ($extra->save()) {
                                    $this->cookAdjustment($extra);

                                }
                            }
                        }
                    } elseif ($orderDish->deleted) {

                        OrderDetails::where('parent_id', $orderDish->id)->delete();
                        OrderDetails::where('id', $orderDish->id)->delete();
                        CookedProduct::where('order_details_id', $orderDish->id)->delete();
                    } else {

                        $order_details = OrderDetails::findOrFail($orderDish->id);
                        $order_details->status = $orderDish->status;
                        $order_details->quantity = $orderDish->quantity;
                        $order_details->Save();
                        $this->cookAdjustment($order_details);

                        if($order_details->sides->count()>0)
                        {
                            foreach ( $order_details->sides as $side)
                            {
                                $side->quantity = $orderDish->quantity;
                                $side->Save();
                                $this->cookAdjustment($side);

                            }

                        }
                        if($order_details->extras->count()>0)
                        {
                            foreach ( $order_details->sides as $extra)
                            {
                                $extra->quantity = $orderDish->quantity;
                                $extra->Save();
                                $this->cookAdjustment($extra);

                            }

                        }
                    }
                }

                $data=[];
                $data['store_id']=Auth::user()->store->id;
                $data['order_id']=$order->id;
                $data['employee_id']=Auth::user()->employee->id;
                $data['details']='edit order';
                storeOrderLog($data);
            }


            DB::commit();
            return response()->json(['status' => true], 200);
        } catch (\Exception $exception) {
            DB::rollBack();
            dd($exception->getMessage());
            \Log::debug($exception->getMessage());
            return response()->json(['status' => false], 422);

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {

            DB::beginTransaction();

            OrderDetails::where('order_id', $id)->delete();
            CookedProduct::where('order_id', $id)->delete();

            $result=OrderPaymentController::refund($id);
            if(!$result['status']){
                return response()->json($result, 422);
            }
            Order::destroy($id);


            $data=[];
            $data['store_id']=Auth::user()->store->id;
            $data['order_id']=$id;
            $data['employee_id']=Auth::user()->employee->id;
            $data['details']='delete order';
            storeOrderLog($data);


            DB::commit();
            return response()->json(['status' => true], 200);
        } catch (\Exception $exception) {
            DB::rollBack();
            \Log::debug($exception->getMessage());
            return response()->json(['status' => false,'message'=>$exception->getMessage()], 422);

        }
    }

    public function allDishes()
    {

        $coupons = Coupon::valid();
//        $dishes = [];

        $dishes = Dish::where('status', '1')->with(['sizes' => function ($q) {
            $q->where('status', '1');
        }])->whereHas('category', function ($q) {
            $q->where('status', '1');
        })->get();

        return response()->json(['dishes' => DishesResource::collection($dishes), 'coupons' => $coupons], 200);
    }


    public function getOrder(Request $request)
    {
        $coupons = Coupon::valid();

        $order = Order::with(['orderDetails' => function ($q) {
            $q->withTrashed()->with(['dishSize' => function ($qq) {
                $qq->with(['dish']);
            }])->with(['sides' => function ($w) {
                $w->withTrashed();
            }, 'extras' => function ($w) {
                $w->withTrashed();
            }])->where('type', null);
        }])->findOrFail($request->order_id);


        $dishes = Dish::where('status', '1')->with(['sizes' => function ($q) {
            $q->where('status', '1');
        }])->whereHas('category', function ($q) {
            $q->where('status', '1');
        })->get();

        return response()->json(['coupons' => $coupons, 'dishes' =>  DishesResource::collection($dishes), 'order' => new OrderResource($order)], 200);
    }

    public function closeOrder(Request $request, $id)
    {

        $order = Order::findOrFail($id);
        if (round($order->demand) > 0) {
            return response()->json(['pay first please!'], 422);

        } else {
            $order->status = 'closed';
            $order->save();
            $data=[];
            $data['store_id']=Auth::user()->store->id;
            $data['order_id']=$order->id;
            $data['employee_id']=Auth::user()->employee->id;
            $data['details']='close order';
            storeOrderLog($data);
        }
        return response()->json(['ok'], 200);
    }


    public function orderAddClient(Request $request, $id)
    {

        $order = Order::findOrFail($id);
        if (!$request->client) {
            return response()->json(['please select client!'], 422);

        } else {
            $order->client_id = $request->client;
            $order->save();
            $data=[];
            $data['store_id']=Auth::user()->store->id;
            $data['order_id']=$order->id;
            $data['employee_id']=Auth::user()->employee->id;
            $data['details']='add client to order';
            storeOrderLog($data);
        }

        return response()->json(['ok'], 200);
    }

    public function orderSplit(Request $request)
    {
        $conf = SystemConf::where('store_id', Auth::user()->store->id)->get();

        $dishes = json_decode($request->dishes);
        $oldOrder = Order::findOrFail($request->order_id);
        $order = new Order();
        $order->store_id = $oldOrder->store_id;
        $order->type = $oldOrder->type;
        $order->service = $conf->where('name', 'service')->first()->value / 100;
        $order->vat = $conf->where('name', 'vat')->first()->value / 100;;
        if (isset($request->client))
            $order->client_id = $request->client;
        $order->save();

        if ($oldOrder->type == 'restaurant') {
            $order->tables()->syncWithoutDetaching($request->table);

        }
        foreach ($dishes as $dish) {

            $orderDetails = OrderDetails::findOrFail($dish);
            $orderDetails->order_id = $order->id;
            $orderDetails->save();

            $orderDetails->cookedProducts()->update(['order_id' => $order->id]);

            foreach ( $orderDetails->sides as $side) {
                $side->cookedProducts()->update(['order_id' => $order->id]);

            }
            foreach ( $orderDetails->extras as $extra) {
                $extra->cookedProducts()->update(['order_id' => $order->id]);
            }

            $orderDetails->sides()->update(['order_id' => $order->id]);
            $orderDetails->extras()->update(['order_id' => $order->id]);
        }

        return response()->json(['ok'], 200);
    }

    public function reopenOrder(Request $request, $id)
    {

        $order = Order::findOrFail($id);
        $order->status = 'reopen';
        $order->is_reopen = 1;
        $order->reopen_employee_id = Auth::user()->employee->id;
        $order->save();

        $data=[];
        $data['store_id']=Auth::user()->store->id;
        $data['order_id']=$order->id;
        $data['employee_id']=Auth::user()->employee->id;
        $data['details']='re open order';
        storeOrderLog($data);
        return response()->json(['ok'], 200);
    }

    public function cookAdjustment($orderDetails)
    {

        $recipes = DishSizeRecipe::where('dish_size_id', $orderDetails->dish_size_id)->get();
//        $this->deleteCookAdjustment($orderDetails);
        $deleteCooked = CookedProduct::where('order_details_id', $orderDetails->id)->delete();
        foreach ($recipes as $recipe) {

            $cooked = new CookedProduct();
            $cooked->store_id = Auth::user()->store->id;
            $cooked->order_id = $orderDetails->order_id;
            $cooked->product_id = $recipe->product_id;
            $cooked->quantity = $orderDetails->quantity * $recipe->unit_quantity;
            $cooked->department_id = $recipe->dishSize->dish->department_id;

            $cooked->cookable_id = $orderDetails->dish_size_id;
            $cooked->cookable_type = DishSize::class;

            $cooked->order_details_id = $orderDetails->id;
            $cooked->save();


        }
    }

//    public function deleteCookAdjustment($orderDetails)
//    {
//
//        $deleteCooked = CookedProduct::where('order_details_id', $orderDetails->id)->get();
//        foreach ($deleteCooked as $cook) {
//            $this->deleteStockAdjustment($cook->product_id, $cook->quantity, $cook->department_id);
//        }
//    }

//    public function stockAdjustment($id, $quantity, $department_id)
//    {
//        $product = Product::findOrFail($id);
//
//        $stock = Stock::where('stockable_type', Department::class)->where('stockable_id', $department_id)
//            ->where('product_id', $id)->first();
//
//        if ($stock) {
//
//            $stock->quantity = $stock->quantity - $quantity;
//            $stock->cost = $product->calculateCost;
//            $stock->save();
//
//        }
//    }
//
//    public function deleteStockAdjustment($id, $quantity, $department_id)
//    {
//        $product = Product::findOrFail($id);
//
//        $stock = Stock::where('stockable_type', Department::class)->where('stockable_id', $department_id)
//            ->where('product_id', $id)->first();
//
//        if ($stock) {
//
//            $stock->quantity = $stock->quantity + $quantity;
//            $stock->cost = $product->calculateCost;
//            $stock->save();
//
//        }
//    }

    /**
     * Update discount
     * @return \Illuminate\Http\JsonResponse
     */
    public function UpdateDiscount(Request $request)
    {
        try {
            $order = Order::findOrfail($request->order_id);
            $order->discount = $request->discount;
            $order->save();

            $data=[];
            $data['store_id']=Auth::user()->store->id;
            $data['order_id']=$order->id;
            $data['employee_id']=Auth::user()->employee->id;
            $data['details']='update discount order by '.$request->discount;
            storeOrderLog($data);

            return response()->json(['status' => true], 200);

        } catch (\Exception $exception) {
            return response()->json([$exception->getMessage()], 422);

        }

    }

    /**
     * Update discount
     * @return \Illuminate\Http\JsonResponse
     */
    public function UpdateCoupon(Request $request)
    {
        try {
            $order = Order::findOrfail($request->order_id);
            $order->coupon = $request->coupon;
            $order->save();
            $data=[];
            $data['store_id']=Auth::user()->store->id;
            $data['order_id']=$order->id;
            $data['employee_id']=Auth::user()->employee->id;
            $data['details']='update coupon order by '.$request->coupon;
            storeOrderLog($data);

            return response()->json(['status' => true], 200);

        } catch (\Exception $exception) {
            return response()->json([$exception->getMessage()], 422);
        }

    }

    /**
     * Update discount
     * @return \Illuminate\Http\JsonResponse
     */
    public function deleteOrderDetails(Request $request)
    {
        try {
            OrderDetails::where('parent_id', $request->orderDish)->delete();
            OrderDetails::where('id', $request->orderDish)->delete();
            CookedProduct::where('order_details_id', $request->orderDish)->delete();

            return response()->json(['status' => true], 200);

        } catch (\Exception $exception) {
            return response()->json([$exception->getMessage()], 422);

        }

    }

    /**
     * Update discount
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateStatusOrderDetails(Request $request)
    {
        try {
            OrderDetails::findOrFail($request->orderDish)->update(['status' => $request->status]);
            return response()->json(['status' => true], 200);

        } catch (\Exception $exception) {
            return response()->json([$exception->getMessage()], 422);

        }

    }


}
