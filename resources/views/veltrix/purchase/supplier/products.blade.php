@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.supplier products')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.purchase')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.supplier')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.supplier products')}}</a></li>
        </ol>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->


    <!-- end row -->

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
                        <th> {{trans('main.id')}}</th>
                        <th>{{trans('main.product')}}</th>
                        <th>{{trans('main.unit')}}</th>
                        <th>{{trans('main.barcode')}}</th>
                        <th>{{trans('main.re-order point')}}</th>
                        <th>{{trans('main.vat')}}</th>
                        <th>{{trans('main.action')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($supplier->products as $product)


                        <tr>
                            <td>{{$product->id}}</td>
                            <td>{{$product->name}}</td>
                            <td>{{$product->unit->unit}}</td>
                            <td>{{$product->barcode}}</td>
                            <td>{{$product->reorder_point}}</td>
                            <td>{{$product->pivot->vat}}</td>
                            <td>
                                <a title="delete" class="btn btn-danger"
                                   href="{{url('stock/product/delete/'.$product->id.'/'.$supplier->id)}}">
                                   {{trans('main.delete')}}
                                </a>
                            </td>

                        </tr>
                    @endforeach
                    {{--                {{dd($products)}}--}}


                    </tbody>
                </table>
                <form action="{{url('stock/product/create/'.$supplier->id)}}" method="post">
                    @csrf
                    <div class="row" id="kt_repeater_2" class="repeater">

                        <div class="col-4">{{trans('main.product')}}</div>
                        <div class="col-4">{{trans('main.vat')}}</div>
                        <div class="col-4">
                            <a href="javascript:;" data-repeater-create=""
                               class="btn btn-bold btn-sm btn-label-brand pull-right">
                                <i class="la la-plus"></i> {{trans('main.add')}}
                            </a>
                        </div>

                        <div class="col-12" data-repeater-list="product_g">
                            <div class="row" data-repeater-item>

                                <div class="col-4">
                                    <select name="product" class="form-control select2">
                                        @foreach($products as $product )
                                            <option value="{{$product->id}}">{{$product->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-4">
                                    <input type="number" class="form-control" name="vat">
                                </div>
                                <div class="col-4" style=" display: flex;
  justify-content: center;
  align-items: center">
                                    <a href="javascript:;" data-repeater-delete="" class="btn btn-danger btn-icon">
                                        {{trans('main.delete')}}
                                    </a>
                                </div>

                            </div>

                        </div>
                        <div class="col-12 pull-left">
                            <button type="submit"
                                    class="btn btn-primary btn-elevate btn-icon-sm">{{trans('main.submit')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        </div>
    </div>
@stop
@section('scripts')

    <script src="{{asset('/vendors/general/jquery.repeater/src/lib.js')}}" type="text/javascript"></script>
    <script src="{{asset('/vendors/general/jquery.repeater/src/jquery.input.js')}}" type="text/javascript"></script>
    <script src="{{asset('/vendors/general/jquery.repeater/src/repeater.js')}}" type="text/javascript"></script>


    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>


        $('#kt_repeater_2').repeater({
            initEmpty: false,

            defaultValues: {
                'text-input': 'foo'
            },

            show: function () {
                $(this).slideDown();
                $('.select2-container').remove();
                $('.select2').select2({
                    width: '100%'
                });
            },

            hide: function (deleteElement) {
                $(this).slideUp(deleteElement);
            }
        });


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
        $.fn.dataTableExt.ofnSearch['html-input'] = function (value) {
            return $(value).val();
        };

    </script>

@stop
