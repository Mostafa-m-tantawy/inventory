@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{ URL::asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet" type="text/css" />
    <style>
        #wrapper {
            height: 100%;
            overflow: unset !important;
            width: 100%;
        }
        .footer {
            bottom: unset !important;
        }

    </style>
@stop


@section('title')
    {{trans('main.product recipe')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.product')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">   {{trans('main.product recipe')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">


                <!--begin: Datatable -->
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <div class="container">

                    <!--begin: Form Wizard Form-->
                    <form style="padding: unset" action="{{route('product.recipe.store',[$product->id])}}"
                          method="post"
                          enctype="multipart/form-data">
                    @csrf
                    <!--begin: Form Wizard Step 1-->
                        {{trans('main.create')}} {{trans('main.recipe')}}
                                    <div class="row">
                                        <div class="col-md-3">

                                            <div class="form-group">
                                                <label>{{trans('main.product')}}</label>
                                                <select name="product" id="product" class="form-control select2" required>
                                                    <option value="">{{trans('main.select')}} {{trans('main.product')}}</option>

                                                    @foreach($categories as $category )
                                                        <optgroup label="{{$category->LangName}}">
                                                            @foreach($category->products as $productt )
                                                                <option
                                                                    value="{{$productt->id}}">{{$productt->LangName}}</option>
                                                            @endforeach
                                                        </optgroup>
                                                    @endforeach
                                                </select>
                                                <span class="form-text text-muted"> {{trans('main.select')}} {{trans('main.product')}} </span>
                                            </div>
                                            </div>


                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>{{trans('main.quantity')}} {{trans('main.in')}}  (<span id="child_unit"></span>)</label>
                                                <input type="number" min="0" step="0.001" class="form-control"
                                                       name="child" id="quantity">
                                                <span class="form-text text-muted">{{trans('main.quantity')}}  </span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>{{trans('main.quantity')}} {{trans('main.in')}}  (<span id="unit"></span>)</label>
                                                <input type="number" min="0"  readonly=""
                                                       class="form-control" id="parent" name="quantity">
                                                <span class="form-text text-muted">{{trans('main.quantity')}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <br>   <button type="submit"
                                                    class="btn btn-primary">
                                                {{trans('main.submit')}}
                                            </button>
                                        </div>
                                    </div>




                        <!--end: Form Actions -->
                    </form>

                    <!--end: Form Wizard Form-->
                </div>
                <br>
                <br>
                <div class="container">
         <!--begin: Datatable -->
                    <table id="datatable-responsive"
                           class="display table table-striped table-bordered " cellspacing="0"
                           style="width:100%">
                        <thead class="thead-dark">
                        <tr>
                            <th>{{trans('main.product')}}</th>
                            <th> {{trans('main.quantity')}}</th>
                            <th> {{trans('main.child')}}  {{trans('main.quantity')}}</th>
                            <th> {{trans('main.delete')}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($product->recipes as $recipe)

                            <tr>
                                <td>{{$recipe->product->name}}</td>
                                <td>{{$recipe->unit_quantity}}</td>
                                <td>{{$recipe->child_unit_quantity}}</td>
                                <td>
                                    <a title="delete" class="btn btn-danger"
                                       href="{{route('product.recipe.delete',[$recipe->id])}}">
                                        {{trans('main.delete')}}
                                    </a>
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

  @stop
@section('scripts')
    {{----}}
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
        var convertion_rate = 0;
        var unitName = '';

        $(document).ready(function () {
//
            $("#product").on('change', function (e) {

                var productId = $("#product").val();
                $.get('{{url('stock/get-unit-of-product/')}}/'+ productId, function (data) {
                    // console.log(data);
                    convertion_rate = parseFloat(data.unit.convert_rate);
                    unitName = data.unit.unit;
                    $("#unit").text(data.unit.unit);
                    $("#child_unit").text(data.unit.child_unit);
                });
            });
            $("#quantity").on('change keyup', function (e) {
                console.log('dddddddd');
                $("#parent").val(parseFloat($(this).val() / convertion_rate),6);


            });



        })
    </script>

@stop
