@extends('veltrix.layouts.master')

@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop

@section('title')
    {{trans('main.restaurant stock')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.stock')}}</a></li>
        </ol>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">

                        @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                    @endif
                    <!--begin: Datatable -->
                            <table id="datatable-responsive"
                                   class="display table table-striped table-bordered " cellspacing="0"
                                   style="width:100%">      <thead class="thead-dark">
                                <tr>
                                    <th>{{trans('main.product')}}</th>
                                    <th>{{trans('main.available')}} {{trans('main.quantity')}} </th>
                                    <th>{{trans('main.Unit cost')}}</th>

                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>
    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('stock.datatable-data')}}',
            columns: [
                {data: 'product_id', name: 'product_id', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'cost', name: 'cost', searchable: true, orderable: true},
            ],
        })

    </script>
@endsection


