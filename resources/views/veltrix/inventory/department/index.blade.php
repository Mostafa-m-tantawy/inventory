@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>

@stop


@section('title')
    {{trans('main.index department')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.department')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="#"
               data-toggle="modal" data-target=".create_department"
               class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light">
                <i class="ti ti-plus"></i>
                {{trans('main.new')}} {{trans('main.record')}}
            </a>
        </div>
    </div>
@endsection


@section('content')
    <!-- begin:: Content -->
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
                        <table id="account-table"
                               class="display table table-striped table-bordered " cellspacing="0"
                               style="width:100%">

                            <thead class="thead-dark">
                            <tr>
                                <th>{{trans('main.name')}}</th>
                                <th>{{trans('main.description')}}</th>
                                <th>{{trans('main.actions')}}</th>
                            </tr>
                            </thead>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="modal fade create_department" id="create_department" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{route('department.store')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title"> {{trans('main.new department')}}</h5>
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
                                           placeholder="{{trans('main.enter')}} {{trans('main.name')}}">
                                </div>
                                <div class="col-12">
                                    <label class="">{{trans('main.description')}} :</label>
                                    <input type="text" name="description" class="form-control"
                                           placeholder="{{trans('main.enter')}} {{trans('main.description')}}">
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="col-12 pull-left">
                            <button type="submit" class="btn btn-primary">{{trans('main.submit')}}</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>

@endsection

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/datatable.js')}}"></script>
    <script>
        var accountTable = $('#account-table').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('departments.datatable-data')}}',
            columns: [
                {data: 'name', name: 'name', searchable: true, orderable: true},
                {data: 'description', name: 'description', searchable: true, orderable: true},
                {data: 'action', name: 'action', searchable: false, orderable: false},
            ],
            columnDefs: [
                {className: 'text-center', targets: [0, 1, 2]},
            ],
        })

    </script>

@endsection
