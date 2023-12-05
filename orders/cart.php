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

    body {
        overflow-y: scroll;
    }

    .card-outline {
        border: 1px solid #dee2e6;
    }

    .card-header {
        background-color: #007bff;
        color: white;
    }

    .card-body {
        padding: 20px;
    }

    .vendor-header {
        background-color: #343a40;
        color: white;
        font-weight: bold;
        padding: 10px;
        margin-bottom: 10px;
    }

    .product-item {
        border: 1px solid #343a40;
        margin-bottom: 10px;
        padding: 15px;
    }

    .total-section {
        margin-top: 20px;
    }

    .checkout-btn {
        text-align: right;
        margin-top: 20px; /* Adjust margin as needed */
    }

    .checkout-btn a {
        background-color: #007bff;
        border: 2px solid #007bff;
        width: 200px;
        height: 40px;
        border-radius: 30px !important;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        text-decoration: none;
        box-sizing: border-box; /* Include border and padding in total width and height */
        margin-left: auto; /* Align to the right */
    }
    
    
</style>

<div class="content py-3">
    <div class="card card-primary shadow rounded-0">
        <div class="card-header">
            <h5 class="card-title">Confirm Booking Details</h5>
        </div>
        <div class="card-body">
            <div id="cart-list">
                <?php
                $gtotal = 0;
                $vendors = $conn->query("SELECT * FROM `agency_list` where id in (SELECT agency_id from package_list where id in (SELECT package_id FROM `booking_list` where traveler_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                while ($vrow = $vendors->fetch_assoc()) :
                ?>
                    <?php
                    $vtotal = 0;
                    $products = $conn->query("SELECT c.*, p.name as `name`, p.price,p.image_path FROM `booking_list` c inner join package_list p on c.package_id = p.id where c.traveler_id = '{$_settings->userdata('id')}' and p.agency_id = '{$vrow['id']}' order by p.name asc");
                    while ($prow = $products->fetch_assoc()) :
                        $total = $prow['price'] * $prow['number_of_traveler'];
                        $gtotal += $total;
                        $vtotal += $total;
                    ?>
                        <div class="product-item">
                            <!-- Product details -->
                            <h4><b><?= $prow['name'] ?> | <?= $vrow['code'] . " - " . $vrow['shop_name'] ?></b></h4>
                            <div class="col-2 text-center">
                                <a href="./?page=products/view_product&id=<?= $prow['package_id'] ?>"><img src="<?= validate_image($prow['image_path']) ?>" alt="" class="img-center prod-img border bg-gradient-black"></a>
                            </div>
                            <div class="d-flex">
                                <div class="col-auto px-0"><small class="text-muted"></small></div>
                                <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-primary"><?= format_num($prow['price']) ?></small></p></div>
                            </div>
                            <!-- number_of_traveler and Confirm Total Days -->
                            <div class="d-flex mb-3">
                                <!-- Number of Rooms -->
                                <div class="col-auto text-center">
                                    <small class="text-muted">Number of Passengers</small>
                                    <div class="input-group input-group-sm">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-primary min-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-minus"></i></button>
                                        </div>
                                        <input type="text" value="<?= $prow['number_of_traveler'] ?>" class="form-control text-center" readonly="readonly">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary plus-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!-- Confirm Total Days -->
                                <!--<div class="col-auto text-center">
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
                                </div>-->
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Travel Type</label>
                                    <div class="input-group input-group-sm">
                                        <select class="form-control form-control-sm form-control-border travel-type" data-prod-id="<?= $prow['id'] ?>" required>
                                            <option value="" selected disabled>Select Travel Type</option>
                                            <?php
                                            // Fetch all travel types from the travel_type table
                                            $travelTypes = $conn->query("SELECT * FROM travel_type");
                                            while ($travelType = $travelTypes->fetch_assoc()) {
                                                echo "<option value='{$travelType['id']}'>{$travelType['travel_type_name']}</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <!-- Check-in and Check-out Dates -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Select Travel Date</label>
                                    <div class="input-group input-group-sm">
                                        <input type="date" class="form-control form-control-sm form-control-border check-in-date" data-prod-id="<?= $prow['id'] ?>" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <!--<div class="col-md-6">
                                    <label class="text-muted">Check-out Date</label>
                                    <div class="input-group input-group-sm">
                                        <input type="date" class="form-control form-control-sm form-control-border check-out-date" data-prod-id="<?= $prow['id'] ?>" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon2"><i class="fas fa-calendar-alt"></i></span>
                                        </div>
                                    </div>
                                </div>-->
                            </div>
                            <!-- Payment Type -->
                             <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Payment Type</label>
                                    <div class="input-group input-group-sm">
                                        <select class="form-control form-control-sm form-control-border payment-type" data-prod-id="<?= $prow['id'] ?>" required>
                                            <option value="" selected disabled>Select Payment Type</option>
                                            <?php
                                            // Fetch payment types from the database
                                            $paymentTypes = $conn->query("SELECT * FROM payment_type");
                                            while ($paymentType = $paymentTypes->fetch_assoc()) {
                                                echo "<option value='{$paymentType['id']}'>{$paymentType['payment_type_name']}</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div> 
                            <!-- Payment Amount -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Payment Amount</label>
                                    <div class="input-group input-group-sm">
                                        <input type="number" class="form-control form-control-sm form-control-border payment-amount" data-prod-id="<?= $prow['id'] ?>" placeholder="Enter Payment Amount" required>
                                    </div>
                                </div>
                            </div>
                            <!-- Payment Method -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Payment Method</label>
                                    <div class="input-group input-group-sm">
                                        <select class="form-control form-control-sm form-control-border payment-method" data-prod-id="<?= $prow['id'] ?>" required>
                                            <option value="" selected disabled>Select Payment Method</option>
                                            <?php
                                            // Fetch payment methods from the payments table
                                            $paymentMethods = $conn->query("SELECT * FROM payments WHERE agency_id = '{$vrow['id']}' AND status = 1");
                                            while ($paymentMethod = $paymentMethods->fetch_assoc()) {
                                                echo "<option value='{$paymentMethod['id']}'>{$paymentMethod['name']}</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="position-relative">
                                        <!-- Payment Details Container -->
                                        <div id="paymentDetailsContainer" class="position-relative">
                                            <?php
                                            // Retrieve stored payment method for the current product
                                            $storedPaymentMethod = isset($_SESSION['paymentMethod_' . $prow['id']]) ? $_SESSION['paymentMethod_' . $prow['id']] : null;

                                            // Fetch and display payment details if a payment method is selected
                                            if ($storedPaymentMethod) {
                                                $paymentDetails = $conn->query("SELECT * FROM payments WHERE id = '{$storedPaymentMethod}' AND agency_id = '{$vrow['id']}' AND status = 1");
                                                $paymentDetails = $paymentDetails->fetch_assoc();
                                                echo "Selected Payment Method: " . $paymentDetails['name'];
                                                // Display other payment details as needed
                                            }
                                            ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Remove Button -->
                            <div class="d-flex">
                                <div class="col-auto">
                                    <button class="btn btn-flat btn-outline-danger btn-sm rem_item" data-id="<?= $prow['id'] ?>">
                                        <i class="fa fa-times"></i> Remove
                                    </button>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endwhile; ?>
                <!-- Total Section -->
                <div class="total-section">
                    <div class="d-flex">
                        <div class="col-9 h4 font-weight-bold text-right text-muted">Total</div>
                        <div class="col-3 h4 font-weight-bold text-right"><?= format_num($gtotal) ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear-fix mb-2"></div>
    <!-- Checkout Button -->
    <div class="checkout-btn">
        <a href="./?page=orders/checkout" class="btn btn-flat btn-primary btn-sm">Proceed to Checkout</a>
    </div>

</div>
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
                data:{cart_id:cart_id,number_of_traveler:qty},
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
                data:{cart_id:cart_id,number_of_traveler:qty},
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
        $('.check-in-date').change(function () {
            var prodId = $(this).data('prod-id');
            var checkInDate = $('.check-in-date[data-prod-id="' + prodId + '"]').val();

            // Call the function to update dates
            updateCartDates(prodId, checkInDate);
        });

        // Add change event listeners to the check-in and check-out date inputs
        $('.check-in-date').change(function () {
            calculateAndSetTotalDays($(this).data('prod-id'));
        });
    });

    function updateCartDates(prodId, checkInDate) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_cart_dates',
            method: 'POST',
            data: {
                cart_id: prodId,
                check_in_date: checkInDate,
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
        $('.check-in-date').change(function () {
            calculateAndSetTotalDays($(this).data('prod-id'));
        });
    });
   
    // Fetch stored data from the server on page load
    $(document).ready(function () {
        $('.check-in-date, .payment-method').each(function () {
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
                        var paymentsId = resp.payments_id;

                        if (checkInDate) {
                            $('.check-in-date[data-prod-id="' + prodId + '"]').val(checkInDate);
                        }

                        if (paymentsId) {
                            $('.payment-method[data-prod-id="' + prodId + '"]').val(paymentsId);
                        }

                        // Trigger change event to recalculate total days
                        $('.check-in-date, .payment-method').change();
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


    /*$(function () {
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
    });*/

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

    // FOR THE TRAVEL TYPE SELECTION
    function updateTravelTypeInDatabase(prodId, travelTypeId) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_travel_type',
            method: 'POST',
            data: {
                prod_id: prodId,
                travel_type_id: travelTypeId
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
                    console.log('Travel type updated successfully');
                    // Save the selected value to local storage
                    sessionStorage.setItem('selectedTravelType_' + prodId, travelTypeId);
                } else if (!!resp.msg) {
                    // Handle error message if needed
                    console.error('Error updating travel type: ' + resp.msg);
                } else {
                    // Handle generic error if needed
                    console.error('Unknown error occurred while updating travel type');
                }
                end_loader();
            }
        });
    }

    // On page load, retrieve the selected value from local storage and set it as the selected option
    $(document).ready(function () {
        $('.travel-type').each(function () {
            var prodId = $(this).data('prod-id');
            var storedTravelTypeId = sessionStorage.getItem('selectedTravelType_' + prodId);
            if (storedTravelTypeId) {
                $(this).val(storedTravelTypeId).change(); // Trigger change event to update the server if needed
            }
        });
    });

    // On change of travel type, save the selected value in local storage
    $('.travel-type').change(function () {
        var prodId = $(this).data('prod-id');
        var selectedTravelTypeId = $(this).val();
        updateTravelTypeInDatabase(prodId, selectedTravelTypeId);
        sessionStorage.setItem('selectedTravelType_' + prodId, selectedTravelTypeId);
    });

    //FOR THE PAYMENT TYPE SELECTION
    // On change of payment type, save the selected value in local storage
    $('.payment-type').change(function () {
        var prodId = $(this).data('prod-id');
        var selectedPaymentTypeId = $(this).val();
        updatePaymentTypeInDatabase(prodId, selectedPaymentTypeId);
        sessionStorage.setItem('selectedPaymentType_' + prodId, selectedPaymentTypeId);
    });

    // On page load, retrieve the selected value from local storage and set it as the selected option
    $(document).ready(function () {
        $('.payment-type').each(function () {
            var prodId = $(this).data('prod-id');
            var storedPaymentTypeId = sessionStorage.getItem('selectedPaymentType_' + prodId);
            if (storedPaymentTypeId) {
                $(this).val(storedPaymentTypeId).change(); // Trigger change event to update the server if needed
            }
        });
    });

    // Function to update payment type in the database
    function updatePaymentTypeInDatabase(prodId, paymentTypeId) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_payment_type',
            method: 'POST',
            data: {
                prod_id: prodId,
                payment_type_id: paymentTypeId
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
                    console.log('Payment type updated successfully');
                } else if (!!resp.msg) {
                    // Handle error message if needed
                    console.error('Error updating payment type: ' + resp.msg);
                } else {
                    // Handle generic error if needed
                    console.error('Unknown error occurred while updating payment type');
                }
                end_loader();
            }
        });
    }

    //FOR THE PAYMENT AMOUNT INPUT
    // On change of payment amount, save the entered value in local storage
    $('.payment-amount').change(function () {
        var prodId = $(this).data('prod-id');
        var enteredPaymentAmount = $(this).val();
        updatePaymentAmountInDatabase(prodId, enteredPaymentAmount);
        sessionStorage.setItem('enteredPaymentAmount_' + prodId, enteredPaymentAmount);
    });

    // On page load, retrieve the entered value from local storage and set it as the entered value
    $(document).ready(function () {
        $('.payment-amount').each(function () {
            var prodId = $(this).data('prod-id');
            var storedPaymentAmount = sessionStorage.getItem('enteredPaymentAmount_' + prodId);
            if (storedPaymentAmount) {
                $(this).val(storedPaymentAmount).change(); // Trigger change event to update the server if needed
            }
        });
    });

    // Function to update payment amount in the database
    function updatePaymentAmountInDatabase(prodId, paymentAmount) {
        start_loader();
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=update_payment_amount',
            method: 'POST',
            data: {
                prod_id: prodId,
                payment_amount: paymentAmount
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
                    console.log('Payment amount updated successfully');
                } else if (!!resp.msg) {
                    // Handle error message if needed
                    console.error('Error updating payment amount: ' + resp.msg);
                } else {
                    // Handle generic error if needed
                    console.error('Unknown error occurred while updating payment amount');
                }
                end_loader();
            }
        });
    }
</script>