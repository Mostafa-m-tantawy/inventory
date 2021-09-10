<?php

use App\PackageRestaurant;
use App\Models\inventory\Store;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


        $user = User::create([
            'name' => 'Demo Store',
            'Email' => 'demo@recipe.com',
            'password' => Hash::make('123456'),
            'is_active' => '1',
            'store_id' => '1'
            ,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()
        ]);

        $restaurant=Store::create([
            'user_id' => 1,
            'parent_id' => 0
            ,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()
        ]);
        \Illuminate\Support\Facades\Auth::login($user);


        $user->assignRole('Super Admin');





        \App\Models\conf\Systemconf::create(['store_id' => 1,
            'name' => 'name', 'value' => 'Demo','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

         \App\Models\conf\Systemconf::create(['store_id' => 1,
                    'name' => 'phone', 'value' => '','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);
         \App\Models\conf\Systemconf::create(['store_id' => 1,
                    'name' => 'mobile', 'value' => '','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

        \App\Models\conf\Systemconf::create(['store_id' => 1,
            'name' => 'logo', 'value' => 'images/no_image.png','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

        \App\Models\conf\Systemconf::create(['store_id' => 1,
            'name' => 'service', 'value' => '12','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

        \App\Models\conf\Systemconf::create(['store_id' => 1,
            'name' => 'vat', 'value' => '14','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

        \App\Models\conf\Systemconf::create(['store_id' => 1,
            'name' => 'method', 'value' => 'avg_cost','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);

        \App\Models\conf\Systemconf::create(
            ['store_id' => 1,
                'name' => 'months', 'value' => '6','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);
        \App\Models\conf\Systemconf::create(
            ['store_id' => 1,
                'name' => 'delivery', 'value' => '0','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);
        \App\Models\conf\Systemconf::create(
            ['store_id' => 1,
                'name' => 'POS check Dish Quantity', 'value' => '1','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]);
    }
}
