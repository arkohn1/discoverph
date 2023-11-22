<?php
if (isset($_GET['id']) && $_GET['id'] > 0) {
    $productQry = $conn->query("SELECT p.*, v.shop_name as vendor, c.name as `category` FROM `product_list` p INNER JOIN vendor_list v ON p.vendor_id = v.id INNER JOIN category_list c ON p.category_id = c.id WHERE p.delete_flag = 0 AND p.id = '{$_GET['id']}'");

    if ($productQry->num_rows > 0) {
        foreach ($productQry->fetch_assoc() as $k => $v) {
            $$k = $v;
        }

        // Now, let's get the total number of available and taken rooms for this product's category
        $roomQry = $conn->query("SELECT 
                                    SUM(CASE WHEN r.status = 1 THEN 1 ELSE 0 END) AS available_rooms,
                                    SUM(CASE WHEN r.status = 0 THEN 1 ELSE 0 END) AS taken_rooms
                                FROM `rooms` r
                                WHERE r.delete_flag = 0 
                                    AND r.vendor_id = '{$vendor_id}' 
                                    AND r.description = '{$category}'");
        $roomData = $roomQry->fetch_assoc();
        $availableRooms = $roomData['available_rooms'];
        $takenRooms = $roomData['taken_rooms'];

    } else {
        echo "<script> alert('Unknown Product ID.'); location.replace('./?page=products') </script>";
        exit;
    }
} else {
    echo "<script> alert('Product ID is required.'); location.replace('./?page=products') </script>";
    exit;
}

// Function to get product reviews with client details
function get_product_reviews($product_id) {
    global $conn; // Assuming $conn is your database connection object

    $product_id = $conn->real_escape_string($product_id);

    $query = "SELECT rr.*, c.firstname, c.middlename, c.lastname, c.avatar
              FROM `ratings_reviews` rr
              LEFT JOIN `client_list` c ON rr.client_id = c.id
              WHERE rr.`product_id` = '$product_id'";

    $result = $conn->query($query);

    if ($result) {
        $reviews = array();

        while ($row = $result->fetch_assoc()) {
            $reviews[] = array(
                'client_name' => ucwords("{$row['firstname']} {$row['middlename']} {$row['lastname']}"),
                'rating' => $row['rating'],
                'review' => $row['review'],
                'date_created' => $row['date_created'],
                'avatar' => $row['avatar']
            );
        }

        return $reviews;
    }

    return false;
}

?>

<style>
    #prod-img-holders {
        height: auto;
        width: auto;
        overflow: hidden;
        background-color: #343a40; 
        border: 0px solid #343a40; /* Change the border color */
        color: /* Add your color value */;
    }

    #prod-img {
        object-fit: cover;
        height: 250px;
        width: calc(100%);
        transition: transform .3s ease-in;
        background-color: #343a40;
    }
    #prod-img-holders:hover #prod-img{
        transform:scale(1.2);
    }

    /* Other Packages */
    .other-packages-section {
        background: #fff;
        border: 1px solid #ccc;
        border-radius: 8px;
        padding: 15px;
        margin-top: 20px;
    }

    .section-title {
        color: #333;
        font-size: 1.2rem;
        font-weight: bold;
        margin-bottom: 15px;
        text-align: center;
    }

    .other-card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
    }

    .other-card {
        width: 100%;
        max-width: 300px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        transition: box-shadow 0.3s ease;
    }

    .other-card:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .other-card-img {
        width: 100%;
        height: 180px;
        object-fit: cover;
    }

    .other-card-body {
        padding: 15px;
    }

    .other-card-title {
        margin-bottom: 10px;
        font-size: 1rem;
        color: #333;
    }

    .view-details-btn {
        display: inline-block;
        padding: 8px 15px;
        font-size: 0.9rem;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        transition: background-color 0.3s ease, color 0.3s ease; /* Add color transition */
    }

    .view-details-btn:hover {
        background-color: #0056b3;
        color: #fff; /* Set text color on hover */
    }


    /* Gallery Styling */
    .gallery-box {
        width: 100%; /* Fixed width */
        height: 450px; /* Fixed height */
        overflow: hidden;
        border: 1px solid #ddd;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .gallery-image {
        width: 100%;
        height: 100%;
        object-fit: cover; /* This property ensures that the image covers the entire container */
    }

    .main-image {
        width: 100%;
        height: 400px; /* Set the fixed height as per your requirement */
        overflow: hidden;
    }

    #main-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .thumbnails-container {
        display: flex;
        overflow-x: auto;
        margin-top: 10px;
    }

    .thumbnail-image {
        width: 20px; /* Adjust the width as needed */
        height: 20px; /* Adjust the height as needed */
        object-fit: cover; /* This property ensures that the image covers the entire container */
        cursor: pointer;
        margin-right: 10px;
    }

    .thumbnails {
        position: relative;
        display: flex;
        overflow-x: auto;
        margin-top: 10px;
    }

    .thumbnail-item {
        cursor: pointer;
        margin-right: 10px;
        position: relative;
    }

    .thumbnail-item img {
        width: 100px; /* Adjust the width as needed */
        height: 100px; /* Adjust the height as needed */
        object-fit: cover;
        border: 2px solid transparent;
        border-radius: 4px;
    }

    .thumbnail-item.selected img {
        border-color: #007bff; /* Highlight the selected thumbnail with a border */
    }

    .navigation-arrows {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 0 20px;
        box-sizing: border-box;
        z-index: 1;
    }

    .arrow {
        font-size: 24px;
        cursor: pointer;
    }

    .fade {
        filter: brightness(0.8); /* Adjust the brightness for the non-selected thumbnails */
    }

    /*Available Rooms Buttons*/
    .rooms-container {
        background-color: #343a40;
        padding: 20px;
        border-radius: 8px;
    }

    .room-box {
        width: 50%;
        border-radius: 5px;
        padding: 15px;
        overflow: hidden;
        margin-bottom: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .available-rooms {
        background-color: #2ecc71;
        color: #fff;
    }

    .taken-rooms {
        background-color: #e74c3c;
        color: #fff;
    }

    .room-header {
        flex: 0 0 auto;
        padding-right: 10px;
    }

    .room-content {
        flex: 1 1 auto;
    }
    
    /*Top Buttons*/
    .room-selection {
        display: flex;
        align-items: center;
        margin-top: 10px;
    }

    #qty {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    #add_to_cart,
    #checkoutBtn {
        width: 100%;
        padding: 7px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        background-color: #28a745;
    }

    #add_to_cart:hover,
    #checkoutBtn:hover {
        background-color: dark blue;
        color: #fff;
    }

    #checkoutBtn:disabled {
        background-color: #ddd;
        color: #666;
        cursor: not-allowed;
    }

    /*Pricing*/
    .price-container {
        display: flex;
        align-items: center;
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 10px;
    }

    .currency-symbol {
        flex: 0 0 auto;
        margin-right: 10px;
        font-size: 1.2rem;
        color: #555;
    }

    .price {
        flex: 1 1 auto;
        font-size: 1.2rem;
        color: #333;
    }

    /*Inquire Modal*/
    .modal-backdrop {
        background-color: rgba(0, 0, 0, 0.5) !important; /* Adjust the opacity as needed */
    }

    /* Set Modal Background to White */
    .modal-content {
        background-color: #fff; /* Set the modal background color to white */
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Optional: Add a subtle box shadow */
    }



    #reviewsSection {
    margin-top: 20px;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 10px; /* Adjust the value as needed */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Adjust the values as needed */
    }

    .review-container {
        border: 1px solid #ccc;
        border-radius: 8px;
        margin-bottom: 20px;
        padding: 15px;
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .review-content {
        word-wrap: break-word;
    }

    #newReviewForm {
        max-width: 400px; /* Adjust the width as needed */
    }
    
    /* Style for existing reviews scrollbar */
    #existingReviewsContainer::-webkit-scrollbar {
        width: 12px;
    }

    #existingReviewsContainer::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    #existingReviewsContainer::-webkit-scrollbar-thumb {
        background-color: #888;
        border-radius: 10px;
        border: 3px solid #f1f1f1;
    }

    #existingReviewsContainer::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
    .img-avatar-small {
        width: 70px;
        height: 70px;
        object-fit: cover;
        object-position: center center;
        border-radius: 20%;
        margin-right: -50px; /* Add some margin for better spacing */
    }
    @media only screen and (min-width: 600px) {
        #existingReviewsContainer {
            width: 640px;
        }

        #newReviewForm {
            width: 40%;
        }
    }

    /* CSS for Rating Stars */
    .rating {
        
        
        text-align: center;
    }

    .rating span.star {
        font-size: 25px;
        padding: 5px;
        cursor: pointer;
        display: inline-block;
    }

    .rating span.star:hover,
    .rating span.star.active {
        color: gold;
    }

