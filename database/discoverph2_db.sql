-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 09:16 PM
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
-- Database: `discoverph2_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agency_list`
--

CREATE TABLE `agency_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `agency_type_id` int(30) NOT NULL,
  `agency_name` text NOT NULL,
  `agency_owner` text NOT NULL,
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
-- Dumping data for table `agency_list`
--

INSERT INTO `agency_list` (`id`, `code`, `agency_type_id`, `agency_name`, `agency_owner`, `email`, `contact`, `username`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(4, '202311-00001', 4, 'Basta Resort', 'Jose P. Rizal', 'bastaresort@gmail.com', '091234567891', 'bastaresort', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/4.png?v=1699820359', 1, 0, '2023-11-13 04:19:19', '2023-11-20 06:52:04'),
(5, '202311-00002', 3, 'Ibang Resort', 'Optimus Prime', '', '09123456789', 'ibangresort', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/5.png?v=1699820607', 1, 0, '2023-11-13 04:23:27', '2023-11-13 04:23:27'),
(8, '202311-00004', 4, 'MMC Travel and Tours', 'Jose Rizal', 'mmctravelandtours@gmail.com', '090123456789', 'mmc', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/8.png?v=1702749323', 1, 0, '2023-11-30 13:25:57', '2023-12-17 01:55:23'),
(9, '202312-00001', 4, 'test 1', 'test 1', 'test1@gmail.com', '09123456789', 'test1', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/9.png?v=1702749218', 1, 0, '2023-12-16 19:09:33', '2023-12-17 01:53:38'),
(10, '202312-00002', 4, 'test 2', 'test 2', 'test2@gmail.com', '0901-234-5678', 'test2', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/10.png?v=1702749192', 1, 0, '2023-12-17 01:51:41', '2023-12-17 01:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `agency_type_list`
--

CREATE TABLE `agency_type_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agency_type_list`
--

INSERT INTO `agency_type_list` (`id`, `name`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Type 3', 1, 0, '2022-02-09 08:49:34', '2023-11-12 22:16:33'),
(2, 'Type 4', 1, 0, '2022-02-09 08:49:46', '2023-11-12 22:16:38'),
(3, 'Type 2', 1, 0, '2022-02-09 08:50:31', '2023-11-12 22:16:29'),
(4, 'Type 1', 1, 0, '2022-02-09 08:50:36', '2023-11-12 22:16:12'),
(5, 'Others', 1, 1, '2022-02-09 08:50:41', '2022-02-09 08:50:45'),
(6, 'Type 5', 1, 1, '2023-12-16 05:23:15', '2023-12-16 05:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `booked_packages`
--

CREATE TABLE `booked_packages` (
  `id` int(11) NOT NULL,
  `booked_packages_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `number_of_traveler` double NOT NULL DEFAULT 0,
  `travel_type_id` int(11) DEFAULT NULL,
  `days` int(11) NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `payment_type_id` int(11) NOT NULL,
  `payment_amount` int(11) NOT NULL DEFAULT 0,
  `payments_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked_packages`
--

