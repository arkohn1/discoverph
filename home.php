<?php 
    $category_ids = isset($_GET['cids']) ? $_GET['cids'] : 'all';

    function get_average_rating($productId, $conn) {
        // Prepare the SQL query to get the average rating
        $query = "SELECT AVG(rating) as average_rating FROM ratings_reviews WHERE product_id = ? AND status = 'approved'";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $productId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row ? round($row['average_rating'], 1) : 0; // Round to 1 decimal place and return
    }
?>
<style>
    .price-section {
        display: flex;
        align-items: center;
        justify-content: center; /* Horizontally center the items */
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 10px;
        background-color: #343a40;
        height: 30px;
        margin-top: 5px;
    }

    .currency-symbol {
        flex: 0 0 auto;
        margin-right: 10px;
        font-size: 1.2rem;
        color: #fff;
    }

    .price {
        flex: 1 1 auto;
        font-size: 1.2rem;
        color: #fff;
    }
    /* Change the color of the "Resort Packages" heading */
    h3.text-center b {
        color: #212529;
    }
</style>
<div class="col-lg-12 py-5">
    <div class="contain-fluid">
        <!--<div class="card card-outline card-dark shadow rounded-0">
            <div class="card-body rounded-0">
                <div class="container-fluid">
                    <h3 class="text-center">Welcome</h3>
                    <hr>
                    <div class="subtitle-content">
                        <?php include("subtitle.html") ?>
                    </div>
                </div>
            </div>
        </div> -->
        <div class="clear-fix mb-3"></div>
        <div id="resort-packages" class="col-lg-12 py-5">
            <h3 class="text-center"><b>Resort Packages</b></h3>
            <center><hr class="w-25"></center>
            <div class="row" id="product_list">
                <?php 
                $products = $conn->query("SELECT p.*, v.shop_name as vendor, c.name as `category` FROM `product_list` p inner join vendor_list v on p.vendor_id = v.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.`status` =1 order by RAND() limit 4");
                while($row = $products->fetch_assoc()):

                // Inside your loop for displaying products
                $averageRating = get_average_rating($row['id'], $conn);
                ?>
                <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                    <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                    <div class="product-img-holder position-relative">
                        <img src="<?= validate_image($row['image_path']) ?>" alt="Product-image" class="img-top product-img bg-gradient-gray">
                    </div>
                        <div class="card-body border-top border-gray">
                            <h5 class="card-title text-truncate w-100"><?= $row['name'] ?></h5>
                            <div class="product-rating">
                                <?php
                                for ($i = 1; $i <= 5; $i++) {
                                    if ($i <= $averageRating) {
                                        echo '<span style="color: gold;">&#9733;</span>'; // Filled star
                                    } else {
                                        echo '<span>&#9733;</span>'; // Empty star
                                    }
                                }
                                ?>
                                <span>(<?= $averageRating ?>)</span> <!-- Optionally display the numeric rating -->
                            </div>
                            <div class="d-flex w-100">
                                <div class="col-auto px-0"><small class="text-muted">Resort:&nbsp;</small></div>
                                <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><small class="text-muted"><?= $row['vendor'] ?></small></p></div>
                            </div>
                            <div class="d-flex">
                                <div class="col-auto px-0"><small class="text-muted">Category:&nbsp;</small></div>
                                <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><small class="text-muted"><?= $row['category'] ?></small></p></div>
                            </div>
                            <!-- Price Section -->
                            <div class="price-section">
                                <div class="currency-symbol">₱</div>
                                <div class="price"><?= format_num($row['price']) ?></div>
                            </div>
                            <p class="card-text truncate-3 w-100"><?= strip_tags(html_entity_decode($row['description'])) ?></p>
                        </div>
                    </a>
                </div>
                <?php endwhile; ?>
            </div>
            <!--<div class="clear-fix mb-2"></div> -->
            <br>
            <br>
            <div class="text-center">
                <a href="./?page=products" class="btn btn-large btn-primary rounded-pill col-lg-3 col-md-5 col-sm-12">Explore More Packages</a>
            </div>
        </div>   

        
        <br>
        <br>
        
        
        
        <!-- ABOUT US -->
        <div id="about" class="content py-3">
            <div class="card rounded-0 card-outline card-navy shadow">
                <div class="card-body rounded-0">
                    <h2 class="text-center">About</h2>
                    <center><hr class="bg-navy border-navy w-25 border-2"></center>
                    <div>
                        <?= file_get_contents("about.html") ?>
                    </div>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <!-- CONTACT US -->
        <div id="contact" class="col-12">
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


    $(document).ready(function () {
        // Function to handle smooth scrolling to a target section with an offset
        function scrollToSection(targetSection, offset = 0) {
            $("html, body").animate(
                {
                    scrollTop: $("#" + targetSection).offset().top - offset, // Apply the specified offset
                },
                1000, // Adjust the animation duration (in milliseconds) as needed
                function () {
                    // Add hash (#) to URL when done scrolling (optional)
                    // window.location.hash = "#" + targetSection;
                }
            );
        }

        // Check if there's a target section in the URL (e.g., #about or #contact)
        var targetSectionInUrl = window.location.hash.replace('#', '');
        if (targetSectionInUrl) {
            if (targetSectionInUrl === 'about') {
                scrollToSection(targetSectionInUrl, 100); // Set an offset of -70 for the About section
            } else if (targetSectionInUrl === 'contact') {
                scrollToSection(targetSectionInUrl, 115); // Set a different offset of -100 for the Contact section
            }
        }

        // Smooth scrolling animation when a navigation link is clicked
        $("a.nav-link").on("click", function (event) {
            var targetSection = $(this).data("target-section");

            if (targetSection) {
                event.preventDefault();

                // If on another page, navigate to the home page with the target section anchor
                if (window.location.pathname !== '/') {
                    window.location.href = '/#' + targetSection;
                } else {
                    // On the home page, perform smooth scrolling with the appropriate offset
                    if (targetSection === 'about') {
                        scrollToSection(targetSection, 100); // Set an offset of -70 for the About section
                    } else if (targetSection === 'contact') {
                        scrollToSection(targetSection, 115); // Set a different offset of -100 for the Contact section
                    }
                }
            }
        });
    });

    // Function to scroll to a specific section by its ID
    function scrollToSection(sectionId, offset = 0) {
        var targetSection = document.getElementById(sectionId);
        if (targetSection) {
            window.scrollTo({
                top: targetSection.offsetTop - offset, // Apply the specified offset
                behavior: 'smooth' // Smooth scrolling behavior
            });
        }
    }

    // Scroll to the top when clicking the "Home" button
    $("a.nav-link.home").on("click", function (event) {
        event.preventDefault();
        $("html, body").animate(
            {
                scrollTop: 0,
            },
            1000 // Adjust the animation duration (in milliseconds) as needed
        );
    });


</script>