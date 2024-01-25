<div style="width: 70%; margin: 20px auto; padding: 15px; background-color: #f0f0f0; border: 1px solid #ddd; border-radius: 10px;">
    <h1 style="font-family: 'Arial', sans-serif; color: #333; text-align: center; text-transform: uppercase; font-size: 1.5em; font-weight: bold;">
        <?php echo $_settings->info('name') ?> (DOT 4A ADMIN)
    </h1>
</div>

<style>
    #cover-image {
        width: calc(100%);
        height: 50vh;
        object-fit: cover;
        object-position: center center;
    }

    .info-box {
        position: relative;
        overflow: hidden;
        transition: transform 0.3s ease-in-out;
    }

    .info-box:hover {
        transform: scale(1.05);
    }

    .info-box-icon {
        position: relative;
        overflow: hidden;
    }

    .info-box-icon::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.3);
        transition: opacity 0.3s ease-in-out;
        opacity: 0;
        z-index: 1;
    }

    .info-box:hover .info-box-icon::before {
        opacity: 1;
    }
</style>

<hr>

<div class="row">
    <!--<div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=packages';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-th-list"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Travel Categories</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM category_list where delete_flag = 0 ")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>-->

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=packages';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-secondary elevation-1"><i class="fas fa-boxes"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Travel Packages</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM package_list where delete_flag = 0 ")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=agencies';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-light elevation-1"><i class="fas fa-users"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Travel Agencies</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM agency_list where delete_flag = 0 ")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=travelers';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-maroon elevation-1"><i class="fas fa-user-friends"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Travelers</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM traveler_list where delete_flag = 0 ")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=bookings';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-warning elevation-1"><i class="fas fa-list"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">Pending Bookings</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM booked_packages_list where `status` = 0 ")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=inquiries';" style="cursor: pointer;">
        <div class="info-box">
            <span class="info-box-icon bg-gradient-green elevation-1"><i class="fas fa-envelope"></i></span>
            <div class="info-box-content">
                <span class="info-box-text">New Inquiries</span>
                <span class="info-box-number text-right h4">
                    <?php
                    $total = $conn->query("SELECT count(id) as total FROM message_list where `status` = 0")->fetch_assoc()['total'];
                    echo format_num($total);
                    ?>
                </span>
            </div>
        </div>
    </div>

    <div class="col-12 col-sm-4 col-md-4" onclick="location.href='<?php echo base_url ?>admin/?page=reports/booking_reports';" style="cursor: pointer;">
        <div class="info-box">
        <span class="info-box-icon bg-gradient-primary elevation-1"><i class="fas fa-chart-bar"></i></span>

        <div class="info-box-content">
            <span class="info-box-text">Generate Reports</span>
            <span class="iinfo-box-number text-right h4">
        
            <?php ?>
            </span>
        </div>
        </div>
    </div>

</div>

<div class="clear-fix mb-2">
    <div class="text-center w-100">
        <img src="<?= validate_image($_settings->info('cover')) ?>" alt="System Cover image" class="w-100" id="cover-image">
    </div>
</div>
