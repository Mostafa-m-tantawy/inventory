<?php

namespace App\Exports\partials;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class DishSizeImportGuides implements FromCollection,WithTitle
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return new Collection(
            [
                ['id'=>"0",'name'=>'dish_id has one value from Dishes guide sheets (Ids) ex: 1'],
                ['id'=>1,'name'=>'status   not show :0 show :1']
            ]

        );
    }

    /**
     * @return string
     */
    public function title(): string
    {
        return  'Guides';
    }


}
