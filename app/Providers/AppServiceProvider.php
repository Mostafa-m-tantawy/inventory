<?php

namespace App\Providers;

use App\Models\Country;
use App\Models\conf\SystemConf;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {


        if(Schema::hasTable('countries'))
        View::share('countries', Country::all());

        Schema::defaultStringLength(191);
        date_default_timezone_set('Africa/Cairo');
    }


}
