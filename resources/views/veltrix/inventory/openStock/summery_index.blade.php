@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{ trans('main.open-stock') }}@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.Open Stock')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{route('open-stock.create')}}"
               class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
                <i class="ti ti-plus"></i>
                {{trans('main.new')}} {{trans('main.record')}}
            </a>
        </div>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->


    <!-- end row -->

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
                                   style="width:100%">         <thead class="thead-dark">
                                <tr>
                                    <th>  {{ trans('main.id') }}        </th>
                                    <th>  {{ trans('main.total') }}     </th>
                                    <th>  {{ trans('main.attachments') }}</th>
                                    <th>  {{trans('main.created_at')}}  </th>

                                    <th>  {{ trans('main.action') }}    </th>
                                </tr>
                                </thead>
                                <tbody>
{{--                                @foreach($opens as $open)--}}
{{--                                    <tr>--}}
{{--                                        <td>{{$open->id}}</td>--}}
{{--                                        <td>{{$open->total}}</td>--}}
{{--                                        <td>--}}
{{--                                            @foreach($open->files as $file)--}}
{{--                                                <a title="Show"  href="{{url($file->url)}}" download="">--}}
{{--                                                    {{$loop->index + 1}}<i class="fa fa-cloud-download-alt"></i></a>--}}
{{--                                            @endforeach--}}
{{--                                        </td>--}}
{{--                                        <td>{{$open->created_at->format('d/m/Y')}}</td>--}}
{{--                                        <td>--}}
{{--                                            <a title="Show" class="btn btn-warning" href="{{route('open-stock.show',[$open->id])}}">--}}
{{--                                                {{ trans('main.show') }}--}}
{{--                                            </a>--}}
{{--                                        </td>--}}


{{--                                    </tr>--}}
{{--                                @endforeach--}}

                                </tbody>
                            </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/pdfmake.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/datatable/vsfonts.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>
        $('table.display').DataTable( {
            responsive: true,
            dom: 'Bflrtip',
            buttons: ['copy', 'excel', 'print'],
            "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
            "pagingType": "full_numbers",
            @if (App::isLocale('ar'))
            "language":dataTableLocale
            @endif
        } );

    </script>

    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('open-stock.datatable-data')}}',
            columns: [
                {data: 'id', name: 'id', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: false, orderable: false},
                {data: 'attachments', name: 'attachments', searchable: false, orderable: false},
                {data: 'created_at', name: 'created_at', searchable: true, orderable: true},
                {data: 'action', name: 'action', searchable: false, orderable: false},
            ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })

    </script>
@endsection
















