@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.open-stock')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.open-stock')}}</a></li>
        </ol>
    </div>

@endsection




@section('content')
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
                               style="width:100%">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th>#</th>
                                            <th> {{ trans('main.product') }}</th>
                                            <th width="100px"> {{ trans('main.quantity') }}</th>
                                            <th width="150px"> {{ trans('main.unit') }}  {{ trans('main.price') }}</th>
                                            <th> {{ trans('main.gross') }}  {{ trans('main.price') }}</th>
{{--                                            <th width="95px"> {{ trans('main.action') }}</th>--}}
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php $count = 1; ?>
                                        @foreach($opens->openStockDetails as $product)
                                            <tr>
                                                <td>{{$loop->index+1}}</td>
                                                <td>{{$product->product->LangName}}</td>
                                                <td>{{$product->quantity}}</td>
                                                <td>{{$product->unit_price}} </td>
                                                <th>{{$product->total}} </th>

                                            </tr>
                                        @endforeach



                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th colspan="3"></th>
                                            <th class="text-right">{{ trans('main.total') }} :</th>
                                            <th>{{ number_format($product->total,2,'.',',')}}</th>

                                        </tr>

                                        </tfoot>
                                    </table>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>

@endsection

@section('scripts')

{{--    <script src="{{ url('/app_js/PursesUpdateController.js') }}"></script>--}}
@include('scripts.OpenStockShowController')
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


        function confirmDelete(url) {
            var con = confirm(' {{ trans("main.Are you sure, you want to delete this item from this purses ?")}}');
            if (con) {
                //console.log('Confirm');
                //console.log(url);
                location.replace(url);
            } else {
                //console.log('not confirm')
            }
        }
    </script>

@endsection


    </script>



@endsection
