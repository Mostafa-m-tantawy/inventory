@extends('veltrix.layouts.master')
@section('head')
    <link href="{{asset('vendors/custom/datatables/datatables.bundle.css')}}" rel="stylesheet" type="text/css"/>
@stop


@section('title')
    {{trans('main.index expense')}}
@stop

@section('breadcrumb')
    <div class="col-sm-6">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="javascript:void(0);">{{trans('main.config')}}</a></li>
            <li class="breadcrumb-item active"><a href="javascript:void(0);">{{trans('main.index expense')}}</a></li>
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
               style="width:100%">    <thead class="thead-dark">
            <tr>
                <th>{{trans('main.id')}}</th>
                <th>{{trans('main.restaurant')}}</th>
                <th>{{trans('main.method')}}</th>
                <th>{{trans('main.amount')}}</th>
                <th>{{trans('main.Due Date')}}</th>
                <th>{{trans('main.note')}}</th>
                <th> {{ trans('main.attachments') }}</th>
                <th>{{trans('main.created_at')}}</th>
                <th>{{trans('main.delete')}}</th>
            </tr>
            </thead>
            <tbody>
           @foreach($expenses as $expense)
               <tr>
                    <td>{{$expense->id}}</td>
                    <td>{{$expense->store->user->name}}</td>
                    <td>{{$expense->payment_method}}</td>
                    <td>{{$expense->payment_amount}}</td>
                    <td>{{$expense->due_date}}</td>
                    <td>{{$expense->note}}</td>
                   <td>
                       @foreach($expense->files as $file)
                           <a title="Show" href="{{url('/download?url='.$file->url)}}">
                               {{$loop->index + 1}}<i class="fa fa-cloud-download-alt"></i></a>
                       @endforeach

                   </td>
                    <td>{{$expense->created_at}}</td>
                   <td>
                           <form method="post"  onsubmit="deleteConfirm(event,'{{trans('main.expenses')}}')"
                                 action="{{route('expenses.destroy',[$expense->id])}}">
                               @csrf
                               @method('DELETE')
                               <button class="btn btn-danger"> {{trans('main.delete')}}</button>
                           </form>
                   </td>
            </tr>
               @endforeach

            </tbody>
        </table>

        <!--end: Datatable -->
    </div>

        </div>
        </div>
    <div class="modal fade newLeaveType" id="newLeaveType" role="dialog"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="{{route('expenses.store')}}" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title"> {{trans('main.create')}} {{trans('main.expense')}} <span
                                class="model_type"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        @csrf
                        <div class="form-group row">
                            <div class="col-12">
                                <label>{{trans('main.payment')}} {{trans('main.method')}}</label>
                                <select id="payment_method" class="form-control select2" name="payment_method">
                                    <option value="0"> {{trans('main.select')}} {{trans('main.method')}}</option>
                                    <option value="cash">{{trans('main.cash')}} </option>
                                    <option value="check">{{trans('main.check')}} </option>
                                </select>
                            </div>
                            <div class="col-12"id="duedate"  style="display: none">
                                <label class="">{{trans('main.Due Date')}}</label>
                                <input type="date"  name="duedate" class="form-control">
                            </div>
                            <div class="col-12">
                                <label class="">{{trans('main.payment')}} {{trans('main.amount')}} </label>
                                <input type="number" required name="payment_amount" class="form-control">
                            </div>
                            <div class="col-12">
                                <label>{{trans('main.files')}}  :</label>
                                <input type="file"  multiple name="files[]" class="form-control" >
                            </div>
                            <div class="col-12">
                                <label>{{trans('main.note')}}  :</label>
                                <input type="text" required name="note" class="form-control" >
                            </div>

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



@stop
