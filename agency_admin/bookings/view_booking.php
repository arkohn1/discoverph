<?php
require_once('./../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT o.*,c.code as ccode, CONCAT(c.lastname, ', ',c.firstname,' ',COALESCE(c.middlename,'')) as client from `booked_packages_list` o inner join traveler_list c on o.traveler_id = c.id where o.id = '{$_GET['id']}' ");
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
	#uni_modal .modal-footer{
		display:none
	}
    .prod-img{
        width:calc(100%);
        height:auto;
        max-height: 10em;
        object-fit:scale-down;
        object-position:center center
    }
        .spacer {
        margin-bottom: 0em;
    }
</style>
<div class="container-fluid">
	<div class="row spacer">
        <div class="col-3 bg-primary"><span class="">Reference Code</span></div>
        <div class="col-9"><span class="font-weight-bolder"><?= isset($code) ? $code : '' ?></span></div>
        <div class="col-3  bg-primary"><span class="">Traveler Name</span></div>
        <div class="col-9 "><span class="font-weight-bolder"><?= isset($client) ? $client : '' ?></span></div>
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
            <?php if ($status != 5): ?>
                <span class="pl-2">
                    <a href="javascript:void(0)" id="update_status" class="btn btn-sm">
                        <i class="fas fa-edit"></i> Update Booking Status
                    </a>
                </span>
            <?php endif; ?>
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
                    case 2:
                        echo '<span class="badge badge-success bg-gradient-warning px-3 rounded-pill">Down Payment</span>';
                        break;
                    default:
                        echo '<span class="badge badge-light bg-gradient-light border px-3 rounded-pill">N/A</span>';
                        break;
                }
            ?>
            <?php if ($status != 5): ?>
                <span class="pl-2">
                    <a href="javascript:void(0)" id="update_payment_status" class="btn btn-sm">
                        <i class="fas fa-edit"></i> Update Payment Status
                    </a>
                </span>
            <?php endif; ?>
        </div>

        <div class="col-3 bg-primary"><span class="">Receipt</span></div>
        <div class="col-9">
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
                        <a href="../?page=packages/view_package&id=<?= $prow['package_id'] ?>"  target="_blank">
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
		<button class="btn btn-default bg-gradient-dark text-light btn-sm btn-flat" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
	</div>
</div>
<script>
$(document).ready(function () {
    // Flag to determine whether to refresh the main modal
    var refreshMainModal = false;

    // Function to open the modal and update dropdown options
    function openModal(title, url) {
        uni_modal_second(title, url);
        $('#uni_modal_second').on('shown.bs.modal', function () {
            updateDropdownOptions();
            attachModalEventListeners(); // Attach event listeners each time the modal is shown
        });

        // Listen for the modal hide event
        $('#uni_modal_second').on('hidden.bs.modal', function () {
            // Check if the main modal should be refreshed
            if (refreshMainModal) {
                // Reload the current page
                location.reload();
            }
        });

        // Stop the propagation of click events on the nested modal
        $('#uni_modal_second').on('click', function (e) {
            e.stopPropagation();
        });
    }

    // Event listener for 'Update Order Status' button
    $(document).on('click', '#update_status', function () {
        openModal("Update Booking Status - <b><?= isset($code) ? $code : '' ?></b>", "bookings/update_status.php?id=<?= isset($id) ? $id : '' ?>");
    });

    // Event listener for 'Update Payment Status' button
    $(document).on('click', '#update_payment_status', function () {
        openModal("Update Payment Status - <b><?= isset($code) ? $code : '' ?></b>", "bookings/update_payment_status.php?id=<?= isset($id) ? $id : '' ?>");
    });

    // Event listener for the cancel button inside the nested modal
    $(document).on('click', '#cancel_button_inside_modal', function () {
        // Set the flag to true to indicate that the main modal should be refreshed
        refreshMainModal = true;
        // Close the nested modal
        $('#uni_modal_second').modal('hide');
    });

    // Function to attach event listeners inside the modal
    function attachModalEventListeners() {
        // Add any additional event listeners you need here
    }
});

</script>
