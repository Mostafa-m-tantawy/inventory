<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterSupplierFinitialStatments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('suppliers', function (Blueprint $table) {
            $table->double('purchases_amount')->default(0);
            $table->double('refunds_amount')->default(0);
            $table->double('paid_amount')->default(0);
            $table->double('credit_amount')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('suppliers', function (Blueprint $table) {
            $table->dropColumn('purchases_amount');
            $table->dropColumn('refunds_amount');
            $table->dropColumn('paid_amount');
            $table->dropColumn('credit_amount');
        });
    }
}
