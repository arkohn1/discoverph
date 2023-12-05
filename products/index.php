<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/10.6.1/bootstrap-slider.min.js"></script>





<?php 
    $category_ids = isset($_GET['cids']) ? $_GET['cids'] : 'all';

    function get_average_rating($productId, $conn) {
        // Prepare the SQL query to get the average rating
        $query = "SELECT AVG(rating) as average_rating FROM ratings_reviews WHERE package_id = ? AND status = 'approved'";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $productId);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        return $row ? round($row['average_rating'], 1) : 0; // Round to 1 decimal place and return
    }
?>
<style>

    body {
            overflow-y: scroll;
    }

    #header{
    height:100vh;
    width:calc(100%);
    position:relative;
    top:-6em;
    overflow: hidden; /* Ensure the cover image covers the top part */
    }
    .price-section {
        display: flex;
        align-items: center;
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

    /* Add custom styling for the price range slider container */
    #priceRangeSlider {
        height: 50px; /* Adjust the height as needed */
        width: 265px; /* Adjust the width as needed */
        max-width: 100%; /* Adjust the max-width as needed */
        margin-left: auto; /* Align to the right for better aesthetics */
        margin-right: auto;
    }

    /* Add padding to the price range values for better spacing in the filtering section */
    #priceRangeValues {
        padding: 9px 0;
    }
</style>
<div class="content py-3">
    <div class="row">
        <div class="col-md-4 order-md-2">
            <div class="card card-outline rounded-0 card-primary shadow">
                <div class="card-body">
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action">
                            <div class="form-group">
                                <label for="categoryDropdown">Select Category</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text bg-white border-right-0">
                                            <i class="fas fa-filter"></i>
                                        </span>
                                    </div>
                                    <select class="form-control custom-select" id="categoryDropdown" name="category">
                                        <option value="all" <?= (!is_array($category_ids) && $category_ids =='all') ? "selected" : "" ?>>All</option>
                                        <?php 
                                        $categories = $conn->query("SELECT * FROM `category_list` where delete_flag = 0 and status = 1 order by `name` asc ");
                                        while($row = $categories->fetch_assoc()):
                                        ?>
                                        <option value="<?= $row['id'] ?>" <?= in_array($row['id'],explode(',',$category_ids)) ? "selected" : '' ?>>
                                            <?= $row['name'] ?>
                                        </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>
                            </div>
                        </div>



                        <div class="list-group-item list-group-item-action">
                            <div class="form-group">
                                <label for="priceRangeSlider">Select Price Range</label>
                                <?php
                                // Get the price range values from the slider
                                $minPrice = isset($_GET['minPrice']) ? (float)$_GET['minPrice'] : 0;
                                $maxPrice = isset($_GET['maxPrice']) ? (float)$_GET['maxPrice'] : 50000;
                                ?>
                                <input id="priceRangeSlider" type="range" min="0" max="50000" step="10" value="<?= $minPrice ?>" class="form-control-range"/>
                                <input id="maxPriceRangeSlider" type="range" min="0" max="50000" step="10" value="<?= $maxPrice ?>" class="form-control-range"/>
                                <output id="priceRangeValues">Price Range: ₱<?= $minPrice ?> - ₱<?= $maxPrice ?></output>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>



        
        <div class="col-md-8 order-md-1">
            <div class="card card-outline card-primary shadow rounded-0">
                <div class="card-body">
                    <div class="container-fluid">
                        <div class="row justify-content-center mb-3">
                            <div class="col-lg-8 col-md-10 col-sm-12">
                                <form action="" id="search-frm">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text">Search</span></div>
                                        <input type="search" id="search" class="form-control" value="<?= isset($_GET['search']) ? $_GET['search'] : '' ?>">
                                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-search"></i></span></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row" id="package_list" style="display: flex; flex-wrap: wrap;">
                            <?php 
                            $swhere = "";
                            if(!empty($category_ids)):
                            if($category_ids !='all'){
                                $swhere = " and p.category_id in ({$category_ids}) ";
                            }
                            if(isset($_GET['search']) && !empty($_GET['search'])){
                                $swhere .= " and (p.name LIKE '%{$_GET['search']}%' or p.description LIKE '%{$_GET['search']}%' or c.name LIKE '%{$_GET['search']}%' or v.shop_name LIKE '%{$_GET['search']}%') ";
                            }
                            $products = $conn->query("SELECT p.*, v.shop_name as vendor, c.name as `category` FROM `package_list` p inner join agency_list v on p.agency_id = v.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.`status` =1 {$swhere} order by RAND()");
                            
                            
                            while($row = $products->fetch_assoc()):
                                // Inside your loop for displaying products
                                $averageRating = get_average_rating($row['id'], $conn);
                                ?>


                                <div class="col-lg-4 col-md-6 col-sm-12 product-item">
                                    <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                                    <!-- <div class="product-img-holders position-relatives">
                                        <img src="<?= validate_image($row['image_path']) ?>" alt="Product-image" class="img-top product-img bg-gradient-gray">
                                    </div> -->
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
                                                <div class="col-auto px-0"><small class="text-muted">    &nbsp;</small></div>
                                                <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><small class="text-muted"><?= $row['vendor'] ?></small></p></div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="col-auto px-0"><small class="text-muted">    &nbsp;</small></div>
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
                            <?php else: ?>
                                <div class="col-12 text-center">
                                    Please select a category
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
</div>




