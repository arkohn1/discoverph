<?php
require_once('./../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT o.*,v.agency_name,v.code as vcode from `booked_packages_list` o inner join agency_list v on o.agency_id = v.id where o.id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
?>
		<center>Unknown order</center>
		<style>
			#uni_modal .modal-footer{
				display:none
			}
		</style>
		<div class="text-right">
			<button class="btn btndefault bg-gradient-dark btn-flat" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
		</div>
		<?php
		exit;
		}
}
?>
<style>
    #uni_modal .modal-footer {
        display: none;
    }

    .order-details .row {
        margin-bottom: 1em;
    }

    .order-details .col {
        padding: 1em;
    }

    .order-details .col-3 {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
    }

    .order-details .col-9 span {
        font-weight: bold;
    }

    .order-details .col-9 .btn {
        height: auto;
    }

    .receipt-image {
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
        border-radius: 8px;
    }

    .spacer {
        margin-bottom: 0em;
    }

    .cancel-btn {
        background-color: #dc3545;
        color: #fff;
        border: 1px solid #dc3545;
    }

    .close-btn {
        background-color: #6c757d;
        color: #fff;
        border: 1px solid #6c757d;
    }

    /* Travel Agency Image Adjustments */
    .image-frame {
        max-width: 100%; /* Ensure the frame doesn't exceed the container width */
    }

    .image-frame img {
        width: 300%; /* Make the image fill the frame */
        height: auto; /* Maintain the aspect ratio */
        border-radius: 4px; /* Optional: Add border-radius for rounded corners */
        display: block; /* Remove any extra spacing below the image */
        margin-left: -150px; /* Center the image within the frame */

    }
