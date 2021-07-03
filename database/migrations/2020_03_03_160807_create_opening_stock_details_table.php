<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOpeningStockDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('opening_stock_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('opening_stock_id');
            $table->unsignedBigInteger('product_id');
            $table->double('quantity');
            $table->double('unit_price');
            $table->double('vat')->default(0)->nullable();  //vat percentage
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('opening_stock_details');
    }
}
