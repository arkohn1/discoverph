-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 10:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvogms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_list`
--

CREATE TABLE `cart_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `payments_id` int(30) DEFAULT NULL,
  `quantity` float NOT NULL,
  `days` int(11) NOT NULL DEFAULT 1,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'Regular', '1 room, 1 medium-sized bed, aircon', 1, 0, '2023-11-13 04:31:45', NULL),
(11, 4, 'Premium', '1 room, 2 large sized beds, aircon, widescreen tv, wifi', 1, 0, '2023-11-13 04:32:24', NULL),
(12, 4, 'Deluxe', '1 room, 4 large sized beds, aircon, widescreen tv, wifi, karaoke, billiards', 1, 0, '2023-11-14 01:36:22', NULL),
(15, 4, '123', '123', 1, 1, '2023-11-20 03:26:23', '2023-11-20 03:26:29'),
(16, 5, 'Whole Resort', 'Rent the whole resort.', 1, 0, '2023-11-20 04:33:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` text NOT NULL,
  `contact` text NOT NULL,
  `address` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '202202-00001', 'John', 'F.', 'Kennedy', 'Male', '09123456789', 'sample address', 'jfk@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/clients/1.png?v=1644386016', 1, 1, '2022-02-09 13:53:36', '2023-11-14 03:49:46'),
