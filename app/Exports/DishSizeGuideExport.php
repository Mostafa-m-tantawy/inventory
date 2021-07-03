<?php

namespace App\Exports;

use App\Exports\partials\DishExport;
use App\Exports\partials\DishSizeImportGuides;
use App\Unit;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;


class DishSizeGuideExport implements WithMultipleSheets
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

            $sheets['Guides'] = new DishSizeImportGuides();
            $sheets['Dishes'] = new DishExport();

        return $sheets;
    }
}
