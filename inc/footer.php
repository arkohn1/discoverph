<script>
  $(document).ready(function(){
    $('#p_use').click(function(){
      uni_modal("Privacy Policy","policy.php","mid-large")
    })
     window.viewer_modal = function($src = ''){
      start_loader()
      var t = $src.split('.')
      t = t[1]
      if(t =='mp4'){
        var view = $("<video src='"+$src+"' controls autoplay></video>")
      }else{
        var view = $("<img src='"+$src+"' />")
      }
      $('#viewer_modal .modal-content video,#viewer_modal .modal-content img').remove()
      $('#viewer_modal .modal-content').append(view)
      $('#viewer_modal').modal({
              show:true,
              backdrop:'static',
              keyboard:false,
              focus:true
            })
            end_loader()  

  }
    window.uni_modal = function($title = '' , $url='',$size=""){
        start_loader()
        $.ajax({
            url:$url,
            error:err=>{
                console.log()
                alert("An error occured")
            },
            success:function(resp){
                if(resp){
                    $('#uni_modal .modal-title').html($title)
                    $('#uni_modal .modal-body').html(resp)
                    if($size != ''){
                        $('#uni_modal .modal-dialog').addClass($size+'  modal-dialog-centered')
                    }else{
                        $('#uni_modal .modal-dialog').removeAttr("class").addClass("modal-dialog modal-md modal-dialog-centered")
                    }
                    $('#uni_modal').modal({
                      show:true,
                      backdrop:'static',
                      keyboard:false,
                      focus:true
                    })
                    end_loader()
                }
            }
        })
    }
    window._conf = function($msg='',$func='',$params = []){
       $('#confirm_modal #confirm').attr('onclick',$func+"("+$params.join(',')+")")
       $('#confirm_modal .modal-body').html($msg)
       $('#confirm_modal').modal('show')
    }
  })
</script>





<style>
  /* Adjust the spacing within the footer */
  footer.main-footer {
    margin-top: 0; /* Adjust the margin as needed */
    padding: 20px; /* Adjust the padding as needed */
  }

  /* Add this style to adjust the spacing of the contact details */
  footer.main-footer ul.list-unstyled {
    margin-bottom: -25px; /* Remove any bottom margin */
  }

  /* Adjust the spacing of the social media icons */
  footer.main-footer .social-media-icons {
    margin-top: 10px;
  }

  #small-logo,
  #small-user-avatar {
    max-width: 50px;
    height: auto;
    border-radius: 5px;
    box-shadow: none;
    margin-right: 10px; /* Optional: Add spacing between the images */
  }

  .contact-details {
    list-style: none;
    padding: 0;
  }

  .contact-details li {
    margin-bottom: 10px; /* Optional: Add spacing between the contact details */
  }

  /* Make social media icons circular */
  footer.main-footer .social-media-icons a.btn {
    border-radius: 50%;
  }

  /* Change color of the links */
  footer.main-footer .nav-link,
  footer.main-footer .nav-item a.btn,
  footer.main-footer .text-muted a {
    color: #6c757d; /* Use the desired gray color */
  }

  /* Adjust the size and shape of social media icons */
  .btn-social {
    width: 40px; /* Adjust the width as needed */
    height: 40px; /* Adjust the height as needed */
    border-radius: 50%; /* Makes the button circular */
  }
</style>




