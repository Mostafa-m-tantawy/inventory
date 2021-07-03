<?php

/*
|--------------------------------------------------------------------------
| System Routes
|--------------------------------------------------------------------------
|
|   The System include several modules
|   routes separated in several files in partial folder
|
*/

Auth::routes();

Route::group(['middleware' => 'web'], function () {
    Route::get('api/documentation', '\L5Swagger\Http\Controllers\SwaggerController@api')->name('l5swagger.api');
});

Route::get('chang-lang', 'DashboardController@changLang')->name('chang-lang');

Route::get('/', function () {
    return view('website.welcome');
});


Route::post('email-me', 'homeController@emailme')->name('email-me');

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/dashboard', 'DashboardController@dashboard')->name('dashboard');

Route::post('states', 'purchase\SupplierController@states');
Route::resource('restaurant', 'inventory\RestaurantController')->only(['store']);

Route::get('/logout', function () {
    Auth::logout();
    return redirect(route('home'));
});

Route::middleware(['auth'])->group(function () {

        Route::get('download', 'DashboardController@download');
        Route::post('address/update', 'purchase\SupplierController@updateAddress');
        Route::post('phone/update', 'purchase\SupplierController@updatePhone');
        Route::post('delete/address-phones', 'purchase\SupplierController@deleteAddressPhones');

        // -------------------------stock  routes--------------------------------
        Route::prefix('stock')->middleware(['auth'])->group(function () {
            include('partial/inventory.php');
            include('partial/purchase.php');
        });


        // -------------------------personal  routes--------------------------------
        Route::prefix('personal')->middleware(['auth'])->group(function () {
            include('partial/personal.php');
        });

        // -------------------------conf  routes--------------------------------
        Route::prefix('conf')->middleware(['auth'])->group(function () {
            include('partial/config.php');

            Route::any('/dashboard', 'DashboardController@dashboard')->name('dashboard');

        });

});
