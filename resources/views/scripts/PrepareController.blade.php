<script>
    /**
 * Created by rifat on 8/27/17.
 */
var convertion_rate;
var clicked_supplier_id = 0;
var quantity = 0
$(document).ready(function () {

    /**
     * Product dropdown on change Action
     */
    $("#quantity").on('change keyup scroll', function (e) {
        var productId = $("#product_id").val()
        $("#quantity").attr('max', 0)

        var stock_quantity = parseFloat( $(this).parent().find('.stock_quantity').html());
        $(this).parent().find('.cook_quantity').html(0);
        $(this).parent().find('.rest_quantity').html(parseFloat(stock_quantity) );

        var formdata = new FormData();
        var json_arr = JSON.stringify(purses);
        formdata.append("_token", $('meta[name="csrf-token"]').attr('content'));

        $.ajax({
            url: '{{url('stock/product/prepare/products-available')}}/' + productId,
            type: "POST",
            data: formdata,
            processData: false,
            contentType: false,
            success: function (data) {
                $("#quantity").attr('max', data['available'])
                if (parseFloat($("#quantity").val()) > parseFloat(data['available'])) {
                  toastr.error('quantity can not be more than ' + parseFloat(data['available']).toFixed(2))
                    $("#quantity").val(quantity)

                } else {
                    console.log($("#quantity").val())
                    quantity = $("#quantity").val()

                    $('.unit_quantity').each(function (td) {
                        var unit_quantity = parseFloat($(this).html()).toFixed(2);
                        var cook_quantity = parseFloat(quantity).toFixed(2);
                        var stock_quantity = parseFloat( $(this).parent().find('.stock_quantity').html());
                        $(this).parent().find('.cook_quantity').html( (unit_quantity * cook_quantity).toFixed(2));
                        $(this).parent().find('.rest_quantity').html(parseFloat(stock_quantity) - parseFloat(unit_quantity * cook_quantity).toFixed(2));
                    })

                }
            },
            error: function (data) {
                if (data['status'] == 422) {
                    $.Notification.notify('error',
                        'bottom right',
                        data.responseJSON[0]);
                }

            },
        });

    });
});
</script>
