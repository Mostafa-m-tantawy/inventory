<script>
    /**
 * Created by rifat on 8/27/17.
 */
var convertion_rate;
var clicked_supplier_id = 0;
var total_discount=0

$(document).ready(function () {

    /**
     * It will take the current supplier id for further use
     */
    $("#supplier_id").on('click', function (e) {
        clicked_supplier_id = $("#supplier_id").val();
    });

    /**
     * Supplier dropdown on change Action
     */
    $("#supplier_id").on('change', function () {


        if (purses.length != 0) {
            if (clicked_supplier_id != 0) {
                $(this).val(clicked_supplier_id);
                toastr.error( 'Cannot add multiple supplier in a purses!')
            }
        } else {
            if ($(this).val() != '') {
                var formdata = new FormData();
                formdata.append("_token", $('meta[name="csrf-token"]').attr('content'));

                $.ajax({
                    url: '{{url('stock/supplier-products')}}/' + $(this).val(),
                    type: "POST",
                    data: formdata,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        $('#product').html('');

                        console.log(data);
                        // var options = '';//'<option value="">select Supplier</option>';
                        $('<option ></option>').val('').text('{{trans('main.select one')}}').appendTo('#product');

                        $.each(data, function (i, item) {
                            console.log(item.pivot);

                            $('<option data-vat="'+item.pivot.vat+'"></option>').val(item.id).text(item.langName).appendTo('#product');

                        });

                    },
                    error: function (data) {
                        if (data['status'] == 422) {
                            console.log(data);

                        }

                    },
                });

            }
        }
    });
    /**
     * Unit Price on value change
     */
    $("#unitPrice ,#quantity ,#percentage_discount").on('keyup wheel', function (e) {
       var discount=$("#percentage_discount").val()? (( $("#unitPrice").val()) * ($("#percentage_discount").val()/100)):0

        console.log(discount)
        $("#grossPrice").val($("#quantity").val() * $("#unitPrice").val()- discount*$("#quantity").val() );
        $("#child_unit_price").val( ( ($("#unitPrice").val()-discount)/  convertion_rate).toFixed(2));
    });    /**

    /**
     * Product dropdown on change Action
     */
    $("#product").on('change', function (e) {
        var productId = $("#product").val()

        //unit price is fixed to cost of recioes if has recipe
        var selected = $(this).find('option:selected');
if(productId){
        $.get('{{url('stock/get-unit-of-product')}}/' + productId, function (data) {
            // console.log(data);
            $("#unit").text(data.unit.unit);
            $("#child_unit").text(data.unit.child_unit);
            convertion_rate = data.unit.convert_rate;

            unitId = data.unit.id;
            unitName = data.unit.unit;

        });}
else {
    $("#unit").text('');
    $("#child_unit").text('');

}

    });



    /**
     * Action on save purses button click
     */
    $("#savePurses").on('click', function (e) {
        if (purses.length != 0) {
            //console.log("You can go on")
        } else {
            //console.log("You cannot go on")
        }
    });

    /**
     * Purses Form Submit
     * @type {*}
     */
    var form = $("#purses");
    form.on('submit', function (e) {

        e.preventDefault();
        if ( !form[0].checkValidity()){
            form[0].reportValidity();

        }else{

            purse = {
                supplier: {
                    supplierId: $("#supplier_id").val(),
                    supplierName: $("#supplier_id option:selected").text()
                },
                product: {
                    productId: $("#product").val(),
                    productName: $("#product option:selected").text(),
                    vat: ($("#product option:selected").data('vat')) ? $("#product option:selected").data('vat') : 0
                },
                quantity: $("#quantity").val(),
                unit: {
                    unitId: unitId,
                    unitName: unitName,
                    childUnit: ($("#unitPrice").val() / convertion_rate).toFixed(2),
                    convertRate: convertion_rate,
                    unitPrice: $("#unitPrice").val()
                },
                grossPrice: $("#grossPrice").val(),
                discount_percentage: $("#percentage_discount").val()? $("#percentage_discount").val():0
            }

            //push purse object to purses array
            purses.push(purse);

            //Call render function to render purses list
            $("#pursesDetailsRender").empty();
            $(this).renderHtml(purses);

            //Set default value of all field except supplier in to form
            $("#quantity").val(0);
            $("#unitPrice").val(0);
            $("#child_unit_price").val(0);
            $("#grossPrice").val(0);
            // $("#product").val('');
            $("#product").val('').trigger('change')
            $("#percentage_discount").val('');
        }


    });

    /**
     * Render Purses List
     * @param data
     */
    $.fn.renderHtml = function (data) {
        // Final Total Cost


        var total = 0;
        var totalvat = 0;
        $.each(data, function (index, data) {
            var discount=data.discount_percentage? (( data.unit.unitPrice) * (data.discount_percentage/100)):0
            total += ((data.unit.unitPrice-discount) * data.quantity) + ((data.unit.unitPrice-discount) * data.quantity) * (data.product.vat / 100);
            totalvat += ((data.unit.unitPrice-discount) * data.quantity) * (data.product.vat / 100);
            $("#pursesDetailsRender").append(
                $("<tr>").append(
                    $("<th>", {text: index + 1}),
                    $("<td>", {text: data.supplier.supplierName}),
                    $("<td>", {text: data.product.productName}),
                    $("<td>").append(
                        $("<input/>", {
                            value: data.quantity,
                            class: 'form-control',
                            type: 'number',
                            onKeyup: '$(this).updateQuantity(' + index + ')'
                        })
                    ),
                    $("<td>").append(
                        $("<input/>", {
                            value: (data.unit.unitPrice),
                            class: 'form-control',
                            type: 'number',
                            onKeyup: '$(this).updateUnitPrice(' + index + ')'
                        })
                    ),
                    $("<td class='PercentageDiscount'>").append(

                        $("<input/>", {
                            value: data.discount_percentage,
                            class: 'form-control',
                            type: 'number',
                            oninput: '$(this).updatePercentageDiscount(' + index + ')'
                        })
                    ),
                    $("<td>", {text: ((data.unit.unitPrice-discount) / data.unit.convertRate).toFixed(2)}),
                    $("<td>", {text: ((data.unit.unitPrice-discount) * data.quantity).toFixed(2)}),
                    $("<td>").append(
                        $("<div>", {class: 'btn-group'}).append(
                            $("<button>", {
                                text:'delete',
                                class: 'btn btn-danger btn-sm',
                                onClick: '$(this).deleteFromList(' + index + ')'
                            })
                        )
                    )
                )
            )
        });
        // Render bottom of purses list with sum of total cost, payment and others
        if (purses.length != 0) {
            $("#pursesDetailsRender").append(
                $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.sub total')}} :", class: "text-right"}),
                    $("<th>", {text: (total - totalvat).toFixed(2)}),
            $("<th>"),
        ), $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.vat')}} :", class: "text-right"}),
                    $("<th>", {text: totalvat.toFixed(2)}),
            $("<th>"),
        ),$("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.discount')}} :", class: "text-right"}),
                    $("<th>", {html: '<input class="form-control" type="number" id="discount" step="0.01" min="0" value="'+total_discount+'" max="'+total+'"  onkeyup="$(this).updateTotalDiscount()" >'})
            ,$("<th>"),
        ), $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.total')}} :", class: "text-right"}),
                    $("<th>", {text: (total-total_discount).toFixed(2)})
          ,  $("<th>"),
        ), $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.Pay way')}} :", class: "text-right"}),
                    $("<th>", {html: '<select class="form-control" name="payment" id="payment">' +
                            '<option value="cash">Cash</option>' +
                            '<option value="later">Later</option>' +
                            '</select>'}),
                    $("<th>"),
                ),

                $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>", {text: "{{trans('main.image')}}:", class: "text-right"}),
                    $("<th>", {
                        html: '<form id="imgform" name="imgform" enctype="multipart/form-data">' +
                            '<input  type="file" multiple name="files[]" id="img" class="filestyle" ></form> ',}),
                    $("<th>"),


                ),
                $("<tr>").append(
                    $("<th>", {colspan: 7}),
                    $("<th>").append(
                        $("<button>", {
                            text: "{{ trans('main.Confirm Order') }}  ",
                            class: "btn btn-primary",
                            onClick: '$(this).confirmPurses()'
                        })
                    ),
                    $("<th>"),

                )
            )
        }

        $('#img').filestyle({
            badge: true,
            input : false,
            btnClass : 'btn-primary',
            htmlIcon : '<span class="oi oi-folder"></span> '
        });

    };

    /**
     * Delete purses form purses list
     * @param index
     */
    $.fn.deleteFromList = function (index) {
        purses.splice(index, 1);
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
    };

    /**
     * Update quantity of purses list
     * @param index
     */
    $.fn.updateQuantity = function (index) {
        purses[index].quantity = this.val();
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
    };

    /**
     * Update unit price of purses list
     * @param index
     */
    $.fn.updateUnitPrice = function (index) {
        purses[index].unit.unitPrice = this.val();
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
    };
   /**
     * Update unit price of purses list
     * @param index
     */
    $.fn.updatePercentageDiscount = function (index) {
        purses[index].discount_percentage = this.val();
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
        var input =$('#pursesDetailsRender tr:eq('+index+')').find('.PercentageDiscount input');

        var strLength = input.val().length * 2;

        input.focus();
        input.val('').val( this.val());

    };   /**
     * Update unit price of purses list
     * @param index
     */
    $.fn.updateTotalDiscount = function () {
        total_discount = this.val();
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
    };

    /**
     * Calculate due after pay
     * @param total
     */
    $.fn.changeDuePayment = function (total) {
        $("#due").text(total - $(this).val());
    };

    /**
     * Confirm Purses
     */
    $.fn.confirmPurses = function () {

        var formdata = new FormData();
        var json_arr = JSON.stringify(purses);

        if ($('#img').prop('files').length > 0) {
            var file = $('#img').prop('files');

            for( var i = 0; i < file.length; i++ ){
                let filee = file[i];
                formdata.append('files[' + i + ']', filee);
            }

        }
        formdata.append("_token", $('meta[name="csrf-token"]').attr('content'));
        formdata.append("supplier_id", $("#supplier_id").val());
        formdata.append("purses", json_arr);
        formdata.append("payment", $("#payment").val() );
        formdata.append("discount", total_discount );
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '{{url('stock/save-purses')}}',
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);
                toastr.success( 'Success ! Purses Has been completed successfully')

                purses = [];
                $("#pursesDetailsRender").empty();
                $(this).renderHtml(purses);

                document.location.href = '{{url('stock/purchase/summery')}}';
            },
            error: function (data) {
                if (data['status'] == 422) {
                    console.log(data);
                    $.Notification.notify('error',
                        'bottom right',
                        data.responseJSON[0]);
                    purses = [];
                    // $("#pursesDetailsRender").empty();
                    $(this).renderHtml(purses);
                }

            },
        });


    }

});

var purse = {};
var unitId = '';
var unitName = '';
var purses = [];
</script>
