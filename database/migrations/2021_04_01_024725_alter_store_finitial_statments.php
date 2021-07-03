<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterStoreFinitialStatments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('stores', function (Blueprint $table) {
            $table->double('supplier_credit_amount')->default(0);
            $table->double('purchases_amount')->default(0);
            $table->double('refunds_amount')->default(0);
            $table->double('paid_amount')->default(0);
            $table->double('dept_amount')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('restaurants', function (Blueprint $table) {
            $table->dropColumn('supplier_credit_amount');
            $table->dropColumn('purchases_amount');
            $table->dropColumn('refunds_amount');
            $table->dropColumn('paid_amount');
            $table->dropColumn('dept_amount');
        });
    }
}
