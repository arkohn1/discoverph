<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery and Popper.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
  .layout-top-nav .wrapper .main-header .brand-image {
      margin-top: -0.5px;
      margin-right: 0.2rem;
      height: 40px;
  }
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
  /* Custom Style for Top Navigation Bar */
  #top-Nav {
      position: fixed;
      top: 0;
      z-index: 1000;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 20px; /* Adjust the border-radius as needed */
      margin: 20px auto; /* Add margin to create a box-like appearance and set auto for left and right margins */
      width: calc(100% - 40px); /* Adjust the width by changing margin values */
      max-width: 1150px; /* Set a maximum width for the navbar */
      left: 0; /* Reset left to 0 to center the navbar */
      right: 0; /* Reset right to 0 to center the navbar */
  }


  .navbar-brand img {
      max-height: 60px;
  }

  /* Customize the active link style */
  #top-Nav a.nav-link.active {
      color: #007bff; /* Change color for active link */
  }

  #top-Nav a.nav-link.active:before {
      content: "";
      position: absolute;
      border-bottom: 2px solid #007bff; /* Highlight active link with a border */
      width: 33.33%;
      left: 33.33%;
      bottom: 0;
  }

  /* Adjust spacing between links */
  #top-Nav a.nav-link {
      margin-right: 20px; /* Adjust the spacing between links */
  }

  /* Optional: Style for the dropdown menu */
  #top-Nav .dropdown-menu {
      border-radius: 10px; /* Adjust the border-radius for dropdown menu */
  }

  /* Adjust the button placement */
  #scrollToTravelPackages {
      margin-top: 10px; /* Adjust the margin-top value to move the button down */
  }
</style>

<nav class="main-header navbar navbar-expand-md navbar-light border-0 text-sm bg-gradient-light shadow fixed-top" id='top-Nav'>

  <div class="container">
    <a href="./" class="navbar-brand">
      <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="Site Logo" class="brand-image <!--img-circle elevation-3-->" style="opacity: .8; max-height: 200px;">
      <span><?= $_settings->info('short_name') ?></span>
    </a>

    <div class="collapse navbar-collapse" id="navbarCollapse">
      <!-- Right navbar links -->
      <ul class="navbar-nav ml-auto d-flex">
        <li class="nav-item">
          <a href="./" class="nav-link home <?= isset($page) && $page == 'home' ? "active" : "" ?>">Home</a>
        </li>
        <li class="nav-item">
          <a href="./?page=packages" class="nav-link <?= isset($page) && $page == 'packages' ? "active" : "" ?>">Packages</a>
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
            $cart_count = $conn->query("SELECT sum(number_of_traveler) FROM `booking_list` where traveler_id = '{$_settings->userdata('id')}'")->fetch_array()[0];
            $cart_count = $cart_count > 0 ? $cart_count : 0;
            ?>
            <a href="./?page=bookings/cart" class="nav-link <?= isset($page) && $page == 'bookings/cart' ? "active" : "" ?>"><span
                class="badge badge-secondary rounded-circle"><!--<?= format_num($cart_count) ?>--></span> Checkout</a>
          </li>
          <li class="nav-item">
            <a href="./?page=bookings/my_bookings"
              class="nav-link <?= isset($page) && $page == 'bookings/my_bookings' ? "active" : "" ?>"> Bookings</a>
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
              <a href="./agency_admin"
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
<style>
  .modal-body a.btn {
    transition: transform 0.3s ease-in-out; /* Add transition for the scaling effect */
  }

  .modal-body a.btn:hover {
    transform: scale(1.1); /* Increase the scale on hover */
  }

  /* Customize the shadow for modal buttons */
.modal-body a.btn {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adjust the shadow values as needed */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* Add transition for both scaling and shadow effect */
}

.modal-body a.btn:hover {
    transform: scale(1.2); /* Increase the scale on hover */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Adjust the shadow values on hover */
}

</style>
<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content border-0 bg-transparent shadow-none">
      <div class="modal-body">
        <div class="row">
          <div class="col-12 text-center mb-3">
            <p class="mb-0"><a href="./login.php" class="btn btn-primary rounded-pill px-5 py-3 shadow-sm">Traveler</a></p>
          </div>
          <div class="col-12 text-center mb-3">
            <p class="mb-0"><a href="./agency_admin" class="btn btn-success rounded-pill px-5 py-3 shadow-sm">Travel Agency</a></p>
          </div>
          <div class="col-12 text-center">
          <p class="mb-0"><a href="./admin" class="btn btn-danger rounded-pill px-5 py-3 shadow-sm">DOT IV-A</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- /.navbar -->

<script>
  $(function () {

  })
</script>
