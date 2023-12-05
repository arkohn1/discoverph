<style>
    body {
        overflow-y: scroll;
        background-color: #f8f9fa;
    }

    .card-title {
        margin-bottom: 0;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .img-thumbnail {
        max-width: 100%;
        height: 700px;
    }

    .summary-item {
        border: 1px solid #dee2e6;
        margin-bottom: 10px;
        padding: 15px;
        background-color: #fff;
    }

    #summary {
        margin-top: 20px;
    }

    .total-section {
        border-top: 1px solid #dee2e6;
        padding-top: 10px;
        margin-top: 10px;
        background-color: #f8f9fa;
        padding: 15px;
    }

    .checkout-btn {
        margin-top: 20px;
    }

    .checkout-btn a {
        padding: 10px 20px;
        font-size: 16px;
    }

    .container-fluid {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        padding: 20px;
        margin-top: 20px;
    }

    .row {
        margin-bottom: 20px;
    }

    .border-primary {
        border-color: #007bff !important;
    }

    .bg-primary {
        background-color: #007bff !important;
    }

    .text-primary {
        color: #007bff !important;
    }

    .rounded-0 {
        border-radius: 0 !important;
    }

    .form-control-border {
        border-radius: 0;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
        width:200px;
        height: 40px;
        border-radius: 30px;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

        /* Style for the file input */
        .custom-file-input {
        display: none;
    }

    .custom-file-label {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        cursor: pointer;
        border: 1px solid #ced4da;
        border-radius: 5px;
        padding: 6px 12px;
    }

    .custom-file-label::after {
        content: 'Browse';
    }

    .custom-file-input:focus ~ .custom-file-label {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    .form-control-border {
        border-radius: 5px;
    }
</style>

<div class="content py-3">
    <div class="card card-primary shadow rounded-0">
        <div class="card-header">
            <h5 class="card-title">Checkout</h5>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <form action="" id="checkout-form" enctype="multipart/form-data">
                        <!-- PROOF OF PAYMENT SECTION -->
                        <div class="form-group">
                            <label for="proof_of_payment" class="control-label">Proof of Payment</label>
                            <div class="custom-file">
                                <input type="file" id="proof_of_payment" name="proof_of_payment" class="custom-file-input form-control-border" onchange="displayImg(this, $(this))" accept="image/png, image/jpeg">
                                <label class="custom-file-label" for="proof_of_payment">Choose file</label>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <img src="../uploads/default_payment_image.jpg" alt="Please Select an Image" id="payment_img" class="border img-thumbnail">
                        </div>
                        <!-- END PROOF OF PAYMENT SECTION -->

                        <div class="form-group">
                            <label for="notes" class="control-label">Notes</label>
                            <textarea name="notes" id="notes" rows="4" class="form-control rounded-0" required></textarea>
                        </div>
                        <div class="checkout-btn text-right">
                            <button class="btn btn-primary btn-sm">Confirm Booking</button>
                        </div>
                    </form>
                </div>

                <div class="col-md-4">
                    <div class="row" id="summary">
                        <div class="col-12 border summary-item">
                            <h2 class="text-center mb-0">Summary</h2>
                        </div>
                        <?php
                        $gtotal = 0;
                        $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                        while ($vrow = $vendors->fetch_assoc()) :
                            $vtotal = $conn->query("SELECT sum(c.quantity * p.price * c.days) FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}'")->fetch_array()[0];
                            $vtotal = $vtotal > 0 ? $vtotal : 0;
                            $gtotal += $vtotal;
                            ?>
                            <div class="col-12 border item">
                                <!--
                                <b class="text-muted"><small><?= $vrow['code']." - ".$vrow['shop_name'] ?></small></b>
                                <div class="text-right"><b><?= format_num($vtotal) ?></b></div>
                                -->

                                <?php
                                // Fetch and display additional details for each product in the current vendor
                                $productsDetails = $conn->query("
                                    SELECT 
                                        c.*, 
                                        p.name as `name`, 
                                        p.price, 
                                        p.image_path, 
                                        p.vendor_id,
                                        cat.name as `category`,
                                        tt.travel_type_name,
                                        pt.payment_type_name as payment_type_name
                                    FROM 
                                        `cart_list` c 
                                    INNER JOIN 
                                        product_list p ON c.product_id = p.id
                                    INNER JOIN
                                        category_list cat ON p.category_id = cat.id
                                    INNER JOIN
                                        travel_type tt ON c.travel_type_id = tt.id
                                    LEFT JOIN
                                        payment_type pt ON c.payment_type_id = pt.id
                                    WHERE 
                                        c.client_id = '{$_settings->userdata('id')}' AND 
                                        p.vendor_id = '{$vrow['id']}'
                                "); 

                                while ($productDetails = $productsDetails->fetch_assoc()):
                                    $totalPerProduct = $productDetails['price'] * $productDetails['quantity'] * $productDetails['days'];

                                    // Output additional details
                                    ?>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Package Name:</small></div>
                                                <div><small><?= $productDetails['name'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Package Category:</small></div>
                                                <div><small><?= $productDetails['category'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Number of Travelers:</small></div>
                                                <div><small><?= $productDetails['quantity'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Travel Type:</small></div>
                                                <div><small><?= $productDetails['travel_type_name'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Travel Date:</small></div>
                                                <div><small><?= $productDetails['check_in'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Payment Type:</small></div>
                                                <div><small><?= $productDetails['payment_type_name'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Payment Amount:</small></div>
                                                <div><small><?= $productDetails['payment_amount'] ?></small></div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="d-flex justify-content-between">
                                                <div><small class="text-muted">Payment Method:</small></div>
                                                <div>
                                                    <?php
                                                    // Fetch the payment method name from the payments table based on payments_id
                                                    $paymentMethodQuery = $conn->query("SELECT name FROM payments WHERE id = '{$productDetails['payments_id']}'");
                                                    $paymentMethodName = $paymentMethodQuery->fetch_assoc()['name'];
                                                    
                                                    echo "<small>{$paymentMethodName}</small>";
                                                    ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endwhile; ?>
                            </div>
                        <?php endwhile; ?>
                        <div class="col-12 border total-section">
                            <b class="text-muted">Grand Total</b>
                            <div class="text-right h3"><b><?= format_num($gtotal) ?></b></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function displayImg(input, _this) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#payment_img').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);

            // Capture the selected file for submission
            _this.data('file', input.files[0]);
        } else {
            $('#payment_img').attr('src', '../uploads/default_payment_image.jpg');
        }
    }



    $('#checkout-form').submit(function (e) {
        e.preventDefault();
        var _this = $(this);
        if (_this[0].checkValidity() == false) {
            _this[0].reportValidity();
            return false;
        }
        if ($('#summary .item').length <= 0) {
            alert_toast("There is no order listed in the cart yet.", 'error');
            return false;
        }
        $('.pop_msg').remove();
        var el = $('<div>');
        el.addClass("alert alert-danger pop_msg");
        el.hide();
        start_loader();

        var formData = new FormData(_this[0]);
        var proofOfPaymentFile = _this.data('file');
        formData.append('proof_of_payment', proofOfPaymentFile);

        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=place_order',
            method: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            dataType: 'json',
            error: function (err) {
                console.error(err);
                alert_toast("An error occurred.", 'error');
                end_loader();
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    location.replace('./?page=products');
                } else if (!!resp.msg) {
                    el.text(resp.msg);
                    _this.prepend(el);
                    el.show('slow');
                    $('html,body').scrollTop(0);
                } else {
                    el.text("An error occurred.");
                    _this.prepend(el);
                    el.show('slow');
                    $('html,body').scrollTop(0);
                }
                end_loader();
            }
        });
    });

</script>





