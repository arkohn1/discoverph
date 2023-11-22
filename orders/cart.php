<!-- Add this to the head section of your HTML to include Bootstrap Datepicker CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

<style>
    .prod-img {
        width: auto;
        height: auto;
        max-height: 10em;
        object-fit: scale-down;
        object-position: center center;
        background: #343a40; /* Use your specific color values */
    }
</style>


<div class="content py-3">
    <div class="card card-outline card-primary rounded-0 shadow-0">
        <div class="card-header">
            <h5 class="card-title">Confirm Booking Details</h5>
        </div>
        <div class="card-body">
            <div id="cart-list">
                <div class="row">
                <?php 
                $gtotal = 0;
                $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                while($vrow=$vendors->fetch_assoc()):                
                ?>
                    <div class="col-12 border" style="background-color: #343a40;">
                        <span style="color: white;"><b><?= $vrow['code']. " - " . $vrow['shop_name'] ?></b></span>
                    </div>
                    <div class="col-12 border p-0">
                        <?php 
                        $vtotal = 0;
                        $products = $conn->query("SELECT c.*, p.name as `name`, p.price,p.image_path FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}' order by p.name asc");
                        while($prow = $products->fetch_assoc()):
                            $total = $prow['price'] * $prow['quantity'] * $prow['days']; // Modify the calculation
                            $gtotal += $total;
                            $vtotal += $total;
                        ?>
                        <div class="d-flex align-items-center border p-2">
                    
                            <div class="col-auto flex-shrink-1 flex-grow-1">
                            
                                <h4><b><?= $prow['name'] ?></b></h4>
                                <div class="col-2 text-center">
                                    <a href="./?page=products/view_product&id=<?= $prow['product_id'] ?>"><img src="<?= validate_image($prow['image_path']) ?>" alt="" class="img-center prod-img border bg-gradient-black"></a>
                                </div>
                                <div class="d-flex">
                                    <div class="col-auto px-0"><small class="text-muted">Price per room/day: </small></div>
                                    <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-primary"><?= format_num($prow['price']) ?></small></p></div>
                                </div>
                                
                                
                                <div class="d-flex mb-3">
                                    <!-- Number of Rooms -->
                                    <div class="col-auto text-center">
                                        <small class="text-muted">Number of Rooms</small>
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-primary min-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-minus"></i></button>
                                            </div>
                                            <input type="text" value="<?= $prow['quantity'] ?>" class="form-control text-center" readonly="readonly">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary plus-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                     <!-- Check in and Check out -->
                                    <div class="col-auto text-center">
                                        <small class="text-muted">Confirm Total Days</small>
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <button class="btn btn-primary min-confirm-days" data-prod-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-minus"></i></button>
                                            </div>
                                            <input type="number" value="<?= $prow['days'] ?>" class="form-control text-center confirm-total-days" readonly="readonly">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary plus-confirm-days" data-prod-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="text-muted">Check-in Date</label>
                                        <div class="input-group input-group-sm">
                                            <input type="date" class="form-control form-control-sm form-control-border check-in-date" data-prod-id="<?= $prow['id'] ?>" required>
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-alt"></i></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="text-muted">Check-out Date</label>
                                        <div class="input-group input-group-sm">
                                            <input type="date" class="form-control form-control-sm form-control-border check-out-date" data-prod-id="<?= $prow['id'] ?>" required>
                                            <div class="input-group-append">
                                                <span class="input-group-text" id="basic-addon2"><i class="fas fa-calendar-alt"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>




                                <!-- Select Mode of Payment -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label class="text-muted">Payment Method</label>
                                        <div class="input-group input-group-sm">
                                            <select class="form-control form-control-sm form-control-border payment-method" data-prod-id="<?= $prow['id'] ?>" required>
                                                <option value="" selected disabled>Select Payment Method</option>
                                                <?php
                                                // Fetch payment methods from the payments table
                                                $paymentMethods = $conn->query("SELECT * FROM payments WHERE vendor_id = '{$vrow['id']}' AND status = 1"); // Modify this query according to your database schema
                                                while ($paymentMethod = $paymentMethods->fetch_assoc()) {
                                                    echo "<option value='{$paymentMethod['id']}'>{$paymentMethod['name']}</option>";
                                                }
                                                ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div id="paymentDetailsContainer" class="position-relative">
                                            <?php
                                            // Retrieve stored payment method for the current product
                                            $storedPaymentMethod = isset($_SESSION['paymentMethod_' . $prow['id']]) ? $_SESSION['paymentMethod_' . $prow['id']] : null;

                                            // Fetch and display payment details if a payment method is selected
                                            if ($storedPaymentMethod) {
                                                $paymentDetails = $conn->query("SELECT * FROM payments WHERE id = '{$storedPaymentMethod}' AND vendor_id = '{$vrow['id']}' AND status = 1");
                                                $paymentDetails = $paymentDetails->fetch_assoc();
                                                echo "Selected Payment Method: " . $paymentDetails['name'];
                                                // Display other payment details as needed
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>



                                

                                <div class="d-flex">
                                    <!-- Buttons -->
                                    <div class="col-auto">
                                        <button class="btn btn-flat btn-outline-danger btn-sm rem_item" data-id="<?= $prow['id'] ?>">
                                            <i class="fa fa-times"></i> Remove
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="col-3 text-right"><?= format_num($total) ?></div>-->
                        </div>
                        <?php endwhile; ?>
                    </div>
                <?php endwhile; ?>
                    <div class="col-12 border">
                        <div class="d-flex">
                            <div class="col-9 h4 font-weight-bold text-right text-muted">Total</div>
                            <div class="col-3 h4 font-weight-bold text-right"><?= format_num($gtotal) ?></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear-fix mb-2"></div>
    <div class="text-right">
        <a href="./?page=orders/checkout" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-money-bill-wave"></i> Checkout</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script>
    $(function(){
        $('.plus-qty').click(function(){
            var group = $(this).closest('.input-group')
            var qty = parseFloat(group.find('input').val()) + 1;
            group.find('input').val(qty)
            var cart_id = $(this).attr('data-id')
            var el = $('<div>')
            el.addClass('alert alert-danger')
            el.hide()
            start_loader()
            $.ajax({
                url:_base_url_+'classes/Master.php?f=update_cart_qty',
                method:'POST',
                data:{cart_id:cart_id,quantity:qty},
                dataType:'json',
                error:err=>{
                    console.error(err)
                    alert_toast('An error occurred.','error')
                    end_loader()
                },
                success:function(resp){
                    if(resp.status =='success'){
                        location.reload()
                    }else if(!!resp.msg){
                        el.text(resp.msg)
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                     }else{
                        el.text("An error occurred. Please try to refresh this page.")
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }
                    end_loader()
                }
            })
            
        })
        $('.min-qty').click(function(){
            var group = $(this).closest('.input-group')
            if(parseFloat(group.find('input').val()) == 1){
                return false;
            }
            var qty = parseFloat(group.find('input').val()) - 1;
            group.find('input').val(qty)
            var cart_id = $(this).attr('data-id')
            var el = $('<div>')
            el.addClass('alert alert-danger')
            el.hide()
            start_loader()
            $.ajax({
                url:_base_url_+'classes/Master.php?f=update_cart_qty',
                method:'POST',
                data:{cart_id:cart_id,quantity:qty},
                dataType:'json',
                error:err=>{
                    console.error(err)
                    alert_toast('An error occurred.','error')
                    end_loader()
                },
                success:function(resp){
                    if(resp.status =='success'){
                        location.reload()
                    }else if(!!resp.msg){
                        el.text(resp.msg)
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }else{
                        el.text("An error occurred. Please try to refresh this page.")
                        $('#msg').append(el)
                        el.show('slow')
                        $('html, body').scrollTop(0)
                    }
                    end_loader()
                }
            })
        })

        $('.rem_item').click(function(){
            _conf("Are you sure delete this item from cart list?",'delete_cart',[$(this).attr('data-id')])
        })
    })

    function delete_cart($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_cart",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}

    $(function(){
        // Function to handle date changes
        $('.check-in-date, .check-out-date').change(function () {
            var prodId = $(this).data('prod-id');
            var checkInDate = $('.check-in-date[data-prod-id="' + prodId + '"]').val();
            var checkOutDate = $('.check-out-date[data-prod-id="' + prodId + '"]').val();

            // Call the function to update dates
            updateCartDates(prodId, checkInDate, checkOutDate);
        });

        // Add change event listeners to the check-in and check-out date inputs
        $('.check-in-date, .check-out-date').change(function () {
            calculateAndSetTotalDays($(this).data('prod-id'));
        });
    });

    function updateCartDates(prodId, checkInDate, checkOutDate) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_cart_dates',
            method: 'POST',
            data: {
                cart_id: prodId,
                check_in_date: checkInDate,
                check_out_date: checkOutDate
            },
            dataType: 'json',
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
                alert_toast('An error occurred: ' + error, 'error');
                end_loader();
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    // Handle success if needed
                } else if (!!resp.msg) {
                    // Handle error message if needed
                } else {
                    // Handle generic error if needed
                }
                end_loader();
            }
        });
    }

    $(function () {
        // Add change event listeners to the check-in and check-out date inputs
        $('.check-in-date, .check-out-date').change(function () {
            calculateAndSetTotalDays($(this).data('prod-id'));
        });
            // Add an additional event listener for the check-out date to handle immediate updates
        $('.check-out-date').on('input', function () {
            calculateAndSetTotalDays($(this).data('prod-id'));
        });
    });
   
    // Fetch stored data from the server on page load
    $(document).ready(function () {
        $('.check-in-date, .check-out-date, .payment-method').each(function () {
            var prodId = $(this).data('prod-id');
            
            // Fetch check-in and check-out dates from the server
            $.ajax({
                url: _base_url_ + 'classes/Master.php?f=get_cart_data',
                method: 'POST',
                data: {
                    prod_id: prodId,
                },
                dataType: 'json',
                success: function (resp) {
                    if (resp.status == 'success') {
                        var checkInDate = resp.check_in_date;
                        var checkOutDate = resp.check_out_date;
                        var paymentsId = resp.payments_id;

                        if (checkInDate) {
                            $('.check-in-date[data-prod-id="' + prodId + '"]').val(checkInDate);
                        }

                        if (checkOutDate) {
                            $('.check-out-date[data-prod-id="' + prodId + '"]').val(checkOutDate);
                        }

                        if (paymentsId) {
                            $('.payment-method[data-prod-id="' + prodId + '"]').val(paymentsId);
                        }

                        // Trigger change event to recalculate total days
                        $('.check-in-date, .check-out-date, .payment-method').change();
                    } else {
                        console.error('Failed to fetch data from the server.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert_toast('An error occurred: ' + error, 'error');
                },
            });
        });
    });


    $(function () {
        $('.plus-confirm-days').click(function () {
            var group = $(this).closest('.input-group');
            var inputField = group.find('.confirm-total-days');
            var days = parseInt(inputField.val()) + 1;

            inputField.val(days);
            updateTotalDaysInDatabase($(this).data('prod-id'), days);
        });

        $('.min-confirm-days').click(function () {
            var group = $(this).closest('.input-group');
            var inputField = group.find('.confirm-total-days');
            var days = parseInt(inputField.val()) - 1;

            if (days >= 0) {
                inputField.val(days);
                updateTotalDaysInDatabase($(this).data('prod-id'), days);
            }
        });

        function updateTotalDaysInDatabase(prodId, days) {
            start_loader();
            $.ajax({
                url: _base_url_ + 'classes/Master.php?f=update_cart_total_days',
                method: 'POST',
                data: {
                    prod_id: prodId,
                    total_days: days
                },
                dataType: 'json',
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                    alert_toast('An error occurred: ' + error, 'error');
                    end_loader();
                },
                success: function (resp) {
                    if (resp.status == 'success') {
                        // Handle success if needed
                        console.log('Total days updated successfully');

                        // Reload the page after successful update
                        location.reload();
                    } else if (!!resp.msg) {
                        // Handle error message if needed
                        console.error('Error updating total days: ' + resp.msg);
                    } else {
                        // Handle generic error if needed
                        console.error('Unknown error occurred while updating total days');
                    }
                    end_loader();
                }
            });
        }
    });

    // Add an event listener for the payment method dropdown change
    $('.payment-method').change(function () {
        var prodId = $(this).data('prod-id');
        var paymentsId = $(this).val();

        // Call a function to update the payment method in the database
        updatePaymentMethodInDatabase(prodId, paymentsId);

        // Call a function to fetch and display payment details
        fetchPaymentDetails(paymentsId); // Pass paymentsId as the argument
    });

    function updatePaymentMethodInDatabase(prodId, paymentsId) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_payment_method',
            method: 'POST',
            data: {
                prod_id: prodId,
                payments_id: paymentsId
            },
            dataType: 'json',
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
                alert_toast('An error occurred: ' + error, 'error');
                end_loader();
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    // Handle success if needed
                    console.log('Payment method updated successfully');
                } else if (!!resp.msg) {
                    // Handle error message if needed
                    console.error('Error updating payment method: ' + resp.msg);
                } else {
                    // Handle generic error if needed
                    console.error('Unknown error occurred while updating payment method');
                }
                end_loader();
            }
        });
    }

    function fetchPaymentDetails(paymentsId) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=fetch_payment_details',
            method: 'POST',
            data: {
                payments_id: paymentsId
            },
            dataType: 'json',
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
                alert_toast('An error occurred: ' + error, 'error');
                end_loader();
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    // Define column names as variables (editable as code)
                    var nameColumn = 'Selected Payment Method';
                    var descriptionColumn = 'Payment Details';
                    var qrCodeColumn = 'Scan QR Code if Available';

                    // Update the content of the payment details container
                    $('#paymentDetailsContainer').html(
                    '<p><strong>' + nameColumn + ':</strong> ' + resp.paymentDetails.name + '</p>' +
                    '<p><strong>' + descriptionColumn + ':</strong> ' + resp.paymentDetails.description + '</p>' +
                    '<p><strong>' + qrCodeColumn + ':</strong></p>' +
                    '<img src="' + resp.paymentDetails.qr_code + '" alt="QR Code">'
                    );
                } else if (!!resp.msg) {
                    // Handle error message if needed
                    console.error('Error fetching payment details: ' + resp.msg);
                } else {
                    // Handle generic error if needed
                    console.error('Unknown error occurred while fetching payment details');
                }
                end_loader();
            }
        });
    }
    
   // On change of payment method, save the selected value in session storage
   $('.payment-method').change(function () {
        var prodId = $(this).data('prod-id');
        var selectedPaymentMethod = $(this).val();
        sessionStorage.setItem('paymentMethod_' + prodId, selectedPaymentMethod);
    });

    // On page load, retrieve the selected payment method from session storage
    $(document).ready(function () {
        $('.payment-method').each(function () {
            var prodId = $(this).data('prod-id');
            var storedPaymentMethod = sessionStorage.getItem('paymentMethod_' + prodId);
            if (storedPaymentMethod) {
                $(this).val(storedPaymentMethod).change(); // Trigger change event to fetch details
            }
        });
    });




</script>