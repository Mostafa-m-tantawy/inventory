<?php


Route::middleware(['auth'])->group(function () {

    // -------------------------payment--------------------------------
    Route::post('payment/store','purchase\PaymentController@savePayment')->name('payment.create');
    Route::get('purchase/delete/{id}','purchase\PaymentController@deletePayment')->name('payment.delete');


    // -------------------------purchase--------------------------------
    Route::get('purchase/summery/datatable-data', 'inventory\RuinedController@summeryDatatableData')->name('purchase.detailed.datatable-data');
    Route::get('purchase/detailed/datatable-data', 'inventory\RuinedController@detailedDatatableData')->name('purchase.detailed.datatable-data');


    Route::get ('purchase/create',     'purchase\PursesController@addPurchase');
    Route::post('/save-purses','purchase\PursesController@savePurses');
    Route::get ('/get-unit-of-product/{id}','purchase\PursesController@getUnitOfProduct');
    Route::get ('purchase/show/{id}','purchase\PursesController@editPurses');
    Route::post('/supplier-products/{supplier_id}','purchase\PursesController@supplierProducts');
    Route::post('save-purses-product/{id}','purchase\PursesController@savePursesProduct');
    Route::get ('deleted-purses-product/{id}','purchase\PursesController@deletePursesProduct');


    Route::get('purchase/summery/datatable-data',  'purchase\PursesController@summeryDatatableData')->name('purchase.summery.datatable-data');
    Route::get('purchase/detailed/datatable-data', 'purchase\PursesController@detailedDatatableData')->name('purchase.detailed.datatable-data');
    Route::get ('purchase/summery','purchase\PursesController@SummeryIndex');
    Route::get ('purchase/detailed','purchase\PursesController@detailedIndex');



    // -------------------------refund--------------------------------
    Route::get('refund/datatable-data', 'purchase\RefundController@datatableData')->name('refund.datatable-data');

    Route::get ('refund','purchase\RefundController@index')->name('refund.index');
    Route::get ('refund/create','purchase\RefundController@newRefund')->name('refund.create');
    Route::post('/save-refund','purchase\RefundController@saveRefund')->name('refund.store');;
    Route::get('refund/delete/{id}','purchase\RefundController@deleteRefund')->name('refund.delete');;


    // -------------------------Supplier--------------------------------
    Route::get('supplier/datatable-data', 'inventory\SupplierController@datatableData')->name('supplier.datatable-data');
    Route::any  ('product/create/{supplier_id}',        'inventory\ProductController@products');
    Route::post ('product/update/{supplier_id}',        'inventory\ProductController@updateProduct');
    Route::get  ('product/delete/{id}/{supplier_id}',   'inventory\ProductController@deleteProduct');
    Route::get  ('product/index',                       'inventory\ProductController@index');
    Route::get  ('supplier/print/financial/{id}',     'purchase\SupplierController@printFinancial')->name('supplier.print.financial');

    Route::get('supplier/datatable-data', 'purchase\SupplierController@datatableData')->name('supplier.datatable-data');
    Route::resource('supplier','purchase\SupplierController');



});
