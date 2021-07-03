<?php

namespace App\Http\Controllers\conf;

use App\Http\Controllers\Controller;
use App\Models\conf\SystemConf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class systemConfigurationController extends Controller
{

    public function __construct()
    {
        $this->middleware(['permission:system configuration'],['only'=>['index']]);
    }


    public function index(){
        return view('veltrix.config.systemconf.index');
    }


    public function store(Request $request){
        $restaurant= Auth::user()->store;


        if($request->file('logo')) {
            $file = $request->file('logo');
            $name = $file->getClientOriginalName();
            $filename_images = date("dmY-his") . $name;
            $fulllink_images = 'media/configration/'.$restaurant->id.'/';
            $file->move($fulllink_images, $filename_images);
            SystemConf::where('name', 'logo')    ->where('store_id', $restaurant->id)->update(['value' =>  $fulllink_images . '/' . $filename_images]);
        }


        SystemConf::where('name', 'name')    ->where('store_id', $restaurant->id)->update(['value' => $request->name]);
        SystemConf::where('name', 'phone')    ->where('store_id', $restaurant->id)->update(['value' => $request->phone]);
        SystemConf::where('name', 'mobile')    ->where('store_id', $restaurant->id)->update(['value' => $request->mobile]);
        SystemConf::where('name', 'vat')    ->where('store_id', $restaurant->id)->update(['value' => $request->vat]);
        SystemConf::where('name', 'service')->where('store_id', $restaurant->id)->update(['value' => $request->service]);
        SystemConf::where('name', 'method') ->where('store_id', $restaurant->id)->update(['value' => $request->methodd]);
        SystemConf::where('name', 'months')  ->where('store_id', $restaurant->id)->update(['value' => $request->months]);

        return redirect('conf/system-configuration');
    }

}
