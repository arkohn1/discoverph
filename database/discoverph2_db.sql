-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 06:16 PM
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
(8, '202311-00004', 4, 'MMC Travel and Tours', 'Mark Delos Reyes', 'mmctravelandtours@gmail.com', '090123456789', 'mmc', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/8.png?v=1702749323', 1, 0, '2023-11-30 13:25:57', '2024-01-26 23:25:16'),
(11, '202401-00001', 4, 'Pakisuyo Travel', 'Roy Calicadan Jr.', 'plantours@gmail.com', '0901-234-5678', 'pakisuyo_travel', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/11.png?v=1706282653', 1, 0, '2024-01-26 22:55:20', '2024-01-26 23:25:27'),
(12, '202401-00002', 4, 'LaagTa Travel and Tours', 'Benedict Salio Timbol', 'laagta@gmail.com', '0912-345-6789', 'laagta', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/12.png?v=1706286727', 1, 0, '2024-01-27 00:32:07', '2024-01-27 00:32:07');

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
(43, 48, 18, 2, 2, 1, 799, '2023-12-22', '0000-00-00', 2, 1598, 12, '2023-12-15 23:03:55'),
(44, 49, 18, 3, 2, 1, 799, '2023-12-26', '0000-00-00', 1, 2000, 12, '2023-12-15 23:14:33'),
(45, 50, 18, 1, 2, 1, 799, '2023-12-25', '0000-00-00', 1, 200, 11, '2023-12-16 19:56:09'),
(47, 52, 19, 2, 2, 1, 2499, '2024-01-11', '0000-00-00', 1, 1000, 11, '2023-12-17 02:33:42'),
(49, 54, 19, 5, 2, 1, 2499, '2024-01-25', '0000-00-00', 1, 5000, 11, '2023-12-18 21:03:51'),
(50, 55, 19, 5, 2, 1, 2499, '2024-01-10', '0000-00-00', 1, 2000, 11, '2023-12-19 10:12:32'),
(52, 57, 19, 2, 1, 1, 2499, '2024-02-14', '0000-00-00', 1, 1000, 11, '2024-01-24 14:15:26');

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
(48, '202312-00004', 3, 8, 1598, 'uploads/receipt/3_657c6adbe2f00_376357602_831507191701156_1441885424189076074_n.jpg', 'testing travel type', 0, 0, '2023-12-15 23:03:55', '2023-12-17 02:03:35'),
(49, '202312-00005', 3, 8, 2397, 'uploads/receipt/3_657c6d5944aaf_376357602_831507191701156_1441885424189076074_n.jpg', 'test book 3', 2, 1, '2023-12-15 23:14:33', '2023-12-16 04:57:26'),
(50, '202312-00006', 3, 8, 799, 'uploads/receipt/3_657d90599320a_sdasd.jpg', 'test book ', 3, 1, '2023-12-16 19:56:09', '2023-12-17 02:05:06'),
(52, '202312-00002', 6, 8, 4998, 'uploads/receipt/6_657ded863aaeb_376357602_831507191701156_1441885424189076074_n.jpg', 'test book sopi', 3, 0, '2023-12-17 02:33:42', '2023-12-18 00:50:25'),
(53, '202312-00003', 6, 8, 3196, 'uploads/receipt/6_657dedcc552db_DDD.jpg', 'test book sopi part 2', 1, 2, '2023-12-17 02:34:52', '2023-12-17 03:38:44'),
(54, '202312-00007', 7, 8, 12495, 'uploads/receipt/7_65804337291d4_376357602_831507191701156_1441885424189076074_n.jpg', 'test book khistan 1', 1, 2, '2023-12-18 21:03:51', '2023-12-18 21:04:33'),
(55, '202312-00008', 6, 8, 12495, 'uploads/receipt/6_6580fc1054f71_CCC.jpg', 'test  book', 2, 1, '2023-12-19 10:12:32', '2023-12-19 10:15:30'),
(57, '202401-00002', 3, 8, 4998, 'uploads/receipt/3_65b0aafe90885_CCC.jpg', 'gikhi', 2, 2, '2024-01-24 14:15:26', '2024-01-24 14:17:11');

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
(314, 7, 19, NULL, 1, 0, 1, NULL, 1, '0000-00-00', '0000-00-00'),
(323, 6, 19, NULL, NULL, 0, 1, NULL, 1, '0000-00-00', '0000-00-00'),
(367, 3, 24, NULL, NULL, 0, 2, NULL, 1, '0000-00-00', '0000-00-00');

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
(18, 8, 'Day Tour', 'sample description', 1, 0, '2023-11-30 13:32:51', NULL),
(20, 8, '2 Days 1 Night', 'sample description', 1, 0, '2023-12-17 02:15:48', '2023-12-17 02:17:28'),
(21, 11, '3 Days 2 Nights', 'Holy Week ', 1, 0, '2024-01-26 22:58:15', NULL),
(22, 11, 'Day Tour', 'Cavite Day Tour', 1, 0, '2024-01-27 00:05:19', NULL);

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
(43, 3, 18, 8, 'test inquire', 'test message', 1, '2023-12-16 19:51:10'),
(47, 6, 19, 8, 'test inquire 2', 'test message 2', 1, '2023-12-17 23:55:05');

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
(22, 'Jose Rizal', '09123456789', 'joserizal@gmail.com', 'Gusto ko sana magreklamo about sa Basta Resort...', 1, '2023-11-20 04:14:25'),
(23, 'Dorothy Grace Dauan', '090123456789', 'dorothy@gmail.com', 'sample inquiry', 1, '2023-11-24 06:52:04'),
(24, '1223', '123', '123@123', '123', 0, '2023-11-26 21:55:46'),
(25, '123', '123', '123@122', '122', 0, '2023-11-26 21:56:12'),
(26, '111', '111', '111@111', '111', 0, '2023-11-27 00:23:42'),
(27, '222', '222', '222@222', '222', 1, '2023-11-27 00:29:11'),
(28, 'Arkohn Mamamo Mamako', '09278709744', 'arkohgn@gmail.com', 'gusto ko sana ireklamo si hannah', 1, '2023-11-27 01:20:19'),
(29, '112', '112', '112@112', '112', 0, '2023-11-27 01:25:32'),
(30, '222', '222', '222@222', '222', 0, '2023-11-27 01:26:14'),
(31, 'mark', '123', 'mark@123', 'mark123', 1, '2023-11-27 01:29:52'),
(32, '555', '555', '555@555', '555', 1, '2023-11-27 01:30:46'),
(33, '1221', '2123121', '22@12312', '21312312312312', 1, '2023-11-27 01:32:33'),
(34, '321312', '213231', '223@231231', '231231', 1, '2023-11-27 01:32:58'),
(35, 'mark', 'mark', 'mark@mark', 'markmark', 1, '2023-11-27 06:15:02'),
(36, 'Dustin Sophie Luna', '0901-234-5678', 'dustin@gmail.com', 'test message', 1, '2023-12-17 01:47:22'),
(37, 'HannahJoyOliveros', '0901-234-5678', 'arkohn@gmail.com', 'jojojojojo', 1, '2024-01-24 14:18:24');

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
(18, 8, 18, NULL, 'Secret River Laguna Day Tour', 'Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25277.479490670084!2d121.1521302399552!3d14.21679047698094!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd618f60320ffd%3A0xe5b4e3a1ea2fb845!2sSan%20Juan%20River!5e0!3m2!1sen!2sph!4v1701323066923!5m2!1sen!2sph', '&lt;div&gt;ENJOY 9+(1 FREE)TRAVEL PACKAGE PROMO&lt;/div&gt;&lt;div&gt;OPEN TO ALL AGES&lt;/div&gt;&lt;div&gt;NO REQUIREMENTS NEEDED&lt;/div&gt;&lt;div&gt;OPEN FOR SOLO , JOINERS, GROUP AND EXCLUSIVE.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;RT Van Transfer Mnl-Zambales-Mnl&lt;/li&gt;&lt;li&gt;Gas,Toll,Drivers fee,Drivers Meals&lt;/li&gt;&lt;li&gt;Ecological Fee&lt;/li&gt;&lt;li&gt;Parking fees,&lt;/li&gt;&lt;li&gt;Coordinator on Board&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;DEPARTURE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;A NIGHT BEFORE OF YOUR TOUR DATE&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;PICK-UP TIME AND PLACE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;11:30PM - MOA ECOM CHOWKING&amp;nbsp;&lt;/div&gt;&lt;div&gt;12:30AM - 7 ELEVEN GREENFIELD SHAW EDSA ( TELEPERFORMANCE )&amp;nbsp;&lt;/div&gt;&lt;div&gt;1:00AM&amp;nbsp; - MCDO CENTRIS BMW&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FOR BOOKING / RESERVATION :&lt;/span&gt;&lt;/div&gt;&lt;div&gt;A Reservation of 500/person DAYTOUR and 1000/person for 2D1N is required to secure your slots. All deposits will be deducted to the balance, remaining balance and exclusions will be collected on the travel date itself.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&quot;NO DEPOSIT NO RESERVATION POLICY&quot;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;Limited slots only! Reservations are on a first-come, first-serve basis. Promo is not valid during Holy week and peak seasons. Reservation depends on the availability of the Tour schedule. We also have combined tours for small groups, private tours can also be set on your preferred Travel date with free pick-up and drop-off within Metro Manila only.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;MMC TRAVEL AND TOURS&lt;/span&gt;&lt;/div&gt;&lt;div&gt;02-7000-7258 LANDLINE/GLOBE/TM&lt;/div&gt;&lt;div&gt;09778527841 GLOBE&lt;/div&gt;&lt;div&gt;www.facebook.com/www.mmctravelandtours.com.ph&lt;/div&gt;', 'uploads/packages/18_gallery_0.png,uploads/packages/18_gallery_1.png,uploads/packages/18_gallery_2.png,uploads/packages/18_gallery_3.png,uploads/packages/18_gallery_4.png,uploads/packages/18_gallery_5.png,uploads/packages/18_gallery_6.png', 799, 'uploads/packages/18.png', 1, 0, '2023-11-30 13:47:50', '2024-01-26 23:37:01'),
(19, 8, 20, NULL, 'Secret River Laguna 2D1N', 'Calamba, Laguna', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61909.09072646383!2d120.9277331437874!3d14.117376936390048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd777b1ab54c8f%3A0x6ecc514451ce2be8!2sTagaytay%2C%20Cavite!5e0!3m2!1sen!2sph!4v1706282881376!5m2!1sen!2sph\" width=\"600\" height=\"450\" ', '&lt;div&gt;ENJOY 9+(1 FREE)TRAVEL PACKAGE PROMO&lt;/div&gt;&lt;div&gt;OPEN TO ALL AGES&lt;/div&gt;&lt;div&gt;NO REQUIREMENTS NEEDED&lt;/div&gt;&lt;div&gt;OPEN FOR SOLO , JOINERS, GROUP AND EXCLUSIVE.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;RT Van Transfer Mnl-Zambales-Mnl&lt;/li&gt;&lt;li&gt;Gas,Toll,Drivers fee,Drivers Meals&lt;/li&gt;&lt;li&gt;Ecological Fee&lt;/li&gt;&lt;li&gt;Parking fees,&lt;/li&gt;&lt;li&gt;Coordinator on Board&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;DEPARTURE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;A NIGHT BEFORE OF YOUR TOUR DATE&lt;/span&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;PICK-UP TIME AND PLACE:&lt;/span&gt;&lt;/div&gt;&lt;div&gt;11:30PM - MOA ECOM CHOWKING&nbsp;&lt;/div&gt;&lt;div&gt;12:30AM - 7 ELEVEN GREENFIELD SHAW EDSA ( TELEPERFORMANCE )&nbsp;&lt;/div&gt;&lt;div&gt;1:00AM&nbsp; - MCDO CENTRIS BMW&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;FOR BOOKING / RESERVATION :&lt;/span&gt;&lt;/div&gt;&lt;div&gt;A Reservation of 500/person DAYTOUR and 1000/person for 2D1N is required to secure your slots. All deposits will be deducted to the balance, remaining balance and exclusions will be collected on the travel date itself.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;&quot;NO DEPOSIT NO RESERVATION POLICY&quot;&lt;/span&gt;&lt;/div&gt;&lt;div&gt;Limited slots only! Reservations are on a first-come, first-serve basis. Promo is not valid during Holy week and peak seasons. Reservation depends on the availability of the Tour schedule. We also have combined tours for small groups, private tours can also be set on your preferred Travel date with free pick-up and drop-off within Metro Manila only.&lt;/div&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;MMC TRAVEL AND TOURS&lt;/span&gt;&lt;/div&gt;&lt;div&gt;02-7000-7258 LANDLINE/GLOBE/TM&lt;/div&gt;&lt;div&gt;09778527841 GLOBE&lt;/div&gt;&lt;div&gt;www.facebook.com/www.mmctravelandtours.com.ph&lt;/div&gt;', 'uploads/packages/19_gallery_0.png,uploads/packages/19_gallery_1.png,uploads/packages/19_gallery_2.png,uploads/packages/19_gallery_3.png,uploads/packages/19_gallery_4.png,uploads/packages/19_gallery_5.png,uploads/packages/19_gallery_6.png', 2499, 'uploads/packages/19.png', 1, 0, '2023-12-01 02:21:54', '2024-01-27 00:23:22'),
(24, 11, 21, NULL, 'Tagaytay 3D2N', 'Tagaytay, Cavite', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61909.09072646383!2d120.9277331437874!3d14.117376936390048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd777b1ab54c8f%3A0x6ecc514451ce2be8!2sTagaytay%2C%20Cavite!5e0!3m2!1sen!2sph!4v1706282881376!5m2!1sen!2sph', '&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;A/C Van Roundtrip Transfers from SMX to Tagaytay - SMX&lt;/li&gt;&lt;li&gt;2 NIghts Hotel Accommodation at RIVERA HOTEL with daily breakfast (Quad &amp; Triple Sharing)&lt;/li&gt;&lt;li&gt;Tours &amp; Entrance Fees&lt;/li&gt;&lt;li&gt;Assistance of DOT Accredited Tour Guide on Day 2 Full Day Tour&lt;/li&gt;&lt;li&gt;1 Bottle of Mineral Water per day&lt;/li&gt;&lt;li&gt;Travel Insurance&lt;/li&gt;&lt;li&gt;Travel Kit&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;EXCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;Other expenses /tours not included in the itinerary&lt;/li&gt;&lt;li&gt;Tipping for Driver &amp; Tour Guide&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ITINERARY:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;DAY 1:&lt;/p&gt;&lt;p&gt;08:00 am&nbsp; - 0900am Pick up SMX . Proceed to Tagaytay. Dropby Pink Sisters Monastery.&nbsp; Check In at Rivera Hotel.&nbsp; Free Time for&nbsp; Prayers and Meditation (Good Friday). Lunch and Dinner own pax account&lt;span style=&quot;font-size: 1rem;&quot;&gt;.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;DAY 2:&nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;Full Day Tour. Breakfast inside Hotel. Proceed to Twin Lakes for sightseeing and Photo Opportunity, visit Puzzle Mansion (Biggest Collection of Puzzles - World\'s Guiness Book of Record),&nbsp; Visit Our Lady of Manaoag Shrine, People\'s Park in the Sky then free time at Picnic Grove. Proceed to Good Shepeherd . Sky Ranch Photo Opp only (optional entrance) then back to Hotel.&nbsp; Lunch and Dinner own pax account.&lt;/p&gt;&lt;p&gt;DAY 3:&lt;/p&gt;&lt;p&gt;Breakfast inside Hotel. Breakfast inside Hotel. Check out. Visit Pasalubong Center. Passby Acienda Premium Outlet in Silang, Easter Sunday Visit at La Salette Shrine in Silang . Back to Manila. Dropby SMX.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;CONTACT US:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813&lt;/p&gt;&lt;p&gt;Email: manila@pakisuyotravel.com&lt;/p&gt;&lt;p&gt;info@pakisuyocenter.com&lt;/p&gt;&lt;table class=&quot;table table-bordered&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813 |&nbsp;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;Email: manila@pakisuyotravel.com |&nbsp;&lt;/span&gt;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;info@pakisuyocenter.com&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Dasmarinas - Camerino corner San Juan Streets., Dasmarinas, Cavite 09186037357 (046) 4166537 and 6831711 dasma@pakisuyotravel.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Gen Trias - The Plaza Florida Sun Estates, Manggahan, Gen. Trias, Cavite 09175215127 (046) 4242288 info@pakisuyogentrias.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Alfonso - 04 Alas-as St., Barangay V, Alfonso, Cavite 0908 411 9344 (046) 4233361 info@pakisuyoalfonso.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;PAYMENT OPTIONS:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Cash deposit to our BDO &amp; BPI Accounts&lt;/li&gt;&lt;li&gt;Remittance Centers&lt;/li&gt;&lt;li&gt;Credit Card&nbsp;&lt;/li&gt;&lt;li&gt;Paypal&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;For your inquires, please feel free to contact any of our branches.&lt;/p&gt;&lt;p&gt;PAKISUYO TRAVEL is duly accredited by the Department of Tourism with Accreditation Nos. TOP RO4A 00004479-2018(M) and a member of :&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Philippine Tour Operators Association&lt;/li&gt;&lt;li&gt;Network of Independent Travel &amp; Allied Services&lt;/li&gt;&lt;li&gt;Cavite Travel &amp; Tours Association, inc.&lt;/li&gt;&lt;/ul&gt;', 'uploads/packages/24_gallery_0.png,uploads/packages/24_gallery_1.png,uploads/packages/24_gallery_2.png,uploads/packages/24_gallery_3.png,uploads/packages/24_gallery_4.png,uploads/packages/24_gallery_5.png', 4888, 'uploads/packages/24.png', 1, 0, '2024-01-26 23:35:11', '2024-01-26 23:58:42'),
(25, 11, 22, NULL, 'Cavite Day Tour', 'Cavite', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d247457.51720969166!2d120.65457848250725!3d14.280976528625802!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d4eae8163c71%3A0xf0c4d0843bdde727!2sCavite!5e0!3m2!1sen!2sph!4v1706285650124!5m2!1sen!2sph', '&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;A/C Van Roundtrip Transfers from SMX to Tagaytay - SMX&lt;/li&gt;&lt;li&gt;Tours &amp; Entrance Fees&lt;/li&gt;&lt;li&gt;Assistance of DOT Accredited Tour Guide on Day 2 Full Day Tour&lt;/li&gt;&lt;li&gt;1 Bottle of Mineral Water&lt;/li&gt;&lt;li&gt;Travel Insurance&lt;/li&gt;&lt;li&gt;Travel Kit&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;EXCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;Other expenses /tours not included in the itinerary&lt;/li&gt;&lt;li&gt;Tipping for Driver &amp; Tour Guide&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ITINERARY:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;Morning (08:00 am - 10:30 am): Pick up SMX, travel to Tagaytay, stop at Pink Sisters Monastery.&lt;/p&gt;&lt;p&gt;Lunch (12:00 pm): Free time for personal activities.&lt;/p&gt;&lt;p&gt;Afternoon (01:00 pm - 06:00 pm): Explore Twin Lakes, Puzzle Mansion, Our Lady of Manaoag Shrine, People\'s Park in the Sky, Picnic Grove, and Good Shepherd. Optional photo opportunity at Sky Ranch.&lt;/p&gt;&lt;p&gt;Evening (06:00 pm): Return to SMX or drop-off location. Dinner at your own expense.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;CONTACT US:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813&lt;/p&gt;&lt;p&gt;Email: manila@pakisuyotravel.com&lt;/p&gt;&lt;p&gt;info@pakisuyocenter.com&lt;/p&gt;&lt;table class=&quot;table table-bordered&quot; style=&quot;width: 537.475px; color: rgb(33, 37, 41); background-color: rgb(255, 255, 255);&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813 |&nbsp;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;Email: manila@pakisuyotravel.com |&nbsp;&lt;/span&gt;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;info@pakisuyocenter.com&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Dasmarinas - Camerino corner San Juan Streets., Dasmarinas, Cavite 09186037357 (046) 4166537 and 6831711 dasma@pakisuyotravel.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Gen Trias - The Plaza Florida Sun Estates, Manggahan, Gen. Trias, Cavite 09175215127 (046) 4242288 info@pakisuyogentrias.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Alfonso - 04 Alas-as St., Barangay V, Alfonso, Cavite 0908 411 9344 (046) 4233361 info@pakisuyoalfonso.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;PAYMENT OPTIONS:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Cash deposit to our BDO &amp; BPI Accounts&lt;/li&gt;&lt;li&gt;Remittance Centers&lt;/li&gt;&lt;li&gt;Credit Card&nbsp;&lt;/li&gt;&lt;li&gt;Paypal&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;For your inquires, please feel free to contact any of our branches.&lt;/p&gt;&lt;p&gt;PAKISUYO TRAVEL is duly accredited by the Department of Tourism with Accreditation Nos. TOP RO4A 00004479-2018(M) and a member of :&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Philippine Tour Operators Association&lt;/li&gt;&lt;li&gt;Network of Independent Travel &amp; Allied Services&lt;/li&gt;&lt;li&gt;Cavite Travel &amp; Tours Association, inc.&lt;/li&gt;&lt;/ul&gt;', 'uploads/packages/25_gallery_0.png,uploads/packages/25_gallery_1.png,uploads/packages/25_gallery_2.png,uploads/packages/25_gallery_3.png,uploads/packages/25_gallery_4.png,uploads/packages/25_gallery_5.png', 999, 'uploads/packages/25.png', 1, 0, '2024-01-27 00:21:09', '2024-01-27 00:21:23');

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
(10, 8, 'Cash', 'Please provide payment (cash) on tour day.', 0, 'uploads/qr/1.png', 0, '2023-12-01 19:10:09', NULL),
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
(2, 'Full Payment');

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
(73, 18, 3, 8, 3, 'maganda naman sya solid ang experience', 0, '2023-12-01 21:43:11'),
(74, 18, 3, 8, 1, 'hindi na niya ako mahal gaiss :(((', 0, '2023-12-01 21:43:35'),
(75, 18, 3, 8, 5, 'try lang magreview :))', 0, '2023-12-03 08:33:08'),
(76, 18, 3, 8, 5, 'very nice', 1, '2023-12-05 13:48:19'),
(80, 18, 5, 8, 3, 'okay lang masaya naman', 1, '2023-12-05 13:53:01'),
(81, 18, 3, 8, 3, 'test review', 1, '2023-12-16 19:51:33'),
(85, 19, 3, 8, 3, 'test review\n', 1, '2023-12-17 02:31:55'),
(87, 19, 6, 8, 4, 'test review', 1, '2023-12-17 02:32:25'),
(91, 19, 7, 8, 1, 'test review', 0, '2023-12-18 20:14:44'),
(93, 19, 6, 8, 5, 'test review masaya', 0, '2023-12-19 10:16:33'),
(94, 18, 3, 8, 4, 'wow', 0, '2024-01-20 17:08:40'),
(95, 24, 3, 11, 5, 'Thank you! I had a wonderful experience. Super solid din ng staff and driver huhu <3\n', 0, '2024-01-26 23:59:26'),
(96, 25, 3, 11, 4, 'I recently booked this travel package and am thrilled with the experience. The booking process was smooth, the accommodations exceeded expectations, and the local guides were knowledgeable and passionate. Overall, it was a well-organized and memorable journey, and I would highly recommend this package to fellow travelers.', 0, '2024-01-27 00:26:40');

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
(14, 'cover', 'uploads/cover-1702888220.png'),
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
(3, '202311-00001', 'Arkohn', 'Josesa', 'Rizal', 'Male', '09278709744', 'San Pedro, Laguna, 4023', 'arkohn@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/3.png?v=1702675918', 1, 0, '2023-11-12 22:05:00', '2024-01-26 23:21:25'),
(5, '202312-00001', 'John Mark', 'Dauan', 'Garapan', 'Male', '09278709744', 'San Pedro, Laguna', 'johnmarkgarapan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/5.png?v=1701755465', 0, 0, '2023-12-05 13:51:05', '2023-12-18 01:07:32'),
(6, '202312-00002', 'Dustin', 'Sophie', 'Luna', 'Female', '090123456789', 'Santa Rosa', 'dustin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/6.png?v=1702748109', 1, 0, '2023-12-17 01:32:29', '2023-12-17 01:37:00'),
(7, '202312-00003', 'Khistan', '', 'Salliao', 'Male', '0901-234-5678', 'Santa Rosa, Laguna', 'khistan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/7.png?v=1702901190', 1, 0, '2023-12-18 20:06:30', '2023-12-18 20:06:30');

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
(1, 'Joiner'),
(2, 'Exclusive');

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `agency_type_list`
--
ALTER TABLE `agency_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booked_packages`
--
ALTER TABLE `booked_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `booked_packages_list`
--
ALTER TABLE `booked_packages_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
