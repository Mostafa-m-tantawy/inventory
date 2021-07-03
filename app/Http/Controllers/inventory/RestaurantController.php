<?php

namespace App\Http\Controllers\inventory;

use App\Models\Country;
use App\Models\hr\HrEmployee;
use App\Http\Controllers\Controller;
use App\Invoice;
use App\PackageRestaurant;
use App\Models\inventory\Purse;
use App\Models\inventory\Store;
use App\Models\conf\Role;
use App\Models\inventory\Supplier;
use App\Models\conf\SystemConf;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use PHPUnit\Exception;

class RestaurantController extends Controller
{
    public function __construct()
    {
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

            $user = new User;
            $user->email = $request->email;
            $user->name = $request->name;
            $user->is_active	 = 1;
            $user->password = Hash::make($request->password);
            $user->save();

            Auth::login($user);

            $restaurant = new Store;
            $restaurant->user_id = $user->id;
            $restaurant->save();
            $user->store_id = $restaurant->id;
            $user->save();

            Role::create(['restaurant_id' => $restaurant->id, 'name' => 'Super Admin']);


            $user->assignRole('Super Admin');
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'service', 'value' => '12', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'vat', 'value' => '14', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'method', 'value' => 'avg_cost', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'months', 'value' => '6', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'delivery', 'value' => '0', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'name', 'value' => $request->name, 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'logo', 'value' => 'images/no_image.png', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'phone', 'value' => '', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);
            SystemConf::create(['store_id' => $restaurant->id,
                'name' => 'mobile', 'value' => '', 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]);


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
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $restaurant = Store::findOrFail($id);
        $user = $restaurant->user;

        $user->email = $request->email;
        $user->name = $request->name;
        $user->save();


        return redirect()->back();

    }


    public function stock(Request $request, $id)
    {
        $purchases = Purse::where('store_id', $id)->get();
        $from = null;
        $to = null;
        $method = $request->price_math_method;
        if ($request->price_math_method != 'last_price') {

            // lenght 10 date = (01/01/2001) =10
            $from = substr($request->rangeofdate, 0, 10);
            // start  13 date = (01/01/2001 */*)=13
            $to = substr($request->rangeofdate, 13, 10);
        }

        return redirect('stock/restaurant/' . $id . '#kt_apps_stock_of_branch')->with(compact('purchases', 'method', 'from', 'to'));

    }


}
