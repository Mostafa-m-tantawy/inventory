@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index product')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.products')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="#"
               data-toggle="modal" data-target=".create_product"
               class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light">
                <i class="ti ti-plus"></i>
                {{trans('main.new')}} {{trans('main.record')}}
            </a>
        </div>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card" style="margin-bottom: -20px;">
                <div class="card-header bg-info">
                    <h4 class="mb-0 text-white">{{__('main.Import Products')}}</h4>
                </div>

                <div class="card-body" style="margin-bottom: -20px;">


                    <form action="{{route('product.import')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="form-body">

                            <div class="row pt-3">
                                <div class="col-md-4">
                                    <div class="form-group row">
                                        <label for="excel" class=" col-md-4">{{__('main.excel')}}</label>
                                        <input type="file" name="excel" id="excel"
                                               class="form-control col-md-8">
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <button type="submit"
                                            class="btn btn-primary">{{__('main.Import')}}</button>
                                </div>
                                <div class="col-md-2">

                                </div>
                                <div class="col-md-3">

                                    <a href="{{route('product.export.guide')}}"
                                       class="btn btn-info" style="float: right">
                                        {{__('main.export_guide')}}
                                    </a>
                                    <a href="{{asset('excel/ProductTemplate.xlsx')}}" download=""
                                       class="btn btn-info">{{__('main.ImportTemplate')}}</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<br>
