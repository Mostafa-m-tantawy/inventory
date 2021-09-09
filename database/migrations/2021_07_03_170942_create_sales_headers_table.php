<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSalesHeadersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sale_headers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('store_id');
            $table->string('price_math_method')->nullable();;
            $table->date('math_start_date')->nullable();
            $table->date('math_end_date')->nullable();
            $table->timestamps();
        });
        Schema::table('cooked_products', function (Blueprint $table) {

            $table->foreign('order_details_id')
                ->references('id')
                ->on('order_details')
                ->onDelete('cascade');

        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sale_headers');
    }
}
