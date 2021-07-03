<?php

namespace App\Exports\partials;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class ProductImportGuides implements FromCollection,WithTitle
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return new Collection(
            [
                ['id'=>"0",'name'=>'product_category_id has one value from Product-Category guide sheets (Ids) ex: 1'],
                ['id'=>1,'name'=>'unit_id has one value from  Units guide sheets  (Ids) ex: 1'],
                ['id'=>3,'name'=>'is_prepared  is asking if product is prepared   has one value of following values  ( 0  no , 1  yes)'],
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
