@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.role')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.config')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.role')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="#"  data-toggle="modal" data-target="#newLeaveType"class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
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
                <table id="datatable-responsive"
                       class="display table table-striped table-bordered " cellspacing="0"
                       style="width:100%">
                    <thead class="thead-dark">
                    <tr>
                        <th>{{trans('main.id')}}</th>
                        <th>{{trans('main.name')}}</th>
                        <th>{{trans('main.permissions')}}</th>
                        <th>{{trans('main.update')}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($roles as $role)
                        <tr>
                            <td>{{$role->id}}</td>
                            <td>{{$role->name}}</td>
                            <td><a class="btn btn-primary" href="{{route('role.show',[$role->id])}}">show </a></td>
                            <td>
                                <a title="update"
                                   data-toggle="modal" data-target=".updateAsset"
                                   data-name="{{$role->name}}"
                                   data-id="{{$role->id}}"class="btn btn-info">{{trans('main.edit')}}
                                </a>
                            </td>

                            {{----}}
                        </tr>
                    @endforeach


                    </tbody>
                </table>

            </div>
        </div>

    </div>

    <div class="modal fade updateAsset" id="updateAsset" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form method="post">
                    @csrf
                    @method('put')
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.update')}} {{trans('main.role')}}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">

                        <div class="container">
                            <div class="row">
                                <div class=" form-group col-12">
                                    <label>{{trans('main.id')}}</label>
                                    <input type="number" readonly class="form-control" name="id">
                                </div>
                                <div class="form-group col-12">
                                    <label>{{trans('main.name')}}</label>
                                    <input type="text" class="form-control" name="name">
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit"
                                    class="btn btn-primary btn-icon-sm">{{trans('main.submit')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
    <div class="modal fade newLeaveType" id="newLeaveType" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{route('role.store')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title"> {{trans('main.new role')}} <span
                                class="model_type"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        @csrf
                        <div class="row">
                            <div class="col-1"></div>

                            <div class="col-10">

                                <div class="form-group">
                                    <label>{{trans('main.name')}}</label>
                                    <input type="text" class="form-control" name="name">
                                </div>

                            </div>

                            <div class="col-1"></div>


                        </div>


                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit"
                                    class="btn btn-primary btn-icon-sm">{{trans('main.create')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        </div>
    </div>
@stop

@section('scripts')

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
        $(document).ready(function () {
            $('#updateAsset').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var name = $(e.relatedTarget).data('name');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="name"]').val(name);

                $(e.currentTarget).find('form').attr('action', "{{url('conf/role/')}}/" + Id);
            });


        })
    </script>

@stop
