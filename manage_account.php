<?php 
$user = $conn->query("SELECT * FROM client_list where id ='".$_settings->userdata('id')."'");
foreach($user->fetch_array() as $k =>$v){
    $$k = $v;
}
?>
<?php if($_settings->chk_flashdata('success')): ?>
<script>
    alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>

<style>
    body {
        overflow-y: scroll;
    }

    .content {
        margin: 0px;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #cimg {
        width: 200px;
        height: 200px;
        object-fit: cover;
        object-position: center center;
        border-radius: 12%;
        border: 5px;
    }

    .card-primary {
        border: 2px solid #007bff;
    }

    .card-primary .card-header {
        background-color: #007bff;
        color: #fff;
    }

    .form-control-border {
        border-radius: 5px;
        border-color: #ced4da;
    }

    .rounded-0 {
        border-radius: 0;
    }

    .btn-primary {
        border: 2px solid #007bff;
        width: 200px;
        height: 40px;
        border-radius: 30px !important;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        text-decoration: none;
        box-sizing: border-box;
        margin-left: auto;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }

    .input-group-text {
        background-color: transparent;
        border: 1px solid #ced4da;
        border-radius: 0;
    }

    .input-group-text a {
        color: #6c757d;
        text-decoration: none;
    }

    .input-group-text a:hover {
        color: #495057;
    }

    .err-msg {
        margin-top: 10px;
    }

    /* Style for the file input */
    .custom-file-input {
        display: none;
    }

    .custom-file-label {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        cursor: pointer;
        border: 1px solid #ced4da;
        border-radius: 5px;
        padding: 6px 12px;
    }

    .custom-file-label::after {
        content: 'Choose file';
    }

    .custom-file-input:focus ~ .custom-file-label {
        border-color: #007bff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    .form-control-border {
        border-radius: 5px;
    }

    .form-control-border {
        border-radius: 5px;
    }
    
    /* Custom class for left-aligned labels */
    .left-align-label {
        text-align: left;
        display: block;
        margin-bottom: 5px; /* Add margin for spacing */
    }
</style>

