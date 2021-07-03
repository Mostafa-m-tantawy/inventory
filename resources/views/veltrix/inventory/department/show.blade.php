@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>

    <style>
        .scroll-group {
            max-height: 320px;
            margin-bottom: 10px;
            overflow: scroll;
            -webkit-overflow-scrolling: touch;
        }
    </style>
@stop


@section('title')
    {{trans('main.show department')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.department')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);"> {{trans('main.show department')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')

    <div class="row">
        <div class="col-xl-12">

            <!--Begin:: Portlet-->

            <div class="card">
                <div class="card-body">
                        <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-brand"
                            role="tablist">

                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#kt_apps_contacts_view_tab_3"
                                   role="tab">
                                    <i class="flaticon2-calendar-3"></i> {{trans('main.edit')}}
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " data-toggle="tab" href="#stock_tab"
                                   role="tab">
                                    <i class="flaticon2-calendar-3"></i> {{trans('main.stock')}}
                                </a>
                            </li>
                        </ul>

                <div class="kt-portlet__body">
                    <div class="tab-content kt-margin-t-20">

                        <!--End:: Tab Content-->

                        <!--Begin:: Tab Content-->
                        <div class="tab-pane active" id="kt_apps_contacts_view_tab_3" role="tabpanel">
                            <form class="kt-form kt-form--label-right" method="post"
                                  action="{{route('department.update',$department->id)}}">
                                @csrf
                                {{ method_field('PUT') }}
                                <div class="kt-portlet__body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h3>{{trans('main.department information')}}</h3>
                                            <div class="form-group row">
                                                <div class="col-12">
                                                    <label>{{trans('main.name')}}:</label>
                                                    <input type="text" required name="name" class="form-control"
                                                           placeholder="{{trans('main.department name')}}" value="{{$department->name}}">
                                                    </div>
                                                <div class="col-12">
                                                    <label class="">{{trans('main.description')}}:</label>
                                                    <input type="text" required name="description"
                                                           value="{{$department->description}}" class="form-control"
                                                           placeholder="{{trans('main.description')}}">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="kt-portlet__foot">
                                    <div class="kt-form__actions">
                                        <div class="row">
                                            <div class="col-lg-4"></div>
                                            <div class="col-lg-8">
                                                <button type="submit"
                                                        class="btn btn-primary">{{trans('main.submit')}}</button>
                                                <button type="reset"
                                                        class="btn btn-secondary">{{trans('main.cancel')}}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tab-pane " id="stock_tab" role="tabpanel">
                                        <table class="datatable-responsive display table table-striped table-bordered " style="width: 100%">
                                            <thead class="thead-dark">
                                            <tr>
                                                <th> {{trans('main.name')}}</th>
                                                <th> {{trans('main.quantity')}}  {{trans('main.available')}}</th>
                                                <th> {{trans('main.unit')}} {{trans('main.price')}}</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            @foreach($stocks as $stock)
                                                <tr>
                                                    <td>{{$stock->product->LangName}}</td>
                                                    <td>{{$stock->quantity }}</td>
                                                    <td>{{$stock->cost }}</td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>

                        </div>

                        <!--End:: Tab Content-->
                    </div>
                </div>
            </div>
            </div>
            </div>

            <!--End:: Portlet-->
        </div>


    </div>

@stop
@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>

    <script>
        $('table.display').DataTable({
            responsive: true,
            dom: 'Bflrtip',
            buttons: ['copy', 'excel', 'print'],
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
            "pagingType": "full_numbers",
            @if (App::isLocale('ar'))
            "language": dataTableLocale
            @endif
        });
    </script>


@stop
