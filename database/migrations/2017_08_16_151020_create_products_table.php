<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('store_id');
            $table->string('name')->nullable();
            $table->string('name_ar')->nullable();
            $table->string('barcode')->nullable();
            $table->string('reorder_point')->nullable();
            $table->boolean('is_stockable')->nullable(); //stockable --non stockable
            $table->unsignedBigInteger('product_category_id')->nullable();
            $table->unsignedBigInteger('unit_id');
            $table->boolean('is_prepared')->default(0);
            $table->double('quantity')->default(0);
            $table->double('cost')->default(0);
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
        Schema::dropIfExists('products');
    }
}
