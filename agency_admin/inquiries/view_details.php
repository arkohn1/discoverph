<?php
require_once('../../config.php');
if(isset($_GET['id'])){
    $qry = $conn->query("SELECT * FROM `inquiries` where id ='{$_GET['id']}' ");
    if($qry->num_rows > 0 ){
        $res = $qry->fetch_array();
        foreach($res as $k => $v){
            if(!is_numeric($k)){
                $$k=$v;
            }
        }
        if(isset($id) && isset($status) && $status != 1)
            $conn->query("UPDATE `inquiries` set status = 1 where id = '{$id}'");
    }
}
?>
<style>
    #uni_modal .modal-content>.modal-footer{
        display:none;
    }
</style>
<?php
    // Assume $id is the inquiry ID you want to view
    $id = $_GET['id'];

    // Fetch details for the specific inquiry
    $qry = $conn->query("
        SELECT i.*, p.name AS product_name, c.firstname, c.middlename, c.lastname, c.email, c.contact
        FROM `inquiries` i
        LEFT JOIN `package_list` p ON i.package_id = p.id
        LEFT JOIN `traveler_list` c ON i.traveler_id = c.id
        WHERE i.id = '$id'
    ");

    if ($qry) {
        $row = $qry->fetch_assoc();
        if ($row) {
            $i = 1;
            $date_created = date('M d, Y - h:i A', strtotime($row['date_created']));
            $fullname = ucwords("{$row['firstname']} {$row['middlename']} {$row['lastname']}");
            $product_name = ucwords($row['product_name']);
            $subject = $row['subject'];
            $message = $row['message'];
            $email = $row['email'];
            $contact = $row['contact'];
            $status = ($row['status'] == 1) ? '<span class="badge badge-pill badge-success">Read</span>' : '<span class="badge badge-pill badge-primary">Unread</span>';
            ?>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <dt class="text-primary">Date</dt>
                                <dd><?= isset($date_created) ? $date_created : "" ?></dd>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <dt class="text-primary">Package</dt>
                                <dd><?= isset($product_name) ? $product_name : "" ?></dd>
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
                            <div class="col-md-6">
                                <dt class="text-primary">Subject</dt>
                                <dd><?= isset($subject) ? $subject : "" ?></dd>
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
            </div>

    <?php
        }
    }
    ?>
    <div class="row">
        <div class="col-12 text-right">
            <button class="btn btn-flat btn-sm btn-dark" type="button" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
        </div>
    </div>
</div>
