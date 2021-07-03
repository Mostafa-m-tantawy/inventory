<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class permissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // inventory Permission


        Permission::create(['group' =>'unit'  ,'name' => 'index unit']);
        Permission::create(['group' =>'unit'  ,'name' => 'create unit']);
        Permission::create(['group' =>'unit'  ,'name' => 'update unit']);
        Permission::create(['group' =>'unit'  ,'name' => 'delete unit']);

        Permission::create(['group' =>'product category'  ,'name' => 'index product category']);
        Permission::create(['group' =>'product category'  ,'name' => 'create product category']);
        Permission::create(['group' =>'product category'  ,'name' => 'update product category']);
        Permission::create(['group' =>'product category'  ,'name' => 'delete product category']);

        Permission::create(['group' =>'product'  ,'name' => 'index product']);
        Permission::create(['group' =>'product'  ,'name' => 'create product']);
        Permission::create(['group' =>'product'  ,'name' => 'show product']);
        Permission::create(['group' =>'product'  ,'name' => 'update product']);
        Permission::create(['group' =>'product'  ,'name' => 'delete product']);




        Permission::create(['group' =>'supplier'  ,'name' => 'index supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'create supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'update supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'show supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'delete supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'attach product to supplier']);
        Permission::create(['group' =>'supplier'  ,'name' => 'detach product to supplier']);


        Permission::create(['group' =>'stock payment'  ,'name' => 'create stock payment']);
        Permission::create(['group' =>'stock payment'  ,'name' => 'delete stock payment']);

        Permission::create(['group' =>'purchase'  ,'name' => 'create purchase']);
        Permission::create(['group' =>'purchase'  ,'name' => 'update purchase']);
        Permission::create(['group' =>'purchase'  ,'name' => 'summery purchase']);
        Permission::create(['group' =>'purchase'  ,'name' => 'details purchase']);


        Permission::create(['group' =>'refund'  ,'name' => 'index refund']);
        Permission::create(['group' =>'refund'  ,'name' => 'create refund']);
        Permission::create(['group' =>'refund'  ,'name' => 'delete refund']);



        Permission::create(['group' =>'department'  ,'name' => 'index department']);
        Permission::create(['group' =>'department'  ,'name' => 'create department']);
        Permission::create(['group' =>'department'  ,'name' => 'show department']);
        Permission::create(['group' =>'department'  ,'name' => 'update department']);
        Permission::create(['group' =>'department'  ,'name' => 'stock department']);
        Permission::create(['group' =>'department'  ,'name' => 'delete department']);



        Permission::create(['group' =>'assign stock'  ,'name' => 'index assign stock']);
        Permission::create(['group' =>'assign stock'  ,'name' => 'create assign stock']);


        Permission::create(['group' =>'ruined product'  ,'name' => 'index ruined product']);
        Permission::create(['group' =>'ruined product'  ,'name' => 'create ruined product']);
        Permission::create(['group' =>'ruined product'  ,'name' => 'delete ruined product']);






        /// configration
        ///
        Permission::create(['group' =>'configuration'  ,'name' => 'system configuration']);


        Permission::create(['group' =>'role'  ,'name' => 'index role']);
        Permission::create(['group' =>'role'  ,'name' => 'create role']);
        Permission::create(['group' =>'role'  ,'name' => 'update role']);
        Permission::create(['group' =>'role'  ,'name' => 'delete role']);
        Permission::create(['group' =>'role'  ,'name' => 'associate Permission role']);
        Permission::create(['group' =>'role'  ,'name' => 'dissociate Permission role']);
//

        Permission::create(['group' =>'expense'  ,'name' => 'index expense']);
        Permission::create(['group' =>'expense'  ,'name' => 'create expense']);
        Permission::create(['group' =>'expense'  ,'name' => 'delete expense']);



        Permission::create(['group' =>'dashboard'  ,'name' => 'stock dashboard']);


    }
}