INSERT INTO `booked_packages` (`id`, `booked_packages_id`, `package_id`, `number_of_traveler`, `travel_type_id`, `days`, `price`, `check_in`, `check_out`, `payment_type_id`, `payment_amount`, `payments_id`, `date_created`) VALUES
(29, 34, 9, 1, 1, 1, 850, '2023-11-01', '2023-11-01', 1, 0, 2, '2023-11-20 00:47:07'),
(30, 35, 9, 2, 1, 1, 850, '2023-11-01', '2023-11-01', 1, 0, 2, '2023-11-20 01:04:04'),
(31, 36, 11, 3, 1, 2, 3200, '2023-11-03', '2023-11-04', 1, 0, 1, '2023-11-20 04:30:22'),
(33, 38, 9, 1, 1, 1, 850, '2023-11-01', '2023-11-01', 1, 0, 2, '2023-11-24 05:30:45'),
(34, 39, 9, 2, 1, 3, 850, '2023-11-01', '2023-11-03', 1, 0, 2, '2023-11-27 02:08:08'),
(35, 40, 9, 2, 1, 2, 850, '2023-11-01', '2023-11-03', 1, 0, 2, '2023-11-27 05:19:15'),
(36, 41, 9, 1, 1, 1, 850, '2023-11-01', '2023-11-01', 1, 0, 2, '2023-11-27 05:22:30'),
(37, 42, 9, 3, 1, 3, 850, '2023-11-03', '2023-11-05', 1, 0, 2, '2023-11-27 05:52:14'),
(38, 43, 9, 2, 1, 3, 850, '2023-11-01', '2023-11-03', 1, 0, 2, '2023-11-27 20:49:53'),
(39, 44, 9, 1, 1, 1, 850, '0000-00-00', '0000-00-00', 1, 0, 1, '2023-11-30 08:27:49'),
(40, 45, 18, 2, 1, 1, 799, '2023-12-09', '0000-00-00', 1, 0, 11, '2023-12-05 13:41:11'),
(43, 48, 18, 2, 2, 1, 799, '2023-12-22', '0000-00-00', 2, 1598, 12, '2023-12-15 23:03:55'),
(44, 49, 18, 3, 2, 1, 799, '2023-12-26', '0000-00-00', 1, 2000, 12, '2023-12-15 23:14:33'),
(45, 50, 18, 1, 2, 1, 799, '2023-12-25', '0000-00-00', 1, 200, 11, '2023-12-16 19:56:09'),
(47, 52, 19, 2, 2, 1, 2499, '2024-01-11', '0000-00-00', 1, 1000, 11, '2023-12-17 02:33:42'),
(48, 53, 18, 4, 4, 1, 799, '2024-01-21', '0000-00-00', 1, 1000, 12, '2023-12-17 02:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `booked_packages_list`
--

CREATE TABLE `booked_packages_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `traveler_id` int(30) NOT NULL,
  `agency_id` int(30) NOT NULL,
  `total_amount` double NOT NULL DEFAULT 0,
  `receipt` text NOT NULL,
  `notes` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booked_packages_list`
--

INSERT INTO `booked_packages_list` (`id`, `code`, `traveler_id`, `agency_id`, `total_amount`, `receipt`, `notes`, `status`, `payment_status`, `date_created`, `date_updated`) VALUES
(34, '202311-00007', 3, 4, 850, 'uploads/receipt/34_655b1231a2cd0_AAA.jpg', 'bdo 850 1 day gcash', 1, 1, '2023-11-20 00:47:07', '2023-11-20 17:04:33'),
(35, '202311-00008', 3, 4, 1700, 'uploads/receipt/35_655b0ed211f39_AAA.jpg', 'gcash 1700', 0, 0, '2023-11-20 01:04:04', '2023-11-20 17:00:26'),
(36, '202311-00001', 3, 4, 19200, 'uploads/receipt/36_655b19a01a938_AAA.jpg', 'cash 3 rooms 2 days', 0, 1, '2023-11-20 04:30:22', '2023-11-20 17:03:16'),
(38, '202311-00003', 3, 4, 850, 'uploads/receipt/38_656135d6029df_Arkohn try.jpg', '1 night', 3, 0, '2023-11-24 05:30:45', '2023-11-26 09:02:17'),
(39, '202311-00004', 3, 4, 5100, 'uploads/receipt/39_656389b776bfd_AAA.jpg', '123', 0, 0, '2023-11-27 02:08:08', '2023-11-27 02:08:55'),
(40, '202311-00005', 3, 4, 3400, 'uploads/receipt/3_6563b65303f4a_AAA.jpg', 'testing001', 3, 1, '2023-11-27 05:19:15', '2023-11-28 07:26:04'),
(41, '202311-00006', 3, 4, 850, 'uploads/receipt/3_6563b716c034b_rc.jpg', 'checkout all 1', 0, 0, '2023-11-27 05:22:30', '2023-11-27 05:22:30'),
(42, '202311-00009', 3, 4, 7650, 'uploads/receipt/3_6563be0e96023_AAA.jpg', '3 days 3 rooms testing', 3, 1, '2023-11-27 05:52:14', '2023-11-27 06:26:17'),
(43, '202311-00010', 3, 4, 5100, 'uploads/receipt/3_6564907200d23_376357602_831507191701156_1441885424189076074_n.jpg', '2 rooms 3 days gcash 5100', 3, 0, '2023-11-27 20:49:53', '2023-11-28 07:26:31'),
(44, '202311-00011', 3, 4, 850, '', '123', 0, 0, '2023-11-30 08:27:49', '2023-11-30 08:27:49'),
(45, '202312-00001', 3, 8, 1598, 'uploads/receipt/3_656eb7f7a40df_DDD.jpg', 'sample booking 1', 0, 0, '2023-12-05 13:41:11', '2023-12-05 13:41:11'),
(48, '202312-00004', 3, 8, 1598, 'uploads/receipt/3_657c6adbe2f00_376357602_831507191701156_1441885424189076074_n.jpg', 'testing travel type', 0, 0, '2023-12-15 23:03:55', '2023-12-17 02:03:35'),
(49, '202312-00005', 3, 8, 2397, 'uploads/receipt/3_657c6d5944aaf_376357602_831507191701156_1441885424189076074_n.jpg', 'test book 3', 2, 1, '2023-12-15 23:14:33', '2023-12-16 04:57:26'),
(50, '202312-00006', 3, 8, 799, 'uploads/receipt/3_657d90599320a_sdasd.jpg', 'test book ', 3, 1, '2023-12-16 19:56:09', '2023-12-17 02:05:06'),
(52, '202312-00002', 6, 8, 4998, 'uploads/receipt/6_657ded863aaeb_376357602_831507191701156_1441885424189076074_n.jpg', 'test book sopi', 0, 0, '2023-12-17 02:33:42', '2023-12-17 03:29:18'),
(53, '202312-00003', 6, 8, 3196, 'uploads/receipt/6_657dedcc552db_DDD.jpg', 'test book sopi part 2', 1, 2, '2023-12-17 02:34:52', '2023-12-17 03:38:44');

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `id` int(30) NOT NULL,
  `traveler_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `payments_id` int(30) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `payment_amount` int(11) NOT NULL,
  `number_of_traveler` float NOT NULL,
  `travel_type_id` int(30) DEFAULT NULL,
  `days` int(11) NOT NULL DEFAULT 1,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`id`, `traveler_id`, `package_id`, `payments_id`, `payment_type_id`, `payment_amount`, `number_of_traveler`, `travel_type_id`, `days`, `check_in`, `check_out`) VALUES
(298, 6, 19, NULL, NULL, 0, 1, NULL, 1, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `agency_id` int(30) NOT NULL,
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

INSERT INTO `category_list` (`id`, `agency_id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(10, 4, 'Regular', '1 room, 1 medium-sized bed, aircon', 1, 0, '2023-11-13 04:31:45', NULL),
(11, 4, 'Premium', '1 room, 2 large sized beds, aircon, widescreen tv, wifi', 1, 0, '2023-11-13 04:32:24', NULL),
(12, 4, 'Deluxe', '1 room, 4 large sized beds, aircon, widescreen tv, wifi, karaoke, billiards', 1, 0, '2023-11-14 01:36:22', NULL),
(16, 5, 'Whole Resort', 'Rent the whole resort.', 1, 0, '2023-11-20 04:33:02', NULL),
(18, 8, 'Day Tour', 'sample description', 1, 0, '2023-11-30 13:32:51', NULL),
(20, 8, '2 Days 1 Night', 'sample description', 1, 0, '2023-12-17 02:15:48', '2023-12-17 02:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(30) NOT NULL,
  `traveler_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `agency_id` int(30) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `traveler_id`, `package_id`, `agency_id`, `subject`, `message`, `status`, `date_created`) VALUES
(13, 3, 9, 4, 'sample', 'SAMPLE', 1, '2023-11-16 01:10:30'),
(14, 3, 9, 4, 'hi', 'hi', 1, '2023-11-16 01:17:59'),
(15, 3, 9, 4, 'gg', 'gg', 1, '2023-11-16 01:20:57'),
(25, 3, 9, 4, 'mamako', 'mamako', 1, '2023-11-16 01:50:07'),
(35, 3, 10, 4, 'try ', 'try', 1, '2023-11-17 03:54:23'),
(37, 3, 9, 4, '123', '123', 0, '2023-11-20 03:28:48'),
(38, 3, 10, 4, '123', '123', 0, '2023-11-20 03:28:56'),
(39, 3, 11, 4, '123', '123', 0, '2023-11-20 03:29:09'),
(43, 3, 18, 8, 'test inquire', 'test message', 0, '2023-12-16 19:51:10');

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
(22, 'Jose Rizal', '09123456789', 'joserizal@gmail.com', 'Gusto ko sana magreklamo about sa Basta Resort...', 0, '2023-11-20 04:14:25'),
(23, 'Dorothy Grace Dauan', '090123456789', 'dorothy@gmail.com', 'sample inquiry', 1, '2023-11-24 06:52:04'),
(24, '1223', '123', '123@123', '123', 0, '2023-11-26 21:55:46'),
(25, '123', '123', '123@122', '122', 0, '2023-11-26 21:56:12'),
(26, '111', '111', '111@111', '111', 0, '2023-11-27 00:23:42'),
(27, '222', '222', '222@222', '222', 1, '2023-11-27 00:29:11'),
(28, 'Arkohn Mamamo Mamako', '09278709744', 'arkohgn@gmail.com', 'gusto ko sana ireklamo si hannah', 1, '2023-11-27 01:20:19'),
(29, '112', '112', '112@112', '112', 0, '2023-11-27 01:25:32'),
(30, '222', '222', '222@222', '222', 0, '2023-11-27 01:26:14'),
(31, 'mark', '123', 'mark@123', 'mark123', 1, '2023-11-27 01:29:52'),
(32, '555', '555', '555@555', '555', 0, '2023-11-27 01:30:46'),
(33, '1221', '2123121', '22@12312', '21312312312312', 0, '2023-11-27 01:32:33'),
(34, '321312', '213231', '223@231231', '231231', 0, '2023-11-27 01:32:58'),
(35, 'mark', 'mark', 'mark@mark', 'markmark', 1, '2023-11-27 06:15:02'),
(36, 'Dustin Sophie Luna', '0901-234-5678', 'dustin@gmail.com', 'test message', 0, '2023-12-17 01:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `package_list`
--

CREATE TABLE `package_list` (
  `id` int(30) NOT NULL,
  `agency_id` int(30) DEFAULT NULL,
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
-- Dumping data for table `package_list`
--

INSERT INTO `package_list` (`id`, `agency_id`, `category_id`, `room_id`, `name`, `address`, `map`, `description`, `gallery_path`, `price`, `image_path`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(9, 4, 10, NULL, 'Basta Resort (Regular)', 'Pansol, Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Welcome to &lt;b&gt;Basta Resort&lt;/b&gt;, where tranquility meets luxury in a picturesque setting. Nestled amidst lush greenery and surrounded by breathtaking views, Basta Resort is your escape to a world of comfort and relaxation.&lt;/p&gt;&lt;p&gt;Our regular rooms are designed with your utmost comfort in mind, offering a perfect blend of modern amenities and charming decor. Each room is thoughtfully appointed to ensure a serene and enjoyable stay. Sink into plush beds with crisp linens, unwind in the cozy seating area, and take in the stunning vistas from your private balcony.&lt;/p&gt;&lt;p&gt;At Basta Resort, we understand the importance of creating a home away from home. Our regular rooms are equipped with all the essentials for a seamless stay, including air conditioning, flat-screen TVs, complimentary Wi-Fi, and well-appointed bathrooms with indulgent toiletries.&lt;/p&gt;&lt;p&gt;As our guest, you\'ll have access to the resort\'s world-class facilities and services. Lounge by the sparkling pool, rejuvenate your senses at the spa, or savor delectable cuisine at our onsite restaurant. Whether you\'re seeking a romantic getaway, a family retreat, or a solo adventure, Basta Resort provides the perfect backdrop for your dream vacation.&lt;/p&gt;&lt;p&gt;Come experience the beauty of Basta Resort, where every moment is an opportunity to unwind and create lasting memories. Book your stay today and embark on a journey of relaxation and indulgence.&lt;/p&gt;', 'uploads/packages/9_gallery_0.png,uploads/packages/9_gallery_1.png,uploads/packages/9_gallery_2.png,uploads/packages/9_gallery_3.png,uploads/packages/9_gallery_4.png,uploads/packages/9_gallery_5.png,uploads/packages/9_gallery_6.png', 850, 'uploads/packages/9.png', 1, 0, '2023-11-13 04:34:11', '2023-11-26 09:12:07'),
(10, 4, 11, NULL, 'Basta Resort (Premium)', 'Pansol, Calamba, Laguna ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Indulge in the epitome of luxury with our Premium Rooms at Basta Resort, where opulence and sophistication seamlessly blend to create an unparalleled retreat. Designed to exceed your expectations, our Premium Rooms offer an elevated experience, ensuring a stay that is both lavish and memorable.&lt;/p&gt;&lt;p&gt;Step into a world of refined comfort as you enter your spacious Premium Room. Immerse yourself in the plush surroundings, where premium furnishings and stylish decor create an ambiance of elegance. The room is thoughtfully curated with high-end amenities to cater to your every need, ensuring a stay that is both indulgent and relaxing.&lt;/p&gt;&lt;p&gt;Relish the exclusive perks that come with our Premium Rooms, including breathtaking panoramic views from your private balcony, personalized concierge services, and access to a dedicated lounge where you can unwind in an intimate setting. Enjoy a restful night\'s sleep on a luxurious king-size bed with premium linens, and wake up to the gentle sounds of nature just beyond your window.&lt;/p&gt;&lt;p&gt;At Basta Resort, we believe in offering an experience that goes beyond the ordinary. Our Premium Rooms boast additional amenities such as in-room coffee makers, deluxe toiletries, and spacious work areas for those who need to stay connected. Whether you\'re celebrating a special occasion or simply seeking a heightened level of comfort, our Premium Rooms are designed to exceed your expectations.&lt;/p&gt;&lt;p&gt;As a guest in our Premium accommodations, you\'ll also enjoy priority access to our resort\'s exclusive facilities, including a private pool and a fitness center. Elevate your stay at Basta Resort with our Premium Rooms, where luxury meets tranquility for an unforgettable escape. Book your indulgent retreat today and let us pamper you in style.&lt;/p&gt;', 'uploads/packages/10_gallery_0.png,uploads/packages/10_gallery_1.png,uploads/packages/10_gallery_2.png', 2500, 'uploads/packages/10.png?v=1699903935', 1, 0, '2023-11-14 03:32:13', '2023-11-30 05:57:10'),
(11, 4, 12, NULL, 'Basta Resort (Deluxe)', 'Pansol, Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30945.865595277177!2d121.1876487!3d14.1811152!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd61e359982a35%3A0x1924c55513a3e849!2sMakiling%20Spring%20Resorts!5e0!3m2!1sen!2sph!4v1699900463925!5m2!1sen!2sph', '&lt;p&gt;Experience a heightened sense of luxury in our Deluxe Rooms at Basta Resort, where sophistication meets comfort in an environment designed to exceed expectations. Our Deluxe Rooms are thoughtfully crafted to provide a refined retreat, ensuring an indulgent stay that caters to your every desire.&lt;/p&gt;&lt;p&gt;Step into an oasis of serenity as you enter your Deluxe Room, adorned with tasteful decor and premium furnishings. The spacious layout creates a sense of openness, allowing you to unwind in style. Sink into the comfort of a sumptuous bed with high-quality linens, and take in the tranquil ambiance that surrounds you.&lt;/p&gt;&lt;p&gt;Our Deluxe Rooms are equipped with a range of amenities to enhance your stay, including a well-appointed en-suite bathroom with deluxe toiletries, a flat-screen TV for entertainment, and complimentary high-speed Wi-Fi for seamless connectivity. Enjoy the convenience of a designated work area, perfect for business travelers or those who need a quiet space to catch up on tasks.&lt;/p&gt;&lt;p&gt;Indulge in the luxury of your private balcony, where you can soak in breathtaking views or enjoy a quiet moment with a refreshing beverage. The attention to detail in our Deluxe Rooms extends to every corner, ensuring that your stay is as comfortable as it is memorable.&lt;/p&gt;&lt;p&gt;As a guest in our Deluxe accommodations, you\'ll have access to all the resort\'s amenities, from the inviting pool area to the delectable offerings at our onsite restaurant. Whether you\'re traveling for business or leisure, our Deluxe Rooms provide a haven of relaxation and sophistication.&lt;/p&gt;&lt;p&gt;Book your stay at Basta Resort and discover the perfect blend of luxury and tranquility in our Deluxe Rooms. Immerse yourself in an experience designed to elevate your journey and create lasting memories.&lt;/p&gt;', '', 3200, 'uploads/packages/11.png?v=1699904675', 1, 0, '2023-11-14 03:44:33', '2023-11-14 03:44:35'),
(18, 8, 18, NULL, 'Secret River Laguna Day Tour', 'Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25277.479490670084!2d121.1521302399552!3d14.21679047698094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd618f60320ffd%3A0xe5b4e3a1ea2fb845!2sSan%20Juan%20River!5e0!3m2!1sen!2sph!4v1701323066923!5m2!1sen!2sph', '&lt;div&gt;✅ENJOY 9+(1 FREE)TRAVEL PACKAGE PROMO&lt;/div&gt;&lt;div&gt;✅ OPEN TO ALL AGES&lt;/div&gt;&lt;div&gt;✅NO REQUIREMENTS NEEDED&lt;/div&gt;&lt;div&gt;✅OPEN FOR SOLO , JOINERS, GROUP AND EXCLUSIVE.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;✔️RT Van Transfer Mnl-Zambales-Mnl&lt;/div&gt;&lt;div&gt;✔️Gas,Toll,Drivers fee,Drivers Meals&lt;/div&gt;&lt;div&gt;✔️Ecological Fee&lt;/div&gt;&lt;div&gt;✔️Parking fees,&lt;/div&gt;&lt;div&gt;✔️Coordinator on Board&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;DEPARTURE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;A NIGHT BEFORE OF YOUR TOUR DATE&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;PICK-UP TIME AND PLACE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;11:30PM - MOA ECOM CHOWKING&nbsp;&lt;/div&gt;&lt;div&gt;12:30AM - 7 ELEVEN GREENFIELD SHAW EDSA ( TELEPERFORMANCE )&nbsp;&lt;/div&gt;&lt;div&gt;1:00AM&nbsp; - MCDO CENTRIS BMW&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FOR BOOKING / RESERVATION :&lt;/span&gt;&lt;/div&gt;&lt;div&gt;A Reservation of 500/person DAYTOUR and 1000/person for 2D1N is required to secure your slots. All deposits will be deducted to the balance, remaining balance and exclusions will be collected on the travel date itself.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&quot;NO DEPOSIT NO RESERVATION POLICY&quot;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;Limited slots only! Reservations are on a first-come, first-serve basis. Promo is not valid during Holy week and peak seasons. Reservation depends on the availability of the Tour schedule. We also have combined tours for small groups, private tours can also be set on your preferred Travel date with free pick-up and drop-off within Metro Manila only.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;MMC TRAVEL AND TOURS&lt;/span&gt;&lt;/div&gt;&lt;div&gt;02-7000-7258 LANDLINE/GLOBE/TM&lt;/div&gt;&lt;div&gt;09778527841 GLOBE&lt;/div&gt;&lt;div&gt;www.facebook.com/www.mmctravelandtours.com.ph&lt;/div&gt;', 'uploads/packages/18_gallery_0.png,uploads/packages/18_gallery_1.png,uploads/packages/18_gallery_2.png,uploads/packages/18_gallery_3.png,uploads/packages/18_gallery_4.png,uploads/packages/18_gallery_5.png,uploads/packages/18_gallery_6.png,uploads/packages/18_gallery_7.png,uploads/packages/18_gallery_8.png,uploads/packages/18_gallery_9.png', 799, 'uploads/packages/18.png', 1, 0, '2023-11-30 13:47:50', '2023-11-30 14:07:37'),
(19, 8, 20, NULL, 'Secret River Laguna 2D1N', 'Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25277.479490670084!2d121.1521302399552!3d14.21679047698094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd618f60320ffd%3A0xe5b4e3a1ea2fb845!2sSan%20Juan%20River!5e0!3m2!1sen!2sph!4v1701323066923!5m2!1sen!2sph', '&lt;div&gt;✅ENJOY 9+(1 FREE)TRAVEL PACKAGE PROMO&lt;/div&gt;&lt;div&gt;✅ OPEN TO ALL AGES&lt;/div&gt;&lt;div&gt;✅NO REQUIREMENTS NEEDED&lt;/div&gt;&lt;div&gt;✅OPEN FOR SOLO , JOINERS, GROUP AND EXCLUSIVE.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;✔️RT Van Transfer Mnl-Zambales-Mnl&lt;/div&gt;&lt;div&gt;✔️Gas,Toll,Drivers fee,Drivers Meals&lt;/div&gt;&lt;div&gt;✔️Ecological Fee&lt;/div&gt;&lt;div&gt;✔️Parking fees,&lt;/div&gt;&lt;div&gt;✔️Coordinator on Board&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;DEPARTURE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;A NIGHT BEFORE OF YOUR TOUR DATE&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;PICK-UP TIME AND PLACE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;11:30PM - MOA ECOM CHOWKING&nbsp;&lt;/div&gt;&lt;div&gt;12:30AM - 7 ELEVEN GREENFIELD SHAW EDSA ( TELEPERFORMANCE )&nbsp;&lt;/div&gt;&lt;div&gt;1:00AM&nbsp; - MCDO CENTRIS BMW&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FOR BOOKING / RESERVATION :&lt;/span&gt;&lt;/div&gt;&lt;div&gt;A Reservation of 500/person DAYTOUR and 1000/person for 2D1N is required to secure your slots. All deposits will be deducted to the balance, remaining balance and exclusions will be collected on the travel date itself.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&quot;NO DEPOSIT NO RESERVATION POLICY&quot;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;Limited slots only! Reservations are on a first-come, first-serve basis. Promo is not valid during Holy week and peak seasons. Reservation depends on the availability of the Tour schedule. We also have combined tours for small groups, private tours can also be set on your preferred Travel date with free pick-up and drop-off within Metro Manila only.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;MMC TRAVEL AND TOURS&lt;/span&gt;&lt;/div&gt;&lt;div&gt;02-7000-7258 LANDLINE/GLOBE/TM&lt;/div&gt;&lt;div&gt;09778527841 GLOBE&lt;/div&gt;&lt;div&gt;www.facebook.com/www.mmctravelandtours.com.ph&lt;/div&gt;', 'uploads/packages/18_gallery_0.png,uploads/packages/18_gallery_1.png,uploads/packages/18_gallery_2.png,uploads/packages/18_gallery_3.png,uploads/packages/18_gallery_4.png,uploads/packages/18_gallery_5.png,uploads/packages/18_gallery_6.png,uploads/packages/18_gallery_7.png,uploads/packages/18_gallery_8.png,uploads/packages/18_gallery_9.png', 2499, 'uploads/packages/18.png', 1, 0, '2023-12-01 02:21:54', '2023-12-17 02:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `agency_id` int(30) NOT NULL,
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

INSERT INTO `payments` (`id`, `agency_id`, `name`, `description`, `status`, `qr_code`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 'Cash', 'Please provide payment (cash) on check-in day.', 1, 'uploads/qr/1.png', 0, '2023-11-18 05:36:08', NULL),
(2, 4, 'GCash', '09123456789', 1, 'uploads/qr/2.png', 0, '2023-11-18 05:37:47', NULL),
(4, 4, 'BDO', '(sample bank details)', 1, 'uploads/qr/4.png', 0, '2023-11-18 07:22:05', NULL),
(6, 4, 'PayMaya', '09123456789', 1, 'uploads/qr/6.png', 0, '2023-11-18 07:56:23', NULL),
(7, 5, 'Cash', '123', 1, NULL, 0, '2023-11-19 01:04:23', NULL),
(9, 5, 'abc', 'abc', 1, 'uploads/qr/1.png', 0, '2023-11-19 01:06:48', NULL),
(10, 8, 'Cash', 'Please provide payment (cash) on tour day.', 1, 'uploads/qr/1.png', 0, '2023-12-01 19:10:09', NULL),
(11, 8, 'GCash', 'Jose Rizal | 0901-234-5678', 1, 'uploads/qr/11.png', 0, '2023-12-01 19:16:27', NULL),
(12, 8, 'BDO', '(sample bank details)', 1, 'uploads/qr/12.png', 0, '2023-12-01 19:17:39', NULL),
(13, 8, 'PayMaya', 'Jose Rizal | 0901-234-5678', 1, 'uploads/qr/13.png', 0, '2023-12-01 19:19:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `payment_type_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id`, `payment_type_name`) VALUES
(1, 'Down Payment'),
(2, 'Full Payment'),
(3, 'Book Now Pay Later');

-- --------------------------------------------------------

--
-- Table structure for table `ratings_reviews`
--

CREATE TABLE `ratings_reviews` (
  `id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `traveler_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings_reviews`
--

INSERT INTO `ratings_reviews` (`id`, `package_id`, `traveler_id`, `agency_id`, `rating`, `review`, `status`, `date_created`) VALUES
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
(71, 9, 3, 4, 3, 'testing 123', 0, '2023-11-25 22:25:14'),
(73, 18, 3, 8, 3, 'maganda naman sya solid ang experience', 0, '2023-12-01 21:43:11'),
(74, 18, 3, 8, 1, 'hindi na niya ako mahal gaiss :(((', 0, '2023-12-01 21:43:35'),
(75, 18, 3, 8, 5, 'try lang magreview :))', 0, '2023-12-03 08:33:08'),
(76, 18, 3, 8, 5, 'very nice', 0, '2023-12-05 13:48:19'),
(80, 18, 5, 8, 3, 'okay lang masaya naman', 1, '2023-12-05 13:53:01'),
(81, 18, 3, 8, 3, 'test review', 0, '2023-12-16 19:51:33'),
(85, 19, 3, 8, 3, 'test review\n', 0, '2023-12-17 02:31:55'),
(87, 19, 6, 8, 4, 'test review', 0, '2023-12-17 02:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(30) NOT NULL,
  `agency_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `package_category` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `agency_id`, `name`, `package_category`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 4, 'Room 101', 'Regular', 'Regular', 0, 0, '2023-11-15 03:55:01', NULL),
(2, 4, 'Room 102', 'Regular', 'Regular', 0, 0, '2023-11-15 03:57:33', NULL),
(3, 4, 'Room 103', 'Regular', 'Regular', 1, 0, '2023-11-15 03:57:44', NULL),
(4, 4, 'Room 104', 'Regular', 'Regular', 1, 0, '2023-11-15 03:57:51', NULL),
(5, 4, 'Room 105', 'Regular', 'Regular', 0, 0, '2023-11-15 03:57:57', NULL),
(6, 4, 'Room 106', 'Premium', 'Premium', 1, 0, '2023-11-15 03:58:20', NULL),
(7, 4, 'Room 107', 'Premium', 'Premium', 1, 0, '2023-11-15 03:58:29', NULL),
(8, 4, 'Room 108', 'Premium', 'Premium', 1, 0, '2023-11-15 03:58:42', NULL),
(9, 4, 'Room 109', 'Deluxe', 'Deluxe', 1, 0, '2023-11-15 03:58:52', NULL),
(10, 4, 'Room 110', 'Deluxe', 'Deluxe', 1, 0, '2023-11-15 03:59:05', NULL),
(19, 8, 'Seat 1', 'Day Tour', 'Shotgun', 1, 0, '2023-12-16 04:26:43', NULL),
(20, 8, 'Seat 2', 'Day Tour', 'Middle Left', 0, 0, '2023-12-16 05:01:52', NULL);

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
(1, 'name', 'Discover Philippines CALABARZON'),
(6, 'short_name', 'Discover PH'),
(11, 'logo', 'uploads/logo-1701304494.png'),
(13, 'user_avatar', 'uploads/avatar-1701023547.png'),
(14, 'cover', 'uploads/cover-1700998310.png'),
(15, 'email', 'dot4a@tourism.gov.ph'),
(16, 'contact', '(049) 254 0265'),
(17, 'address', 'Dencris Business Center, Manila S Rd, Calamba, 4027 Laguna');

-- --------------------------------------------------------

--
-- Table structure for table `traveler_list`
--

CREATE TABLE `traveler_list` (
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
-- Dumping data for table `traveler_list`
--

INSERT INTO `traveler_list` (`id`, `code`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `password`, `avatar`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(3, '202311-00001', 'Arkohn', 'Jose', 'Rizal', 'Male', '09278709744', 'San Pedro, Laguna, 4023', 'arkohn@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/3.png?v=1702675918', 1, 0, '2023-11-12 22:05:00', '2023-12-16 05:31:58'),
(5, '202312-00001', 'John Mark', 'Dauan', 'Garapan', 'Male', '09278709744', 'San Pedro, Laguna', 'johnmarkgarapan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/5.png?v=1701755465', 1, 0, '2023-12-05 13:51:05', '2023-12-05 13:51:05'),
(6, '202312-00002', 'Dustin', 'Sophie', 'Luna', 'Female', '090123456789', 'Santa Rosa', 'dustin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/6.png?v=1702748109', 1, 0, '2023-12-17 01:32:29', '2023-12-17 01:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `travel_type`
--

CREATE TABLE `travel_type` (
  `id` int(11) NOT NULL,
  `travel_type_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel_type`
--

INSERT INTO `travel_type` (`id`, `travel_type_name`) VALUES
(1, 'Solo'),
(2, 'Joiner'),
(3, 'Group'),
(4, 'Exclusive');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agency_list`
--
ALTER TABLE `agency_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_type_id` (`agency_type_id`);

--
-- Indexes for table `agency_type_list`
--
ALTER TABLE `agency_type_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booked_packages`
--
ALTER TABLE `booked_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`booked_packages_id`),
  ADD KEY `product_id` (`package_id`),
  ADD KEY `order_items_ibfk_3` (`payments_id`),
  ADD KEY `booked_packages_ibfk_4` (`payment_type_id`),
  ADD KEY `travel_type_id` (`travel_type_id`);

--
-- Indexes for table `booked_packages_list`
--
ALTER TABLE `booked_packages_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`traveler_id`),
  ADD KEY `vendor_id` (`agency_id`);

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`traveler_id`),
  ADD KEY `product_id` (`package_id`),
  ADD KEY `cart_list_ibfk_3` (`payments_id`),
  ADD KEY `cart_list_ibfk_4` (`travel_type_id`),
  ADD KEY `cart_list_ibfk_5` (`payment_type_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`agency_id`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inquiries_ibfk_1` (`traveler_id`),
  ADD KEY `inquiries_ibfk_2` (`package_id`),
  ADD KEY `inquiries_ibfk_3` (`agency_id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_list`
--
ALTER TABLE `package_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_id` (`agency_id`),
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `product_list_ibfk_3` (`room_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_ibfk_1` (`agency_id`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_reviews_ibfk_1` (`package_id`),
  ADD KEY `ratings_reviews_ibfk_2` (`traveler_id`),
  ADD KEY `ratings_reviews_ibfk_3` (`agency_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roms_ibfk_1` (`agency_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traveler_list`
--
ALTER TABLE `traveler_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel_type`
--
ALTER TABLE `travel_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agency_list`
--
ALTER TABLE `agency_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `agency_type_list`
--
ALTER TABLE `agency_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booked_packages`
--
ALTER TABLE `booked_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `booked_packages_list`
--
ALTER TABLE `booked_packages_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `traveler_list`
--
ALTER TABLE `traveler_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `travel_type`
--
ALTER TABLE `travel_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency_list`
--
ALTER TABLE `agency_list`
  ADD CONSTRAINT `agency_list_ibfk_1` FOREIGN KEY (`agency_type_id`) REFERENCES `agency_type_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booked_packages`
--
ALTER TABLE `booked_packages`
  ADD CONSTRAINT `booked_packages_ibfk_1` FOREIGN KEY (`booked_packages_id`) REFERENCES `booked_packages_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_packages_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_packages_ibfk_3` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_packages_ibfk_4` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_packages_ibfk_5` FOREIGN KEY (`travel_type_id`) REFERENCES `travel_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booked_packages_list`
--
ALTER TABLE `booked_packages_list`
  ADD CONSTRAINT `booked_packages_list_ibfk_1` FOREIGN KEY (`traveler_id`) REFERENCES `traveler_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booked_packages_list_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD CONSTRAINT `booking_list_ibfk_1` FOREIGN KEY (`traveler_id`) REFERENCES `traveler_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_3` FOREIGN KEY (`payments_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_4` FOREIGN KEY (`travel_type_id`) REFERENCES `travel_type` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `booking_list_ibfk_5` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_list`
--
ALTER TABLE `category_list`
  ADD CONSTRAINT `category_list_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`traveler_id`) REFERENCES `traveler_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiries_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inquiries_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`);

--
-- Constraints for table `package_list`
--
ALTER TABLE `package_list`
  ADD CONSTRAINT `package_list_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `package_list_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `package_list_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  ADD CONSTRAINT `ratings_reviews_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_reviews_ibfk_2` FOREIGN KEY (`traveler_id`) REFERENCES `traveler_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_reviews_ibfk_3` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `roms_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