</style>
<div class="content py-3">
    <div class="card card-outline card-primary rounded-0 shadow">
        <div class="card-header">
            <h5 class="card-title"><b>Resort Details</b></h5>
        </div>
        <div class="card-body">
            <div class="container-fluid">
                <div id="msg"></div>
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12 text-center">
                        <div class="position-relative overflow-hidden" id="prod-img-holders">
                            <img src="<?= validate_image(isset($image_path) ? $image_path : "") ?>" alt="<?= $name ?>" id="prod-img" class="img-thumbnail">
                        </div>
                        <div class="information-container">
                            <div class="price" style="background-color: #f4f4f4; border-radius: 5px; padding: 5px;">
                            ₱ <?= format_num($price) ?> per room/day
                            </div>
                        </div>
                        <!-- Related Packages Link -->
                        <?php
                        $otherResortsQry = $conn->query("SELECT * FROM `product_list` WHERE vendor_id = '{$vendor_id}' AND id != '{$_GET['id']}' AND delete_flag = 0 LIMIT 5");
                        $otherResorts = $otherResortsQry->fetch_all(MYSQLI_ASSOC);
                        ?>
                        <!-- Display other resorts -->
                        <div class="mt-5 other-packages-section">
                            <h5 class="section-title">Other Packages by <?= $vendor ?></h5>
                            <div class="other-card-container">
                                <?php foreach ($otherResorts as $otherResort): ?>
                                    <div class="other-card">
                                        <img src="<?= validate_image(isset($otherResort['image_path']) ? $otherResort['image_path'] : "") ?>" class="other-card-img" alt="<?= $otherResort['name'] ?>">
                                        <div class="other-card-body">
                                            <h5 class="other-card-title"><?= $otherResort['name'] ?></h5>
                                            <a href="./?page=products/view_product&id=<?= $otherResort['id'] ?>" class="view-details-btn">View Details</a>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <br>                
                        <!-- Rooms Container -->
                        <div class="rooms-container">
                            <!-- Available Rooms Box -->
                            <div class="room-box available-rooms">
                                <div style="display: flex;">
                                    <div class="room-header"><small>Available Rooms:</small></div>
                                    <div class="room-content"><p class="m-0"><?= $availableRooms ?></p></div>
                                </div>
                            </div>

                            <!-- Taken Rooms Box -->
                            <div class="room-box taken-rooms">
                                <div style="display: flex;">
                                    <div class="room-header"><small>Taken Rooms:</small></div>
                                    <div class="room-content"><p class="m-0"><?= $takenRooms ?></p></div>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                        <div class="d-flex align-items-center mb-3">
                            <h3><b><?= $name ?></b></h3>
                            <div class="ml-3">
                            <button class="btn btn-primary btn-sm" id="inquireBtn" data-toggle="modal" data-target="#inquireModal">
                                <i class="fas fa-question-circle mr-1"></i> Inquire
                            </button>
                            </div>
                            <!-- Modal for Inquire -->
                            <div class="modal fade" id="inquireModal" tabindex="-1" role="dialog" aria-labelledby="inquireModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="inquireModalLabel">Inquire about <?= $name ?></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
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
                                            <!-- Add your form for Subject and Message here -->
                                            <form id="inquireForm">
                                                <!-- Add this hidden input field for product_id -->
                                                <input type="hidden" id="product_id" name="product_id" value="<?= $id ?>">
                                                <input type="hidden" id="vendor_id" name="vendor_id" value="<?= $vendor_id ?>">
                                                <div class="form-group">
                                                    <label for="inquireSubject">Subject:</label>
                                                    <input type="text" class="form-control" id="inquireSubject" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inquireMessage">Message:</label>
                                                    <textarea class="form-control" id="inquireMessage" rows="4" required></textarea>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" id="sendInquiryBtn">Send Inquiry</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        

                        <div class="information-container">
                            <div class="info-group">
                                <div class="info-label"><small class="text-muted">Name:</small></div>
                                <div class="info-value"><?= $vendor ?></div>
                            </div>
                            <div class="info-group">
                                <div class="info-label"><small class="text-muted">Room Category:</small></div>
                                <div class="info-value"><?= $category ?></div>
                            </div>
                            <div class="info-group">
                                <div class="info-label"><small class="text-muted">Address:</small></div>
                                <div class="info-value"><?= $address ?></div>
                            </div>
                        </div>                          
                        <div class="row align-items-end room-selection">
                            <!-- <div class="col-md-3 form-group">
                                <label for="qty" style="width: 110%; font-size: 0.8rem; font-weight: normal;">Number of Rooms:</label>
                                <input type="number" min="1" id="qty" value="1" class="form-control rounded-0 text-center">
                            </div>-->
                            <div class="col-md-3 form-group">
                                <button class="btn btn-primary btn-flat" type="button" id="add_to_cart"><i class="fa fa-check"></i> Book Now</button>
                            </div>
                            <!--<div class="col-md-3 form-group">
                                <a href="./?page=orders/cart" class="btn btn-success btn-flat" id="checkoutBtn" disabled><i class="fa fa-check"></i> Book</a>
                            </div>-->
                        </div>
                        
                        <!-- Add this modal for displaying the confirmation message -->
                        <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
                            <!-- ... (unchanged) ... -->
                        </div>
                        <div class="w-100"><?= html_entity_decode($description) ?></div>
                
                        <!-- Gallery Images -->
                        <div class="gallery-container mt-4">
                            <div class="gallery-box">
                                <div id="main-image-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <?php
                                        // Assuming $gallery_path contains the comma-separated list of image paths from the database
                                        $galleryImages = explode(',', $gallery_path);

                                        foreach ($galleryImages as $index => $imagePath) {
                                        ?>
                                            <div class="carousel-item <?= $index === 0 ? 'active' : '' ?>">
                                                <img src="<?= validate_image($imagePath) ?>" alt="Gallery Image" class="d-block w-100 gallery-image">
                                            </div>
                                        <?php
                                        }
                                        ?>
                                    </div>
                                    <a class="carousel-control-prev" href="#main-image-carousel" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#main-image-carousel" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                            <div class="thumbnails-container mt-3">
                                <?php
                                foreach ($galleryImages as $index => $imagePath) {
                                ?>
                                    <div class="thumbnail-item" data-target="#main-image-carousel" data-slide-to="<?= $index ?>">
                                        <img src="<?= validate_image($imagePath) ?>" alt="Thumbnail" class="img-thumbnail thumbnail-image">
                                    </div>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            

<!-- Reviews Section -->
<div id="reviewsSection" style="border: 1px solid #ccc; padding: 10px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);">

    <!-- Heading showing the number of reviews -->
    <h5 id="reviewsHeading" style="text-align: center; margin-bottom: 10px;"></h5>
    <hr style="width: 600px; border-width: 3px; height: 5px; border-color: #007bff; margin-bottom: 20px;">

<!-- Display existing reviews if any -->
<div id="existingReviewsContainer" style="width: 640px; height: 300px; overflow-y: auto; word-wrap: break-word; float: left; margin-right: 20px;">
    <div id="existingReviews" style="flex: 1;">
        <?php
        // Assuming you have a function to fetch reviews for a product
        $reviews = get_product_reviews($id); // Replace with your actual function
        if ($reviews) {
            foreach ($reviews as $review) {
                echo '<div class="review-container" style="background-color: #;">';
                echo '<div class="review-header">';
                echo '<img src="' . validate_image($review['avatar']) . '" class="img-avatar-small img-thumbnail p-0 border-2" alt="client_avatar">';
                echo '<h5>' . $review['client_name'] . '</h5>';
                echo '<p>Date: ' . date('F j, Y', strtotime($review['date_created'])) . '</p>';
                echo '</div>';
                
                // Display stars based on the rating
                echo '<p>Rating: ';
                for ($i = 1; $i <= 5; $i++) {
                    if ($i <= $review['rating']) {
                        // Output a colored star for each filled star
                        echo '<span style="color: gold;">&#9733;</span>';
                    } else {
                        // Output an empty star for each unfilled star
                        echo '<span>&#9733;</span>';
                    }
                }
                echo '</p>';
                
                echo '<div class="review-content">';
                echo '<p>' . $review['review'] . '</p>';
                echo '</div>';
                echo '</div>';
            }
        }
        ?>
    </div>
</div>

    <!-- Form for submitting reviews on the right side -->
    <div id="newReviewForm" style="width: 40%; float: left;">
        <form id="reviewForm">
            <!-- Add this hidden input field for product_id -->
            <input type="hidden" id="product_id_review" name="product_id_review" value="<?= $id ?>">

            <!-- Rating Stars -->
            <div class="form-group">
                <label for="rating">Rating:</label>
                <div class="rating">
                    <span class="star" data-rating="1">&#9733;</span>
                    <span class="star" data-rating="2">&#9733;</span>
                    <span class="star" data-rating="3">&#9733;</span>
                    <span class="star" data-rating="4">&#9733;</span>
                    <span class="star" data-rating="5">&#9733;</span>
                </div>
                <input type="hidden" name="rating" id="rating" value="0" required>
            </div>

            <div class="form-group">
                <label for="review">Write a Review:</label>
                <textarea class="form-control" id="review" name="review" rows="4" required></textarea>
            </div>

            <button type="button" class="btn btn-primary" id="submitReviewBtn">Submit Review </button>
        </form>
    </div>

    <div style="clear: both;"></div> <!-- Clear the float to prevent layout issues -->

</div>






          
         


            
            <!-- Google Map Embed -->
            <div class="mb-4 rounded-lg overflow-hidden">
                <iframe
                width="100%"
                height="228"
                frameborder="0"
                style="width: 100%; height: 300px; border: 0; border-radius: 5px; margin-top: 50px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);" 
                src="<?= isset($map) ? $map : '' ?>"
                allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"
                ></iframe>
            </div>
        </div>
    </div>
</div>
<script>
    function add_to_cart() {
        var pid = '<?= isset($id) ? $id : '' ?>';
        var qty = $('#qty').val();
        var el = $('<div>')
        el.addClass('alert alert-danger')
        el.hide()
        $('#msg').html('')
        start_loader()
        $.ajax({
            url: _base_url_ + 'classes/Master.php?f=add_to_cart',
            method: 'POST',
            data: { product_id: pid, quantity: qty },
            dataType: 'json',
            error: err => {
                console.error(err)
                alert_toast('An error occurred.', 'error')
                end_loader()
            },
            success: function (resp) {
                if (resp.status == 'success') {
                    $('#checkoutBtn').prop('disabled', false); // Enable the checkout button
                    // Redirect to the orders/cart page upon success
                    window.location.href = "./?page=orders/cart";
                } else if (!!resp.msg) {
                    el.text(resp.msg);
                    $('#msg').append(el);
                    el.show('slow');
                    $('html, body').scrollTop(0);
                } else {
                    el.text("An error occurred. Please try to refresh this page.");
                    $('#msg').append(el);
                    el.show('slow');
                    $('html, body').scrollTop(0);
                }
                end_loader();
            }
        })
    }

    $(function () {
        $('#add_to_cart').click(function () {
            if ('<?= $_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3 ?>') {
                add_to_cart();
            } else {
                location.href = "./login.php"
            }
        })

        // Show the confirmation modal if the user clicks on the Checkout button without confirming the number of rooms
        $('#checkoutBtn').click(function () {
            var qty = $('#qty').val();
            if (qty < 1) {
                $('#confirmationModal').modal('show');
            }
        });
    })

    $(document).ready(function () {
        var currentIndex = 0;

        $('.thumbnail-item').click(function () {
            currentIndex = $(this).data('slide-to');
            updateThumbnails();
            $('#main-image-carousel').carousel(currentIndex);
        });

        $('.carousel-control-prev').click(function () {
            currentIndex = (currentIndex - 1 + $('.thumbnail-item').length) % $('.thumbnail-item').length;
            updateThumbnails();
        });

        $('.carousel-control-next').click(function () {
            currentIndex = (currentIndex + 1) % $('.thumbnail-item').length;
            updateThumbnails();
        });

        function updateThumbnails() {
            $('.thumbnail-item').removeClass('selected').eq(currentIndex).addClass('selected');
        }

        $('#sendInquiryBtn').click(function () {
            // Validate the form fields here if needed
            var subject = $('#inquireSubject').val();
            var message = $('#inquireMessage').val();

            // Add your logic to send the inquiry (e.g., AJAX request)

            // Close the modal after sending the inquiry
            $('#inquireModal').modal('hide');
        });
        $('#sendInquiryBtn').click(function () {
            // Assuming you have the necessary data in the form
            var product_id = '<?= isset($id) ? $id : '' ?>';
            var vendor_id = '<?= isset($vendor_id) ? $vendor_id : '' ?>'; // Add this line
            var inquireSubject = $('#inquireSubject').val();
            var inquireMessage = $('#inquireMessage').val();

            // Validate the form fields (you may add more validation)
            if (inquireSubject.trim() === '' || inquireMessage.trim() === '') {
                alert('Please fill in all required fields.');
                return;
            }

            // Prepare data for AJAX request
            var data = {
                product_id: product_id,
                vendor_id: vendor_id, // Add this line
                inquireSubject: inquireSubject,
                inquireMessage: inquireMessage
            };

            // Make AJAX request to save inquiry
            $.ajax({
                url: _base_url_ + 'classes/Master.php?f=save_inquiry',
                method: 'POST',
                data: data,
                dataType: 'json',
                error: function (err) {
                    console.error(err);
                    alert_toast('An error occurred.');
                    end_loader();
                },
                success: function (resp) {
                    if (resp.status === 'success') {
                        alert_toast(resp.msg);
                        // Optionally, you can redirect or perform other actions after successful inquiry submission
                        location.reload(); // Reload the page for demonstration purposes
                        end_loader();
                    } else {
                         window.location.href = './login.php'; // Update '/login' with the actual login page URL
                    }
                }
            });
        });

        $('#submitReviewBtn').click(function () {
            // Validate the form fields here if needed
            var product_id_review = '<?= isset($id) ? $id : '' ?>';
            var review = $('#review').val();
            var rating = $('#rating').val();

            // Validate the form fields here if needed
            if (review.trim() === '' || rating.trim() === '') {
                alert('Please fill in all required fields.');
                return;
            }

            // AJAX request to save the review
            $.ajax({
                url: 'classes/Master.php?f=save_reviews', // Update the path accordingly
                method: 'POST',
                data: {
                    product_id_review: product_id_review,
                    review: review,
                    rating: rating
                },
                dataType: 'json',
                success: function (resp) {
                    if (resp.status === 'success') {
                        alert_toast(resp.msg);
                        // You may want to reload the reviews after successful submission
                        // For demonstration purposes, I'll reload the page
                        location.reload();
                    } else {
                        alert_toast(resp.msg, 'error');
                    }
                },
                error: function (err) {
                    console.error(err);
                    alert_toast('An error occurred.');
                }
            });
        });
    });

    // jQuery to handle star rating
    $('.star').click(function () {
        var rating = $(this).data('rating'); // Get the rating directly from data-rating
        $('#rating').val(rating);

        // Toggle 'active' class for the clicked star and previous stars
        $(this).addClass('active').prevAll('.star').addClass('active');
        $(this).nextAll('.star').removeClass('active');
    });

    // Optionally, you can add hover functionality to restore colors when not clicked
    $('.star').hover(function () {
        var rating = $(this).data('rating'); // Get the rating directly from data-rating
        $(this).prevAll('.star').andSelf().addClass('hover');
        $(this).nextAll('.star').removeClass('hover');
    }, function () {
        $('.star').removeClass('hover');
    });

    // Update the reviews heading with the count
    var reviewCount = <?= count($reviews) ?>;
    document.getElementById('reviewsHeading').innerText = 'Reviews (' + reviewCount + ')';

    
    
    
    $('#add_to_cart').click(function () {
        // Check if reviews exist or not
        if (typeof productReviews === 'undefined' || productReviews.length === 0) {
            // No reviews, proceed with the cart addition logic
            add_to_cart();
        } else {
            // Reviews exist, handle accordingly (e.g., show a message or enable the button)
            console.log('Reviews exist');
        }
    });
</script>
