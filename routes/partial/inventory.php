<?php


Route::middleware(['auth'])->group(function () {

    Route::resource('restaurant', 'inventory\RestaurantController')->except('store');;
    Route::post('restaurant/{id}/stock', 'inventory\RestaurantController@stock')->name('restaurant.stock');
    Route::any('/dashboard', 'DashboardController@stockDashboard')->name('dashboard.stock')->middleware('module:inventory');;

    // -------------------------stock--------------------------------

    Route::get('stock/datatable-data', 'inventory\StockController@datatableData')->name('stock.datatable-data');
    Route::any('stock/index', 'inventory\StockController@index')->name('stock.index');


    // -------------------------units--------------------------------

    Route::get('unit/datatable-data', 'inventory\UnitController@datatableData')->name('unit.datatable-data');
    Route::resource('unit','inventory\UnitController');

    // -------------------------product category  routes--------------------------------
    Route::get('product-category/datatable-data', 'inventory\ProductCategoryController@datatableData')->name('product-category.datatable-data');
    Route::resource('product-category','inventory\ProductCategoryController')->except(['update']);
    Route::post ('product-category/update',     'inventory\ProductCategoryController@update');


    // -------------------------Product  --------------------------------

    Route::post ('product/import',     'inventory\ProductController@import')->name('product.import');
    Route::get ('product/export',     'inventory\ProductController@ExportGuide')->name('product.export.guide');

    Route::get('product/update-all', 'inventory\ProductController@updateAllProducts')->name('product.updateAllProducts');
    Route::get('product/datatable-data', 'inventory\ProductController@datatableData')->name('product.datatable-data');

    // ----Show Product
    Route::get('product/purchasing/datatable-data', 'inventory\ProductDataTablesController@purchasingDatatableData')->name('product.purchasing.datatable-data');
    Route::get('product/refunded/datatable-data', 'inventory\ProductDataTablesController@refundedDatatableData')->name('product.refunded.datatable-data');
    Route::get('product/ruined/datatable-data', 'inventory\ProductDataTablesController@ruinedDatatableData')->name('product.ruined.datatable-data');
    Route::get('product/assignment/datatable-data', 'inventory\ProductDataTablesController@assignmentDatatableData')->name('product.assignment.datatable-data');



    Route::resource('product','inventory\ProductController')->except(['update']);
    Route::post ('product/update',     'inventory\ProductController@update');
    Route::post ('product/quantity/{id}',     'inventory\ProductController@getProductQuantity');


    // -------------------------Product Prepare --------------------------------
    Route::get ('product/recipe/{id}',     'inventory\ProductRecipeController@show')->name('product.recipe.show');
    Route::post ('product/recipe/{id}',    'inventory\ProductRecipeController@store')->name('product.recipe.store');
    Route::get ('product/recipe/delete/{id}',    'inventory\ProductRecipeController@delete')->name('product.recipe.delete');
    Route::post ('product/cook',            'inventory\ProductRecipeController@cook');

    Route::get('product/prepare','inventory\PrepareController@index');
    Route::get('product//prepare/datatable-data', 'inventory\PrepareController@datatableData')->name('prepare.datatable-data');
    Route::get('product/prepare/create/{id}','inventory\PrepareController@create');
    Route::post('product/prepare/products-available/{id}','inventory\PrepareController@productsAvailable');
    Route::post('product/prepare/cook/{id}','inventory\PrepareController@cook')->name('product.prepare.cook');
    Route::post('product/prepare/show/{id}','inventory\PrepareController@show');


    // ------------------------- Centers --------------------------------

    Route::get('center/datatable-data', 'inventory\CenterController@datatableData')->name('center.datatable-data');
    Route::resource('center', 'inventory\CenterController');
    Route::any('center/stock', 'inventory\CenterController@stock')->name('center.stock');


    // -------------------------Department --------------------------------
    Route::get('departments/datatable-data', 'inventory\DepartmentController@datatableData')->name('departments.datatable-data');
    Route::resource('department', 'inventory\DepartmentController');
    Route::any('departments/stock', 'inventory\DepartmentController@stock')->name('department.stock');


    // -------------------------Assign to department or branch --------------------------------
    Route::get('assign/datatable-data', 'inventory\AssignController@datatableData')->name('assign.datatable-data');
    Route::get('assign/index', 'inventory\AssignController@index')->name('stock.assign.index');
    Route::get('assign/create', 'inventory\AssignController@CreateAssign');
    Route::post('/get-sourceable/{id}', 'inventory\AssignController@getSource');
    Route::post('/get-sourceable-products', 'inventory\AssignController@getSourceProducts');
    Route::post('/save-assign', 'inventory\AssignController@saveAssign');


    // -------------------------Open Stock --------------------------------
    Route::get('open-stock/detailed/datatable-data', 'inventory\OpeningStockController@detailedDatatableData')->name('open-stock.detailed.datatable-data');
    Route::get('open-stock/datatable-data', 'inventory\OpeningStockController@datatableData')->name('open-stock.datatable-data');

    Route::get ('open-stock/detailed','inventory\OpeningStockController@detailedIndex')->name('open-stock.detailed');
    Route::resource('open-stock','inventory\OpeningStockController')->except('update','edit','destroy');


    // -------------------------ruined --------------------------------
    Route::get('ruined/datatable-data', 'inventory\RuinedController@datatableData')->name('ruined.datatable-data');

    Route::get ('ruined','inventory\RuinedController@index')->name('ruined.index');
    Route::get ('ruined/create','inventory\RuinedController@newRuined')->name('ruined.create');
    Route::post('/get-assignable-ruined/{id}','inventory\RuinedController@getAssignable');
    Route::post('ruined-products','inventory\RuinedController@ruinedProducts');
    Route::post('get-product-cost/{id}','inventory\RuinedController@getProductQuantity');
    Route::post('/save-ruined','inventory\RuinedController@saveRuined')->name('ruined.store');;
    Route::delete('ruined/{id}','inventory\RuinedController@destroy')->name('ruined.destroy');;

    // -------------------------sales --------------------------------
    Route::get('sales/datatable-data', 'inventory\SalesController@datatableData')->name('stock.sales.datatable-data');

    Route::get ('sales'                     ,'inventory\SalesController@index')->name('stock.sales.index');
    Route::get ('sales/create'              ,'inventory\SalesController@create')->name('stock.sales.create');
    Route::post('sales/store'               ,'inventory\SalesController@store')->name('stock.sales.store');;
    Route::post('sales/products'            ,'inventory\SalesController@getProducts')->name('stock.sales.getProducts');
    Route::post('sales/get-product-quantity/{id}' ,'inventory\SalesController@getProductQuantity')->name('stock.sales.getProductQuantity');

});
