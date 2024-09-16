<style>
    .badge {
        font-size: 0.8rem;
        padding: 0.3rem 0.75rem;
        border-radius: 0.375rem;
    }
</style>
<!-- <div class="content py-3"> -->
    <div class="card card-primary rounded-0 shadow">
        <div class="card-header">
            <h5 class="card-title">Booking and Reservations</h5>
        </div>
        <div class="card-body">
            <div class="w-100 overflow-auto">
            <table class="table table-bordered table-striped">
            <colgroup>
                    <col width="5%">
                    <col width="20%">
                    <col width="20%">
                    <col width="15%">
                    <col width="20%">
                    <col width="20%">
                    <col width="5%">
                </colgroup>
                <thead>
                    <tr class="bg-secondary">
                        <th>#</th>
                        <th>Date Booked</th>
                        <th>Ref. Code</th>
                        <th>Total Amount</th>
                        <th>Booking Status</th>
                        <th>Payment Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                    $i = 1;
                    $orders = $conn->query("SELECT * FROM `booked_packages_list` order by `status` asc,unix_timestamp(date_created) desc ");
                    while($row = $orders->fetch_assoc()):
                    ?>
                    <tr>
                    <td class="px-2 py-1 align-middle text-center"><?= $i++; ?></td>
                        <td class="px-2 py-1 align-middle"><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
                        <td class="px-2 py-1 align-middle"><?= $row['code'] ?></td>
                        <td class="px-2 py-1 align-middle text-right">₱<?= format_num($row['total_amount']) ?></td>
                        <td class="px-2 py-1 align-middle text-center">
                            <?php 
                                switch($row['status']){
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
                        </td>
                        <td class="px-2 py-1 align-middle text-center">
                            <?php 
                                // Fetch and display Payment Status from the database
                                switch($row['payment_status']){
                                    case '0':
                                        echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Pending</span>';
                                        break;
                                    case '1':
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
                        </td>
                        <td class="px-2 py-1 align-middle text-center">
                            <button type="button" class="btn btn-flat border btn-light btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                Action
                            <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <div class="dropdown-menu" role="menu">
                                <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?= $row['id'] ?>" data-code="<?= $row['code'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
                            </div>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
            </div>
        </div>
    </div>
<!-- </div> -->
<script>
    $(function(){
        $('.view_data').click(function(){
            uni_modal("View Booking Details - <b>"+($(this).attr('data-code'))+"</b>","bookings/view_booking.php?id="+$(this).attr('data-id'),'mid-large')
        })
        $('table').dataTable();
    })
</script>