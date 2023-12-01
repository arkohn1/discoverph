<?php require_once('./config.php'); ?>
 <!DOCTYPE html>
<html lang="en" class="" style="height: auto;">
<style>
  #header{
    height:100vh;
    width:calc(100%);
    position:relative;
    top:-6em;
    overflow: hidden; /* Ensure the cover image covers the top part */
  }
  #header:before {
    content: "";
    position: absolute;
    height: calc(100%);
    width: calc(100%);
    background-image: url(<?= validate_image($_settings->info("cover")) ?>);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
  }
  #header>div{
    position:absolute;
    height:calc(100%);
    width:calc(100%);
    z-index:2;
  }

  /* Style for the Explore Packages button */
  #scrollToResortPackages {
      display: inline-block;
      padding: 20px 30px;
      background-color: #007bff; /* Button background color */
      color: #fff; /* Text color */
      height: auto;
      font-size: 18px; /* Font size */
      text-align: center;
      text-decoration: none;
      border-radius: 50px; /* Border radius to make it rounded */
      transition: background-color 0.3s ease; /* Smooth transition for background color */
      margin-top: 80px; /* You can adjust the value as needed */
      position: relative;
      top: 40px; /* Adjust the value as needed to move the button down */
  }
  /* Hover effect: Change background color on hover */
  #scrollToResortPackages:hover {
      background-color: #0056b3; /* New background color on hover */
  }
  .subtitle-content {
    max-width: 1300px;
    color: white;
    text-align: center;
    margin-top: 50px;
  }
  #header .subtitle-content {
    position: relative;
    top: 30px; /* Adjust the value as needed to move the subtitle down */
  }
  #header .site-title {
    position: relative;
    top: 40px; /* Adjust the value as needed to move the site title down */
  }
</style>
<?php require_once('inc/header.php') ?>
  <body class="layout-top-nav layout-fixed layout-navbar-fixed" style="height: auto;">
    <div class="wrapper">
     <?php $page = isset($_GET['page']) ? $_GET['page'] : 'home';  ?>
     <?php require_once('inc/topBarNav.php') ?>
     <?php if($_settings->chk_flashdata('success')): ?>
      <script>
        alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
      </script>
      <?php endif;?>    
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper pt-5" style="">
      <?php if ($page == "home" || $page == "about"): ?>
          <div id="header" class="shadow mb-4">
              <div class="d-flex justify-content-center h-100 w-100 align-items-center flex-column px-3">
                  <h1 class="w-100 text-center site-title px-5" style="max-width: 1100px;">
                      <?php echo $_settings->info('name') ?>
                  </h1>
                  <h5 class="subtitle-content">
                      <?php include("subtitle.html") ?>
                  </h5>
                  <a href="#resort-packages" class="btn btn-primary rounded-pill mt-3" id="scrollToResortPackages">View Packages</a>
              </div>
          </div>
      <?php endif; ?>

        <!-- Main content -->
        <section class="content" style="background-color: ;">
          <div class="container">
            <?php 
              if(!file_exists($page.".php") && !is_dir($page)){
                  include '404.html';
              }else{
                if(is_dir($page))
                  include $page.'/index.php';
                else
                  include $page.'.php';

              }
            ?>
          </div>
        </section>
        <!-- /.content -->
        <div class="modal fade rounded-0" id="uni_modal" role='dialog'>
          <div class="modal-dialog modal-md modal-dialog-centered rounded-0" role="document">
            <div class="modal-content rounded-0">
              <div class="modal-header rounded-0">
              <h5 class="modal-title"></h5>
            </div>
            <div class="modal-body rounded-0">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
            </div>
          </div>
        </div>
        <div class="modal fade rounded-0" id="confirm_modal" role='dialog'>
          <div class="modal-dialog modal-md modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header rounded-0">
              <h5 class="modal-title">Confirmation</h5>
            </div>
            <div class="modal-body rounded-0">
              <div id="delete_content"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" id='confirm' onclick="">Continue</button>
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
            </div>
          </div>
        </div>
        <div class="modal fade rounded-0" id="uni_modal_right" role='dialog'>
          <div class="modal-dialog modal-full-height  modal-md" role="document">
            <div class="modal-content">
              <div class="modal-header rounded-0">
              <h5 class="modal-title"></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span class="fa fa-arrow-right"></span>
              </button>
            </div>
            <div class="modal-body rounded-0">
            </div>
            </div>
          </div>
        </div>
        <div class="modal fade" id="viewer_modal" role='dialog'>
          <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                    <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
                    <img src="" alt="">
            </div>
          </div>
        </div>
      </div>
      <!-- /.content-wrapper -->
      <?php require_once('inc/footer.php') ?>
  </body>
</html>

<!-- Add this script to your index.php file -->
<script>
  $(document).ready(function () {
      // Set your desired offset value
      var scrollOffset = 70; // Change this value as needed

      // Smooth scrolling animation when the button is clicked
      $("#scrollToResortPackages").on("click", function () {
          $("html, body").animate(
              {
                  scrollTop: $("#resort-packages").offset().top - scrollOffset,
              },
              1000 // Adjust the animation duration (in milliseconds) as needed
          );
      });
  });
</script>
