<?php

namespace App\Exports;

use App\Exports\partials\ProductCategoryExport;
use App\Exports\partials\ProductImportGuides;
use App\Exports\partials\UnitExport;
use App\Unit;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;


class ProductGuide implements WithMultipleSheets
{
    use Exportable;

    public function __construct()
    {
    }

    /**
     * @return array
     */
    public function sheets(): array
    {
        $sheets = [];

            $sheets['Guides']           = new ProductImportGuides();
            $sheets['Unit']             = new UnitExport();
            $sheets['Product Category'] = new ProductCategoryExport();

        return $sheets;
    }
}
