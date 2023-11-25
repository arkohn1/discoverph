<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery and Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
  .user-img {
    position: absolute;
    height: 27px;
    width: 27px;
    object-fit: cover;
    left: -90%;
    top: -12%;
  }

  .btn-rounded {
    border-radius: 50px;
  }

  .navbar-nav .nav-item .nav-link {
    transition: color 0.3s ease-in-out; /* Add transition for color change */
  }

  .navbar-nav .nav-item .nav-link:hover {
    color: #007bff; /* Change color on hover */
  }



  .navbar-light .navbar-nav .show > .nav-link, .navbar-light .navbar-nav .active > .nav-link, .navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .nav-link.active {
    color: rgba(0, 0, 0, 0.5);
`}
</style>

<!-- Navbar -->
<style>
  #top-Nav {
    position: fixed;
    top: 0;
    z-index: 1000; /* Adjust the z-index as needed */
    background-color: rgba(255, 255, 255, 0.8);
    width: 100%; /* Ensure full width */
    height: 85px; /* Adjust the height as needed */
  }

  .navbar-brand img {
    max-height: 60px; /* Adjust the max-height of the logo */
  }

  .text-sm .layout-navbar-fixed .wrapper .main-header ~ .content-wrapper,
  .layout-navbar-fixed .wrapper .main-header.text-sm ~ .content-wrapper {
    margin-top: calc(3.6) !important;
    padding-top: calc(3.2em) !important;
  }

  .layout-top-nav .wrapper .main-header .brand-image {
    margin-top: -0.5rem;
    margin-right: 0.2rem;
    height: 50px;
}
</style>

<nav class="main-header navbar navbar-expand-md navbar-light border-0 text-sm bg-gradient-light shadow fixed-top" id='top-Nav'>

  <div class="container">
    <a href="./" class="navbar-brand">
      <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="Site Logo" class="brand-image img-circle elevation-3" style="opacity: .8; max-height: 200px;">
      <span><?= $_settings->info('short_name') ?></span>
    </a>

    <div class="collapse navbar-collapse" id="navbarCollapse">
      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto d-flex">
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
              class="nav-link <?= isset($page) && $page == 'orders/my_orders' ? "active" : "" ?>">My Bookings</a>
          </li>
        <?php endif; ?>

        <?php if (!($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3)) : ?>
          <!-- Modal Trigger Button for users who are not logged in -->
          <li class="nav-item">
            <a class="nav-link" data-toggle="modal" data-target="#loginModal" href="javascript:void(0)">Sign In</a>
          </li>
        <?php endif; ?>

        <div class="d-flex">
          <div>
            <?php if ($_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3) : ?>
              <div class="dropdown">
                <a href="javascript:void(0)" class="dropdown-toggle text-reset text-decoration-none" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <span class="mx-2">
                    <img src="<?= validate_image($_settings->userdata('avatar')) ?>" class="img-thumbnail rounded-circle" alt="User Avatar" id="client-img-avatar">
                    <span class="mx-2">
                      <?= !empty($_settings->userdata('firstname')) ? $_settings->userdata('firstname') : $_settings->userdata('email') ?>
                    </span>
                  </span>
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="./?page=manage_account">
                    <i class="fas fa-cogs"></i> Manage Account
                  </a>
                  <a class="dropdown-item" href="<?= base_url.'classes/Login.php?f=logout_client' ?>">
                    <i class="fas fa-sign-out-alt"></i> Logout
                  </a>
                </div>
              </div>
            <?php else : ?>
              <a href="./login.php"
                class="mx-2 text-light text-decoration-none font-weight-bolder"></a>
              <a href="./vendor"
                class="mx-2 text-light text-decoration-none font-weight-bolder"></a>
              <a href="./admin"
                class="mx-2 text-light text-decoration-none font-weight-bolder"></a>
            <?php endif; ?>
          </div>
        </div>
      </ul>
    </div>
    <!-- Navbar toggle button -->
    <button class="navbar-toggler order-1 border-0 text-sm" type="button" data-toggle="collapse"
      data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="loginModalLabel">Sign In</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Your login forms go here -->
        <p><a href="./login.php" class="text-dark text-decoration-none">Customer Login</a></p>
        <p><a href="./vendor" class="text-dark text-decoration-none">Resort Admin Login</a></p>
        <p><a href="./admin" class="text-dark text-decoration-none">Superadmin Login</a></p>
      </div>
    </div>
  </div>
</div>

<!-- /.navbar -->
<script>
  $(function () {

  })
</script>
