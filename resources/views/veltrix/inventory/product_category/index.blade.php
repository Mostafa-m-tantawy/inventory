@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.product category')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.Inventory')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.product category')}}</a></li>
        </ol>
    </div>
    <div class="col-sm-6">
        <div class="float-right d-none d-md-block">
            <a href="#" data-toggle="modal" data-target="#newunit"
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
                        <table id="datatable-responsive"
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


    <div class="modal fade bd-example-modal-lg" id="updatemodel" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{url('stock/product-category/update')}}" method="post">
                    {{--                    {{url('unit/update)}}--}}
                    @csrf
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.update')}} {{trans('main.category')}}</h5>
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
                                    <label>{{trans('main.name')}}</label>
                                    <input type="text" class="form-control" name="name">
                                </div>
                                <div class="col-12">
                                    <label>{{trans('main.name_ar')}}</label>
                                    <input type="text" class="form-control" name="name_ar">
                                </div>

                                <div class="col-12">
                                    <label>{{trans('main.description')}}</label>
                                    <input type="text" class="form-control" name="description">
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
    <div class="modal fade delete" id="newunit" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{url('stock/product-category')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">{{trans('main.create')}} {{trans('main.product')}} {{trans('main.category')}}
                            <span class="model_type"></span></h5>
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
                                <div class="form-group">
                                    <label>{{trans('main.name_ar')}}</label>
                                    <input type="text" class="form-control" name="name_ar">
                                </div>
                                <div class=" form-group">
                                    <label>{{trans('main.description')}}</label>
                                    <input type="text" class="form-control" name="description">
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
    </div>@endsection

@section('scripts')

    <script type="text/javascript" src="{{asset('js/datatable/pdfmake.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/datatable/vsfonts.js')}}"></script>
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


        $(document).ready(function () {
//
            $('#updatemodel').on('show.bs.modal', function (e) {
                var Id = $(e.relatedTarget).data('id');
                var name = $(e.relatedTarget).data('name');
                var name_ar = $(e.relatedTarget).data('name_ar');
                var description = $(e.relatedTarget).data('description');
                $(e.currentTarget).find('input[name="id"]').val(Id);
                $(e.currentTarget).find('input[name="name"]').val(name);
                $(e.currentTarget).find('input[name="name_ar"]').val(name_ar);
                $(e.currentTarget).find('input[name="description"]').val(description);
            });

        })
    </script>
    <script>
        var accountTable = $('#datatable-responsive').DataTable({
            ...DatatableOptions,
            ajax: '{{ route('product-category.datatable-data')}}',
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
