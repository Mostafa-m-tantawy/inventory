<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {



        $products=[
            ['name'=>'salt'         ,'name_ar'=>'ملح'       ,'barcode'=>'1'   ,'reorder_point'=>'10'   ,'is_stockable'=>'0'  ,'product_category_id'=>'1'  ,'unit_id'=>'2'   ,'is_prepared'=>'0'   ,'store_id'=>1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name'=>'oil'          ,'name_ar'=>'زيت'       ,'barcode'=>'2'   ,'reorder_point'=>'10'   ,'is_stockable'=>'0'  ,'product_category_id'=>'4'  ,'unit_id'=>'3'   ,'is_prepared'=>'0'   ,'store_id'=>1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name'=>'Minced meat'  ,'name_ar'=>'لحم مفروم' ,'barcode'=>'3'   ,'reorder_point'=>'10'   ,'is_stockable'=>'0'  ,'product_category_id'=>'6'  ,'unit_id'=>'2'   ,'is_prepared'=>'0'   ,'store_id'=>1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name'=>'Borio'        ,'name_ar'=>'بوريو'     ,'barcode'=>'4'   ,'reorder_point'=>'10'   ,'is_stockable'=>'0'  ,'product_category_id'=>'4'  ,'unit_id'=>'1'   ,'is_prepared'=>'0'   ,'store_id'=>1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ];


        DB::table('products')->insert($products);

    }
}
