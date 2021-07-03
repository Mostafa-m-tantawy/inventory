<!-- App's Basic Js  -->

<script>
    var dataTableLocale = {
        "sEmptyTable": "ليست هناك بيانات متاحة في الجدول",
        "sLoadingRecords": "جارٍ التحميل...",
        "sProcessing": "جارٍ التحميل...",
        "sLengthMenu": "أظهر _MENU_ مدخلات",
        "sZeroRecords": "لم يعثر على أية سجلات",
        "sInfo": "إظهار _START_ إلى _END_ من أصل _TOTAL_ مدخل",
        "sInfoEmpty": "يعرض 0 إلى 0 من أصل 0 سجل",
        "sInfoFiltered": "(منتقاة من مجموع _MAX_ مُدخل)",
        "sInfoPostFix": "",
        "sSearch": "ابحث:",
        "sUrl": "",
        "oPaginate": {
            "sFirst": "الأول",
            "sPrevious": "السابق",
            "sNext": "التالي",
            "sLast": "الأخير"
        },
        "oAria": {
            "sSortAscending": ": تفعيل لترتيب العمود تصاعدياً",
            "sSortDescending": ": تفعيل لترتيب العمود تنازلياً"
        }
    };
    const DatatableOptions={
        dom: 'Bflrtip',
        buttons: ['copy', 'excel', 'print'],
        bDestroy: true,
        processing: true,
        responsive: true,
        serverSide: true,
        info: false,
        pageLength: 25,
        lengthMenu: [[10, 25, 50, 100, 1000], [10, 25, 50, 100, "{{ __('datatable.all') }}"]],
        lengthChange: true,
        searching: true,
        order : [[ 0, "desc" ]],
        language: {
            sEmptyTable:     "{{ __('datatable.sEmptyTable') }}",
            sInfo:           "{{ __('datatable.sInfo') }}",
            sInfoEmpty:      "{{ __('datatable.sInfoEmpty') }}",
            sInfoFiltered:   "{{ __('datatable.sInfoFiltered') }}",
            sInfoPostFix:    "",
            sInfoThousands:  ",",
            sLengthMenu:     "{{ __('datatable.sLengthMenu') }}",
            sLoadingRecords: "{{ __('datatable.sLoadingRecords') }}",
            sProcessing:     "{{ __('datatable.sProcessing') }}",
            sSearch:         "{{ __('datatable.sSearch') }}",
            sZeroRecords:    "{{ __('datatable.sZeroRecords') }}",
            oPaginate: {
                sFirst:    "{{ __('datatable.sFirst') }}",
                sLast:     "{{ __('datatable.sLast') }}",
                sNext:     "{{ __('datatable.sNext') }}",
                sPrevious: "{{ __('datatable.sPrevious') }}",
            },
            oAria: {
                sSortAscending:  "{{ __('datatable.sSortAscending') }}",
                sSortDescending: "{{ __('datatable.sSortDescending') }}",
            }
        },
    };
</script>

<script src="{{ URL::asset('veltrix/assets/js/jquery.min.js') }}"></script>
<script src="{{ URL::asset('veltrix/assets/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ URL::asset('veltrix/assets/js/metisMenu.min.js') }}"></script>
<script src="{{ URL::asset('veltrix/assets/js/jquery.slimscroll.js') }}"></script>
<script src="{{ URL::asset('veltrix/assets/js/waves.min.js') }}"></script>
<script src="{{asset('/vendors/general/select2/dist/js/select2.full.js')}}" type="text/javascript"></script>
<script src="{{asset('/vendors/general/toastr/build/toastr.min.js')}}" type="text/javascript"></script>

<script>

    $(document).ready(function() {
        $('.select2').select2({     width: '100%'});

        $('#deleteModal').on('show.bs.modal', function (e) {
            var url = $(e.relatedTarget).data('url');
            $(e.currentTarget).find('form').attr('action', url);
        });
    });

    function deleteConfirm(e,type){
        var r = confirm("{{trans('main.Are you sure you want to delete this')}}"+type+'!?');
        if (r == false) {
            e.preventDefault();
            return false;
        }
    }

    function filestyleFun()
    {$('.filestyle').each(function() {
        var $this = $(this),
            options = {
            'input' : $this.attr('data-input') !== 'false',
            'htmlIcon' : $this.attr('data-icon'),
            'buttonBefore' : $this.attr('data-buttonBefore') === 'true',
            'disabled' : $this.attr('data-disabled') === 'true',
            'size' : $this.attr('data-size'),
            'text' : $this.attr('data-text'),
            'btnClass' : $this.attr('data-btnClass'),
            'badge' : $this.attr('data-badge') === 'true',
            'dragdrop' : $this.attr('data-dragdrop') !== 'false',
            'badgeName' : $this.attr('data-badgeName'),
            'placeholder': $this.attr('data-placeholder')
        };
        $this.filestyle(options);
    });}

</script>
@yield('scripts')


<!-- App js-->
<script src="{{ URL::asset('veltrix/assets/js/app.js') }}"></script>
{{--@toastr_js--}}
@toastr_render
@yield('script-bottom')