(3, '202311-00001', 'Arkohn', 'Mamamo', 'Mamanaten', 'Male', '123456', 'sample address', 'arkohn@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/clients/3.png?v=1699797900', 1, 0, '2023-11-12 22:05:00', '2023-11-16 02:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `client_id`, `product_id`, `vendor_id`, `subject`, `message`, `status`, `date_created`) VALUES
(13, 3, 9, 4, 'sample', 'SAMPLE', 1, '2023-11-16 01:10:30'),
(14, 3, 9, 4, 'hi', 'hi', 1, '2023-11-16 01:17:59'),
(15, 3, 9, 4, 'gg', 'gg', 1, '2023-11-16 01:20:57'),
(25, 3, 9, 4, 'mamako', 'mamako', 1, '2023-11-16 01:50:07'),
(35, 3, 10, 4, 'try ', 'try', 1, '2023-11-17 03:54:23'),
(37, 3, 9, 4, '123', '123', 0, '2023-11-20 03:28:48'),
(38, 3, 10, 4, '123', '123', 0, '2023-11-20 03:28:56'),
(39, 3, 11, 4, '123', '123', 0, '2023-11-20 03:29:09'),
(40, 3, 14, 5, '123', '123', 0, '2023-11-20 04:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(7, 'Mark', '123', 'mark@gmail.com', 'mamamo', 1, '0000-00-00 00:00:00'),
(8, 'Mark', '123', 'mark@gmail.com', 'mamako', 1, '2023-11-13 01:15:32'),
(9, 'Grace', '123456', 'grace@gmail.com', 'mamanaten', 1, '2023-11-13 02:33:20'),
(10, 'Arkohn', '123456', 'arkohn@gmail.com', 'mamanila', 1, '2023-11-13 04:08:07'),
(14, '123', '123', '123@123', '123', 1, '2023-11-15 20:22:44'),
(18, 'arkohn', '123', '123@123', 'hello', 1, '2023-11-16 01:19:14'),
(19, 'dasda', '213', '123@1313', 'asdadwasdasd', 1, '2023-11-17 02:48:48'),
(20, '123123', '1243123', '123@dda', 'aasdadasda', 1, '2023-11-17 02:48:55'),
(21, 'sdasda', '2313', '213@wdzc', 'zxczxczcx', 1, '2023-11-17 02:49:07'),
(22, 'Jose Rizal', '09123456789', 'joserizal@gmail.com', 'Gusto ko sana magreklamo about sa Basta Resort...', 0, '2023-11-20 04:14:25');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `payments_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `days`, `price`, `check_in`, `check_out`, `payments_id`, `date_created`) VALUES
(29, 34, 9, 1, 1, 850, '2023-11-01', '2023-11-01', 2, '2023-11-20 00:47:07'),
(30, 35, 9, 2, 1, 850, '2023-11-01', '2023-11-01', 2, '2023-11-20 01:04:04'),
(31, 36, 11, 3, 2, 3200, '2023-11-03', '2023-11-04', 1, '2023-11-20 04:30:22'),
(32, 37, 14, 2, 3, 123, '2023-11-01', '2023-11-03', 9, '2023-11-20 04:36:12');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `receipt` text NOT NULL,
  `notes` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `code`, `client_id`, `vendor_id`, `total_amount`, `receipt`, `notes`, `status`, `payment_status`, `date_created`, `date_updated`) VALUES
(34, '202311-00007', 3, 4, 850, 'uploads/receipt/34_655b1231a2cd0_AAA.jpg', 'bdo 850 1 day gcash', 1, 1, '2023-11-20 00:47:07', '2023-11-20 17:04:33'),
(35, '202311-00008', 3, 4, 1700, 'uploads/receipt/35_655b0ed211f39_AAA.jpg', 'gcash 1700', 0, 0, '2023-11-20 01:04:04', '2023-11-20 17:00:26'),
(36, '202311-00001', 3, 4, 19200, 'uploads/receipt/36_655b19a01a938_AAA.jpg', 'cash 3 rooms 2 days', 0, 1, '2023-11-20 04:30:22', '2023-11-20 17:03:16'),
(37, '202311-00002', 3, 5, 738, 'uploads/receipt/37_655b1200d48d2_AAA.jpg', '2312', 0, 0, '2023-11-20 04:36:12', '2023-11-20 16:31:17');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `qr_code` text DEFAULT 'uploads/qr/1.png',
  `delete_flag` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `vendor_id`, `name`, `description`, `status`, `qr_code`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 'Cash', 'Please provide payment (cash) on check-in day.', 1, 'uploads/qr/1.png', 0, '2023-11-18 05:36:08', NULL),
(2, 4, 'GCash', '09123456789', 1, 'uploads/qr/2.png', 0, '2023-11-18 05:37:47', NULL),
(4, 4, 'BDO', '(sample bank details)', 1, 'uploads/qr/4.png', 0, '2023-11-18 07:22:05', NULL),
(6, 4, 'PayMaya', '09123456789', 1, 'uploads/qr/6.png', 0, '2023-11-18 07:56:23', NULL),
(7, 5, 'Cash', '123', 1, NULL, 0, '2023-11-19 01:04:23', NULL),
(9, 5, 'abc', 'abc', 1, 'uploads/qr/1.png', 0, '2023-11-19 01:06:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) DEFAULT NULL,
  `category_id` int(30) DEFAULT NULL,
  `room_id` int(30) DEFAULT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `map` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `gallery_path` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `vendor_id`, `category_id`, `room_id`, `name`, `address`, `map`, `description`, `gallery_path`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, NULL, 'Basta Resort (Regular)', 'Pansol, Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Welcome to Basta Resort, where tranquility meets luxury in a picturesque setting. Nestled amidst lush greenery and surrounded by breathtaking views, Basta Resort is your escape to a world of comfort and relaxation.&lt;/p&gt;&lt;p&gt;Our regular rooms are designed with your utmost comfort in mind, offering a perfect blend of modern amenities and charming decor. Each room is thoughtfully appointed to ensure a serene and enjoyable stay. Sink into plush beds with crisp linens, unwind in the cozy seating area, and take in the stunning vistas from your private balcony.&lt;/p&gt;&lt;p&gt;At Basta Resort, we understand the importance of creating a home away from home. Our regular rooms are equipped with all the essentials for a seamless stay, including air conditioning, flat-screen TVs, complimentary Wi-Fi, and well-appointed bathrooms with indulgent toiletries.&lt;/p&gt;&lt;p&gt;As our guest, you\'ll have access to the resort\'s world-class facilities and services. Lounge by the sparkling pool, rejuvenate your senses at the spa, or savor delectable cuisine at our onsite restaurant. Whether you\'re seeking a romantic getaway, a family retreat, or a solo adventure, Basta Resort provides the perfect backdrop for your dream vacation.&lt;/p&gt;&lt;p&gt;Come experience the beauty of Basta Resort, where every moment is an opportunity to unwind and create lasting memories. Book your stay today and embark on a journey of relaxation and indulgence.&lt;/p&gt;', 'uploads/products/9_gallery_0.png,uploads/products/9_gallery_1.png,uploads/products/9_gallery_2.png,uploads/products/9_gallery_3.png,uploads/products/9_gallery_4.png,uploads/products/9_gallery_5.png,uploads/products/9_gallery_6.png', 850, 'uploads/products/9.png', 1, 0, '2023-11-13 04:34:11', '2023-11-15 06:16:20'),
(10, 4, 11, NULL, 'Basta Resort (Premium)', 'Pansol, Calamba, Laguna ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Indulge in the epitome of luxury with our Premium Rooms at Basta Resort, where opulence and sophistication seamlessly blend to create an unparalleled retreat. Designed to exceed your expectations, our Premium Rooms offer an elevated experience, ensuring a stay that is both lavish and memorable.&lt;/p&gt;&lt;p&gt;Step into a world of refined comfort as you enter your spacious Premium Room. Immerse yourself in the plush surroundings, where premium furnishings and stylish decor create an ambiance of elegance. The room is thoughtfully curated with high-end amenities to cater to your every need, ensuring a stay that is both indulgent and relaxing.&lt;/p&gt;&lt;p&gt;Relish the exclusive perks that come with our Premium Rooms, including breathtaking panoramic views from your private balcony, personalized concierge services, and access to a dedicated lounge where you can unwind in an intimate setting. Enjoy a restful night\'s sleep on a luxurious king-size bed with premium linens, and wake up to the gentle sounds of nature just beyond your window.&lt;/p&gt;&lt;p&gt;At Basta Resort, we believe in offering an experience that goes beyond the ordinary. Our Premium Rooms boast additional amenities such as in-room coffee makers, deluxe toiletries, and spacious work areas for those who need to stay connected. Whether you\'re celebrating a special occasion or simply seeking a heightened level of comfort, our Premium Rooms are designed to exceed your expectations.&lt;/p&gt;&lt;p&gt;As a guest in our Premium accommodations, you\'ll also enjoy priority access to our resort\'s exclusive facilities, including a private pool and a fitness center. Elevate your stay at Basta Resort with our Premium Rooms, where luxury meets tranquility for an unforgettable escape. Book your indulgent retreat today and let us pamper you in style.&lt;/p&gt;', '', 2500, 'uploads/products/10.png?v=1699903935', 1, 0, '2023-11-14 03:32:13', '2023-11-14 03:42:58'),
(11, 4, 12, NULL, 'Basta Resort (Deluxe)', 'Pansol, Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Experience a heightened sense of luxury in our Deluxe Rooms at Basta Resort, where sophistication meets comfort in an environment designed to exceed expectations. Our Deluxe Rooms are thoughtfully crafted to provide a refined retreat, ensuring an indulgent stay that caters to your every desire.&lt;/p&gt;&lt;p&gt;Step into an oasis of serenity as you enter your Deluxe Room, adorned with tasteful decor and premium furnishings. The spacious layout creates a sense of openness, allowing you to unwind in style. Sink into the comfort of a sumptuous bed with high-quality linens, and take in the tranquil ambiance that surrounds you.&lt;/p&gt;&lt;p&gt;Our Deluxe Rooms are equipped with a range of amenities to enhance your stay, including a well-appointed en-suite bathroom with deluxe toiletries, a flat-screen TV for entertainment, and complimentary high-speed Wi-Fi for seamless connectivity. Enjoy the convenience of a designated work area, perfect for business travelers or those who need a quiet space to catch up on tasks.&lt;/p&gt;&lt;p&gt;Indulge in the luxury of your private balcony, where you can soak in breathtaking views or enjoy a quiet moment with a refreshing beverage. The attention to detail in our Deluxe Rooms extends to every corner, ensuring that your stay is as comfortable as it is memorable.&lt;/p&gt;&lt;p&gt;As a guest in our Deluxe accommodations, you\'ll have access to all the resort\'s amenities, from the inviting pool area to the delectable offerings at our onsite restaurant. Whether you\'re traveling for business or leisure, our Deluxe Rooms provide a haven of relaxation and sophistication.&lt;/p&gt;&lt;p&gt;Book your stay at Basta Resort and discover the perfect blend of luxury and tranquility in our Deluxe Rooms. Immerse yourself in an experience designed to elevate your journey and create lasting memories.&lt;/p&gt;', '', 3200, 'uploads/products/11.png?v=1699904675', 1, 0, '2023-11-14 03:44:33', '2023-11-14 03:44:35'),
(14, 5, 16, NULL, 'Ibang Resort', '123', '123', '&lt;p&gt;123&lt;/p&gt;', 'uploads/products/14_gallery_0.png,uploads/products/14_gallery_1.png,uploads/products/14_gallery_2.png', 123, 'uploads/products/14.png', 1, 0, '2023-11-20 04:34:09', '2023-11-20 04:34:10');

-- --------------------------------------------------------

--
-- Table structure for table `ratings_reviews`
--

CREATE TABLE `ratings_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings_reviews`
--

INSERT INTO `ratings_reviews` (`id`, `product_id`, `client_id`, `vendor_id`, `rating`, `review`, `status`, `date_created`) VALUES
(1, 9, 3, 4, 5, 'Maganda and malinis mga pools at kwarto nila. I love it!!!', 1, '2023-11-17 02:03:04'),
(32, 9, 3, 4, 3, 'di na nya ako mahal gaisss :((', 0, '2023-11-17 02:03:31'),
(33, 9, 3, 4, 3, '123', 0, '2023-11-17 02:21:38'),
(35, 9, 3, 4, 1, 'nice one pareh', 1, '2023-11-17 02:22:15'),
(36, 9, 3, 4, 5, 'gegege', 1, '2023-11-17 02:22:34'),
(38, 9, 3, 4, 4, 'number 2', 1, '2023-11-17 02:24:59'),
(48, 9, 3, 4, 1, 'Very Nice!!!', 0, '2023-11-17 03:19:20'),
(49, 9, 3, 4, 5, 'gg', 0, '2023-11-17 03:19:54'),
(50, 9, 3, 4, 4, '2 star', 0, '2023-11-17 03:23:40'),
(51, 9, 3, 4, 1, 'try 5', 0, '2023-11-17 03:27:30'),
(52, 9, 3, 4, 4, 'try 4', 0, '2023-11-17 03:28:48'),
(53, 9, 3, 4, 1, 'try 1', 0, '2023-11-17 03:29:09'),
(54, 9, 3, 4, 0, 'try 2', 0, '2023-11-17 03:29:15'),
(55, 9, 3, 4, 2, 'try 2', 0, '2023-11-17 03:29:21'),
(56, 9, 3, 4, 3, 'try 3', 0, '2023-11-17 03:29:27'),
(57, 9, 3, 4, 4, 'try 4', 0, '2023-11-17 03:29:31'),
(58, 9, 3, 4, 5, 'try 5', 0, '2023-11-17 03:29:40'),
(60, 9, 3, 4, 0, 'sda', 0, '2023-11-17 03:31:22'),
(61, 9, 3, 4, 0, 'dsf', 0, '2023-11-17 03:34:30'),
(62, 9, 3, 4, 0, 'dsad', 0, '2023-11-17 03:38:20'),
(66, 10, 3, 4, 4, 'try', 1, '2023-11-17 03:52:36'),
(69, 11, 3, 4, 5, 'okay naman maganda dito', 0, '2023-11-20 02:48:39'),
(70, 14, 3, 5, 3, 'Ganda ng resort gaiss', 0, '2023-11-20 04:35:18');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(30) NOT NULL,
  `vendor_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `vendor_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 'Room 101', 'Regular', 0, 0, '2023-11-15 03:55:01', NULL),
(2, 4, 'Room 102', 'Regular', 0, 0, '2023-11-15 03:57:33', NULL),
(3, 4, 'Room 103', 'Regular', 1, 0, '2023-11-15 03:57:44', NULL),
(4, 4, 'Room 104', 'Regular', 1, 0, '2023-11-15 03:57:51', NULL),
(5, 4, 'Room 105', 'Regular', 0, 0, '2023-11-15 03:57:57', NULL),
(6, 4, 'Room 106', 'Premium', 1, 0, '2023-11-15 03:58:20', NULL),
(7, 4, 'Room 107', 'Premium', 1, 0, '2023-11-15 03:58:29', NULL),
(8, 4, 'Room 108', 'Premium', 1, 0, '2023-11-15 03:58:42', NULL),
(9, 4, 'Room 109', 'Deluxe', 1, 0, '2023-11-15 03:58:52', NULL),
(10, 4, 'Room 110', 'Deluxe', 1, 0, '2023-11-15 03:59:05', NULL),
(13, 4, '123', '123', 1, 1, '2023-11-20 03:18:46', NULL),
(14, 4, '123', '123', 0, 1, '2023-11-20 03:25:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_type_list`
--

CREATE TABLE `shop_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop_type_list`
--

INSERT INTO `shop_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Type 3', 1, 0, '2022-02-09 08:49:34', '2023-11-12 22:16:33'),
(2, 'Type 4', 1, 0, '2022-02-09 08:49:46', '2023-11-12 22:16:38'),
(3, 'Type 2', 1, 0, '2022-02-09 08:50:31', '2023-11-12 22:16:29'),
(4, 'Type 1', 1, 0, '2022-02-09 08:50:36', '2023-11-12 22:16:12'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Resorts Booking Management System - Calamba, Laguna'),
(6, 'short_name', 'RBMS'),
(11, 'logo', 'uploads/logo-1699796512.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1699793791.png'),
(15, 'email', 'dot4a@tourism.gov.ph'),
(16, 'contact', '(049) 254 0265'),
(17, 'address', 'Dencris Business Center, Manila S Rd, Calamba, 4027 Laguna');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Department of Toursim', 'Region 4A', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-1.png?v=1699794147', NULL, 1, '2021-01-20 14:02:37', '2023-11-20 07:09:13'),
(12, 'Captain ', 'Barbell', 'captainbarbell', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-12.png?v=1700435167', NULL, 2, '2023-11-20 07:05:25', '2023-11-20 07:06:07'),
(13, 'Captain', 'America', 'cap', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-13.png?v=1700435308', NULL, 1, '2023-11-20 07:07:21', '2023-11-20 07:08:28');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_list`
--

CREATE TABLE `vendor_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `shop_type_id` int(30) NOT NULL,
  `shop_name` text NOT NULL,
  `shop_owner` text NOT NULL,
  `email` text NOT NULL,
  `contact` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_list`
--

INSERT INTO `vendor_list` (`id`, `code`, `shop_type_id`, `shop_name`, `shop_owner`, `email`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202311-00001', 4, 'Basta Resort', 'Jose P. Rizal', 'bastaresort@gmail.com', '091234567891', 'bastaresort', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/vendors/4.png?v=1699820359', 1, 0, '2023-11-13 04:19:19', '2023-11-20 06:52:04'),
(5, '202311-00002', 3, 'Ibang Resort', 'Optimus Prime', '', '09123456789', 'ibangresort', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/vendors/5.png?v=1699820607', 1, 0, '2023-11-13 04:23:27', '2023-11-13 04:23:27'),
(6, '202311-00003', 4, 'Another Resort', 'Another R. Ulet', 'anotherresort@gmail.com', '090123456789', 'anotherresort', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/vendors/6.png?v=1700434510', 1, 0, '2023-11-20 06:55:10', '2023-11-20 06:55:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `cart_list_ibfk_3` (`payments_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inquiries_ibfk_1` (`client_id`),
  ADD KEY `inquiries_ibfk_2` (`product_id`),
  ADD KEY `inquiries_ibfk_3` (`vendor_id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_items_ibfk_3` (`payments_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_ibfk_1` (`vendor_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `product_list_ibfk_3` (`room_id`);

--
-- Indexes for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_reviews_ibfk_1` (`product_id`),
  ADD KEY `ratings_reviews_ibfk_2` (`client_id`),
  ADD KEY `ratings_reviews_ibfk_3` (`vendor_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roms_ibfk_1` (`vendor_id`);

--
-- Indexes for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`shop_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart_list`
--
ALTER TABLE `cart_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shop_type_list`
--
ALTER TABLE `shop_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_list`
--
ALTER TABLE `vendor_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_list`
--
ALTER TABLE `cart_list`
  ADD CONSTRAINT `cart_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_list_ibfk_3` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiries_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiries_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`);

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `product_list_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_list_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  ADD CONSTRAINT `ratings_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_reviews_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_reviews_ibfk_3` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `roms_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_list`
--
ALTER TABLE `vendor_list`
  ADD CONSTRAINT `vendor_list_ibfk_1` FOREIGN KEY (`shop_type_id`) REFERENCES `shop_type_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
