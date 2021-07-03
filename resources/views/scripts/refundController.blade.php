<script>
    /**
 * Created by rifat on 8/27/17.
 */
var convertion_rate;
var clicked_supplier_id = 0;


function checkQuantityForAdd(product_id) {
    var quantity=0;
    for (var i=0;i<purses.length;i++){
        if(purses[i].product.productId==product_id)
            quantity+=parseFloat(purses[i].quantity);
    }
    return quantity;
};
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
                        $('<option ></option>').val('').text('{{trans('main.select')}}').appendTo('#product');

                        $.each(data, function (i, item) {
                         if(item.quantity_available)
                             $('<option data-vat="'+item.pivot.vat+'" data-quantity="'+item.quantity+'"></option>').val(item.id).text(item.langName).appendTo('#product');

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
     * Quantity on value change
     */
    $("#quantity").on('keyup', function (e) {
        //console.log("Change");
        $("#grossPrice").val(($("#quantity").val() * $("#unitPrice").val()).toFixed(2));
        $("#child_unit_price").val(($("#unitPrice").val() / convertion_rate).toFixed(2));
    });

    /**
     * Unit Price on value change
     */
    $("#unitPrice").on('keyup wheel', function (e) {
        $("#grossPrice").val($("#quantity").val() * $("#unitPrice").val());
        $("#child_unit_price").val(($("#unitPrice").val() / convertion_rate).toFixed(2));
    });


    /**
     * Product dropdown on change Action
     */
    $("#product").on('change', function (e) {
        var productId = $("#product").val()

        //unit price is fixed to cost of recioes if has recipe
        var selected = $(this).find('option:selected');

        var quantityassigned=selected.data('quantity')-checkQuantityForAdd(productId);

        if (parseFloat(quantityassigned) >= 0) {
            $('#quantity').prop("max", quantityassigned);

        }
      $.get('{{url('stock/get-unit-of-product')}}/' + productId, function (data) {
            // console.log(data);
            $("#unit").text(data.unit.unit);
            convertion_rate = data.unit.convert_rate;

            unitId = data.unit.id;
            unitName = data.unit.unit;

        });
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

        }else{   purse = {
            supplier: {
                supplierId: $("#supplier_id").val(),
                supplierName: $("#supplier_id option:selected").text()
            },
            product: {
                productId: $("#product").val(),
                productName: $("#product option:selected").text(),
                vat: ($("#product option:selected").data('vat')) ? $("#product option:selected").data('vat') : 0,
                quantityAvailable: $("#product option:selected").data('quantity'),
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
            note: $("#note").val()
        }

        //push purse object to purses array
        purses.push(purse);

        //Call render function to render purses list
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);

        //Set default value of all field except supplier in to form
        $("#quantity").val(0);
        $("#unitPrice").val(0);
        $("#grossPrice").val(0);
        $("#product").val('');
        $("#note").val('');
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
            total += (data.unit.unitPrice * data.quantity) + (data.unit.unitPrice * data.quantity) * (data.product.vat / 100);
            totalvat += (data.unit.unitPrice * data.quantity) * (data.product.vat / 100);
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
                            value: data.unit.unitPrice,
                            class: 'form-control',
                            type: 'number',
                            onChange: '$(this).updatePrice(' + index + ')'
                        })
                    ),
                    $("<td>", {text: (data.unit.unitPrice / data.unit.convertRate).toFixed(2)}),
                    $("<td>", {text: (data.unit.unitPrice * data.quantity).toFixed(2)}),
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
                    $("<th>", {colspan: 5}),
                    $("<th>", {text: "{{trans('main.sub total')}} :", class: "text-right"}),
                    $("<th>", {text: (total - totalvat).toFixed(2)}),
                    $("<th>")
                ), $("<tr>").append(
                    $("<th>", {colspan: 5}),
                    $("<th>", {text: "{{trans('main.vat')}} :", class: "text-right"}),
                    $("<th>", {text: totalvat.toFixed(2)}),
                    $("<th>")

                ), $("<tr>").append(
                    $("<th>", {colspan: 5}),
                    $("<th>", {text: "{{trans('main.total')}} :", class: "text-right"}),
                    $("<th>", {text: total.toFixed(2)}),
                    $("<th>")

                ),
                $("<tr>").append(
                    $("<th>", {colspan: 5}),
                    $("<th>", {text: "{{trans('main.image')}} :", class: "text-right"}),
                    $("<th>", {
                        html: '<form id="imgform" name="imgform" enctype="multipart/form-data">' +
                            '<input class="filestyle" type="file" name="img" id="img"></form> ',
                    }),
                    $("<th>")


                    // )
                ),
                $("<tr>").append(
                    $("<th>", {colspan: 6}),
                    $("<th>").append(
                        $("<button>", {
                            text: "{{trans('main.Confirm Return')}}",
                            class: "btn btn-primary",
                            onClick: '$(this).confirmPurses()'
                        })
                    ),
                    $("<th>")

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
    $.fn.updatePrice = function (index) {
        purses[index].unit.unitPrice = this.val();
        $("#pursesDetailsRender").empty();
        $(this).renderHtml(purses);
    };

    /**
     * Update unit price of purses list
     * @param index
     */
    $.fn.updateQuantity = function (index) {
        var quantityassigned=this.checkQuantityForUpdate(index);
        quantityassigned=parseFloat( purses[index].product.quantityAvailable)
            -parseFloat(quantityassigned) -parseFloat(this.val());
        if(quantityassigned >=0){
            purses[index].quantity = this.val();
            $("#pursesDetailsRender").empty();
            $(this).renderHtml(purses);

            var quantityassignedd=purses[index].product.quantityAvailable-checkQuantityForAdd(purses[index].product.productId);

            $('#quantity').prop("max", quantityassignedd);

        }else {
            this.val(purses[index].quantity);
            toastr.error( 'quantity not enough!')

        }
        //     console.log(this.checkQuantityForUpdate(index));

    };


    /**
     * Update quantity of purses list
     * @param index
     */
    $.fn.checkQuantityForUpdate = function (index) {

        var quantity=0;
        for (var i=0;i<purses.length;i++){
            if(purses[i].product.productId==purses[index].product.productId && i!=index)
                quantity+=parseFloat(purses[i].quantity);
        }
        // console.log(quantity);

        return quantity;
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
            var file = $('#img').prop('files')[0];
            formdata.append("image", file);

        }
        formdata.append("_token", $('meta[name="csrf-token"]').attr('content'));
        formdata.append("supplier_id", $("#supplier_id").val());
        formdata.append("purses", json_arr);
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '{{url('stock/save-refund')}}',
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false,
            success: function (data) {
                console.log(data);
                toastr.success( 'Success ! Purses Has been completed successfully!')
                purses = [];
                $("#pursesDetailsRender").empty();
                $(this).renderHtml(purses);
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
