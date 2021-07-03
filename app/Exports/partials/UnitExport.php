<?php

namespace App\Exports\partials;

use App\Models\inventory\Department;
use App\Models\inventory\Unit;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;

class UnitExport implements FromCollection,WithTitle,WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Unit::select('id','unit')->get();
    }

    /**
     * @return string
     */
    public function title(): string
    {
        return 'Units';
    }

    /**
     * @return array
     */
    public function headings(): array
    {
return  ['id','unit'];
    }
}