<script>
    $(function(){
        if($('#cat_all').is(':checked') == true){
            $('.cat_item').prop('checked',true)
        }
        if($('.cat_item:checked').length == $('.cat_item').length){
            $('#cat_all').prop('checked',true)
        }
        $('.cat_item').change(function(){
            var ids = [];
            $('.cat_item:checked').each(function(){
                ids.push($(this).val())
            })
            location.href="./?page=products&cids="+(ids.join(","))
        })
        $('#cat_all').change(function(){
            if($(this).is(':checked') == true){
                $('.cat_item').prop('checked',true)
            }else{
                $('.cat_item').prop('checked',false)
            }
            $('.cat_item').trigger('change')
        })
        $('#search-frm').submit(function(e){
            e.preventDefault()
            var q = "search="+$('#search').val()
            if('<?= !empty($category_ids) && $category_ids !='all' ?>' == 1){
                q += "&cids=<?= $category_ids ?>"
            }
            location.href="./?page=products&"+q;

        })
    })



    $(function(){
        $('#categoryDropdown').change(function(){
            var selectedCategory = $(this).val();
            location.href = "./?page=products&cids=" + selectedCategory;
        });

        // ... existing JavaScript code ...
    });


    



    


    var _base_url_ = '<?php echo base_url ?>'; // Replace with your actual base URL

    $(function() {
        function updateProductList(minPrice, maxPrice) {
            $.ajax({
                url: _base_url_ + 'classes/Master.php?f=fetch_products_by_price_range', // Adjusted URL
                type: 'GET',
                data: { minPrice: minPrice, maxPrice: maxPrice },
                dataType: 'json',
                success: function(response) {
                    if(response.status === 'success') {
                        var productsHtml = '';
                        response.products.forEach(function(product) {
                            // Construct your product HTML here
                            productsHtml += '<div>' + product.name + '</div>'; // Example
                        });
                        $('#package_list').html(productsHtml);
                    } else {
                        alert(response.msg);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("An error occurred: " + status + "\nError: " + error);
                }
            });
        }

        $('#priceRangeSlider, #maxPriceRangeSlider').on('input', function() {
            var minPrice = $('#priceRangeSlider').val();
            var maxPrice = $('#maxPriceRangeSlider').val();
            $('#priceRangeValues').text('Price Range: ₱' + minPrice + ' - ₱' + maxPrice);
            updateProductList(minPrice, maxPrice);
        });
    });


</script>