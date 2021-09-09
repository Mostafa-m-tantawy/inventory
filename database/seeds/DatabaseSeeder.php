<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
//try{
//    DB::beginTransaction();

         $this->call(RolesSeeder::class);
        $this->call(permissionSeeder::class);
         $this->call(CountriesSeeder::class);
         $this->call(StatesSeeder::class);
         $this->call(categoriesSeeder::class);
         $this->call(UserSeeder::class);

         $this->call(ProductSeeder::class);
//

    }
}
