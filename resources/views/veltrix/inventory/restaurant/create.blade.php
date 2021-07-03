@extends('layouts.welcome')
@section('title')
    {{trans('main.create restaurant')}}
@stop


@section('content')
    <!-- begin:: Content -->
    <div class="kt-content  kt-grid__item kt-grid__item--fluid" id="kt_content">

        <div class="kt-portlet__body">
            <form class="kt-form kt-form--label-right" method="post" action="{{route('restaurant.store')}}">

                <div class="kt-portlet">
                    <div class="kt-portlet__head">
                        <div class="kt-portlet__head-label">
                            <h3 class="kt-portlet__head-title">
                                Branch of Resturant

                            </h3>
                            <span class="kt-switch kt-switch--lg">
                        <label>
                            <input type="hidden" value="on" name="branch">
                        </label>
                            </span>
                        </div>
                    </div>

                    <!--begin::Form-->
                    @csrf
                    <div class="kt-portlet__body">
                        <div class="row">
                            <div class="col-md-12">
                                <h3>Personal Information</h3>
                                <div class="form-group row">
                                    <div class="col-12">
                                        <label>Full Name:</label>
                                        <input type="text" required name="name" class="form-control"
                                               placeholder="Enter full name">
                                        <span class="form-text text-muted">Please enter your full name</span>
                                    </div>
                                    <div class="col-12">
                                        <label class="">Email:</label>
                                        <input type="email" required name="email" class="form-control"
                                               placeholder="Enter email">
                                        <span class="form-text text-muted">Please enter your email</span>
                                    </div>
                                    <div class="col-12">
                                        <label>Password :</label>
                                        <input type="password" required name="password" class="form-control"
                                               placeholder="********">
                                        <span class="form-text text-muted">Please enter password</span>
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
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-secondary">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--end::Form-->


                </div>
            </form>
        </div>

    </div>

@stop
@section('scripts')

    <script src="{{asset('js/demo1/pages/crud/forms/widgets/form-repeater.js')}}" type="text/javascript"></script>
    <script src="{{asset('js/demo1/pages/crud/forms/widgets/select2.js')}}" type="text/javascript"></script>
    <script>

        function changecity(select) {


            $.ajax('{{url('/')}}/states', {
                method: 'post',
                data: {_token: '{{@csrf_token()}}', id: $(select).val()},
                dataType: 'JSON',
                success: function (data) {
                    // $('#cityoption').html('');
                    // console.log(  $(select).parent().parent().find(' .col-lg-5:nth-child(2) select ').html('ssssss'));
                    $(select).parent().parent().find(' .col-lg-5:nth-child(2) select').empty();

                    for (var i = 0; i < data.length; i++) {
                        $(select).parent().parent().find(' .col-lg-5:nth-child(2) select').append('           ' +
                            '<option value="' + data[i].id + '">' + data[i].name + '</option>');
                    }
                },
                error: function () {
                    alert('There is an error  exist make sure you are  log in ');
                }
            });
        }

    </script>
@stop
