<script>
    /**
 * Created by rifat on 8/27/17.
 */
var convertion_rate;
var clicked_supplier_id = 0;
var total_discount=0

$(document).ready(function () {


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

        $.get('{{url('stock/get-unit-of-product')}}/' + productId, function (data) {
            // console.log(data);
            $("#unit").text(data.unit.unit);
            $("#child_unit").text(data.unit.child_unit);
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

        }else{

            purse = {

                product: {
                    productId: $("#product").val(),
                    productName: $("#product option:selected").text(),
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
            $("#product").val('');
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
              total += ((data.unit.unitPrice) * data.quantity);

            $("#pursesDetailsRender").append(
                $("<tr>").append(
                    $("<th>", {text: index + 1}),
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

                    $("<td>", {text: ((data.unit.unitPrice) / data.unit.convertRate).toFixed(2)}),
                    $("<td>", {text: ((data.unit.unitPrice) * data.quantity).toFixed(2)}),
                    $("<td>").append(
                        $("<div>", {class: 'btn-group'}).append(
                            $("<button>", {
                                class: 'btn btn-danger btn-sm',
                                onClick: '$(this).deleteFromList(' + index + ')'
                            }).append(
                                $('<i>', {class: 'ti-trash'})
                            )
                        )
                    )
                )
            )
        });
        // Render bottom of purses list with sum of total cost, payment and others
        if (purses.length != 0) {
            $("#pursesDetailsRender").append(
                $("<tr>").append(
                    $("<th>", {colspan: 4}),
                    $("<th>", {text: "Total :", class: "text-right"}),
                    $("<th>", {text: (total ).toFixed(2)})
                ),
                $("<tr>").append(
                    $("<th>", {colspan: 4}),
                    $("<th>", {text: "scan image:", class: "text-right"}),
                    $("<th>", {
                        html: '<form id="imgform" name="imgform" enctype="multipart/form-data">' +
                            '<input class="form-control" type="file" multiple name="files[]" id="img"></form> ',

                    })

                    // )
                ),
                $("<tr>").append(
                    $("<th>", {colspan: 5}),
                    $("<th>").append(
                        $("<button>", {
                            text: "Confirm ",
                            class: "btn btn-primary ",
                            onClick: '$(this).confirmPurses()'
                        })
                    )
                )
            )
        }
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
        formdata.append("purses", json_arr);
        $.ajaxSetup({
            headers: {
                'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '{{route('open-stock.store')}}',
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false,
            success: function (data) {
            toastr.success('Success ! Purses Has been completed successfully')
                purses = [];
                $("#pursesDetailsRender").empty();
                $(this).renderHtml(purses);
                document.location.href = '{{route('open-stock.index')}}';
            },
            error: function (data) {
                if (data['status'] == 422) {
                    console.log(data);
                    toastr.danger( data.responseJSON[0]);
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
