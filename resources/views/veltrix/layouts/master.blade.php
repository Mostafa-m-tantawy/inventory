<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
        <title>@yield('title')</title>
        <meta content="Recipe System" name="description" />
        <meta content="Tantawy Solutions" name="author" />
        @include('veltrix.layouts.head')
        @livewireStyles
        <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>

        <style>
            .table td{
                padding: unset;
            }

            td .btn{
                               padding-top: unset;
                               padding-bottom: unset;            }
            .table > tbody > tr > td, .table > tfoot > tr > td, .table > thead > tr > td
            {
                padding: 2px 8px;
            }

            #wrapper {
            overflow: unset;
            }
</style>
    </head>
<body>
    <div id="wrapper">
         @include('veltrix.layouts.header')

            @include('veltrix.layouts.sidebars.inventorySideBar')

         <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                   @include('veltrix.layouts.settings')
                   @yield('content')
                </div>
            </div>
        </div>

        <div class="modal fade deleteModal" id="deleteModal" role="dialog"
             aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <form method="post">
                        <div class="modal-header">
                            <h5 class="modal-title"> {{trans('main.delete warning')}}</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            @csrf
                            @method('Delete')
                            <div class="container">
                                <div class="form-group row">
                                    <div class="col-12 text-center">
                                        {{trans('main.Are you sure you want to delete this item')}}
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="col-12 pull-left">
                                <button type="submit" class="btn btn-danger">{{trans('main.delete')}}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        @include('veltrix.layouts.footer-script')
        @livewireScripts

    </div>
    </body>
</html>
