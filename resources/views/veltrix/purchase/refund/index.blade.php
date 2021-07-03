@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index refund')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.index refund')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{route('refund.create')}}" class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
                <i class="ti ti-plus"></i>
                {{trans('main.new record')}}
            </a>
        </div>
    </div>
@endsection


@section('content')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

                <!--begin: Datatable -->
                <table id="datatable-responsive"
                       class="display table table-striped table-bordered " cellspacing="0"
                       style="width:100%">
                    <thead class="thead-dark">
                    <tr>
                        <th>{{ trans('main.supplier') }}  {{ trans('main.name') }}</th>
                        <th>{{ trans('main.product') }}</th>
                        <th>{{ trans('main.quantity') }}</th>
                        <th>{{ trans('main.unit price') }}</th>
                        <th>{{ trans('main.vat') }}</th>
                        <th>{{ trans('main.gross') }}</th>
                        <th>{{trans('main.created_at')}}</th>
                        <th>{{ trans('main.note') }}</th>
                        <th>{{ trans('main.actions') }}</th>
                    </tr>
                    </thead>
                    <tbody>


                    </tbody>
                </table>

                <!--end: Datatable -->
            </div>
            </div>

        </div>
    </div>

@stop


@section('scripts')


    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>

        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('refund.datatable-data')}}',
            columns: [
                {data: 'supplier_id', name: 'supplier_id', searchable: false, orderable: false},
                {data: 'product_id', name: 'product_id', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'unit_price', name: 'unit_price', searchable: true, orderable: true},
                {data: 'vat', name: 'vat', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: true, orderable: true},
                {data: 'note', name: 'note', searchable: true, orderable: true},
                {data: 'created_at', name: 'created_at', searchable: true, orderable: true},
                {data: 'action', name: 'action', searchable: true, orderable: true},

            ],
        })
    </script>


@endsection