<br>
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
                               class="display thead-light compact table table-striped table-bordered " cellspacing="0"
                               style="width:100%">
                            <thead class="thead-dark">
                            <tr>
                                <th>{{trans('main.category')}}</th>
                                <th>{{trans('main.name')}}</th>
                                <th>{{trans('main.unit')}}</th>
                                <th>{{trans('main.barcode')}}</th>
                                <th>{{trans('main.re-order point')}}</th>
                                <th>{{trans('main.cost')}}</th>
                                <th>{{trans('main.quantity')}}</th>
                                <th>{{trans('main.is prepared')}}</th>
                                <th>{{trans('main.action')}}</th>
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

    <div class="modal fade create_product" id="create_product" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{route('product.store')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.new')}} {{trans('main.product')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        @csrf
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-12">
                                    <label> {{trans('main.name')}}</label>
                                    <input type="text" required name="name" class="form-control"
                                           placeholder="{{trans('main.product name')}}">
                                </div>
                                <div class="col-12">
                                    <label> {{trans('main.name_ar')}}</label>
                                    <input type="text" name="name_ar" class="form-control"
                                           placeholder="{{trans('main.product name_ar')}}">
                                </div>

                                <div class="col-12">
                                    <label class=""> {{trans('main.unit')}} </label>
                                    <select name="unit" class="form-control select2">
                                        <option value=""> {{trans('main.select')}}  {{trans('main.unit')}}</option>
                                        @foreach($units as $unit )
                                            <option value="{{$unit->id}}">{{$unit->unit}}</option>
                                        @endforeach
                                    </select>

                                </div>

                                <div class="col-12">
                                    <label class="">{{trans('main.category')}} </label>
                                    <select name="category" class="form-control select2">
                                        <option value="">{{trans('main.select category')}}</option>

                                        @foreach($categories as $category )
                                            <option value="{{$category->id}}">{{$category->name}}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label class="">{{trans('main.re-order point')}} :</label>
                                    <input type="number" min="0" step=".001" name="reorder_point" class="form-control"
                                           placeholder="{{trans('main.reorder point')}} ">

                                </div>

                                <div class="col-12">
                                    <label class="">{{trans('main.barcode')}} </label>
                                    <input type="text" name="barcode" class="form-control"
                                           placeholder="{{trans('main.enter barcode')}} ">

                                </div>

                                <div class="col-12">
                                    <label>  {{trans('main.prepared')}}</label>
                                    <div class="form-group row">
                                        <div class="col-9">
                                            <div class="kt-radio-inline">
                                                <label class="kt-radio">
                                                    <input type="radio" value="1" name="is_prepared">
                                                    {{trans('main.prepared')}}
                                                    <span></span>
                                                </label>
                                                <label class="kt-radio">
                                                    <input type="radio" checked="checked" value="0" name="is_prepared">
                                                    {{trans('main.not prepared')}}
                                                    <span></span>
                                                </label>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit"
                                    class="btn btn-primary">{{trans('main.submit')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <div class="modal fade bd-example-modal-lg" id="updatemodel" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{url('stock/product/update')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.update')}} {{trans('main.product')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        @csrf
                        <div class="container">
                            <div class="form-group row">
                                <div class="col-12">
                                    <label>  {{trans('main.id')}}</label>
                                    <input type="text" required name="id" readonly class="form-control">
                                </div>
                                <div class="col-12">
                                    <label> {{trans('main.name')}}</label>
                                    <input type="text" required name="name" class="form-control"
                                           placeholder="{{trans('main.product name')}}">
                                </div>

                                <div class="col-12">
                                    <label> {{trans('main.name_ar')}}</label>
                                    <input type="text" name="name_ar" class="form-control"
                                           placeholder="{{trans('main.product name_ar')}}">
                                </div>
                                <div class="col-12">
                                    <label class=""> {{trans('main.unit')}} </label>
                                    <select name="unit" class="form-control select2">
                                        <option value=""> {{trans('main.select')}}  {{trans('main.unit')}}</option>
                                        @foreach($units as $unit )
                                            <option value="{{$unit->id}}">{{$unit->unit}}</option>
                                        @endforeach
                                    </select>

                                </div>

                                <div class="col-12">
                                    <label class="">{{trans('main.category')}} </label>
                                    <select name="category" class="form-control select2">
                                        <option value="">{{trans('main.select category')}}</option>

                                        @foreach($categories as $category )
                                            <option value="{{$category->id}}">{{$category->name}}</option>
                                        @endforeach
                                    </select>
                                </div>


                                <div class="col-12">
                                    <label class="">{{trans('main.re-order point')}} :</label>
                                    <input type="number" min="0" step=".001" name="reorder_point" class="form-control"
                                           placeholder="{{trans('main.reorder point')}}">

                                </div>

                                <div class="col-12">
                                    <label class="">{{trans('main.barcode')}} </label>
                                    <input type="text" name="barcode" class="form-control"
                                           placeholder="{{trans('main.enter barcode')}}">

                                </div>


                                <div class="col-12">
                                    <label>  {{trans('main.prepared')}}</label>
                                    <div class="form-group row">
                                        <div class="col-9">
                                            <div class="kt-radio-inline">
                                                <label class="kt-radio">
                                                    <input type="radio" value="1" class="prepared" name="is_prepared">
                                                    {{trans('main.prepared')}}
                                                    <span></span>
                                                </label>
                                                <label class="kt-radio">
                                                    <input type="radio" class="prepared" value="0" name="is_prepared">
                                                    {{trans('main.not prepared')}}
                                                    <span></span>
                                                </label>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit"
                                    class="btn btn-primary">{{trans('main.submit')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <div class="modal fade" id="excel_errors_modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="width:120%">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('main.excel_errors')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table id="comments-table" class="table table-striped border display">
                        <thead class="bg-info text-white">
                        <tr>
                            <th>{{__('main.row_id')}}</th>
                            <th>{{__('main.comment')}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @if(session('excel_errors'))
                            @foreach(session('excel_errors') as $key=>$errors)
                                <tr>
                                    <td>{{$key}}</td>
                                    <td>
                                        @foreach($errors['keys'] as $error)
                                            {{$error}}
                                            <ul>
                                                <li>{{$errors['messages'][$error][0]}}</li>
                                            </ul>
                                        @endforeach

                                    </td>
                                </tr>
                            @endforeach
                        @endif
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">{{__('main.close')}}</button>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('scripts')


    <script type="text/javascript">
        $(document).ready(function () {

            @if(session('excel_errors'))

            $('#excel_errors_modal').modal('show');

            @endif

        });
    </script>
    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>


        $.fn.dataTableExt.ofnSearch['html-input'] = function (value) {
            return $(value).val();
        };
        $(document).ready(function () {
            $('#updatemodel').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var name = $(e.relatedTarget).data('name');
                var name_ar = $(e.relatedTarget).data('name_ar');
                var unit = $(e.relatedTarget).data('unit');
                var category = $(e.relatedTarget).data('category');
                var reorder = $(e.relatedTarget).data('reorder');
                var barcode = $(e.relatedTarget).data('barcode');
                var is_stockable = $(e.relatedTarget).data('is_stockable');
                var is_prepared = $(e.relatedTarget).data('is_prepared');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="name"]').val(name);
                $(e.currentTarget).find('input[name="name_ar"]').val(name_ar);
                $(e.currentTarget).find('select[name="unit"]').val(unit);
                $(e.currentTarget).find('select[name="category"]').val(category);
                $(e.currentTarget).find('input[name="reorder_point"]').val(reorder);
                $(e.currentTarget).find('input[name="barcode"]').val(barcode);

                if (is_stockable == 0)
                    $(e.currentTarget).find('input[name="is_stockable"]').prop('checked', false);
                // if (is_prepared)
                $(e.currentTarget).find('.prepared[value="' + is_prepared + '"]').attr('checked', true);
            });

        })
    </script>
    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('product.datatable-data')}}',
            columns: [
                {data: 'category'       , name: 'category'      , searchable: true, orderable: true},
                {data: 'name'           , name: 'name'          , searchable: true, orderable: true},
                {data: 'unit'           , name: 'unit'          , searchable: true, orderable: true},
                {data: 'barcode'        , name: 'barcode'       , searchable: true, orderable: true},
                {data: 'reorder_point'  , name: 'reorder_point' , searchable: true, orderable: true},
                {data: 'cost'           , name: 'cost'          , searchable: true, orderable: true},
                {data: 'quantity'       , name: 'quantity'      , searchable: true, orderable: true},
                {data: 'is_prepared'    , name: 'is_prepared'   , searchable: false, orderable: false},
                {data: 'action'         , name: 'action'        , searchable: false, orderable: false},
            ],

        })

    </script>
@stop
