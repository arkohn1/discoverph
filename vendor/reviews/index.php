<style>
    .img-avatar {
        width: 45px;
        height: 45px;
        object-fit: cover;
        object-position: center center;
        border-radius: 100%;
    }
</style>

<div class="card card-outline card-info rounded-0">
    <div class="card-header">
        <h3 class="card-title">List of Ratings & Reviews</h3>
    </div>
    <div class="card-body">
        <div class="container-fluid">
            <table class="table table-hover table-striped">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <col width="20%">
                    <col width="15%">
                    <col width="10%">
                </colgroup>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Package</th>
                        <th>Name</th>
                        <th>Rating</th>
                        <th>Review</th>
                        <th>Date & Time</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <?php
                    $i = 1;
                    $agency_id = 'admin_agency_id'; // Replace 'admin_agency_id' with the actual agency_id of the admin
                    $qry = $conn->query("
                        SELECT i.*, p.name AS product_name, c.firstname, c.middlename, c.lastname
                        FROM `ratings_reviews` i
                        LEFT JOIN `package_list` p ON i.package_id = p.id
                        LEFT JOIN `traveler_list` c ON i.traveler_id = c.id
						WHERE i.agency_id = '{$_settings->userdata('id')}'
                        ORDER BY i.status ASC, unix_timestamp(i.date_created) DESC
                    ");
                    while ($row = $qry->fetch_assoc()) :
                ?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo ucwords($row['product_name']) ?></td>
							<td><?php echo ucwords("{$row['firstname']} {$row['middlename']} {$row['lastname']}") ?></td>
							<td>
								<?php
								// Display stars based on the rating
								for ($j = 1; $j <= 5; $j++) {
									if ($j <= $row['rating']) {
										// Output a colored star for each filled star
										echo '<span style="color: gold;">&#9733;</span>';
									} else {
										// Output an empty star for each unfilled star
										echo '<span>&#9733;</span>';
									}
								}
								?>
							</td>
							<td class="truncate-1"><?php echo ($row['review']) ?></td>
							<td class="text-center"><?php echo date('M d, Y - h:i A', strtotime($row['date_created'])); ?></td>

							<td class="text-center">
								<?php if ($row['status'] == 1) : ?>
									<span class="badge badge-pill badge-success">Read</span>
								<?php else : ?>
									<span class="badge badge-pill badge-primary">Unread</span>
								<?php endif; ?>
							</td>
							<td align="center">
								<button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
									Action
									<span class="sr-only">Toggle Dropdown</span>
								</button>
								<div class="dropdown-menu" role="menu">
									<a class="dropdown-item view_details" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
								</div>
							</td>
						</tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.delete_data').click(function () {
            _conf("Are you sure to delete this review permanently?", "delete_reviews", [$(this).attr('data-id')])
        })
        $('.table td,.table th').addClass('py-1 px-2 align-middle')
        $('.view_details').click(function () {
            uni_modal('Review Details', "reviews/view_details.php?id=" + $(this).attr('data-id'), 'mid-large')
        })
        $('.table').dataTable();
        $('#uni_modal').on('hide.bs.modal', function () {
            location.reload()
        })
    })

    function delete_reviews($id) {
        start_loader();
        $.ajax({
            url: _base_url_ + "classes/Master.php?f=delete_reviews",
            method: "POST",
            data: {
                id: $id
            },
            dataType: "json",
            error: err => {
                console.log(err)
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
        })
    }

	function verify_user($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Users.php?f=verify_inquiries",
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
</script>
