<?php


Route::middleware(['auth'])->group(function () {

    Route::resource('labels', 'LabelsController');
    Route::get('labels/get-data/{id}', 'LabelsController@edit');


    //------------- system configuration  --------------------------
    Route::get ('system-configuration',             'conf\systemConfigurationController@index')   ->name('system-conf.index');;
    Route::post ('system-configuration/store',      'conf\systemConfigurationController@store')   ->name('system-conf.store');;


    // -------------------------coupon--------------------------------
    Route::resource('coupon','crm\CouponController');;
    Route::resource('reservation','crm\ReservationController');;


    // -------------------------expenses--------------------------------
    Route::resource ('expenses','conf\ExpensesController');


    // -------------------------role--------------------------------
    Route::resource('role','conf\RoleController');;
    Route::post('role-association',         'conf\RoleController@association')->name('role.association');;
    Route::delete('role-dissociation/{id}', 'conf\RoleController@dissociation')->name('role.dissociation');;

    Route::resource('permission',           'conf\PermissionController');;
    Route::post('permission-association',   'conf\PermissionController@association')->name('permission.association');;
    Route::delete('permission-association/{id}', 'conf\PermissionController@dissociation')->name('permission.dissociation');;



});
