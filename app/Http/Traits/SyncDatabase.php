<?php


namespace App\Http\Traits;

use App\Models\cost\Dish;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;


class SyncDatabase
{



    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function sync()
    {
//        $live_database = DB::connection('my-live-db');
        dd(Dish::all());
        // Get table data from production
//        foreach($live_database->table('dishes')->get() as $data){
            // Save data to staging database - default db connection
//            DB::table('table_name')->insert((array) $data);
//        }
        // Get table_2 data from production

    }
}
