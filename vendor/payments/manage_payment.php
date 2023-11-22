<?php
require_once('./../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `payments` where id = '{$_GET['id']}' and delete_flag = 0 ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
?>
		<center>Unknown Shop Type</center>
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
<div class="container-fluid">
	<form action="" id="payment-form">
		<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
		<input type="hidden" name ="vendor_id" value="<?= $_settings->userdata('id') ?>">
		<div class="form-group">
			<label for="name" class="control-label">Payment Method</label>
			<input name="name" id="name" type="text"class="form-control form-control-sm form-control-border" value="<?php echo isset($name) ? $name : ''; ?>" required>
		</div>
		<div class="form-group">
			<label for="description" class="control-label">Details</label>
			<textarea name="description" id="description" rows="4"class="form-control form-control-sm rounded-0" required><?php echo isset($description) ? $description : ''; ?></textarea>
		</div>

		<!-- QR CODE SECTION -->
		<div class="form-group">
			<label for="qr_code" class="control-label">QR Code</label>
			<input type="file" id="qr_code" name="img" class="form-control form-control-sm form-control-border" onchange="displayImg(this,$(this))" accept="image/png, image/jpeg">
		</div>
		<div class="form-group col-md-6 text-center">
			<?php if (isset($qr_code) && !empty($qr_code)): ?>
				<img src="<?= validate_image($qr_code) ?>" alt="QR Code" id="cimg" class="border border-gray img-thumbnail">
			<?php else: ?>
				<img src="../uploads/qr/sample.jpg" alt="Placeholder" id="cimg" class="border border-gray img-thumbnail">
			<?php endif; ?>
		</div>
		<!-- END QR CODE SECTION -->

		<div class="form-group">
			<label for="status" class="control-label">Status</label>
			<select name="status" id="status" class="custom-select selevt" required>
			<option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
			<option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
			</select>
		</div>
		
	</form>
</div>
<script>
  
  function displayImg(input,_this) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#cimg').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }else{
	        	$('#cimg').attr('src', '<?= validate_image(isset($qr_code) ? $qr_code : "") ?>');
        }
	}

	$(document).ready(function(){
		$('#uni_modal #payment-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			 if(_this[0].checkValidity() == false){
				 _this[0].reportValidity();
				 return false;
			 }
			var el = $('<div>')
				el.addClass("alert err-msg")
				el.hide()
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_payment",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.error(err)
					el.addClass('alert-danger').text("An error occured");
					_this.prepend(el)
					el.show('.modal')
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.reload();
					}else if(resp.status == 'failed' && !!resp.msg){
                        el.addClass('alert-danger').text(resp.msg);
						_this.prepend(el)
						el.show('.modal')
                    }else{
						el.text("An error occured");
                        console.error(resp)
					}
					$("html, body").scrollTop(0);
					end_loader()

				}
			})
		})

        $('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script>