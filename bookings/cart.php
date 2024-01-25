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

    .card-title {
        margin-bottom: 0;
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

    /*.product-item {
        border: 0px solid #343a40;
        margin-bottom: 10px;
        padding: 15px;
    }*/

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
    
    .rem-btn {
        text-align: right;
        margin-top: 20px; /* Adjust margin as needed */
        margin-right: 10px; /* Adjust margin as needed */
    }

    .rem-btn .rem_item {
        background-color: #dc3545;
        border: 2px solid #dc3545;
        color: #fff;
        border-radius: 50px; /* Adjust border-radius as needed */
        padding: 8px 20px; /* Adjust padding for size */
    }

    .fixed-size-image {
        width: 100%; /* Set the desired width to 100% for responsiveness */
        height: auto;
        object-fit: cover;
    }

    @media (min-width: 576px) {
        /* Adjust the margin for larger screens */
        .col-10 {
            margin-left: 20px;
        }
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
                $vendors = $conn->query("SELECT * FROM `agency_list` where id in (SELECT agency_id from package_list where id in (SELECT package_id FROM `booking_list` where traveler_id ='{$_settings->userdata('id')}')) order by `agency_name` asc");
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
                            <div class="container">
                                <div class="row">
                                    <!-- Product Image -->
                                    <div class="col-md-2 text-center">
                                        <a href="./?page=packages/view_package&id=<?= $prow['package_id'] ?>">
                                            <img src="<?= validate_image($prow['image_path']) ?>" alt="" class="img-center prod-img border bg-gradient-black fixed-size-image">
                                        </a>
                                    </div>
                                    <!-- Product Name and Package Information -->
                                    <div class="col-md-10">
                                        <div class="d-flex align-items-center mb-2">
                                            <!-- Product Name -->
                                            <h4 class="mb-0"><b><?= $prow['name'] ?></b></h4>
                                        </div>

                                        <!-- Package Information -->
                                        <div class="d-flex align-items-center mb-2">
                                            <span class="mr-2"><?=$vrow['agency_name'] ?></span>
                                        </div>

                                        <!-- Base Price -->
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                                <p class="m-0">
                                                    ₱ <?= format_num($prow['price']) ?>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>
                            <!-- Number of Travelers -->
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="text-muted">Number of Travelers</label>
                                    <div class="input-group input-group-sm">
                                        <input type="number" value="<?= $prow['number_of_traveler'] ?>" class="form-control text-center qty-input" data-id="<?= $prow['id'] ?>">
                                        <div class="input-group-prepend">
                                            <button class="btn btn-primary min-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-minus"></i></button>
                                        </div>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary plus-qty" data-id="<?= $prow['id'] ?>" type="button"><i class="fa fa-plus"></i></button>
                                        </div>
                                        <div class="input-group-append">
                                            <button class="btn btn-success confirm-btn" required data-id="<?= $prow['id'] ?>" type="button">Confirm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Check-in and Check-out Dates -->
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
                                <div class="col-md-6">
                                    <label class="text-muted">Select Travel Date</label>
                                    <div class="input-group input-group-sm">
                                        <input type="date" class="form-control form-control-sm form-control-border check-in-date" data-prod-id="<?= $prow['id'] ?>" required>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-alt"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Payment Type & Payment Amount-->
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
                            <div class="clear-fix mb-2"></div>
                            <!-- Total Section -->
                            <div class="total-section">
                                <div class="d-flex">
                                    <div class="col-9 h4 font-weight-bold text-right text-muted">Total</div>
                                    <div class="col-3 h4 font-weight-bold text-right" id="totalPrice"> ₱ <?= format_num($gtotal) ?></div>
                                </div>
                            </div>
                            <!-- Remove and Confirm Details Buttons -->
                            <div class="d-flex justify-content-between">
                                <!-- Remove Button -->
                                <div class="rem-btn">
                                    <button class="btn btn-flat btn-danger btn-sm rem_item" data-id="<?= $prow['id'] ?>">
                                        <i class="fa fa-times"></i> Cancel
                                    </button>
                                </div>
                                
                                <!-- Confirm Details Button -->
                                <div class="checkout-btn">
                                    <a href="./?page=bookings/checkout" class="btn btn-flat btn-primary btn-sm">Confirm Details</a>
                                </div>
                            </div>
                        </div>
                    <?php endwhile; ?>
                <?php endwhile; ?>
            </div>
        </div>
    </div>
</div>



<!-- Include Flatpickr from CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script>
//----------------------------------------------------------------------------------------------------------------
    // NUMBER OF TRAVELERS
    $(function () {
        // Function to update cart quantity
        function updateCartQty(cart_id, qty) {
            var el = $('<div>');
            el.addClass('alert alert-danger');
            el.hide();
            start_loader();

            $.ajax({
                url: _base_url_ + 'classes/Master.php?f=update_cart_qty',
                method: 'POST',
                data: { cart_id: cart_id, number_of_traveler: qty },
                dataType: 'json',
                error: function (err) {
                    console.error(err);
                    alert_toast('An error occurred.', 'error');
                    end_loader();
                },
                success: function (resp) {
                    if (resp.status === 'success') {
                        // location.reload(); // Uncomment this line if you want to reload the page after successful update
                    } else if (!!resp.msg) {
                        el.text(resp.msg);
                        $('#msg').append(el);
                        el.show('slow');
                        $('html, body').scrollTop(0);
                    } else {
                        el.text("An error occurred. Please try to refresh this page.");
                        $('#msg').append(el);
                        el.show('slow');
                        $('html, body').scrollTop(0);
                    }
                    end_loader();
                }
            });
        }

        // Plus button click event
        $('.plus-qty').click(function () {
            var group = $(this).closest('.input-group');
            var qty = parseFloat(group.find('input').val()) + 1;
            group.find('input').val(qty);
            var cart_id = $(this).attr('data-id');
            updateCartQty(cart_id, qty);
            saveToLocalStorage(cart_id, qty);
        });

        // Minus button click event
        $('.min-qty').click(function () {
            var group = $(this).closest('.input-group');
            var qty = parseFloat(group.find('input').val());

            // Ensure the quantity does not go below 1
            if (qty > 1) {
                qty -= 1;
                group.find('input').val(qty);
                var cart_id = $(this).attr('data-id');
                updateCartQty(cart_id, qty);
                saveToLocalStorage(cart_id, qty);
            }
        });

        // Manual input change event
        $('.qty-input').change(function () {
            var qty = parseFloat($(this).val());
            var cart_id = $(this).attr('data-id');

            // Ensure the quantity does not go below 1
            if (qty < 1) {
                qty = 1;
                $(this).val(qty);
            }

            updateCartQty(cart_id, qty);
            saveToLocalStorage(cart_id, qty);
        });

        // Function to save quantity to local storage
        function saveToLocalStorage(cart_id, qty) {
            localStorage.setItem('cart_qty_' + cart_id, qty);
        }

        // Retrieve and set stored quantity on page load
        $('.qty-input').each(function () {
            var cart_id = $(this).data('id');
            var storedQty = localStorage.getItem('cart_qty_' + cart_id);
            if (storedQty !== null) {
                $(this).val(storedQty);
            }
        });

        // Confirm button click event
        $('.confirm-btn').click(function () {
            var cart_id = $(this).attr('data-id');
            var qty = parseFloat($('.qty-input[data-id="' + cart_id + '"]').val());

            // You can perform any additional logic here if needed before refreshing the page

            // Reload the page
            location.reload();
        });

        // Remove item click event
        $('.rem_item').click(function () {
            _conf("Are you sure you want to cancel this booking?", 'delete_cart', [$(this).attr('data-id')]);
        });
    });
//----------------------------------------------------------------------------------------------------------------
    // TRAVEL TYPE SELECTION
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
//----------------------------------------------------------------------------------------------------------------
    // Fetch TRAVEL DATE from the server and initialize Flatpickr
    $('.check-in-date').each(function () {
        var prodId = $(this).data('prod-id');

        // Fetch check-in date from the server
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

                    if (checkInDate) {
                        // Set the fetched check-in date in Flatpickr
                        var checkInInstance = flatpickr(".check-in-date", {
                            altInput: true,
                            dateFormat: "Y-m-d",
                            minDate: "today",
                            defaultDate: checkInDate, // Set the default date
                            // Add any additional options as needed
                        });

                        // Add an event listener for the onChange event
                        checkInInstance.config.onChange.push(function (selectedDates, dateStr, instance) {
                            // Store the selected check-in date in local storage
                            localStorage.setItem('selectedCheckInDate', dateStr);
                            
                            // Store the selected check-in date in the database
                            updateCartDates(prodId, dateStr);
                            updateDayCount(selectedDates, checkOutInstance);
                        });
                    }
                } else {
                    console.error('Failed to fetch data from the server: ' + resp.msg);
                }
            },
            error: function (xhr, status, error) {
                console.error(xhr.responseText);
                alert_toast('An error occurred: ' + error, 'error');
            },
        });
    });

    // Function to handle date changes
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
//----------------------------------------------------------------------------------------------------------------

    // PAYMENT TYPE AND PAYMENT AMOUNT
    // On change of payment type, save the selected value in local storage
    $('.payment-type').change(function () {
        var prodId = $(this).data('prod-id');
        var selectedPaymentType = $(this).val();
        
        // Call the server-side script to update the payment type
        updatePaymentType(prodId, selectedPaymentType);

        // Check if the selected payment type is "Full Payment" (assuming '2' is the ID for "Full Payment")
        var paymentAmountInput = $('.payment-amount[data-prod-id="' + prodId + '"]');
        if (selectedPaymentType === '2') {
            // Set the payment amount to the total amount
            var totalAmount = <?= $gtotal ?>;
            paymentAmountInput.val(totalAmount).prop('readonly', true).change();
        } else {
            // Reset the payment amount and remove readonly
            paymentAmountInput.val('').prop('readonly', false).change();
        }

        // Save the selected payment type in local storage
        localStorage.setItem('paymentType_' + prodId, selectedPaymentType);
    });

    // On page load, retrieve the selected payment type from local storage
    $(document).ready(function () {
        $('.payment-type').each(function () {
            var prodId = $(this).data('prod-id');
            var storedPaymentType = localStorage.getItem('paymentType_' + prodId);
            if (storedPaymentType) {
                // Trigger change event to update the server if needed
                $(this).val(storedPaymentType).change();
            }
        });
    });

    function updatePaymentType(prodId, paymentTypeId) {
        $.ajax({
            type: 'POST',
            url: 'classes/Master.php?f=update_payment_type',
            data: {
                prod_id: prodId,
                payment_type_id: paymentTypeId
            },
            dataType: 'json',
            success: function (response) {
                // Handle success
                if (response.status === 'success') {
                    console.log(response.msg);
                } else {
                    console.error(response.msg);
                    console.error(response.error);
                }
            },
            error: function (error) {
                // Handle error
                console.error('Failed to update payment type:', error);
            }
        });
    }

    //FOR THE PAYMENT AMOUNT INPUT
    // On change of payment amount, save the entered value in local storage
    $('.payment-amount').change(function () {
        var prodId = $(this).data('prod-id');
        var enteredPaymentAmount = $(this).val();
        updatePaymentAmountInDatabase(prodId, enteredPaymentAmount);
        
        // Save the entered payment amount in local storage
        localStorage.setItem('enteredPaymentAmount_' + prodId, enteredPaymentAmount);
    });

    // On page load, retrieve the entered value from local storage and set it as the entered value
    $(document).ready(function () {
        $('.payment-amount').each(function () {
            var prodId = $(this).data('prod-id');
            var storedPaymentAmount = localStorage.getItem('enteredPaymentAmount_' + prodId);
            if (storedPaymentAmount) {
                // Trigger change event to update the server if needed
                $(this).val(storedPaymentAmount).change();
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



//----------------------------------------------------------------------------------------------------------------
    // PAYMENT METHOD
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
//----------------------------------------------------------------------------------------------------------------
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
//----------------------------------------------------------------------------------------------------------------
    // DISCARD BOOKING
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

    
//----------------------------------------------------------------------------------------------------------------
</script>

<script>
    // Function to check if all required inputs are filled
    function areAllInputsFilled() {
        var allInputsFilled = true;

        // Check each required input
        $('.travel-type, .check-in-date, .payment-type, .payment-amount, .payment-method').each(function () {
            if (!$(this)[0].checkValidity()) {
                allInputsFilled = false;
                return false; // Break out of the loop early if any input is not valid
            }
        });

        return allInputsFilled;
    }

    // Update the Confirm Details button state based on input validity
    function updateConfirmDetailsButtonState() {
        var confirmDetailsButton = $('.checkout-btn a');

        if (areAllInputsFilled()) {
            confirmDetailsButton.removeClass('disabled').attr('href', './?page=bookings/checkout'); // Enable the button
        } else {
            confirmDetailsButton.addClass('disabled').removeAttr('href'); // Disable the button
        }
    }

    // Add change event listeners to the required inputs and payment type/payment method dropdowns
    $('.travel-type, .check-in-date, .payment-type, .payment-amount, .payment-method').change(function () {
        updateConfirmDetailsButtonState();
    });

    // Disable the Confirm Details button initially
    updateConfirmDetailsButtonState();

    document.addEventListener('DOMContentLoaded', function () {
        // Get the payment amount input element
        var paymentAmountInput = document.querySelector('.payment-amount');

        // Add an input event listener to enforce the maximum length
        paymentAmountInput.addEventListener('input', function () {
            if (paymentAmountInput.value.length > 9) {
                // Truncate the value to 9 digits
                paymentAmountInput.value = paymentAmountInput.value.slice(0, 9);
            }
        });
    });
</script>