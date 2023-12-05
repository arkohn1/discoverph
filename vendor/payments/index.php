<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<style>
    .product-img {
        width: calc(100%);
        height: auto;
        max-width: 5em;
        object-fit: scale-down;
        object-position: center center;
    }

    td, th {
        vertical-align: middle;
    }

    /* Target cells in the QR code column */
    td.qr-code-cell {
        text-align: center; /* Optional: Center the text horizontally as well */
    }
</style>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">Payment Methods</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" class="btn btn-flat btn-primary" id="create_new"><span class="fas fa-plus"></span>  Create New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr class="bg-gradient-secondary">
						<th>#</th>
						<th>Date Created</th>
						<th>Payment Method</th>
						<th>Details</th>
						<th>QR Code</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `payments` where delete_flag = 0 and `agency_id` = '{$_settings->userdata('id')}' order by `name` asc ");
						while($row = $qry->fetch_assoc()):
					?>
						<tr>
							<td class="text-center"><?php echo $i++; ?></td>
							<td><?php echo date("Y-m-d H:i",strtotime($row['date_created'])) ?></td>
							<td><?php echo $row['name'] ?></td>
							<td><p class="m-0 truncate-1"><?php echo $row['description'] ?></p></td>
							<td class="text-center qr-code-cell">
								<?php if (!empty($row['qr_code'])): ?>
									<img src="<?= validate_image($row['qr_code']) ?>" alt="QR Code" class="border border-gray img-thumbnail product-img">
								<?php else: ?>
									<img src="../uploads/qr/sample.jpg" alt="Placeholder" class="border border-gray img-thumbnail product-img">
								<?php endif; ?>
							</td>							
							<td class="text-center">
                                <?php if($row['status'] == 1): ?>
                                    <span class="badge badge-success bg-gradient-success px-3 rounded-pill">Active</span>
                                <?php else: ?>
                                    <span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Inactive</span>
                                <?php endif; ?>
                            </td>
							<td align="center">
								 <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
				                  		Action
				                    <span class="sr-only">Toggle Dropdown</span>
				                  </button>
				                  <div class="dropdown-menu" role="menu">
				                    <a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
				                    <div class="dropdown-divider"></div>
				                    <a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
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
</div>
<script>
    $(document).ready(function(){
        $('#create_new').click(function(){
            uni_modal('Add New Payment Method',"payments/manage_payment.php")
        })

        $('.view_data').click(function(){
            uni_modal('View Payment Details',"payments/view_payment.php?id="+$(this).attr('data-id'))
        })

        $('.edit_data').click(function(){
            uni_modal('Update Payment',"payments/manage_payment.php?id="+$(this).attr('data-id'))
        })

        $('.delete_data').click(function(){
            _conf("Are you sure to delete this Payment method permanently?","delete_payment",[$(this).attr('data-id')])
        })

        $('table th, table td').addClass('align-middle px-2 py-1')
        $('.table').dataTable();
    })

    function delete_payment($id){
        start_loader();
        $.ajax({
            url:_base_url_+"classes/Master.php?f=delete_payment",
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
                } else {
                    alert_toast("An error occured.",'error');
                    end_loader();
                }
            }
        })
    }
</script>