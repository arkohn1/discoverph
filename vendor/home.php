<div style="width: 70%; margin: 20px auto; padding: 15px; background-color: #f0f0f0; border: 1px solid #ddd; border-radius: 10px;">
    <h1 style="font-family: 'Arial', sans-serif; color: #333; text-align: center; text-transform: uppercase; font-size: 1.5em; font-weight: bold;">
        <?php echo $_settings->info('name') ?> (Travel Agency Admin)
</div>
<style>
  #cover-image{
    width:calc(100%);
    height:50vh;
    object-fit:cover;
    object-position:center center;
  }
</style>
<hr>
<div class="row">
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-th-list"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Room Categories</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM category_list where delete_flag = 0 and vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-orange elevation-1"><i class="fas fas fa-bed"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Available Rooms</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM rooms where `status` = 1 and delete_flag = 0 and vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-secondary elevation-1"><i class="fas fa-boxes"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Travel Packages</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM product_list where delete_flag = 0 and  vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-warning elevation-1"><i class="fas fa-list"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Pending Bookings</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM order_list where `status` = 0 and  vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
      <span class="info-box-icon bg-gradient-gray elevation-1"><i class="fas fa-credit-card"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">Pending Payments</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM order_list where `payment_status` = 0 and  vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
  <div class="col-12 col-sm-4 col-md-4">
    <div class="info-box">
    <span class="info-box-icon bg-gradient-green elevation-1"><i class="fas fa-envelope"></i></span>

      <div class="info-box-content">
        <span class="info-box-text">New Inquiries</span>
        <span class="iinfo-box-number text-right h4">
          <?php 
            $total = $conn->query("SELECT count(id) as total FROM inquiries where `status` = 0 and  vendor_id = '{$_settings->userdata('id')}' ")->fetch_assoc()['total'];
            echo format_num($total);
          ?>
          <?php ?>
        </span>
      </div>
      <!-- /.info-box-content -->
    </div>
    <!-- /.info-box -->
  </div>
</div>

<div class="clear-fix mb-2">
    <div class="text-center w-100">
      <img src="<?= validate_image($_settings->info('cover')) ?>" alt="System Cover image" class="w-100" id="cover-image">
    </div>
  </div>
