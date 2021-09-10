<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class categoriesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {


        $departments = [
            ['name' => 'مطبخ', 'store_id' => 1, 'center_id' => '1','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => "باريستا", 'store_id' => 1, 'center_id' => '1','created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
        ];

        $productcategories = [
            ['name' => 'Spices', 'name_ar' => 'بهارات', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => 'Bread', 'name_ar' => 'عيش', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => 'Drinks', 'name_ar' => 'مشروبات', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => 'Canned', 'name_ar' => 'معلبات', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => 'Milks', 'name_ar' => 'البان', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['name' => 'Meats', 'name_ar' => 'لحوم', 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()]];

        $units = [
            ['unit' => 'دسته', 'child_unit' => 'باكو', 'convert_rate' => 12, 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['unit' => 'كيلو', 'child_unit' => 'جرام', 'convert_rate' => 1000, 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['unit' => 'لتر', 'child_unit' => 'ملي لتر ', 'convert_rate' => 1000, 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
            ['unit' => 'طن', 'child_unit' => 'كيلو', 'convert_rate' => 1000, 'store_id' => 1,'created_at'=>\Carbon\Carbon::now(),'updated_at'=>\Carbon\Carbon::now()],
        ];


        DB::table('departments')->insert($departments);
        DB::table('product_categories')->insert($productcategories);
        DB::table('units')->insert($units);

    }
}
