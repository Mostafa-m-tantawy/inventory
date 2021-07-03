<?php

namespace App\Exports\partials;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class DishImportGuides implements FromCollection,WithTitle
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return new Collection(
            [
                ['id'=>"0",'name'=>'dish_category_id has one value from Dish-Category guide sheets (Ids) ex: 1'],
                ['id'=>1,'name'=>'department_id has one value from  Department guide sheets  (Ids) ex: 1'],
                ['id'=>3,'name'=>'type  is dish type  has one value of following values  ( dish , side  , extra )'],
                ['id'=>4,'name'=>'status   not show :0 show :1']
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
