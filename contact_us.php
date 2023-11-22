<div class="col-12">
    <div class="row my-5 ">
        <div class="col-md-5">
            <div class="card card-outline card-navy rounded-0 shadow">
                <div class="card-header">
                    <h4 class="card-title">Contact Information</h4>
                </div>
                <div class="card-body rounded-0">
                    <dl>
                        <dt class="text-muted"><i class="fa fa-envelope"></i> Email</dt>
                        <dd class="pl-4"><?= $_settings->info('email') ?></dd>
                        <dt class="text-muted"><i class="fa fa-phone"></i> Call Us</dt>
                        <dd class="pl-4"><?= $_settings->info('contact') ?></dd>
                        <dt class="text-muted"><i class="fa fa-map-marked-alt"></i> Location</dt>
                        <dd class="pl-4"><?= $_settings->info('address') ?></dd>
                    </dl>
                </div>
            </div>
            <!-- Google Map Embed -->
            <div class="mb-4 rounded-lg overflow-hidden border" style="border-radius: 15px; box-shadow: 0 15px 15px rgba(0, 0, 0, 0.1);">
                <iframe
                    width="100%"
                    height="235"
                    frameborder="0"
                    style="border:0"
                    allowfullscreen
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3867.998641786037!2d121.1620564109892!3d14.194857786187438!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd63dc3b3048f3%3A0xd1eb86e27b6d3366!2sDepartment%20of%20Tourism%20Region%20IV-A!5e0!3m2!1sen!2sph!4v1699815522036!5m2!1sen!2sph"
                    allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
            </div>
        </div>
        
        <div class="col-md-7">
            <div class="card rounded-0 card-outline card-navy shadow" >
                <div class="card-body rounded-0">
                    <h2 class="text-center">Message Us</h2>
                    <center><hr class="bg-navy border-navy w-25 border-2"></center>
                    <?php if($_settings->chk_flashdata('pop_msg')): ?>
                        <div class="alert alert-success">
                            <i class="fa fa-check mr-2"></i> <?= $_settings->flashdata('pop_msg') ?>
                        </div>
                        <script>
                            $(function(){
                                $('html, body').animate({scrollTop:0})
                            })
                        </script>
                    <?php endif; ?>
                    <form action="" id="message-form">
                        <input type="hidden" name="id">
                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <input type="text" class="form-control form-control-sm rounded-0" id="fullname" name="fullname" required placeholder="First Name, Middle Name, Last Name">
                        </div>

                        <div class="form-group">
                            <label for="contact">Contact Number</label>
                            <input type="text" class="form-control form-control-sm rounded-0" id="contact" name="contact" required placeholder="09XX-XXX-XXXX">
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control form-control-sm rounded-0" id="email" name="email" required placeholder="sample@email.com">
                        </div>

                        <div class="form-group">
                            <label for="message" class="text-muted">Message</label>
                            <textarea name="message" id="message" rows="4" class="form-control form-control-sm rounded-0" required placeholder="Write your message here"></textarea>
                        </div>

                        <div class="form-group text-center">
                            <button class="btn btn-primary rounded-pill col-5">Send Message</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        $('#message-form').submit(function(e){
            e.preventDefault();
            var _this = $(this)
            $('.pop-msg').remove()
            var el = $('<div>')
                el.addClass("pop-msg alert")
                el.hide()
            start_loader();
            $.ajax({
                url:_base_url_+"classes/Master.php?f=save_message",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
                success:function(resp){
                    if(resp.status == 'success'){
                        location.reload();
                    }else if(!!resp.msg){
                        el.addClass("alert-danger")
                        el.text(resp.msg)
                        _this.prepend(el)
                    }else{
                        el.addClass("alert-danger")
                        el.text("An error occurred due to unknown reason.")
                        _this.prepend(el)
                    }
                    el.show('slow')
                    $('html, body').animate({scrollTop:0},'fast')
                    end_loader();
                }
            })
        })
    })
</script>