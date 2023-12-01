<?php
require_once('../config.php');
Class Master extends DBConnection {
	private $settings;
	public function __construct(){
		global $_settings;
		$this->settings = $_settings;
		parent::__construct();
	}
	public function __destruct(){
		parent::__destruct();
	}
	function capture_err(){
		if(!$this->conn->error)
			return false;
		else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
			return json_encode($resp);
			exit;
		}
	}
	function save_message(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!is_numeric($v))
					$v = $this->conn->real_escape_string($v);
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$v}' ";
			}
		}
		if(empty($id)){
			$sql = "INSERT INTO `message_list` set {$data} ";
		}else{
			$sql = "UPDATE `message_list` set {$data} where id = '{$id}' ";
		}
		
		$save = $this->conn->query($sql);
		if($save){
			$rid = !empty($id) ? $id : $this->conn->insert_id;
			$resp['status'] = 'success';
			if(empty($id))
				$resp['msg'] = "Your message has successfully sent.";
			else
				$resp['msg'] = "Message details has been updated successfully.";
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occured.";
			$resp['err'] = $this->conn->error."[{$sql}]";
		}
		if($resp['status'] =='success' && !empty($id))
		$this->settings->set_flashdata('success',$resp['msg']);
		if($resp['status'] =='success' && empty($id))
		$this->settings->set_flashdata('pop_msg',$resp['msg']);
		return json_encode($resp);
	}
	function delete_message(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `message_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Message has been deleted successfully.");

		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}

	function save_inquiry(){
		extract($_POST);
	
		// Assuming you have these fields in your HTML form
		$client_id = $this->settings->userdata('id');
		$product_id = $this->conn->real_escape_string($product_id);
		$vendor_id = ''; // Initialize vendor_id
	
		// Fetch vendor_id based on product_id
		$vendorQry = $this->conn->query("SELECT vendor_id FROM product_list WHERE id = '$product_id' LIMIT 1");
		if ($vendorQry->num_rows > 0) {
			$vendorData = $vendorQry->fetch_assoc();
			$vendor_id = $vendorData['vendor_id'];
		}
	
		$subject = $this->conn->real_escape_string($inquireSubject);
		$message = $this->conn->real_escape_string($inquireMessage);
		$status = 'Pending';
		$date_created = date('Y-m-d H:i:s');
	
		$sql = "INSERT INTO `inquiries` (`client_id`, `vendor_id`, `product_id`, `subject`, `message`, `status`, `date_created`)
				VALUES ('$client_id', '$vendor_id', '$product_id', '$subject', '$message', '$status', '$date_created')";
	
		$save = $this->conn->query($sql);
	
		if ($save) {
			$resp['status'] = 'success';
			$resp['msg'] = "Your inquiry has been successfully sent.";
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "An error occurred.";
			$resp['err'] = $this->conn->error . " [{$sql}]";
		}
	
		return json_encode($resp);
	}
	
	function delete_inquiry(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `inquiries` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Message has been deleted successfully.");

		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}

	// Add this function to your Master.php file
	function save_reviews(){
		extract($_POST);

		// Assuming you have these fields in your HTML form
		$client_id = $this->settings->userdata('id');
		$product_id = $this->conn->real_escape_string($product_id_review);
		$vendor_id = ''; // Initialize vendor_id

		// Fetch vendor_id based on product_id
		$vendorQry = $this->conn->query("SELECT vendor_id FROM product_list WHERE id = '$product_id' LIMIT 1");
		if ($vendorQry->num_rows > 0) {
			$vendorData = $vendorQry->fetch_assoc();
			$vendor_id = $vendorData['vendor_id'];
		}

		$review = $this->conn->real_escape_string($review);
		$rating = intval($rating); // Ensure rating is an integer
		$date_created = date('Y-m-d H:i:s');

		$sql = "INSERT INTO `ratings_reviews` (`client_id`, `vendor_id`, `product_id`, `rating`, `review`, `date_created`)
				VALUES ('$client_id', '$vendor_id', '$product_id', '$rating', '$review', '$date_created')";

		$save = $this->conn->query($sql);

		if ($save) {
			$resp['status'] = 'success';
			$resp['msg'] = "Your review has been successfully submitted.";
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = "Please Log In first.";
			$resp['err'] = $this->conn->error . " [{$sql}]"; // Log the error
		}

		return json_encode($resp);
	}

	function delete_reviews(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `ratings_reviews` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success',"Message has been deleted successfully.");

		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}

	function save_shop_type(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
		
		$check = $this->conn->query("SELECT * FROM `shop_type_list` where `name` = '{$name}' and delete_flag = 0 ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = "Shop Type already exists.";
		}else{
			if(empty($id)){
				$sql = "INSERT INTO `shop_type_list` set {$data} ";
			}else{
				$sql = "UPDATE `shop_type_list` set {$data} where id = '{$id}' ";
			}
			$save = $this->conn->query($sql);
			if($save){
				$resp['status'] = 'success';
				if(empty($id))
				$resp['msg'] = " New Shop Type successfully saved.";
				else
				$resp['msg'] = " Shop Type successfully updated.";
			}else{
				$resp['status'] = 'failed';
				$resp['err'] = $this->conn->error."[{$sql}]";
			}
		}
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}
	function delete_shop_type(){
		extract($_POST);
		$del = $this->conn->query("UPDATE `shop_type_list` set delete_flag = 1 where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Shop Type successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}
	function save_category(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
		
		$check = $this->conn->query("SELECT * FROM `category_list` where `name` = '{$name}' and vendor_id = '{$vendor_id}' and delete_flag = 0 ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = " Category already exists.";
		}else{
			if(empty($id)){
				$sql = "INSERT INTO `category_list` set {$data} ";
			}else{
				$sql = "UPDATE `category_list` set {$data} where id = '{$id}' ";
			}
			$save = $this->conn->query($sql);
			if($save){
				$resp['status'] = 'success';
				if(empty($id))
				$resp['msg'] = " New Category successfully saved.";
				else
				$resp['msg'] = " Category successfully updated.";
			}else{
				$resp['status'] = 'failed';
				$resp['err'] = $this->conn->error."[{$sql}]";
			}
		}
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}
	function delete_category(){
		extract($_POST);
		$del = $this->conn->query("UPDATE `category_list` set delete_flag = 1 where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Category successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	function save_room(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
		
		$check = $this->conn->query("SELECT * FROM `rooms` where `name` = '{$name}' and vendor_id = '{$vendor_id}' and delete_flag = 0 ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = " Room already exists.";
		}else{
			if(empty($id)){
				$sql = "INSERT INTO `rooms` set {$data} ";
			}else{
				$sql = "UPDATE `rooms` set {$data} where id = '{$id}' ";
			}
			$save = $this->conn->query($sql);
			if($save){
				$resp['status'] = 'success';
				if(empty($id))
				$resp['msg'] = " New Room successfully saved.";
				else
				$resp['msg'] = " Room successfully updated.";
			}else{
				$resp['status'] = 'failed';
				$resp['err'] = $this->conn->error."[{$sql}]";
			}
		}
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}
	function delete_seat(){
		extract($_POST);
		$del = $this->conn->query("UPDATE `rooms` set delete_flag = 1 where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Room successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}

	function save_product(){
		$_POST['description'] = htmlentities($_POST['description']);
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
		$check = $this->conn->query("SELECT * FROM `product_list` where vendor_id = '{$vendor_id}' and `name` = '{$name}' and delete_flag = 0 ".(!empty($id) ? " and id != '{$id}'" : ""))->num_rows;
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = ' Package Name Already exists.';
		}else{
			if(empty($id)){
				$sql = "INSERT INTO `product_list` set {$data} ";
			}else{
				$sql = "UPDATE `product_list` set {$data} where id = '{$id}' ";
			}
			$save = $this->conn->query($sql);
			if($save){
				$pid = empty($id) ? $this->conn->insert_id : $id;
				$resp['pid'] = $pid;
				$resp['status'] = 'success';
				if(empty($id))
					$resp['msg'] = " New Package successfully saved.";
				else
					$resp['msg'] = " Package successfully updated.";
				
				// Handle Gallery Image Upload
				if (isset($_FILES['gallery']) && !empty($_FILES['gallery']['tmp_name'][0])) {
					$gallery_images = [];
					foreach ($_FILES['gallery']['tmp_name'] as $key => $tmp_name) {
						$upload = $tmp_name;
						$type = mime_content_type($upload);
						$allowed = array('image/png', 'image/jpeg');

						if (in_array($type, $allowed)) {
							list($width, $height) = getimagesize($upload);
							$new_height = $height;
							$new_width = $width;
							$t_image = imagecreatetruecolor($new_width, $new_height);
							imagealphablending($t_image, false);
							imagesavealpha($t_image, true);
							$gdImg = ($type == 'image/png') ? imagecreatefrompng($upload) : imagecreatefromjpeg($upload);
							imagecopyresampled($t_image, $gdImg, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

							$fname = 'uploads/products/' . $pid . '_gallery_' . $key . '.png';
							$dir_path = base_app . $fname;

							if ($gdImg) {
								if (is_file($dir_path)) {
									unlink($dir_path);
								}
								$uploaded_img = imagepng($t_image, $dir_path);
								imagedestroy($gdImg);
								imagedestroy($t_image);
								if (isset($uploaded_img) && $uploaded_img == true) {
									$gallery_images[] = $fname;
								}
							} else {
								$resp['msg'] = " But Image failed to upload due to unknown reason.";
							}
						} else {
							$resp['msg'] = " But Image failed to upload due to invalid file type.";
						}
					}

					if (!empty($gallery_images)) {
						$gallery_path = implode(',', $gallery_images);
						$qry = $this->conn->query("UPDATE `product_list` SET gallery_path = '{$gallery_path}' WHERE id = '$pid'");
					}
				}
				// Handle Travel Agency Image Upload
				if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
					if (!is_dir(base_app . "uploads/products")) {
						mkdir(base_app . "uploads/products");
					}
					$fname = 'uploads/products/' . ($pid) . '.png';
					$dir_path = base_app . $fname;
					$upload = $_FILES['img']['tmp_name'];
					$type = mime_content_type($upload);
					$allowed = array('image/png', 'image/jpeg');
			
					if (!in_array($type, $allowed)) {
						$resp['msg'] .= " Image failed to upload due to an invalid file type.";
					} else {
						list($width, $height) = getimagesize($upload);
						$new_height = $height;
						$new_width = $width;
						$t_image = imagecreatetruecolor($new_width, $new_height);
						imagealphablending($t_image, false);
						imagesavealpha($t_image, true);
						$gdImg = ($type == 'image/png') ? imagecreatefrompng($upload) : imagecreatefromjpeg($upload);
						imagecopyresampled($t_image, $gdImg, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
			
						if ($gdImg) {
							if (is_file($dir_path)) {
								unlink($dir_path);
							}
							$uploaded_img = imagepng($t_image, $dir_path);
							imagedestroy($gdImg);
							imagedestroy($t_image);
							if (isset($uploaded_img) && $uploaded_img == true) {
								$qry = $this->conn->query("UPDATE `product_list` set image_path = '{$fname}' where id = '$pid'");
							}
						} else {
							$resp['msg'] .= " Image failed to upload due to an unknown reason.";
						}
					}
				}	
			}		
			else{
				$resp['status'] = 'failed';
				if(empty($id))
					$resp['msg'] = " Package has failed to save.";
				else
					$resp['msg'] = " Package has failed to update.";
				$resp['err'] = $this->conn->error."[{$sql}]";
			}
		}

		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}

	function delete_product(){
		extract($_POST);
		$del = $this->conn->query("UPDATE `product_list` set `delete_flag` = 1 where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Package successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);

	}

	function add_to_cart() {
		// Set the payments_id to a default value or retrieve it from some source
		$payments_id = 'default_value'; // Adjust this line as needed
	
		$_POST['client_id'] = $this->settings->userdata('id');
		extract($_POST);
		$data = "";
	
		foreach ($_POST as $k => $v) {
			// Exclude 'quantity' from being included in $data
			if (!in_array($k, array('id', 'quantity'))) {
				if (!empty($data)) $data .= ",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
	
		$check = $this->conn->query("SELECT * FROM cart_list where product_id = '{$product_id}' && client_id = '{$client_id}'")->num_rows;
	
		if ($check > 0) {
			// If the item already exists in the cart, do nothing (quantity remains unchanged)
			$resp['status'] = 'success';
			$resp['msg'] = " Number of Traveler(s) Confirmed.";
		} else {
			// If the item is not in the cart, insert it with quantity set to 1
			$sql = "INSERT INTO cart_list SET {$data}, `payments_id` = NULL, `quantity` = 1";
			$save = $this->conn->query($sql);
	
			if ($save) {
				$resp['status'] = 'success';
				$resp['msg'] = " Number of Traveler(s) Confirmed.";
			} else {
				$resp['status'] = 'failed';
				$resp['msg'] = " The package has failed to add to the checkout.";
				$resp['error'] = $this->conn->error . "[{$sql}]";
			}
		}
	
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}
	
		return json_encode($resp);
	}

	function update_cart_qty(){
		extract($_POST);
		$update_cart = $this->conn->query("UPDATE `cart_list` set `quantity` = '{$quantity}' where id = '{$cart_id}'");
		if($update_cart){
			$resp['status'] = 'success';
			$resp['msg'] = ' Number of Traveler(s) Updated';
		}else{
			$resp['status'] = 'success';
			$resp['msg'] = ' Number of Traveler(s) has failed to update';
			$resp['error'] = $this->conn->error;
		}
		
		if($resp['status'] == 'success')
		$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}

	function update_cart_dates(){
		extract($_POST);
	
		$update_dates = $this->conn->query("UPDATE `cart_list` SET `check_in` = '{$check_in_date}' WHERE id = '{$cart_id}'");
	
		if ($update_dates) {
			$resp['status'] = 'success';
			$resp['msg'] = 'Travel date updated successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to update Travel date';
			$resp['error'] = $this->conn->error;
		}
	
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}
	
		return json_encode($resp);
	}

	function update_cart_total_days() {
		extract($_POST);
		
		// Use the correct variable names
		$update_days = $this->conn->query("UPDATE `cart_list` SET `days` = '{$total_days}' WHERE id = '{$prod_id}'");
	
		if ($update_days) {
			$resp['status'] = 'success';
			$resp['msg'] = 'Total days updated successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to update total days';
			$resp['error'] = $this->conn->error;
		}
	
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}
	
		echo json_encode($resp);
	}

	function update_payment_method(){
		extract($_POST);

		$updateMethod = $this->conn->query("UPDATE `cart_list` SET `payments_id` = '{$payments_id}' WHERE id = '{$prod_id}'");

		if ($updateMethod) {
			$resp['status'] = 'success';
			$resp['msg'] = 'Payment method updated successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to update payment method';
			$resp['error'] = $this->conn->error;
		}

		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}

		return json_encode($resp);
	}

	function update_travel_type() {
		extract($_POST);
	
		// Update the cart_list table with the selected travel type ID
		$updateTravelType = $this->conn->query("UPDATE `cart_list` SET `travel_type_id` = '{$travel_type_id}' WHERE id = '{$prod_id}'");
	
		if ($updateTravelType) {
			$resp['status'] = 'success';
			$resp['msg'] = 'Travel type updated successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to update travel type';
			$resp['error'] = $this->conn->error;
		}
	
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}
	
		return json_encode($resp);
	}

	function update_payment_type() {
		extract($_POST);
	
		// Update the cart_list table with the selected payment type ID
		$updatePaymentType = $this->conn->query("UPDATE `cart_list` SET `payment_type_id` = '{$payment_type_id}' WHERE id = '{$prod_id}'");
	
		if ($updatePaymentType) {
			$resp['status'] = 'success';
			$resp['msg'] = 'Payment type updated successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to update payment type';
			$resp['error'] = $this->conn->error;
		}
	
		if ($resp['status'] == 'success') {
			$this->settings->set_flashdata('success', $resp['msg']);
		}
	
		return json_encode($resp);
	}

	function get_cart_data() {
		extract($_POST);
	
		$query = $this->conn->query("SELECT check_in, check_out, payments_id FROM cart_list WHERE id = '{$prod_id}'");
	
		if ($query) {
			$result = $query->fetch_assoc();
			$resp['status'] = 'success';
			$resp['check_in_date'] = $result['check_in'];
			$resp['check_out_date'] = $result['check_out'];
			$resp['payments_id'] = $result['payments_id'];
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to fetch data from the database';
			$resp['error'] = $this->conn->error;
		}
	
		echo json_encode($resp);
	}

	function fetch_payment_details(){
		extract($_POST);
	
		$paymentDetails = $this->conn->query("SELECT * FROM payments WHERE id = '{$payments_id}'")->fetch_assoc();
	
		if ($paymentDetails) {
			$resp['status'] = 'success';
			$resp['paymentDetails'] = $paymentDetails;
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to fetch payment details';
			$resp['error'] = $this->conn->error;
		}
	
		return json_encode($resp);
	}
	
	function delete_cart(){
		extract($_POST);
		$del = $this->conn->query("DELETE FROM `cart_list` where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$resp['msg'] = " Room has been deleted successfully.";
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = " Room has failed to delete.";
			$resp['error'] = $this->conn->error;
		}
		if($resp['status'] =='success'){
			$this->settings->set_flashdata('success',$resp['msg']);
		}
		return json_encode($resp);
	}

	function place_order(){
		extract($_POST);
		$inserted=[];
		$has_failed=false;
		$gtotal = 0;
		$vendors = $this->conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$this->settings->userdata('id')}')) order by `shop_name` asc");
		$prefix = date('Ym-');
		$code = sprintf("%'.05d",1);
		
		while($vrow = $vendors->fetch_assoc()):
			$data = "";
			
			while(true){
				$check = $this->conn->query("SELECT * FROM order_list where code = '{$prefix}{$code}' ")->num_rows;
				if($check > 0){
					$code = sprintf("%'.05d",ceil($code) + 1);
				}else{
					break;
				}
			}
			
			$ref_code = $prefix.$code;
			$data = "('{$ref_code}','{$this->settings->userdata('id')}','{$vrow['id']}','{$this->conn->real_escape_string($notes)}')";
			$sql = "INSERT INTO `order_list` (`code`,`client_id`,`vendor_id`,`notes`) VALUES {$data}";
			$save = $this->conn->query($sql);
			
			if($save){
				$oid = $this->conn->insert_id;
				$inserted[] = $oid;
				$data = "";
				$gtotal = 0;
				
				$products = $this->conn->query("SELECT c.*, p.name as `name`, p.price, p.image_path, p.vendor_id FROM `cart_list` c INNER JOIN product_list p ON c.product_id = p.id WHERE c.client_id = '{$this->settings->userdata('id')}' AND p.vendor_id = '{$vrow['id']}' ORDER BY p.name ASC");
				
				while($prow = $products->fetch_assoc()):
					$total = $prow['price'] * $prow['quantity'] * $prow['days'];
					$gtotal += $total;
					
					if(!empty($data)) $data .= ", ";
					$data .= "('{$oid}', '{$prow['product_id']}', '{$prow['quantity']}', '{$prow['price']}', '{$prow['days']}', '{$prow['check_in']}', '{$prow['check_out']}', '{$prow['payments_id']}')";
				endwhile;
				
				$sql2 = "INSERT INTO `order_items` (`order_id`,`product_id`,`quantity`,`price`, `days`, `check_in`, `check_out`, `payments_id`) VALUES {$data}";
				$save2 = $this->conn->query($sql2);
				
				if($save2){
					$this->conn->query("UPDATE `order_list` SET `total_amount` = '{$gtotal}' WHERE id = '{$oid}'");

					// Check if a file is uploaded
					if (isset($_FILES['proof_of_payment']) && $_FILES['proof_of_payment']['tmp_name'] != '') {
						// Specify the directory for proof of payment uploads
						$uploadDir = base_app . "uploads/receipt/";

						// Create the directory if it doesn't exist
						if (!is_dir($uploadDir)) {
							mkdir($uploadDir, 0777, true); // Adjust permissions as needed
						}

						// Get the client_id of the logged-in user
						$client_id = $this->settings->userdata('id');

						// Generate a unique filename based on client_id
						$filename = $client_id . '_' . uniqid() . '_' . basename($_FILES['proof_of_payment']['name']);

						// ... (previous code)

						// Define the path for the uploaded file
						$filename = $client_id . '_' . uniqid() . '_' . basename($_FILES['proof_of_payment']['name']);

						// Use a relative path for the uploaded file
						$uploadedFile = "uploads/receipt/" . $filename;

						// Move the uploaded file to the desired directory
						move_uploaded_file($_FILES['proof_of_payment']['tmp_name'], base_app . $uploadedFile);

						// Save the file path to the "receipt" column in the "order_list" table
						$this->conn->query("UPDATE `order_list` SET `receipt` = '{$uploadedFile}' WHERE id = '{$oid}'");

					}

				}else{
					$has_failed = true;
					$resp['sql'] = $sql2;
					break;
				}
			}else{
				$has_failed = true;
				$resp['sql'] = $sql;
				break;
			}
			
		endwhile;
		
		if(!$has_failed){
			$resp['status'] = 'success';
			$resp['msg'] = " Booking Reservation has been placed";
			$this->conn->query("DELETE FROM `cart_list` WHERE client_id ='{$this->settings->userdata('id')}'");
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = " Order has failed to place";
			$resp['error'] = $this->conn->error;
			
			if(count($inserted) > 0){
				$this->conn->query("DELETE FROM `order_list` WHERE id IN (".(implode(',',array_values($inserted))).") ");
			}
		}
		
		if($resp['status'] == 'success') {
			$this->settings->set_flashdata('success',$resp['msg']);
		}
	
		return json_encode($resp);
	}

	function cancel_order(){
		extract($_POST);
		$update = $this->conn->query("UPDATE `order_list` set `status` = 3 where id = '{$id}'");
		if($update){
			$resp['status'] = 'success';
			$resp['msg'] = " Order has been cancelled successfully.";
		}else{
			$resp['status'] = 'success';
			$resp['error'] = $this->conn->error;
		}
		if($resp['status'] == 'success')
		$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}

	function update_status(){
		extract($_POST);
		$update = $this->conn->query("UPDATE `order_list` set `status` = '{$status}' where id = '{$id}'");
		if($update){
			$resp['status'] = 'success';
			$resp['msg'] = " Booking Status has been updated successfully.";
		}else{
			$resp['status'] = 'success';
			$resp['msg'] = " Booking Status has failed to update.";
			$resp['error'] = $this->conn->error;
		}
		if($resp['status'] == 'success')
		$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}



    function update_payment_status(){
		extract($_POST);
		$update = $this->conn->query("UPDATE `order_list` SET `payment_status` = '{$payment_status}' WHERE id = '{$id}'");
	
		if($update){
			$resp['status'] = 'success';
			$resp['msg'] = "Payment Status has been updated successfully.";
		}else{
			$resp['status'] = 'failed';
			$resp['msg'] = "Payment Status has failed to update.";
			$resp['error'] = $this->conn->error;
		}
	
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success', $resp['msg']);
	
		return json_encode($resp);
	}
	
	function save_payment(){
		extract($_POST);
		$data = "";
		foreach($_POST as $k =>$v){
			if(!in_array($k,array('id'))){
				if(!empty($data)) $data .=",";
				$data .= " `{$k}`='{$this->conn->real_escape_string($v)}' ";
			}
		}
	
		$check = $this->conn->query("SELECT * FROM `payments` where `name` = '{$name}' and vendor_id = '{$vendor_id}' and delete_flag = 0 ".(!empty($id) ? " and id != {$id} " : "")." ")->num_rows;
		if($this->capture_err())
			return $this->capture_err();
		if($check > 0){
			$resp['status'] = 'failed';
			$resp['msg'] = " Payment method already exists.";
		} else {
			if(empty($id)){
				$sql = "INSERT INTO `payments` set {$data} ";
			} else {
				$sql = "UPDATE `payments` set {$data} where id = '{$id}' ";
			}
			$save = $this->conn->query($sql);
			if($save){
				$resp['status'] = 'success';
				if(empty($id))
					$resp['msg'] = " New Payment Method successfully saved.";
				else
					$resp['msg'] = " Payment Method successfully updated.";
	
				// Handle QR Code Image Upload
				if (isset($_FILES['img']) && $_FILES['img']['tmp_name'] != '') {
					if (!is_dir(base_app . "uploads/qr")) {
						mkdir(base_app . "uploads/qr");
					}
					$pid = empty($id) ? $this->conn->insert_id : $id;  // Set $pid for an existing or new record
					$fname = 'uploads/qr/' . $pid . '.png';
					$dir_path = base_app . $fname;
					$upload = $_FILES['img']['tmp_name'];
					$type = mime_content_type($upload);
					$allowed = array('image/png', 'image/jpeg');
	
					if (!in_array($type, $allowed)) {
						$resp['msg'] .= " But QR Code failed to upload due to an invalid file type.";
					} else {
						list($width, $height) = getimagesize($upload);
						$new_height = $height;
						$new_width = $width;
						$t_image = imagecreatetruecolor($new_width, $new_height);
						imagealphablending($t_image, false);
						imagesavealpha($t_image, true);
						$gdImg = ($type == 'image/png') ? imagecreatefrompng($upload) : imagecreatefromjpeg($upload);
						imagecopyresampled($t_image, $gdImg, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
	
						if ($gdImg) {
							if (is_file($dir_path)) {
								unlink($dir_path);
							}
							$uploaded_img = imagepng($t_image, $dir_path);
							imagedestroy($gdImg);
							imagedestroy($t_image);
							if (isset($uploaded_img) && $uploaded_img == true) {
								$qry = $this->conn->query("UPDATE `payments` set qr_code = '{$fname}' where id = '$pid'");
							}
						} else {
							$resp['msg'] .= " But QR Code failed to upload due to an unknown reason.";
						}
					}
				}
			} else {
				$resp['status'] = 'failed';
				$resp['err'] = $this->conn->error."[{$sql}]";
			}
		}
		if($resp['status'] == 'success')
			$this->settings->set_flashdata('success',$resp['msg']);
		return json_encode($resp);
	}
	
	function delete_payment(){
		extract($_POST);
		$del = $this->conn->query("UPDATE `payments` set delete_flag = 1 where id = '{$id}'");
		if($del){
			$resp['status'] = 'success';
			$this->settings->set_flashdata('success'," Payment method successfully deleted.");
		}else{
			$resp['status'] = 'failed';
			$resp['error'] = $this->conn->error;
		}
		return json_encode($resp);
	}
	
	

	function upload_receipt_image() {
		extract($_POST);
	
		// Check if the required parameters are provided
		if (isset($order_id) && isset($_FILES['receipt_image']) && $_FILES['receipt_image']['tmp_name'] != '') {
			$order_id = $this->conn->real_escape_string($order_id);
	
			// Specify the directory for receipt image uploads
			$uploadDir = base_app . "uploads/receipt/";
	
			// Create the directory if it doesn't exist
			if (!is_dir($uploadDir)) {
				mkdir($uploadDir, 0777, true); // Adjust permissions as needed
			}
	
			// Generate a unique filename based on order_id
			$filename = $order_id . '_' . uniqid() . '_' . basename($_FILES['receipt_image']['name']);
	
			// Define the path for the uploaded file
			$uploadedFile = "uploads/receipt/" . $filename;
	
			// Move the uploaded file to the desired directory
			move_uploaded_file($_FILES['receipt_image']['tmp_name'], base_app . $uploadedFile);
	
			// Update the receipt column in the order_list table with the new file path
			$this->conn->query("UPDATE `order_list` SET `receipt` = '{$uploadedFile}' WHERE id = '{$order_id}'");
	
			$resp['status'] = 'success';
			$resp['msg'] = 'Receipt image uploaded successfully';
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Invalid parameters';
		}
	
		return json_encode($resp);
	}






	function fetch_products_by_price_range() {
		// Assuming you have a database connection instance $this->conn
		$minPrice = isset($_GET['minPrice']) ? $this->conn->real_escape_string($_GET['minPrice']) : 0;
		$maxPrice = isset($_GET['maxPrice']) ? $this->conn->real_escape_string($_GET['maxPrice']) : 50000;
	
		$query = "SELECT * FROM product_list WHERE price BETWEEN '{$minPrice}' AND '{$maxPrice}' AND delete_flag = 0 AND status = 1";
		$result = $this->conn->query($query);
	
		$resp = array();
		if ($result) {
			$products = array();
			while($row = $result->fetch_assoc()) {
				$products[] = $row;
			}
	
			$resp['status'] = 'success';
			$resp['products'] = $products;
		} else {
			$resp['status'] = 'failed';
			$resp['msg'] = 'Failed to fetch products';
			$resp['error'] = $this->conn->error;
		}
	
		return json_encode($resp);
	}
	
	
}

$Master = new Master();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);
$sysset = new SystemSettings();
switch ($action) {
	case 'save_message':
		echo $Master->save_message();
	break;
	case 'delete_message':
		echo $Master->delete_message();
	break;
	case 'save_reviews':
		echo $Master->save_reviews();
	break;
	case 'delete_reviews':
		echo $Master->delete_reviews();
	break;
	case 'save_inquiry':
		echo $Master->save_inquiry();
	break;
	case 'delete_inquiry':
		echo $Master->delete_inquiry();
	break;
	case 'save_shop_type':
		echo $Master->save_shop_type();
	break;
	case 'delete_shop_type':
		echo $Master->delete_shop_type();
	break;
	case 'save_category':
		echo $Master->save_category();
	break;
	case 'delete_category':
		echo $Master->delete_category();
	break;
	case 'save_room':
		echo $Master->save_room();
	break;
	case 'delete_seat':
		echo $Master->delete_seat();
	break;
	case 'save_product':
		echo $Master->save_product();
	break;
	case 'delete_product':
		echo $Master->delete_product();
	break;
	case 'add_to_cart':
		echo $Master->add_to_cart();
	break;
	case 'update_cart_qty':
		echo $Master->update_cart_qty();
	break;
	case 'update_cart_dates':
		echo $Master->update_cart_dates();
	break;
	case 'update_cart_total_days':
		echo $Master->update_cart_total_days();
	break;
	case 'get_cart_data':
		echo $Master->get_cart_data();
	break;
	case 'delete_cart':
		echo $Master->delete_cart();
	break;
	case 'place_order':
		echo $Master->place_order();
	break;
	case 'cancel_order':
		echo $Master->cancel_order();
	break;
	case 'update_status':
		echo $Master->update_status();
	break;
	case 'update_payment_status':
		echo $Master->update_payment_status();
	break;
	case 'save_payment':
		echo $Master->save_payment();
	break;
	case 'delete_payment':
		echo $Master->delete_payment();
	break;
	case 'update_payment_method':
		echo $Master->update_payment_method();
	break;
	case 'update_travel_type':
		echo $Master->update_travel_type();
	break;
	case 'update_payment_type':
		echo $Master->update_payment_type();
	break;
	case 'get_payment_details':
		echo $Master->get_payment_details();
	break;
	case 'fetch_payment_details':
		echo $Master->fetch_payment_details();
	break;
	case 'upload_receipt_image':
		echo $Master->upload_receipt_image();
	break;
	case 'fetch_products_by_price_range':
		echo $Master->fetch_products_by_price_range();
	break;
	default:
		// echo $sysset->index();
		break;
}