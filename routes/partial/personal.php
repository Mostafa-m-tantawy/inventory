<?php


Route::middleware(['auth'])->group(function () {

    // -------------------------Cashier--------------------------------
    Route::get('/profile', 'ProfileController@show')->name('personal.profile');
    Route::put('/profile', 'ProfileController@update')->name('personal.profile.update');
    Route::any('/dashboard', 'DashboardController@cashierDashboard')->name('dashboard.cashier');

    // -------------------------Cashier--------------------------------

});