<footer class="main-footer">
  <div class="container">
    <div class="row">
      <!-- Column 1: Images and Contact Details -->
      <div class="col-lg-4 mb-4">
        <div class="d-flex flex-column align-items-center">
          <!-- Contact Information -->
          <ul class="list-unstyled text-muted contact-details">
            <li><i class="fa fa-envelope"></i> <?= $_settings->info('email') ?></li>
            <li><i class="fa fa-phone"></i> <?= $_settings->info('contact') ?></li>
            <li><i class="fa fa-map-marked-alt"></i> <?= $_settings->info('address') ?></li>
            <!-- Small Logo -->
            <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="System Logo" class="img-fluid mb-3" id="small-logo">
            <!-- Small User Avatar -->
            <img src="<?php echo validate_image($_settings->info('user_avatar')) ?>" alt="User Avatar" class="img-fluid mb-3" id="small-user-avatar">
          </ul>
        </div>
      </div>

      <!-- Column 2: Social Media Icons, Privacy Policy, DOT, and Copyright -->
      <div class="col-lg-4 mb-4">
        <div class="d-flex flex-column align-items-center">
          <!-- Social Media Icons -->
          <div class="social-media-icons">
            <a class="btn btn-dark btn-social mx-2" href="https://philippines.travel/" target="_blank"><i class="fas fa-globe"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="https://www.facebook.com/dotcalabarzon" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="https://www.instagram.com/tourism_phl" target="_blank"><i class="fab fa-instagram"></i></a>
          </div>
          <!-- Privacy Policy and DOT -->
          <div class="text-muted mt-3">
            <a class="link-dark text-decoration-none me-3" href="javascript:void(0)" id="p_use">Privacy Policy</a>
            <span class="ml-3"><a href="https://beta.tourism.gov.ph/" target="_blank">Department of Tourism</a></span>
          </div>
          <!-- Copyright -->
          <div class="text-muted mt-3">&copy; <?php echo $_settings->info('short_name') ?> <?php echo date('Y') ?>. All rights reserved.</div>
        </div>
      </div>

      <!-- Column 3: Navigation Buttons -->
      <div class="col-lg-4 mb-4">
        <ul class="nav justify-content-center">
          <li class="nav-item">
            <a href="./" class="nav-link home <?= isset($page) && $page == 'home' ? "active" : "" ?>">Home</a>
          </li>
          <li class="nav-item">
            <a href="./?page=products" class="nav-link <?= isset($page) && $page == 'products' ? "active" : "" ?>">Resorts</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?= isset($page) && $page == 'about' ? "active" : "" ?>" data-target-section="about"
              href="<?= isset($page) && $page != 'home' ? './#about' : 'javascript:void(0)' ?>">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link <?= isset($page) && $page == 'contact' ? "active" : "" ?>" data-target-section="contact"
              href="<?= isset($page) && $page != 'home' ? './#contact' : 'javascript:void(0)' ?>">Contact</a>
          </li>
          <?php if ($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3) : ?>
            <li class="nav-item">
              <?php
              $cart_count = $conn->query("SELECT sum(quantity) FROM `cart_list` where client_id = '{$_settings->userdata('id')}'")->fetch_array()[0];
              $cart_count = $cart_count > 0 ? $cart_count : 0;
              ?>
              <a href="./?page=orders/cart" class="nav-link <?= isset($page) && $page == 'orders/cart' ? "active" : "" ?>"><span
                  class="badge badge-secondary rounded-circle"><!--<?= format_num($cart_count) ?>--></span> Checkout</a>
            </li>
            <li class="nav-item">
              <a href="./?page=orders/my_orders"
                class="nav-link <?= isset($page) && $page == 'orders/my_orders' ? "active" : "" ?>"> Bookings</a>
            </li>
          <?php endif; ?>
          <?php if (!($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3)) : ?>
            <!-- Modal Trigger Button for users who are not logged in -->
            <li class="nav-item">
              <a class="nav-link" data-toggle="modal" data-target="#loginModal" href="javascript:void(0)">Sign In</a>
            </li>
          <?php endif; ?>
        </ul>
        
      </div>
    </div>
  </div>
</footer>

















    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="<?php echo base_url ?>plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- ChartJS -->
    <script src="<?php echo base_url ?>plugins/chart.js/Chart.min.js"></script>
    <!-- Sparkline -->
    <script src="<?php echo base_url ?>plugins/sparklines/sparkline.js"></script>
    <!-- Select2 -->
    <script src="<?php echo base_url ?>plugins/select2/js/select2.full.min.js"></script>
    <!-- JQVMap -->
    <script src="<?php echo base_url ?>plugins/jqvmap/jquery.vmap.min.js"></script>
    <script src="<?php echo base_url ?>plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="<?php echo base_url ?>plugins/jquery-knob/jquery.knob.min.js"></script>
    <!-- daterangepicker -->
    <script src="<?php echo base_url ?>plugins/moment/moment.min.js"></script>
    <script src="<?php echo base_url ?>plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<?php echo base_url ?>plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Summernote -->
    <script src="<?php echo base_url ?>plugins/summernote/summernote-bs4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url ?>plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <!-- overlayScrollbars -->
    <!-- <script src="<?php echo base_url ?>plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script> -->
    <!-- AdminLTE App -->
    <script src="<?php echo base_url ?>dist/js/adminlte.js"></script>
    <div class="daterangepicker ltr show-ranges opensright">
      <div class="ranges">
        <ul>
          <li data-range-key="Today">Today</li>
          <li data-range-key="Yesterday">Yesterday</li>
          <li data-range-key="Last 7 Days">Last 7 Days</li>
          <li data-range-key="Last 30 Days">Last 30 Days</li>
          <li data-range-key="This Month">This Month</li>
          <li data-range-key="Last Month">Last Month</li>
          <li data-range-key="Custom Range">Custom Range</li>
        </ul>
      </div>
      <div class="drp-calendar left">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-calendar right">
        <div class="calendar-table"></div>
        <div class="calendar-time" style="display: none;"></div>
      </div>
      <div class="drp-buttons"><span class="drp-selected"></span><button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button><button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button> </div>
    </div>
    <div class="jqvmap-label" style="display: none; left: 1093.83px; top: 394.361px;">Idaho</div>
<script>
  $(function(){
    $('.wrapper>.content-wrapper').css("min-height",$(window).height() - $('#top-Nav').height() - $('#login-nav').height() - $("footer.main-footer").height())
  })
</script>