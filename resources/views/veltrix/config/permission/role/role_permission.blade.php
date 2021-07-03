@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.permission')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.config')}}</a></li>
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.role')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.permission')}}</a></li>
        </ol>
    </div>

@endsection


@section('content')
    <!-- begin:: Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">

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

                                            <form  action="{{route('role.association')}}" method="post">
                                                @csrf
                                            <div class="row">

                                                <div class="col-10">
                                                    <input type="hidden" name="role_id" value="{{$role->id}}" >

                                                    <div class="form-group">
                                                        @foreach($permissions as $group)
                                                                <div class="row">
                                                                    <div class="col-4">{{$group->first()?$group->first()->group:''}}                                            </div>
                                                                    <div class="col-2">
                                                                        <label style="margin: 10px">
                                                                            <input type="checkbox" class="select-all" >
                                                                            Select All
                                                                        </label>
                                                                    </div>
                                                                    <div class="col-6">

                                                                        @foreach($group as $permission)
                                                                        <div class="col-12">
                                                                            <label>
                                                                                <input type="checkbox" class="check-item form-check-inline" name="permission_id[]" value="{{$permission->id}}" >
                                                                                {{__('permission.'.$permission->name)}}
                                                                            </label>
                                                                        </div>

                                                                        @endforeach


                                                                    </div>
                                                                </div>
                                                                <br><hr><br>




                                                        @endforeach
                                                    </div>

                                                </div>

                                                <div class="col-12 ">
                                                    <button type="submit"
                                                            class="btn btn-primary ">{{trans('main.create')}}</button>
                                                </div>


                                            </div>
                                            </form>

            </div>
        </div>

    </div>


@stop
@section('scripts')

    <script>

        $(document).ready(function () {
            // var form = $("form");

            @if(isset($rolePermissions))
                @foreach($rolePermissions as $permission)
                $('input[value="{{$permission->id}}"]').attr('checked', true);
                @endforeach
            @endif


            $('.select-all').click(function (event) {
                if (this.checked) {
                    // Iterate each checkbox
                    console.log($(this).parent().parent().parent().html())
                    $(this).parent().parent().parent().find('input[type=checkbox]').each(function () {
                        this.checked = true;
                    });
                } else {
                    $(this).parent().parent().parent().find('input[type=checkbox]').each(function () {
                        this.checked = false;
                    });
                }
            });

        })
    </script>

@endsection
