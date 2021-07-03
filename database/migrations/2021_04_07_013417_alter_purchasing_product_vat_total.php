<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterPurchasingProductVatTotal extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('purses_products', function (Blueprint $table) {
            $table->double('total')->default(0);
        });
        Schema::table('ruined_products', function (Blueprint $table) {
            $table->double('total')->default(0);
        });   Schema::table('refund_products', function (Blueprint $table) {
            $table->double('total')->default(0);
        });
        Schema::table('opening_stock_details', function (Blueprint $table) {
            $table->double('total')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('purses_products', function (Blueprint $table) {

            $table->dropColumn('total');
        });
        Schema::table('ruined_products', function (Blueprint $table) {
            $table->dropColumn('total');
        });
        Schema::table('refund_products', function (Blueprint $table) {

            $table->dropColumn('total');
        });
        Schema::table('opening_stock_details', function (Blueprint $table) {

            $table->dropColumn('total');
        });
    }
}
