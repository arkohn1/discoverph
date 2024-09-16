<?php
require_once('./../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `rooms` where id = '{$_GET['id']}' and delete_flag = 0 ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
?>
		<center>Unknown Category</center>
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

	.close-btn {
        background-color: #6c757d;
        color: #fff;
        border: 1px solid #6c757d;
    }
</style>
<div class="container-fluid">
	<dl>
        <dt class="text-muted">Room Name/Number</dt>
        <dd class="pl-3"><?= isset($name) ? $name : "" ?></dd>
        <dt class="text-muted">Category</dt>
        <dd class="pl-3"><?= isset($package_category) ? $package_category : "" ?></dd>
		<dt class="text-muted">Description</dt>
        <dd class="pl-3"><?= isset($description) ? $description : "" ?></dd>
        <dt class="text-muted">Status</dt>
        <dd class="pl-3">
            <?php if($status == 1): ?>
                <span class="badge badge-success bg-gradient-success px-3 rounded-pill">Available</span>
            <?php else: ?>
                <span class="badge badge-danger bg-gradient-danger px-3 rounded-pill">Taken</span>
            <?php endif; ?>
        </dd>
    </dl>
	<div class="clear-fix mb-3"></div>
	<div class="text-right">
		<button class="btn close-btn" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
	</div>
</div>
