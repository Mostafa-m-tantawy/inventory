@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.prepare product')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.product')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.prepare')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="{{url('stock/prepare/create')}}"
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
                                    <th>  {{ trans('main.id') }}</th>
                                    <th>  {{ trans('main.product') }} </th>
                                    <th>  {{ trans('main.quantity') }}</th>
                                    <th>{{trans('main.created_at')}}</th>
                                    <th>  {{ trans('main.details') }}</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($prepares as $prepare)
                                    <tr>
                                        <td>{{$prepare->id}}</td>
                                        <td>{{$prepare->product->LangName}}</td>
                                        <td>{{$category->quantity}}</td>
                                        <td>{{$prepare->created_at->format('d/m/Y')}}</td>
                                        <td>
                                            <a title="Show" href="{{url('stock/prepare/show/'.$prepare->id)}}"> <i  class="fa fa-book-open"></i></a>
                                        </td>
                                    </tr>
                                @endforeach

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

@endsection















