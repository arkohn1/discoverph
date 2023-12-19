<?php 
require_once('../../config.php');
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM `message_list` where id ='{$_GET['id']}' ");
    if($qry->num_rows > 0 ){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k)){
                $$k=$v;
            }
        }
        if(isset($id) && isset($status) && $status != 1)
        $conn->query("UPDATE `message_list` set status = 1 where id = '{$id}'");
    }
}
?>
<style>
    #uni_modal .modal-content>.modal-footer{
        display:none;
    }

    .close-btn {
        background-color: #6c757d;
        color: #fff;
        border: 1px solid #6c757d;
    }
</style>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6">
                    <dt class="text-primary">Date</dt>
                    <dd><?= isset($date_created) ? date('M d, Y - h:i A', strtotime($date_created)) : "" ?></dd>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <dt class="text-primary">Name</dt>
                    <dd><?= isset($fullname) ? $fullname : "" ?></dd>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <dt class="text-primary">Email</dt>
                    <dd><?= isset($email) ? $email : "" ?></dd>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <dt class="text-primary">Contact</dt>
                    <dd><?= isset($contact) ? $contact : "" ?></dd>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <dt class="text-primary">Message</dt>
                    <dd><?= isset($message) ? $message : "" ?></dd>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-right">
            <button class="btn close-btn" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
        </div>
    </div>
</div>
