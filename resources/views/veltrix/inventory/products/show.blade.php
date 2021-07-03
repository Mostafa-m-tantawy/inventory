@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('css/demo1/style.bundle.css')}}" rel="stylesheet" type="text/css"/>
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
    {{trans('main.show product')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.product')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">   {{trans('main.show product')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')

    <div class="row">
        <div class="col-xl-12">

            <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor">


                <!-- begin:: Content -->
                <div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">

                    <div class="row">
                        <div class="col-xl-12">

                            <!--begin:: Widgets/Product Sales-->
                            <div
                                class="kt-portlet kt-portlet--bordered-semi kt-portlet--space kt-portlet--height-fluid">
                                <div class="kt-portlet__head">
                                    <div class="kt-portlet__head-label">
                                        <h3 class="kt-portlet__head-title">
                                            {{$product->lang_name}}
                                            <small> {{trans('main.restaurant stock')}}</small>
                                        </h3>
                                    </div>
                                </div>
                                <div class="kt-portlet__body">
                                    <div class="kt-widget25">
                                        <span class="kt-widget25__stats m-font-brand">{{$product->MainStoreQuantity(Auth::user()->store)}}</span>
                                        <span class="kt-widget25__subtitle">
                                        {{trans('main.restaurant stock')}}
                                </span>

                                        <div class="kt-widget25__items">


                                            <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: green">
															{{$open}}
														</span>
                                                <div class="progress kt-progress--sm">
                                                    <div class="progress-bar kt-bg-success" role="progressbar"
                                                         style="color: green; width: @if($open+$purchased!=0){{($open/($purchased+$open))*100}}% @else 0% @endif"
                                                         aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                                <span class="kt-widget25__desc" style="color: green">
                                                        {{trans('main.open stock')}}


														 </span>
                                            </div>

                                            <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: green">
															{{$purchased}}
														</span>
                                                <div class="progress kt-progress--sm">
                                                    <div class="progress-bar kt-bg-success" role="progressbar"
                                                         style="color: green; width: @if($open+$purchased!=0){{($purchased/($purchased+$open))*100}}% @else 0% @endif"
                                                         aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                                <span class="kt-widget25__desc" style="color: green">
											@if($product->is_prepared)
                                                        {{trans('main.prepared')}}
                                                    @else
                                                        {{trans('main.purchases')}}
                                                    @endif
														 </span>
                                            </div>
                                            @if(!$product->is_prepared)
                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$cooked}}
														</span>
                                                    <div class="progress m-progress--sm">
                                                        <div class="progress-bar kt-bg-danger" role="progressbar"
                                                             style=" color: red; width: @if($open+$purchased!=0){{($cooked/($purchased+$open))*100}}% @else 0% @endif; "
                                                             aria-valuenow="50" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: red">
															{{trans('main.cooked')}}
														</span>
                                                </div>
                                            @endif

                                            @if(!$product->is_prepared)

                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$refund}}
														</span>
                                                    <div class="progress m-progress--sm">
                                                        <div class="progress-bar kt-bg-danger" role="progressbar"
                                                             style=" color: red; width: @if($open+$purchased!=0){{($refund/($purchased+$open))*100}}% @else 0% @endif; "
                                                             aria-valuenow="50" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: red">
															{{trans('main.refund')}}
														</span>
                                                </div>
                                            @endif

                                            <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$ruind}}
														</span>
                                                <div class="progress m-progress--sm">
                                                    <div class="progress-bar kt-bg-danger" role="progressbar"
                                                         style="color: red; width: @if($open+$purchased!=0){{($ruind/($purchased+$open))*100}}% @else 0% @endif ;"
                                                         aria-valuenow="50" aria-valuemin="0"
                                                         aria- aria-valuemax="100"></div>
                                                </div>
                                                <span class="kt-widget25__desc" style="color: red">
															{{trans('main.ruined')}}
														</span>
                                            </div>
                                            <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$assign_to_other}}
														</span>
                                                <div class="progress m-progress--sm">
                                                    <div class="progress-bar kt-bg-danger" role="progressbar"
                                                         style="color: red;
                                                             width:@if($open+$purchased!=0)
                                                         {{($assign_to_other/($purchased+$open))*100}}%
                                                         @else
                                                             0%
                                                         @endif;" aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100">

                                                    </div>
                                                </div>
                                                <span class="kt-widget25__desc" style="color: red">
															{{trans('main.assign to departments')}}
														</span>
                                            </div>
                                            <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: green">
															{{$assign_to_me}}
														</span>
                                                <div class="progress m-progress--sm">
                                                    <div class="progress-bar kt-bg-success" role="progressbar"
                                                         style="color: green; width: @if($open+$purchased!=0){{($assign_to_me/($purchased+$open))*100}}% @else 0% @endif;"
                                                         aria-valuenow="50" aria-valuemin="0"
                                                         aria-valuemax="100"></div>
                                                </div>
                                                <span class="kt-widget25__desc" style="color: green">
															{{trans('main.assign to restaurant from department')}}
														</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--end:: Widgets/Product Sales-->

                        </div>


                        @foreach($departments as $department)
                            <div class="col-xl-6">

                                <!--begin:: Widgets/Product Sales-->
                                <div
                                    class="kt-portlet kt-portlet--bordered-semi kt-portlet--space kt-portlet--height-fluid">
                                    <div class="kt-portlet__head">
                                        <div class="kt-portlet__head-label">
                                            <h3 class="kt-portlet__head-title">
                                                {{$department->name}}
                                                <small> {{trans('main.department stock')}}</small>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="kt-portlet__body">
                                        <div class="kt-widget25">
                                    <span
                                        class="kt-widget25__stats m-font-brand">{{$product->departmentquantity($department)}}</span>
                                            <span class="kt-widget25__subtitle">
                                      {{trans('main.department stock')}}
                                </span>
                                            <div class="kt-widget25__items">
                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: green">
															{{$product->assginedToMe($department)}}
														</span>
                                                    <div class="progress kt-progress--sm">
                                                        <div class="progress-bar kt-bg-success" role="progressbar"
                                                             style="color: green; width: @if($product->assginedToMe($department)!=0){{($product->assginedToMe($department)/$product->assginedToMe($department))*100}}% @else 0% @endif"
                                                             aria-valuenow="50" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: green">
															{{trans('main.assign from restaurant')}}
														 </span>
                                                </div>
                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$product->assginedToOthers($department)}}
														</span>
                                                    <div class="progress m-progress--sm">
                                                        <div class="progress-bar kt-bg-danger" role="progressbar"
                                                             style=" color: red; width: @if($product->assginedToMe($department)!=0){{($product->assginedToOthers($department)/$product->assginedToMe($department))*100}}% @else 0% @endif; "
                                                             aria-valuenow="50" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: red">
															{{trans('main.assign to restaurant')}}
														</span>
                                                </div>
                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$product->ruinedFromMe($department)}}
														</span>
                                                    <div class="progress m-progress--sm">
                                                        <div class="progress-bar kt-bg-danger" role="progressbar"
                                                             style="color: red; width: @if($product->assginedToMe($department)!=0){{($product->ruinedFromMe($department)/$product->assginedToMe($department))*100}}% @else 0% @endif ;"
                                                             aria-valuenow="50" aria-valuemin="0"
                                                             aria- aria-valuemax="100"></div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: red">
															{{trans('main.ruined')}}
														</span>
                                                </div>
                                                <div class="kt-widget25__item">
														<span class="kt-widget25__number" style="color: red">
															{{$product->cookedProduct($department)}}
														</span>
                                                    <div class="progress m-progress--sm">
                                                        <div class="progress-bar kt-bg-danger" role="progressbar"
                                                             style="color: red;
                                                                 width:@if($product->assginedToMe($department)!=0)
                                                             {{($product->cookedProduct($department)/$product->assginedToMe($department))*100}}%
                                                             @else
                                                                 0%
                                                             @endif;" aria-valuenow="50" aria-valuemin="0"
                                                             aria-valuemax="100">

                                                        </div>
                                                    </div>
                                                    <span class="kt-widget25__desc" style="color: red">
															{{trans('main.cooked')}}
														</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--end:: Widgets/Product Sales-->

                            </div>

                        @endforeach


                        <div class="col-xl-12">

                            <!--Begin:: Portlet-->
                            <div class="kt-portlet kt-portlet--tabs">
                                <div class="kt-portlet__head">
                                    <div class="kt-portlet__head-toolbar">
                                        <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-brand"
                                            role="tablist">

                                            <li class="nav-item">
                                                <a class="nav-link active" data-toggle="tab" href="#kt_apps_purchases"
                                                   role="tab">
                                                    <i class="flaticon2-calendar-3"></i>
                                                    @if($product->is_prepared)
                                                        {{trans('main.prepared')}}
                                                    @else
                                                        {{trans('main.purchases')}}
                                                    @endif
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#kt_apps_ruined"
                                                   role="tab">
                                                    <i class="flaticon2-user-outline-symbol"></i> {{trans('main.ruined')}}
                                                </a>
                                            </li>
                                            @if(!$product->is_prepared)
                                                <li class="nav-item">
                                                    <a class="nav-link" data-toggle="tab" href="#kt_apps_refund"
                                                       role="tab">
                                                        <i class="flaticon2-gear"></i> {{trans('main.refund')}}
                                                    </a>
                                                </li>
                                            @endif
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" href="#kt_apps_assign"
                                                   role="tab">
                                                    <i class="flaticon2-gear"></i> {{trans('main.assign')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="kt-portlet__body">
                                    <div class="tab-content kt-margin-t-20">

                                        <!--End:: Tab Content-->

                                    @if($product->is_prepared)
                                        <!--Begin:: Tab Content-->
                                            <div class="tab-pane active" id="kt_apps_purchases" role="tabpanel">

                                                <div class="kt-portlet__body" style="padding: unset">

                                                    <div class="kt-portlet__head kt-portlet__head--lg">
                                                        <div class="kt-portlet__head-label">
										        <span class="kt-portlet__head-icon">
											        <i class="kt-font-brand flaticon2-line-chart"></i>
										        </span>
                                                            <h3 class="kt-portlet__head-title">
                                                                {{trans('main.product prepared')}}
                                                            </h3>
                                                        </div>

                                                    </div>
                                                    <!--begin: Datatable -->
                                                    <table id="datatable-prepared"
                                                           class="display table table-striped table-bordered "
                                                           cellspacing="0"
                                                           style="width:100%">
                                                        <thead class="thead-dark">
                                                        <tr>
                                                            <th>{{trans('main.id')}}</th>
                                                            <th>{{trans('main.quantity')}}</th>
                                                            <th>{{trans('main.created_at')}}</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>


                                                        </tbody>
                                                    </table>

                                                </div>

                                            </div>

                                            <!--End:: Tab Content-->
                                    @else
                                        <!--Begin:: Tab Content-->
                                            <div class="tab-pane active" id="kt_apps_purchases" role="tabpanel">

                                                <div class="kt-portlet__body" style="padding: unset">

                                                    <div class="kt-portlet__head kt-portlet__head--lg">
                                                        <div class="kt-portlet__head-label">
										        <span class="kt-portlet__head-icon">
											        <i class="kt-font-brand flaticon2-line-chart"></i>
										        </span>
                                                            <h3 class="kt-portlet__head-title">
                                                                {{trans('main.product purchases')}}
                                                            </h3>
                                                        </div>

                                                    </div>
                                                    <!--begin: Datatable -->
                                                    <table id="datatable-purchases"
                                                           class="display table table-striped table-bordered "
                                                           cellspacing="0"
                                                           style="width:100%">
                                                        <thead class="thead-dark">
                                                        <tr>
                                                            <th>{{trans('main.id')}}</th>
                                                            <th>{{trans('main.supplier')}}</th>
                                                            <th>{{trans('main.price')}}</th>
                                                            <th>{{trans('main.quantity')}}</th>
                                                            <th>{{trans('main.vat')}}</th>
                                                            <th>{{trans('main.discount')}}</th>
                                                            <th>{{trans('main.total')}}</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>


                                                        </tbody>
                                                    </table>

                                                </div>

                                            </div>

                                            <!--End:: Tab Content-->
                                    @endif

                                    <!--Begin:: Tab Content-->
                                        <div class="tab-pane" id="kt_apps_ruined" role="tabpanel">

                                            <div class="kt-portlet__body" style="padding: unset">

                                                <div class="kt-portlet__head kt-portlet__head--lg">
                                                    <div class="kt-portlet__head-label">
										<span class="kt-portlet__head-icon">
											<i class="kt-font-brand flaticon2-line-chart"></i>
										</span>
                                                        <h3 class="kt-portlet__head-title">
                                                            {{trans('main.ruined product' )}}
                                                        </h3>
                                                    </div>

                                                </div>
                                                <!--begin: Datatable -->
                                                <table id="datatable-ruined"
                                                       class="display table table-striped table-bordered "
                                                       cellspacing="0"
                                                       style="width:100%">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th>{{trans('main.id')}}</th>
                                                        <th>{{trans('main.from')}}</th>
                                                        <th>{{trans('main.unit price')}}</th>
                                                        <th>{{trans('main.quantity')}}</th>
                                                        <th>{{trans('main.total')}}</th>
                                                        <th>{{trans('main.note')}}</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>


                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                        <!--End:: Tab Content-->

                                    @if(!$product->is_prepared)

                                        <!--Begin:: Tab Content-->
                                            <div class="tab-pane" id="kt_apps_refund" role="tabpanel">

                                                <div class="kt-portlet__body" style="padding: unset">

                                                    <div class="kt-portlet__head kt-portlet__head--lg">
                                                        <div class="kt-portlet__head-label">
										<span class="kt-portlet__head-icon">
											<i class="kt-font-brand flaticon2-line-chart"></i>
										</span>
                                                            <h3 class="kt-portlet__head-title">
                                                                {{trans('main.refunded product')}}
                                                            </h3>
                                                        </div>

                                                    </div>
                                                    <!--begin: Datatable -->
                                                    <table id="datatable-refunded"
                                                           class="display table table-striped table-bordered "
                                                           cellspacing="0"
                                                           style="width:100%">
                                                        <thead class="thead-dark">
                                                        <tr>
                                                            <th>{{trans('main.id')}}</th>
                                                            <th>{{trans('main.supplier')}}</th>
                                                            <th>{{trans('main.price')}}</th>
                                                            <th>{{trans('main.quantity')}}</th>
                                                            <th>{{trans('main.vat')}}</th>
                                                            <th>{{trans('main.total')}}</th>
                                                            <th>{{trans('main.note')}}</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>


                                                        </tbody>
                                                    </table>

                                                </div>


                                                <div
                                                    class="kt-separator kt-separator--space-lg kt-separator--fit kt-separator--border-solid"></div>

                                                <div class="kt-form__actions">

                                                </div>
                                            </div>
                                            <!--End:: Tab Content-->
                                    @endif

                                    <!--Begin:: Tab Content-->
                                        <div class="tab-pane" id="kt_apps_assign" role="tabpanel">

                                            <div class="kt-portlet__body" style="padding: unset">

                                                <div class="kt-portlet__head kt-portlet__head--lg">
                                                    <div class="kt-portlet__head-label">
										<span class="kt-portlet__head-icon">
											<i class="kt-font-brand flaticon2-line-chart"></i>
										</span>
                                                        <h3 class="kt-portlet__head-title">
                                                            {{trans('main.product assignment')}}
                                                        </h3>
                                                    </div>

                                                </div>
                                                <!--begin: Datatable -->
                                                <table id="datatable-assignment"
                                                       class="display table table-striped table-bordered "
                                                       cellspacing="0"
                                                       style="width:100%">
                                                    <thead class="thead-dark">
                                                    <tr>
                                                        <th> {{trans('main.id')}}</th>
                                                        <th> {{trans('main.from')}}</th>
                                                        <th> {{trans('main.to')}}</th>
                                                        <th> {{trans('main.product')}}</th>
                                                        <th> {{trans('main.quantity')}}</th>
                                                        <th>{{trans('main.created_at')}}</th>
                                                    </tr>
                                                    </thead>

                                                </table>

                                            </div>


                                            <div
                                                class="kt-separator kt-separator--space-lg kt-separator--fit kt-separator--border-solid"></div>

                                            <div class="kt-form__actions">

                                            </div>
                                        </div>
                                        <!--End:: Tab Content-->
                                    </div>
                                </div>
                            </div>

                            <!--End:: Portlet-->
                        </div>


                    </div>
                </div>

                <!-- end:: Content -->
            </div>

        </div>
    </div>
@stop

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>
        var accountTable = $('#datatable-purchases').DataTable({
            ...DatatableOptions,
            ajax: {
                url: '{{ route('product.purchasing.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            }, columns: [
                {data: 'id', name: 'id', searchable: false, orderable: false},
                {data: 'supplier', name: 'supplier', searchable: false, orderable: false},
                {data: 'unit_price', name: 'unit_price', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'vat', name: 'vat', searchable: true, orderable: true},
                {data: 'discount_percentage', name: 'discount_percentage', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: true, orderable: true},
            ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })


        var accountTable = $('#datatable-ruined').DataTable({
            ...DatatableOptions,
            ajax: {
                url: '{{ route('product.ruined.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            },
            columns: [
                {data: 'id', name: 'id', searchable: false, orderable: false},
                {data: 'from', name: 'from', searchable: false, orderable: false},
                {data: 'price_unit', name: 'price_unit', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: true, orderable: true},
                {data: 'note', name: 'note', searchable: true, orderable: true},
               ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })



        var accountTable = $('#datatable-refunded').DataTable({
            ...DatatableOptions,
            ajax: {
                url: '{{ route('product.refunded.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            },
            columns: [
                {data: 'id', name: 'id', searchable: false, orderable: false},
                {data: 'supplier', name: 'supplier', searchable: false, orderable: false},
                {data: 'unit_price', name: 'unit_price', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'vat', name: 'vat', searchable: true, orderable: true},
                {data: 'total', name: 'total', searchable: true, orderable: true},
                {data: 'note', name: 'note', searchable: true, orderable: true},
               ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })


        var accountTable = $('#datatable-assignment').DataTable({
            ...DatatableOptions,
            ajax: {
                url: '{{ route('product.assignment.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            },
            columns: [
                {data: 'id', name: 'id', searchable: false, orderable: false},
                {data: 'sourceable', name: 'sourceable', searchable: false, orderable: false},
                {data: 'assignable', name: 'assignable', searchable: false, orderable: false},
                {data: 'product_id', name: 'product_id', searchable: true, orderable: true},
                {data: 'quantity', name: 'quantity', searchable: true, orderable: true},
                {data: 'created_at', name: 'created_at', searchable: true, orderable: true},
                ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })

    </script>
    <script>
        var accountTable = $('#datatable-prepared').DataTable({
            ...DatatableOptions,

            ajax: {
                url: '{{ route('prepare.datatable-data')}}',
                type: "get",
                data: function (d) {
                    d.product_id = "{{$product->id}}";
                },
            },columns: [
                {data: 'id'           , name: 'id'          , searchable: true, orderable: true},
                {data: 'quantity'           , name: 'quantity'          , searchable: true, orderable: true},
                {data: 'created_at'        , name: 'created_at'       , searchable: true, orderable: true},

            ],
            columnDefs: [
                {"targets": [0], "visible": false},
            ],
        })

    </script>
@endsection
