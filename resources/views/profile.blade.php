@extends('veltrix.layouts.master')
@section('head')

    <link href="{{asset('css/demo1/style.bundle.css')}}" rel="stylesheet" type="text/css"/>

    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
    <link href="{{asset('vendors/custom/vendors/line-awesome/css/line-awesome.css')}}" rel="stylesheet" type="text/css"/>

<style>
        .kt-aside--enabled .kt-header.kt-header--fixed {
            left: 0px !important;
        }
</style>
@endsection

@section('title')
    {{trans('main.dashboard')}}
@stop

@section('content')
    <div class="kt-grid kt-grid--hor kt-grid--root">
        <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--ver kt-page">

            <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor kt-wrapper"
                 style="padding-left: unset" id="kt_wrapper">

                <!-- begin:: Header -->
                @include('veltrix.layouts.header')

    <div class="kt-grid__item kt-grid__item--fluid kt-grid kt-grid--hor">


        <!-- begin:: Content -->
        <div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">

            <div class="row">
                <div class="col-xl-4">


                    <!--Begin:: Portlet-->
                    <div class="kt-portlet">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-label">
                                <h3 class="kt-portlet__head-title">
                                    {{trans('main.employee')}}
                                </h3>
                            </div>

                        </div>
                        <div class="kt-form kt-form--label-right">
                            <div class="kt-portlet__body">
                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">{{trans('main.name')}}:</label>
                                    <div class="col-7">
                                        <span
                                            class="form-control-plaintext kt-font-bolder">{{$employee->name}}</span>
                                    </div>
                                </div>
                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">{{trans('main.email')}}:</label>
                                    <div class="col-7">
                                        <span
                                            class="form-control-plaintext kt-font-bolder">{{$employee->email}}</span>
                                    </div>
                                </div>


                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">phone 1:</label>

                                    <div class="col-7">
                                        <span class="form-control-plaintext kt-font-bolder">{{$employee->phone1}}</span>
                                    </div>
                                </div>

                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">phone 2:</label>

                                    <div class="col-7">
                                        <span class="form-control-plaintext kt-font-bolder">{{$employee->phone2}}</span>
                                    </div>
                                </div>

                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label">phone 3:</label>

                                    <div class="col-7">
                                        <span class="form-control-plaintext kt-font-bolder">{{$employee->phone3}}</span>
                                    </div>
                                </div>


                                <div class="form-group form-group-xs row">
                                    <label class="col-3 col-form-label"> {{trans('main.address')}}:</label>

                                    <div class="col-7">
                                        <span class="form-control-plaintext kt-font-bolder">
                                            {{$employee->address}}</span>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <!--End:: Portlet-->

                </div>


                <div class="col-xl-8">

                    <!--Begin:: Portlet-->
                    <div class="kt-portlet kt-portlet--tabs">
                        <div class="kt-portlet__head">
                            <div class="kt-portlet__head-toolbar">
                                <ul class="nav nav-tabs nav-tabs-space-lg nav-tabs-line nav-tabs-bold nav-tabs-line-3x nav-tabs-line-brand"
                                    role="tablist">

                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab" href="#kt_apps_contacts_view_tab_3"
                                           role="tab">
                                            <i class="flaticon2-calendar-3"></i> {{trans('main.personal')}}
                                        </a>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class="kt-portlet__body">
                            <div class="tab-content kt-margin-t-20">

                                <!--End:: Tab Content-->

                                <!--Begin:: Tab Content-->
                                <div class="tab-pane active" id="kt_apps_contacts_view_tab_3" role="tabpanel">
                                    <form class="kt-form kt-form--label-right" method="post"
                                          action="{{route('personal.profile.update')}}">
                                        @csrf
                                        {{ method_field('PUT') }}
                                        <div class="kt-portlet__body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    @if ($errors->any())
                                                        <div class="alert alert-danger">
                                                            <ul>
                                                                @foreach ($errors->all() as $error)
                                                                    <li>{{ $error }}</li>
                                                                @endforeach
                                                            </ul>
                                                        </div>
                                                    @endif
                                                    <h3>{{trans('main.personal')}} {{trans('main.information')}}</h3>

                                                </div>

                                                <div class="col-12">
                                                    <label>{{trans('main.address')}}:</label>
                                                    <input type="text" required name="address" class="form-control"
                                                           placeholder="{{trans('main.Enter your address')}}" value="{{$employee->address}}">
                                                </div>
                                                <div class="col-6">
                                                    <label>{{trans('main.phone')}} 1:</label>
                                                    <input type="text"  name="phone1" class="form-control"
                                                           placeholder="010********" max="11" value="{{$employee->phone1}}">
                                                </div>
                                                <div class="col-6">
                                                    <label>{{trans('main.phone')}} 2:</label>
                                                    <input type="text"  name="phone2" class="form-control"
                                                           placeholder="012********" max="11" value="{{$employee->phone2}}">
                                                </div>

                                                <div class="col-12">
                                                    <label>{{trans('main.phone')}} 3:</label>
                                                    <input type="text"  name="phone3" class="form-control"
                                                           placeholder="011********" max="11" value="{{$employee->phone3}}">
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

                                <!--End:: Tab Content-->

                                <!--Begin:: Tab Content-->

                            </div>


                        </div>
                    </div>
                </div>

                <!--End:: Portlet-->
            </div>


        </div>
    </div>
    </div>
    </div>
    </div>









@stop
@section('scripts')

    <script>

        $.fn.dataTableExt.ofnSearch['html-input'] = function (value) {
            return $(value).val();
        };
        $(document).ready(function () {

            $('#department').val('{{$employee->department_id}}');



            $('#update_emergency').on('show.bs.modal', function (e) {

                var Id = $(e.relatedTarget).data('id');
                var phone = $(e.relatedTarget).data('phone');
                var address = $(e.relatedTarget).data('address');
                var name = $(e.relatedTarget).data('name');
                var email = $(e.relatedTarget).data('email');
                var relationship = $(e.relatedTarget).data('relationship');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="phone"]').val(phone);
                $(e.currentTarget).find('input[name="address"]').val(address);
                $(e.currentTarget).find('input[name="name"]').val(name);
                $(e.currentTarget).find('input[name="email"]').val(email);
                $(e.currentTarget).find('input[name="relationship"]').val(relationship);
                $(e.currentTarget).find('form').attr('action', "{{url('conf/emergency/')}}/" + Id);
            });


            $('#delete_emergency').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var name = $(e.relatedTarget).data('name');
                $(e.currentTarget).find('.name').html(name);
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('form').attr('action', "{{url('conf/emergency/')}}/" + Id);

            });


        })
    </script>

@stop
@section('right_header')

    <a class="kt-login__logo" href="#">
                                <img class="img-fluid" style="height: 30px" src="{{url('media/logos/recipe2.png')}}">
                            </a>
@endsection
