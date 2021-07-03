@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index unit')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.units')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="#"  data-toggle="modal" data-target="#newunit"class="btn btn-primary dropdown-toggle arrow-none waves-effect waves-light" >
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
                               class="display table table-striped table-bordered " cellspacing="0"
                               style="width:100%">
                            <thead class="thead-dark">
                            <tr>
                                <th>{{trans('main.unit')}}</th>
                                <th>{{trans('main.child unit')}} </th>
                                <th>{{trans('main.convert_rate')}}</th>
                                <th>{{trans('main.actions')}}</th>
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

<div class="modal fade bd-example-modal-lg" id="updatemodel" role="dialog"
     aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form  method="post">

                @csrf
                @method('put')
                <div class="modal-header">
                    <h5 class="modal-title">{{trans('main.update')}} {{trans('main.unit')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">

                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <label>{{trans('main.id')}}</label>
                                <input type="number" readonly class="form-control" name="id">
                            </div>
                            <div class="col-12">
                                <label>{{trans('main.unit')}}</label>
                                <input type="text" class="form-control" name="unit">
                            </div>

                            <div class="col-12">
                                <label>{{trans('main.child unit')}}</label>
                                <input type="text" class="form-control" name="child_unit">
                            </div>
                            <div class="col-12">
                                <label>{{trans('main.convert_rate')}}</label>
                                <input type="number" class="form-control" name="convert_rate">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <div class="col-12 pull-left">
                        <button type="submit" class="btn btn-primary">{{trans('main.update')}}</button>
                    </div>
                </div>
            </form>

        </div>
    </div>
</div>
<div class="modal fade newunit" id="newunit" role="dialog"
     aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form action="{{route('unit.store')}}" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">{{trans('main.new')}} {{trans('main.unit')}} <span class="model_type"></span></h5>
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
                                <label>{{trans('main.unit')}}</label>
                                <input type="text" class="form-control" name="unit">
                            </div>

                            <div class=" form-group">
                                <label>{{trans('main.child unit')}}</label>
                                <input type="text" class="form-control" name="child_unit">
                            </div>
                            <div class="form-group">
                                <label>{{trans('main.convert_rate')}}</label>
                                <input type="text" class="form-control" name="convert_rate">
                            </div>

                        </div>

                        <div class="col-1"></div>


                    </div>


                </div>
                <div class="modal-footer">
                    <div class="col-12 pull-left">
                        <button type="submit" class="btn btn-primary">{{trans('main.create')}}</button>
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


        $(document).ready(function () {
//
            $('#updatemodel').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var unit = $(e.relatedTarget).data('unit');
                var child = $(e.relatedTarget).data('child');
                var convert_rate = $(e.relatedTarget).data('convert_rate');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="unit"]').val(unit);
                $(e.currentTarget).find('input[name="child_unit"]').val(child);
                $(e.currentTarget).find('input[name="convert_rate"]').val(convert_rate);

                $(e.currentTarget).find('form').attr('action', "{{url('stock/unit/')}}/" + Id);
            });

        })
    </script>
    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('unit.datatable-data')}}',
            columns: [
                {data: 'unit', name: 'unit', searchable: true, orderable: true},
                {data: 'child_unit', name: 'child_unit', searchable: true, orderable: true},
                {data: 'convert_rate', name: 'convert_rate', searchable: true, orderable: true},
                {data: 'action', name: 'action', searchable: false, orderable: false},
            ],
            columnDefs: [
                {className: 'text-center', targets: [0, 1, 2,3]},
            ],
        })

    </script>

@endsection