</style>
<div class="container-fluid">
    <div class="row spacer">
        <div class="col-3 bg-primary"><span class="">Reference Code</span></div>
        <div class="col-9"><span class="font-weight-bolder"><?= isset($code) ? $code : '' ?></span></div>
        <div class="col-3 bg-primary"><span class="">Travel Agency</span></div>
        <div class="col-9"><span class="font-weight-bolder"><?= isset($agency_name) ? $agency_name : '' ?></span></div>
        <div class="col-3 bg-primary"><span class="">Notes</span></div>
        <div class="col-9"><span class="font-weight-bolder"><?= isset($notes) ? $notes : '' ?></span></div>
        <div class="col-3 bg-primary"><span class="">Booking Status</span></div>
        <div class="col-9"><span class="font-weight-bolder">
            <?php 
            $status = isset($status) ? $status : '';
                switch($status){
                    case 0:
                        echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Pending</span>';
                        break;
                    case 1:
                        echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Confirmed</span>';
                        break;
                    case 2:
                        echo '<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Done</span>';
                        break;
                    case 3:
                        echo '<span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Cancelled</span>';
                        break;
                    default:
                        echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
                        break;
                }
            ?>
        </div>
        <div class="col-3 bg-primary"><span class="">Payment Status</span></div>
        <div class="col-9"><span class="font-weight-bolder">
            <?php 
            $paymentStatus = isset($payment_status) ? $payment_status : '';
                switch($paymentStatus){
                    case 0:
                        echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Pending</span>';
                        break;
                    case 1:
                        echo '<span class="badge badge-success bg-gradient-success px-3 rounded-pill">Paid</span>';
                        break;
                    case '2':
                        echo '<span class="badge badge-success bg-gradient-warning px-3 rounded-pill">Down Payment</span>';
                        break;
                    default:
                        echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
                        break;
                }
            ?>
        </div>

        <div class="col-3 bg-primary"><span class="">Receipt</span></div>
        <div class="col-9">
            <!-- New button for uploading receipt -->
            <button class="btn btn-outline-success btn-sm mt-2" style="height: auto;" id="uploadReceiptBtn">
                <i class="fas fa-upload"></i> Upload Receipt
            </button>               

            <input type="file" id="receiptImageInput" style="display: none;">
            <div id="uploadSuccessMessage" style="display: none;"></div>

            <?php if (!empty($receipt)): ?>
                <button class="btn btn-outline-primary btn-sm mt-2" style="height: auto; "data-toggle="modal" data-target="#viewReceiptModal">
                    <i class="fas fa-receipt"></i> View Receipt
                </button>
            <?php else: ?>
                No receipt available
            <?php endif; ?>
        </div>

        <!-- Bootstrap Modal for Viewing Receipt -->
        <div class="modal fade" id="viewReceiptModal" tabindex="-1" role="dialog" aria-labelledby="viewReceiptModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-transparent" role="document">
                <div class="modal-content border-0 shadow-none" style="background: transparent;">
                    <div class="modal-body position-relative" style="text-align: center; padding: 0;" onclick="closeInnerModal()">
                        <button type="button" class="close position-absolute text-black" style="top: 50px; right: 50px; font-size: 2em; z-index: 2;" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <?php if (!empty($receipt)): ?>
                            <img src="<?= validate_image($receipt) ?>" alt="Receipt Image" class="img-fluid img-with-shadow" style="max-width: 95vw; max-height: 95vh; position: relative; z-index: 1;">
                        <?php else: ?>
                            No receipt available
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .img-with-shadow {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5); /* Adjust the shadow as needed */
                border-radius: 8px; /* Optional: Add border-radius for rounded corners */
            }
        </style>
        <script>
            function closeInnerModal() {
                $('#viewReceiptModal').modal('hide');
            }
        </script>
        <!-- Bootstrap Modal for Viewing Receipt -->
    </div>

    <div class="clear-fix mb-2"></div>
    <div id="order-list" class="row spacer">
        <?php 
            $gtotal = 0;
            $products = $conn->query("SELECT o.*, p.name as `name`, p.price, p.image_path, 
                o.number_of_traveler as number_of_traveler, o.days as days, o.check_in as check_in, o.check_out as check_out,
                pm.name as payment_method,
                ol.receipt as receipt,
                cat.name as `category`,
                tt.travel_type_name as travel_type_name,
                pt.payment_type_name as payment_type_name
                FROM `booked_packages` o 
                INNER JOIN package_list p ON o.package_id = p.id 
                LEFT JOIN payments pm ON o.payments_id = pm.id
                LEFT JOIN booked_packages_list ol ON o.booked_packages_id = ol.id
                LEFT JOIN category_list cat ON p.category_id = cat.id
                LEFT JOIN travel_type tt ON o.travel_type_id = tt.id
                LEFT JOIN payment_type pt ON o.payment_type_id = pt.id
                WHERE o.booked_packages_id='{$id}' 
                ORDER BY p.name ASC");

            while($prow = $products->fetch_assoc()):
                $total = $prow['price'] * $prow['number_of_traveler'] * $prow['days']; // Modify the calculation
                $gtotal += $total;
                ?>

            <div class="col-12 border">
                <div class="d-flex align-items-center p-2">
                    <div class="col-auto flex-shrink-1 flex-grow-1">
                        <h4><b><?= $prow['name'] ?></b></h4>
                        <!-- Additional details -->
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Category: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <!-- Modify this line to display category instead of category_id -->
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['category'] ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Price: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= format_num($prow['price']) ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Number of Travelers: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['number_of_traveler'] ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Travel Date: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['check_in'] ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Travel Type: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['travel_type_name'] ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Payment Type: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <!-- Modify this line to display payment_type_name instead of payment_type_id -->
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['payment_type_name'] ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Payment Amount: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= format_num($prow['payment_amount']) ?></small></p>
                            </div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Payment Method: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1">
                                <p class="m-0 pl-3"><small class="text-primary"><?= $prow['payment_method'] ?></small></p>
                            </div>
                        </div>
                        <!-- End additional details -->
                    </div>
                    <div class="col-2 text-center image-frame">
                        <a href="./?page=packages/view_package&id=<?= $prow['package_id'] ?>" target="_blank">
                            <img src="<?= validate_image($prow['image_path']) ?>" alt="" class="img-center prod-img border bg-gradient-gray">
                        </a>
                    </div>
                </div>
            </div>
        <?php endwhile; ?>

        <div class="col-12 border">
            <div class="d-flex">
                <div class="col-9 h4 font-weight-bold text-right text-muted">Total</div>
                <div class="col-3 h4 font-weight-bold text-right"><?= format_num($gtotal) ?></div>
            </div>  
        </div>
    </div>
    <div class="clear-fix mb-3"></div>
    <div class="text-right">
        <?php if(isset($status) && $status == 0): ?>
            <button class="btn cancel-btn" type="button" id="cancel_order">Cancel Booking</button>
        <?php endif; ?>
            <button class="btn close-btn" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
    </div>
</div>

<script>
    $(function () {
        $('#cancel_order').click(function () {
            _conf("Are you sure to cancel this order?", "cancel_order", ['<?= isset($id) ? $id : '' ?>'])
        })
    })
    function cancel_order($id){
        start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=cancel_order",
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

    $(document).ready(function () {
        $(document).off('click', '#cancel_order').on('click', '#cancel_order', function () {
            _conf("Are you sure to cancel this order?", "cancel_order", ['<?= isset($id) ? $id : '' ?>']);
        });

        $(document).off('click', '#uploadReceiptBtn').on('click', '#uploadReceiptBtn', function () {
            // Assuming you have the order ID stored in a variable named orderId
            var orderId = <?= isset($id) ? $id : 0 ?>;
            // Trigger file input click to open the file dialog
            $('#receiptImageInput').click();
        });

        $(document).off('change', '#receiptImageInput').on('change', '#receiptImageInput', function () {
            handleReceiptChange();
        });

        function handleReceiptChange() {
            // Assuming you have the order ID stored in a variable named orderId
            var orderId = <?= isset($id) ? $id : 0 ?>;
            // Get the selected file
            var receiptImage = $('#receiptImageInput')[0].files[0];

            // Check if a file is selected
            if (receiptImage) {
                // Create FormData to send file and order ID to the server
                var formData = new FormData();
                formData.append('booked_packages_id', orderId);
                formData.append('receipt_image', receiptImage);

                // Perform AJAX to upload the receipt image
                $.ajax({
                    url: _base_url_ + "classes/Master.php?f=upload_receipt_image",
                    method: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: "json",
                    beforeSend: function () {
                        start_loader();
                    },
                    success: function (resp) {
                        end_loader();
                        if (resp.status == 'success') {
                            // Handle success if needed
                            alert_toast("Receipt uploaded successfully.", 'success');
                            // Reload the page or update the UI as needed
                            location.reload();
                        } else if (!!resp.msg) {
                            // Handle specific error message if needed
                            alert_toast(resp.msg, 'error');
                        } else {
                            // Handle generic error if needed
                            alert_toast("Error uploading receipt image.", 'error');
                        }
                    },
                    error: function (err) {
                        console.log(err);
                        end_loader();
                        alert_toast("An error occurred.", 'error');
                    }
                });
            }
        }

        function cancel_order($id) {
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=cancel_order",
                method: "POST",
                data: { id: $id },
                dataType: "json",
                error: err => {
                    console.log(err);
                    alert_toast("An error occurred.", 'error');
                    end_loader();
                },
                success: function (resp) {
                    if (typeof resp == 'object' && resp.status == 'success') {
                        location.reload();
                    } else {
                        alert_toast("An error occurred.", 'error');
                        end_loader();
                    }
                }
            });
        }
    });
</script>