<div class="content py-3">
    <div class="card card-primary rounded-0 shadow">
        <div class="card-body">
            <div class="container-fluid text-center">
                <div id="msg"></div>

                <!-- Image and Upload Image -->
                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <div class="custom-file ">
                            <input type="file" id="logo" name="img" class="custom-file-input form-control-border" onchange="displayImg(this,$(this))" accept="image/png, image/jpeg">
                            <label class="custom-file-label left-align-label" for="logo">Choose Image</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-6 mx-auto">
                        <img src="<?= validate_image(isset($avatar) ? $avatar : "") ?>" alt="Profile Photo" id="cimg" class="border border-gray img-thumbnail">
                    </div>
                </div>
               
                <center><hr class="bg border w-100 border-10" ></center>

                <!-- Form Inputs -->
                <form action="" id="manage-user">    
                    <input type="hidden" name="id" value="<?php echo $_settings->userdata('id') ?>">
					<div class="row">
                        <div class="form-group col-md-4">
                            <label for="firstname" class="control-label left-align-label">First Name</label>
                            <input type="text" id="firstname" name="firstname" class="form-control form-control-sm form-control-border" value="<?= isset($firstname) ? $firstname : "" ?>" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="middlename" class="control-label left-align-label">Middle Name</label>
                            <input type="text" id="middlename" name="middlename" class="form-control form-control-sm form-control-border" value="<?= isset($middlename) ? $middlename : "" ?>" placeholder="optional">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="lastname" class="control-label left-align-label">Last Name</label>
                            <input type="text" id="lastname" name="lastname" class="form-control form-control-sm form-control-border" value="<?= isset($lastname) ? $lastname : "" ?>" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="gender" class="control-label left-align-label">Gender</label>
                            <select type="text" id="gender" name="gender" class="form-control form-control-sm form-control-border select2" required>
                                <option <?= isset($gender) && $gender == "Male" ? 'selected' : '' ?>>Male</option>
                                <option <?= isset($gender) && $gender == "Female" ? 'selected' : '' ?>>Female</option>
                            </select>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="contact" class="control-label left-align-label">Contact #</label>
                            <input type="text" id="contact" name="contact" class="form-control form-control-sm form-control-border" value="<?= isset($contact) ? $contact : "" ?>" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="email" class="control-label left-align-label">Email</label>
                            <input type="text" id="email" name="email" class="form-control form-control-sm form-control-border" value="<?= isset($email) ? $email : "" ?>" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <label for="address" class="control-label left-align-label">Address</label>
                            <textarea rows="3" id="address" name="address" class="form-control form-control-sm rounded-0" required><?= isset($address) ? $address : "" ?></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="password" class="control-label left-align-label">New Password</label>
                            <div class="input-group input-group-sm">
                                <input type="password" id="password" name="password" class="form-control form-control-sm form-control-border">
                                <div class="input-group-append bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
                                    <span class="input-group-text bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
                                        <a href="javascript:void(0)" class="text-reset text-decoration-none pass_view"> <i class="fa fa-eye-slash"></i></a>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="cpassword" class="control-label left-align-label">Confirm Password</label>
                            <div class="input-group input-group-sm">
                                <input type="password" id="cpassword" class="form-control form-control-sm form-control-border">
                                <div class="input-group-append bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
                                    <span class="input-group-text bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
                                        <a href="javascript:void(0)" class="text-reset text-decoration-none pass_view"> <i class="fa fa-eye-slash"></i></a>
                                    </span>
                                </div>
                            </div>
                        </div>
						<small class="text-muted"><i>Leave the New Password Fileds blank if you don't want to update it.</i></small>
                    </div>
                    <div class="row">
						<div class="form-group col-md-6">
							<label for="oldpassword" class="control-label left-align-label">Enter Current Password</label>
							<div class="input-group input-group-sm">
								<input type="password" id="oldpassword" name="oldpassword" class="form-control form-control-sm form-control-border" required>
								<div class="input-group-append bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
									<span class="input-group-text bg-transparent border-top-0 border-left-0 border-right-0 rounded-0">
										<a href="javascript:void(0)" class="text-reset text-decoration-none pass_view"> <i class="fa fa-eye-slash"></i></a>
									</span>
								</div>
							</div>
						</div>
					</div>

                    <!-- Update Button -->
                        <div class="update-btn" style="margin-right: -15px;">
                            <button class="btn btn-sm btn-primary" form="manage-user">Update Profile</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function displayImg(input,_this) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#cimg').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        } else {
            $('#cimg').attr('src', "<?= validate_image(isset($avatar) ? $avatar : "") ?>");
        }
    }

    $(function(){
        $('.pass_view').click(function(){
            var _el = $(this).closest('.input-group')
            var type = _el.find('input').attr('type')
            if(type == 'password'){
                _el.find('input').attr('type','text').focus()
                $(this).find('i.fa').removeClass('fa-eye-slash').addClass('fa-eye')
            } else {
                _el.find('input').attr('type','password').focus()
                $(this).find('i.fa').addClass('fa-eye-slash').removeClass('fa-eye')
            }
        })

        $('#manage-user').submit(function(e){
            e.preventDefault();
            var _this = $(this)
            $('.err-msg').remove();
            var el = $('<div>')
            el.addClass("alert err-msg")
            el.hide()
            if(_this[0].checkValidity() == false){
                _this[0].reportValidity();
                return false;
            }
            if($('#password').val() != $('#cpassword').val()){
                el.addClass('alert-danger').text('Password does not match.')
                _this.prepend(el)
                el.show('slow')
                $('html,body').scrollTop(0)
                return false;
            }
            start_loader();
            $.ajax({
                url:_base_url_+"classes/Users.php?f=save_client",
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
                    } else if(resp.status == 'failed' && !!resp.msg){
                        el.addClass('alert-danger').text(resp.msg);
                        _this.prepend(el)
                        el.show('.modal')
                    } else {
                        el.text("An error occured");
                        console.error(resp)
                    }
                    $("html, body").scrollTop(0);
                    end_loader()
                }
            })
        })
    })
</script>
