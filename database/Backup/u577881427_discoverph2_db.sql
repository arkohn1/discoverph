-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 29, 2024 at 03:38 AM
-- Server version: 10.6.14-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u577881427_discoverph2_db`
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
(12, '202401-00002', 4, 'LaagTa Travel and Tours', 'Benedict Salio Timbol', 'laagta@gmail.com', '0912-345-6789', 'laagta', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/12.png?v=1706286727', 1, 0, '2024-01-27 00:32:07', '2024-01-27 00:32:07'),
(13, '202401-00003', 4, 'R&C Travel & Tours', 'Benedict E. Timbol', 'benedict@gmail.com', '0901-234-5661', 'rctraveltours', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travel_agencies/13.png?v=1706318301', 1, 0, '2024-01-27 01:18:21', '2024-01-27 01:18:21');

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
(45, 50, 18, 1, 2, 1, 799, '2023-12-25', '0000-00-00', 1, 200, 11, '2023-12-16 19:56:09'),
(47, 52, 19, 2, 2, 1, 2499, '2024-01-11', '0000-00-00', 1, 1000, 11, '2023-12-17 02:33:42'),
(49, 54, 19, 5, 2, 1, 2499, '2024-01-25', '0000-00-00', 1, 5000, 11, '2023-12-18 21:03:51'),
(50, 55, 19, 5, 2, 1, 2499, '2024-01-10', '0000-00-00', 1, 2000, 11, '2023-12-19 10:12:32'),
(52, 57, 19, 2, 1, 1, 2499, '2024-02-14', '0000-00-00', 1, 1000, 11, '2024-01-24 14:15:26'),
(53, 58, 18, 3, 1, 1, 799, '2024-01-30', '0000-00-00', 1, 1000, 11, '2024-01-26 22:07:07'),
(54, 59, 19, 2, 1, 1, 2499, '2024-01-28', '0000-00-00', 1, 480, 11, '2024-01-27 00:40:33'),
(55, 60, 27, 1, 1, 1, 2499, '2024-01-31', '0000-00-00', 1, 1500, 20, '2024-01-27 02:11:50'),
(56, 61, 25, 1, 1, 1, 999, '2024-01-31', '0000-00-00', 2, 999, 17, '2024-01-27 05:26:00'),
(57, 62, 27, 2, 1, 1, 2499, '2024-01-27', '0000-00-00', 1, 3000, 20, '2024-01-27 05:30:00'),
(58, 63, 18, 1, 1, 1, 799, '2024-01-30', '0000-00-00', 2, 799, 11, '2024-01-27 05:32:30'),
(59, 64, 28, 1, 1, 1, 899, '2024-02-14', '0000-00-00', 2, 899, 22, '2024-01-27 05:40:07'),
(60, 65, 27, 2, 1, 1, 2499, '2024-01-30', '0000-00-00', 2, 4998, 20, '2024-01-27 06:44:48'),
(61, 66, 24, 3, 1, 1, 4888, '2024-01-30', '0000-00-00', 2, 14664, 17, '2024-01-27 07:14:12');

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
(50, '202312-00006', 3, 8, 799, 'uploads/receipt/3_657d90599320a_sdasd.jpg', 'test book ', 3, 1, '2023-12-16 19:56:09', '2023-12-17 02:05:06'),
(52, '202312-00002', 6, 8, 4998, 'uploads/receipt/6_657ded863aaeb_376357602_831507191701156_1441885424189076074_n.jpg', 'test book sopi', 3, 0, '2023-12-17 02:33:42', '2023-12-18 00:50:25'),
(54, '202312-00007', 7, 8, 12495, 'uploads/receipt/7_65804337291d4_376357602_831507191701156_1441885424189076074_n.jpg', 'test book khistan 1', 1, 2, '2023-12-18 21:03:51', '2023-12-18 21:04:33'),
(55, '202312-00008', 6, 8, 12495, 'uploads/receipt/6_6580fc1054f71_CCC.jpg', 'test  book', 2, 1, '2023-12-19 10:12:32', '2023-12-19 10:15:30'),
(57, '202401-00002', 3, 8, 4998, 'uploads/receipt/3_65b0aafe90885_CCC.jpg', 'gikhi', 2, 2, '2024-01-24 14:15:26', '2024-01-24 14:17:11'),
(58, '202401-00001', 7, 8, 2397, 'uploads/receipt/7_65b42d0b7aa6e_CCC.jpg', 'testing notes', 1, 1, '2024-01-26 22:07:07', '2024-01-26 22:23:27'),
(59, '202401-00003', 8, 8, 4998, 'uploads/receipt/8_65b45101b3e2f_Downpayment.jpg', 'Agreed payment', 1, 2, '2024-01-27 00:40:33', '2024-01-27 00:47:41'),
(60, '202401-00004', 10, 12, 2499, 'uploads/receipt/10_65b4666653a3b_418392820_590783519891383_4199387088984390128_n.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\r\n', 0, 0, '2024-01-27 02:11:50', '2024-01-27 02:11:50'),
(61, '202401-00005', 11, 11, 999, 'uploads/receipt/11_65b493e8213e5_415768738_922770609221289_7657784780751222918_n.jpg', 'sana masaya', 0, 0, '2024-01-27 05:26:00', '2024-01-27 05:26:00'),
(62, '202401-00006', 11, 12, 4998, 'uploads/receipt/11_65b494d8dbc71_415768738_922770609221289_7657784780751222918_n.jpg', 'sana maenjoy namin ng jowa ko', 0, 0, '2024-01-27 05:30:00', '2024-01-27 05:30:00'),
(63, '202401-00007', 11, 8, 799, 'uploads/receipt/11_65b4956e3fdef_415768738_922770609221289_7657784780751222918_n.jpg', 'hope for the best things to come', 0, 0, '2024-01-27 05:32:30', '2024-01-27 05:32:30'),
(64, '202401-00008', 11, 13, 899, 'uploads/receipt/11_65b497376706f_415768738_922770609221289_7657784780751222918_n.jpg', 'sana masaya ang valentines ko rito', 2, 1, '2024-01-27 05:40:07', '2024-01-27 05:56:51'),
(65, '202401-00009', 3, 12, 4998, 'uploads/receipt/3_65b4a660ca26a_BBB.jpg', 'full payment 3015', 2, 1, '2024-01-27 06:44:48', '2024-01-27 06:49:09'),
(66, '202401-00010', 3, 11, 14664, 'uploads/receipt/3_65b4ad4437207_CCC.jpg', 'full payment ss', 1, 1, '2024-01-27 07:14:12', '2024-01-27 07:17:03');

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
(380, 6, 18, 13, NULL, 0, 5, NULL, 1, '0000-00-00', '0000-00-00'),
(395, 7, 28, NULL, NULL, 0, 1, NULL, 1, '0000-00-00', '0000-00-00');

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
(22, 11, 'Day Tour', 'Cavite Day Tour', 1, 0, '2024-01-27 00:05:19', NULL),
(23, 12, '2 Days 1 Night', 'Alibijaban Island', 1, 0, '2024-01-27 00:13:41', NULL),
(24, 13, 'Day Hike', 'Mt. Daraitan Heart Peak + Tinipak River', 1, 0, '2024-01-27 01:35:55', NULL),
(25, 13, 'Day Tour', 'Tagaytay + Batangas Day Tour', 1, 0, '2024-01-27 02:58:15', NULL);

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
(47, 6, 19, 8, 'test inquire 2', 'test message 2', 1, '2023-12-17 23:55:05'),
(48, 6, 26, 12, 'Available Promos', 'Hi po, ask ko lang if may mga available po kayong mga promos regardin sa Alibijaban Island Travel Package niyo po? Thank you po!', 1, '2024-01-27 13:49:11');

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
(23, 'Dorothy Grace Dauan', '090123456789', 'dorothy@gmail.com', 'sample inquiry', 1, '2023-11-24 06:52:04'),
(38, 'Khistan G. Salliao', '0912-345-6789', 'khistan@gmail.com', 'Subject: Urgent Complaint Regarding [Travel Agency] Violations - Seeking DOT Intervention\r\n\r\nDear Department of Transportation Complaints Division,\r\n\r\nI hope this message finds you well. My name is Sarah Johnson, and I am writing to file a formal complaint against [Travel Agency] for multiple violations during my recent travel experience. I am reaching out to the Department of Transportation in the hope of seeking intervention and resolution for the following issues:\r\n\r\nUnreliable Transportation Services: The transportation services arranged by [Travel Agency] were consistently delayed and lacked the punctuality promised in their package. This resulted in missed connections and added unnecessary stress to my journey.\r\n\r\nFalse Advertising of Accommodations: The accommodations specified in the travel package did not align with the representations made by [Travel Agency]. The quality of the rooms and amenities fell significantly below the standards communicated during the booking process.\r\n\r\nLack of Customer Service Responsiveness: Attempts to address these issues with [Travel Agency] were met with a lack of responsiveness. Emails and calls were either ignored or handled without the urgency required to address the gravity of the situation.\r\n\r\nThese issues not only compromised the quality of my travel experience but also reflect potential violations of DOT regulations. I kindly request that the DOT investigate these matters and take appropriate actions to ensure compliance with industry standards.\r\n\r\nI have attached relevant documentation, including booking confirmations, correspondence with the travel agency, and any other pertinent information that may aid in your investigation. Your prompt attention to this matter is crucial, and I appreciate your assistance in resolving these concerns.\r\n\r\nThank you for your time and consideration.\r\n\r\nSincerely,\r\n\r\nSarah Johnson', 1, '2024-01-26 23:17:30');

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
(25, 11, 22, NULL, 'Cavite Day Tour', 'Cavite', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d247457.51720969166!2d120.65457848250725!3d14.280976528625802!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d4eae8163c71%3A0xf0c4d0843bdde727!2sCavite!5e0!3m2!1sen!2sph!4v1706285650124!5m2!1sen!2sph', '&lt;div&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;A/C Van Roundtrip Transfers from SMX to Tagaytay - SMX&lt;/li&gt;&lt;li&gt;Tours &amp; Entrance Fees&lt;/li&gt;&lt;li&gt;Assistance of DOT Accredited Tour Guide on Day 2 Full Day Tour&lt;/li&gt;&lt;li&gt;1 Bottle of Mineral Water&lt;/li&gt;&lt;li&gt;Travel Insurance&lt;/li&gt;&lt;li&gt;Travel Kit&lt;/li&gt;&lt;/ul&gt;&lt;div&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;EXCLUSIONS:&lt;/span&gt;&lt;/div&gt;&lt;ul&gt;&lt;li&gt;Other expenses /tours not included in the itinerary&lt;/li&gt;&lt;li&gt;Tipping for Driver &amp; Tour Guide&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;ITINERARY:&lt;/span&gt;&lt;/p&gt;&lt;p&gt;Morning (08:00 am - 10:30 am): Pick up SMX, travel to Tagaytay, stop at Pink Sisters Monastery.&lt;/p&gt;&lt;p&gt;Lunch (12:00 pm): Free time for personal activities.&lt;/p&gt;&lt;p&gt;Afternoon (01:00 pm - 06:00 pm): Explore Twin Lakes, Puzzle Mansion, Our Lady of Manaoag Shrine, People\'s Park in the Sky, Picnic Grove, and Good Shepherd. Optional photo opportunity at Sky Ranch.&lt;/p&gt;&lt;p&gt;Evening (06:00 pm): Return to SMX or drop-off location. Dinner at your own expense.&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;CONTACT US:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813&lt;/p&gt;&lt;p&gt;Email: manila@pakisuyotravel.com&lt;/p&gt;&lt;p&gt;info@pakisuyocenter.com&lt;/p&gt;&lt;table class=&quot;table table-bordered&quot; style=&quot;width: 537.475px; color: rgb(33, 37, 41); background-color: rgb(255, 255, 255);&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p&gt;Manila - Rm 323 FUBC Bldg, Escolta St., Binondo, Manila 09178053266 Tel Nos (02) 6646918/ 7031813 |&nbsp;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;Email: manila@pakisuyotravel.com |&nbsp;&lt;/span&gt;&lt;span style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;info@pakisuyocenter.com&lt;/span&gt;&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Dasmarinas - Camerino corner San Juan Streets., Dasmarinas, Cavite 09186037357 (046) 4166537 and 6831711 dasma@pakisuyotravel.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Gen Trias - The Plaza Florida Sun Estates, Manggahan, Gen. Trias, Cavite 09175215127 (046) 4242288 info@pakisuyogentrias.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td&gt;Alfonso - 04 Alas-as St., Barangay V, Alfonso, Cavite 0908 411 9344 (046) 4233361 info@pakisuyoalfonso.com&lt;br&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;PAYMENT OPTIONS:&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Cash deposit to our BDO &amp; BPI Accounts&lt;/li&gt;&lt;li&gt;Remittance Centers&lt;/li&gt;&lt;li&gt;Credit Card&nbsp;&lt;/li&gt;&lt;li&gt;Paypal&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;For your inquires, please feel free to contact any of our branches.&lt;/p&gt;&lt;p&gt;PAKISUYO TRAVEL is duly accredited by the Department of Tourism with Accreditation Nos. TOP RO4A 00004479-2018(M) and a member of :&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Philippine Tour Operators Association&lt;/li&gt;&lt;li&gt;Network of Independent Travel &amp; Allied Services&lt;/li&gt;&lt;li&gt;Cavite Travel &amp; Tours Association, inc.&lt;/li&gt;&lt;/ul&gt;', 'uploads/packages/25_gallery_0.png,uploads/packages/25_gallery_1.png,uploads/packages/25_gallery_2.png,uploads/packages/25_gallery_3.png,uploads/packages/25_gallery_4.png,uploads/packages/25_gallery_5.png', 999, 'uploads/packages/25.png', 1, 0, '2024-01-27 00:21:09', '2024-01-27 00:21:23'),
(26, 12, 23, NULL, 'Alibijaban Island', 'Alibijaban, San Andres, Quezon', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d992518.5422050762!2d121.67070509944723!3d13.65620937584911!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a3ca82a30fa161%3A0xec22157409832b90!2sAlibijaban%20Island!5e0!3m2!1sen!2sph!4v1706314669647!5m2!1sen!2sph', '&lt;p style=&quot;line-height: 1;&quot;&gt;Open for joiners tour (Every weekend)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;We also cater exclusive tour 12 pax + 1pax for FREE (Any date)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;DESTINATIONS &amp;amp; ACTIVITIES:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🏝️Island hopping&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🌿Mangrove Forest&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🌊Crystal clear water&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🏊&zwj;♂️Snorkeling&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🐟Fish feeding&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🌊Floating cottage&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🌊Sandbar&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🚣&zwj;♂️Kayaking&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;👀Sightseeing&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;⭐Stargazing&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;⛺Chill camping&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;🍻Inuman session (optional)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;RT Van transfer (MNL- Quezon Province -MNL)&amp;nbsp;&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Boat transfers&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Parking fee&#039;s, Driver&#039;s meal&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Registration fee/s&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Entrance fee/s&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Environmental fee/s&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Local Permit&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Camping tents 2-3pax per tent (additional 250 pesos for solo tent)&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;3 hosted meal&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Day 1 Lunch, Dinner&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Day 2 Breakfast&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Customized bagtag as souvenir&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Coordinator on board&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Coordinator act as your photographer&lt;/span&gt;&lt;/li&gt;&lt;/ul&gt;&lt;table class=&quot;table table-bordered&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-weight: bolder;&quot;&gt;OPEN SLOT:&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 2-3&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 8-9&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 9-10&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 16-17&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 23-24&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 28-29&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 29-30&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 Marc 30-31&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 April 6-7&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 April 13-14&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 April 10-11&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 April 27-28&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;#LaagtaTravelandTours&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Kindly send us a private message for more details or call&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;09436940063 Smart&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;&lt;/span&gt;&lt;/p&gt;', 'uploads/packages/26_gallery_0.png,uploads/packages/26_gallery_1.png,uploads/packages/26_gallery_2.png,uploads/packages/26_gallery_3.png,uploads/packages/26_gallery_4.png,uploads/packages/26_gallery_5.png,uploads/packages/26_gallery_6.png', 2999, 'uploads/packages/26.png', 1, 0, '2024-01-27 00:27:34', '2024-01-27 00:46:48'),
(27, 12, 23, NULL, 'LAKE MAPANUEPE + LIWLIWA BEACH', 'San Marcelino, Zambales', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d30833.57606787535!2d120.27228686682133!3d14.9817651822608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33967c5e446bf91f%3A0xa948dc36f9db4091!2sMapanuepe%20Lake!5e0!3m2!1sen!2sph!4v1706316647778!5m2!1sen!2sph\" width=\"600\" height=\"450\" style', '&lt;p style=&quot;line-height: 1;&quot;&gt;Open for joiners tour (Every weekend)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;We also cater exclusive tour 12 pax + 1pax for FREE (Any date)&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;LAKE MAPANUEPE sidetrip LIWLIWA BEACH&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;PACKAGE INCLUSIONS:&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Van Transfers (Manila-Zambales-Manila)&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Registration fee/s&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Boat ride with life vest (5-10mins ride) / 5 pax per boat&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FREE use of waterproof camping tents (2-3 pax)&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FREE use of camping chair for photo ops!&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FREE 1 gallon of drinking water (per van group sharing)&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FREE 2 bottles of Mojito (per van group sharing)&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;3 Hosted Meal &quot;BUSOG LUSOG MEAL&quot;&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Day 1 Lunch, Dinner&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Day 2 Breakfast with COFFEE&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;&lt;span style=&quot;font-size: 1rem;&quot;&gt;Camping Site fee/s&lt;/span&gt;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Local Permit&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Pet Friendly&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Personalized bagtag as souvenir&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Coordinator on board&amp;nbsp;&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FREE Photoshoot (Coordinator act as your photographer)&lt;/li&gt;&lt;/ul&gt;&lt;table class=&quot;table table-bordered&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;NEXT SCHEDULE&amp;nbsp;&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 January 13-14&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 January 20-21&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 January 26-27&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 January 27-28&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 February 3-4&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 February 10-11&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 February 17-18&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 February 24-25&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 2-3&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 8-9&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 9-10&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 16-17&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 23-24&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 28-29&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 March 29-30&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📅 Marc 30-31&lt;/p&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📩 Kindly send us a private message for more details or call&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📞09436940063 Smart&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;📞09924494987 DITO&lt;/p&gt;', 'uploads/packages/27_gallery_0.png,uploads/packages/27_gallery_1.png,uploads/packages/27_gallery_2.png,uploads/packages/27_gallery_3.png,uploads/packages/27_gallery_4.png,uploads/packages/27_gallery_5.png', 2499, 'uploads/packages/27.png', 1, 0, '2024-01-27 00:56:06', '2024-01-27 00:56:07'),
(28, 13, 24, NULL, 'Mt. Daraitan + Tinapak River Day Hike', 'Tanay, Rizal', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d43681.04651135223!2d121.42209824015661!3d14.60502693382767!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397920f241ba847%3A0x87162c333390e20a!2sMount%20Daraitan!5e0!3m2!1sen!2sph!4v1706319449353!5m2!1sen!2sph\" width=\"600\" height=\"450\" styl', '&lt;p style=&quot;line-height: 1;&quot;&gt;Tara Hike Naman Tayo Ka Ahon!!!&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Mt. Daraitan + Tinipak River Day Hike&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Elevation: 739+ MASL&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Difficulty: 4/9&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;R&amp;C Travel &amp; Tours: https://www.facebook.com/RCTRAVELANDTOURSPH&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Contact : 09157958292/09055043469&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;INCLUSIONS:&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Heart Peak&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Tinipak River &amp; Cave&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Environmental fees&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Permit to Climb&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Local Guide Fee&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;RT Van Transfers&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Tour Coordinator + Photographer&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Bagtags&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;span style=&quot;font-weight: 700;&quot;&gt;EXCLUSIONS:&lt;/span&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Foods&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Others not mentioned above&lt;br&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;&lt;table class=&quot;table table-bordered&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;NOTE:&nbsp;&lt;/b&gt;&lt;b style=&quot;background-color: transparent; color: inherit; font-size: 1rem;&quot;&gt;TEAM BUILDING/PRIVATE AND EXCLUSIVE TOURS CAN CHOOSE THEIR OWN DATE AND PICKUP TIME.&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;FEBRUARY SCHEDULE&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 3&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 4&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 9&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 1&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 17&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 18&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 24&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;FEBRUARY 25&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;b&gt;MARCH SCHEDULE&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 2&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 3&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 9&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 11&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 17&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 18&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 24&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;MARCH 25&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;b&gt;APRIL SCHEDULE&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 6&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 7&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 8&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 9&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 13&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 14&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 20&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 21&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 27&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;APRIL 28&lt;/li&gt;&lt;/ul&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;', 'uploads/packages/28_gallery_0.png,uploads/packages/28_gallery_1.png,uploads/packages/28_gallery_2.png,uploads/packages/28_gallery_3.png,uploads/packages/28_gallery_4.png,uploads/packages/28_gallery_5.png', 899, 'uploads/packages/28.png', 1, 0, '2024-01-27 02:44:57', '2024-01-27 02:45:18'),
(29, 13, 25, NULL, 'Tagaytay + Batangas Day Tour (Bali Feels)', 'Tagaytay and Batangas', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d61909.09072646383!2d120.9277331437874!3d14.117376936390048!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd777b1ab54c8f%3A0x6ecc514451ce2be8!2sTagaytay%2C%20Cavite!5e0!3m2!1sen!2sph!4v1706324381448!5m2!1sen!2sph\" width=\"600\" height=\"450\" ', '&lt;p style=&quot;line-height: 1;&quot;&gt;All Nationalities are welcome to join on out Tour Packages!!!&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;SUMAMA KANA AT MAEXPERIENCE LEGIT AND QUALITY TOUR!!!&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;TAGAYTAY + BATANGAS DAY TOUR (BALI FEELS)&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;Places to Visit:&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Villa Jovita Bali Feels&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Bali Swings, Giant Nest&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Bali Viewdeck, Hobbiton&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Fantasy World (sightseeing)&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Gingerbread House&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Reptiland (optional)&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Caleruega Church&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Skyranch&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;Bulalohan&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;SCHEDULE:&lt;/b&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;span style=&quot;font-weight: bolder; font-size: 1rem;&quot;&gt;Note:&amp;nbsp;&amp;nbsp;&lt;/span&gt;2D1N is For Exclusive Tour only (Minimum of 13&amp;nbsp; PAX to avail 2D1N Tagaytay Tour) or PRIVATE AND EXCLUSIVE TOURS CAN CHOOSE THEIR OWN DATE AND PICKUP TIME.(MINIMUM OF 12 PAX)&lt;/p&gt;&lt;table class=&quot;table table-bordered&quot;&gt;&lt;tbody&gt;&lt;tr&gt;&lt;td&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;b&gt;January Schedule&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;box-sizing: border-box; line-height: 1.5;&quot;&gt;January 20&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; line-height: 1.5;&quot;&gt;January 21&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; line-height: 1.5;&quot;&gt;January 27&lt;/li&gt;&lt;li style=&quot;box-sizing: border-box; line-height: 1.5;&quot;&gt;January 28&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;b&gt;February Schedule&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 3&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 4&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 11&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 17&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 18&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 24&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;February 25&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;b&gt;March Schedule&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 2&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 3&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 9&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 11&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 23&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 24&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 28&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 29&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 30&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;March 31&lt;/li&gt;&lt;/ul&gt;&lt;p style=&quot;line-height: 1.5;&quot;&gt;&lt;b&gt;&amp;nbsp;April Schedule&lt;/b&gt;&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 6&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 7&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 8&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 9&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 10&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 13&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 14&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 20&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 21&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 27&lt;/li&gt;&lt;li style=&quot;line-height: 1.5;&quot;&gt;April 28&lt;/li&gt;&lt;/ul&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;R&amp;amp;C Travel &amp;amp; Tours: https://www.facebook.com/RCTRAVELANDTOURSPH&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;Contact : 09157958292 / 09055043469&lt;/p&gt;&lt;p style=&quot;line-height: 1;&quot;&gt;&lt;br&gt;&lt;/p&gt;', 'uploads/packages/29_gallery_0.png,uploads/packages/29_gallery_1.png,uploads/packages/29_gallery_2.png,uploads/packages/29_gallery_3.png,uploads/packages/29_gallery_4.png,uploads/packages/29_gallery_5.png', 999, 'uploads/packages/29.png', 1, 0, '2024-01-27 03:26:22', '2024-01-27 03:26:24');

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
(13, 8, 'PayMaya', 'Jose Rizal | 0901-234-5678', 1, 'uploads/qr/13.png', 0, '2023-12-01 19:19:45', NULL),
(15, 8, 'BDO', 'Account Number: 01233-22133-12312\r\nName: Oliver Tanesa', 1, 'uploads/qr/15.png', 0, '2024-01-26 23:45:25', NULL),
(16, 11, 'BDO', 'Account Number: 01233-22133-12312\r\nName: Roy Thompsion', 1, 'uploads/qr/16.png', 0, '2024-01-27 00:07:07', NULL),
(17, 11, 'GCash', 'Roy Thompson | 0901-234-5678', 1, 'uploads/qr/17.png', 0, '2024-01-27 00:07:39', NULL),
(18, 11, 'PayMaya', 'Roy Thompson | 0901-234-5678', 1, 'uploads/qr/18.png', 0, '2024-01-27 00:08:04', NULL),
(19, 12, 'BDO', 'Account Number: 01233-22133-12312\r\nName: Jane Masapa', 1, 'uploads/qr/19.png', 0, '2024-01-27 00:15:52', NULL),
(20, 12, 'GCash', 'Jane Masapa | 0901-234-5678', 1, 'uploads/qr/20.png', 0, '2024-01-27 00:16:26', NULL),
(21, 12, 'PayMaya', 'Jane Masapa | 0901-234-5678', 1, 'uploads/qr/21.png', 0, '2024-01-27 00:16:39', NULL),
(22, 13, 'BDO', 'Account Number: 01233-22133-12312\r\nName: Benedict Timbol', 1, 'uploads/qr/22.png', 0, '2024-01-27 01:32:38', NULL),
(23, 13, 'GCash', 'Benedict Timbol | 0901-234-5678', 1, 'uploads/qr/23.png', 0, '2024-01-27 01:33:07', NULL),
(24, 13, 'PayMaya', 'Benedict Timbol | 0901-234-5678', 1, 'uploads/qr/24.png', 0, '2024-01-27 01:33:18', NULL);

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
(96, 25, 3, 11, 4, 'I recently booked this travel package and am thrilled with the experience. The booking process was smooth, the accommodations exceeded expectations, and the local guides were knowledgeable and passionate. Overall, it was a well-organized and memorable journey, and I would highly recommend this package to fellow travelers.', 0, '2024-01-27 00:26:40'),
(97, 26, 6, 12, 4, '\nWe thoroughly enjoyed our time on Alijaban Island, reveling in the tranquil atmosphere, pristine beaches, and the captivating underwater world. The island provided a delightful escape, making it a truly memorable experience for us.', 0, '2024-01-27 08:34:47'),
(98, 27, 6, 12, 5, '\nExploring Lake Mapanuepe was a mesmerizing experience, surrounded by lush greenery and serene waters. The peaceful ambiance and picturesque views made our visit truly enchanting, leaving us with lasting memories of this natural gem.', 0, '2024-01-27 08:57:29'),
(99, 28, 6, 13, 4, '\nEmbarking on the Mt. Daraitan + Tinapak River Day Hike was an exhilarating adventure, offering stunning panoramic views and a refreshing river trek. The challenging yet rewarding journey, coupled with the breathtaking natural beauty, made it an unforgettable hiking experience.', 0, '2024-01-27 11:27:44'),
(100, 29, 6, 13, 4, 'Embarking on the Tagaytay + Batangas Day Tour felt like a blissful escape to Bali. The scenic landscapes of Tagaytay and the tropical vibes of Batangas created a perfect blend of relaxation and adventure, making it a day filled with enchanting experiences and wonderful memories.', 0, '2024-01-27 11:28:42'),
(102, 24, 8, 11, 5, 'The package is budget friendly and well spent.', 0, '2024-01-27 12:55:36'),
(103, 26, 7, 12, 3, 'Our visit to Alibijaban Island was a tropical paradise experience. The pristine beaches, crystal-clear waters, and the laid-back atmosphere made it an idyllic getaway, leaving us with cherished memories of this hidden gem.', 0, '2024-01-27 13:18:22'),
(104, 29, 11, 13, 5, 'Sobrang solid grabe di ko maintindihan or masabi yung experience ko rito. Mula sa Skyranch hanggang sa Tagaytay, unforgettable talaga! Highly recommend.', 0, '2024-01-27 13:28:20'),
(105, 26, 9, 12, 4, 'Alibijaban Island surpassed our expectations with its untouched beauty and tranquil ambiance. From the swaying coconut palms to the pristine sandy shores, every aspect of the island exuded serenity, offering a perfect retreat for nature lovers seeking an unspoiled paradise.', 0, '2024-01-27 13:29:34'),
(106, 27, 9, 12, 4, 'Our day exploring Lake Mapanuepe and Liwliwa Beach was a delightful journey through nature\'s wonders. The calm waters of Lake Mapanuepe provided a serene escape, while Liwliwa Beach\'s golden sands and vibrant surf culture created a laid-back coastal experience, making it a perfect blend of tranquility and beachside adventure.', 0, '2024-01-27 13:30:54'),
(107, 24, 11, 11, 3, 'Enjoyable kaso ang traffic sa may slex as well as medyo janky rin yung travel process. Hope for improvements in the future.', 0, '2024-01-27 13:31:31'),
(109, 27, 7, 12, 3, 'Our experience at Lake Mapanuepe and Liwliwa Beach was unfortunately less than satisfying. Lake Mapanuepe\'s surroundings felt rather dull and lacking in vibrant scenery, while Liwliwa Beach\'s atmosphere was marred by excessive crowds and a noticeable lack of cleanliness. Overall, it was a disappointing day that fell short of our expectations for a relaxing nature escape.', 0, '2024-01-27 13:33:59'),
(110, 26, 11, 12, 4, 'The beach is an absolute stunner. Like wow, I have never seen an attraction as beautiful as this before. This could be on par with Boracay, but the travel time somewhat makes me feel dizzy. Still a solid trip though.', 0, '2024-01-27 13:35:46'),
(111, 25, 11, 11, 1, 'What an absolute waste of time and money. I would never recommend it again.', 0, '2024-01-27 13:37:23'),
(112, 28, 11, 13, 5, 'Gusto kong sumigaw sa tuktok ng bundok na \'to, kasi sobrang ganda ng view! Para kang nanood ng isang slow-burn movie, mabagal yung usad pero mawawala yung pagod pagdating mo sa mountain peak. I would highly recommend this place kung gusto mong mag-unwid at pansamantalang kalimutan ng stress ng buhay.', 0, '2024-01-27 13:45:55'),
(113, 27, 11, 12, 4, 'To be honest, hindi ko type mga trips kung pa-norte yung biyahe. Pero nung may nag-invite sa akin na pumunta rito for our office vacation, the camp aspect made me interested. Despite the long and stressful drive, the camping aspect and the package\'s natural interaction have the trip pay off', 0, '2024-01-27 13:54:45');

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
(7, '202312-00003', 'Khistan', '', 'Salliao', 'Male', '0901-234-5678', 'Santa Rosa, Laguna', 'khistan@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/7.png?v=1702901190', 1, 0, '2023-12-18 20:06:30', '2023-12-18 20:06:30'),
(8, '202401-00001', 'PaulineFaustina', 'Santos', 'Panganiban', 'Female', '0935-385-5054', 'B1 L1 MABOLO ST. EAST DRIVE VILLAGE, BRGY. POOC, STA. ROSA LAGUNA', 'paulinee.panganiban@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/8.png?v=1706315282', 1, 0, '2024-01-27 00:28:02', '2024-01-27 00:28:02'),
(9, '202401-00002', 'Celia', 'Dauan', 'Garapan', 'Female', '0901-234-5667', 'St. Francis Homes 2', 'celia@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/9.png?v=1706317720', 1, 0, '2024-01-27 01:08:40', '2024-01-27 01:08:40'),
(10, '202401-00003', 'Khistan', '', 'Salliao', 'Male', '0929-438-0257', '883 F.Gomez Barangay Ibaba Santa Rosa Laguna', 'salliaokhistang@gmail.com', '20be3fa6f1a659b9b822756d7da4f581', 'uploads/travelers/10.png?v=1706320695', 1, 0, '2024-01-27 01:58:15', '2024-01-27 01:58:15'),
(11, '202401-00004', 'Vince', '', 'Sagun', 'Male', '0984-289-9159', 'Blk 16 Lot 20 Caballero St. Alfonso Homes 2 Brgy. Sinalhan', 'vsagun70@gmail.com', '60215c4d3ca27bac3ba9968f17fb3df9', 'uploads/travelers/11.png?v=1706332890', 1, 0, '2024-01-27 05:21:30', '2024-01-27 05:21:30'),
(12, '202401-00005', 'Jessica', 'Master', 'Masara', 'Female', '0912-324-5678', 'St. Francis Homes', 'jessica_masara@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/travelers/12.png?v=1706340635', 1, 0, '2024-01-27 07:30:35', '2024-01-27 07:30:35');

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
(12, 'Jessica', 'Barbella', 'jessica_barbella', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-12.png?v=1706310733', NULL, 2, '2023-11-20 07:05:25', '2024-01-26 23:12:13'),
(13, 'Maureen', 'De Luna', 'maureen', 'e10adc3949ba59abbe56e057f20f883e', 'uploads/avatar-13.png?v=1706310308', NULL, 1, '2023-11-20 07:07:21', '2024-01-26 23:05:08');

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `agency_type_list`
--
ALTER TABLE `agency_type_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `booked_packages`
--
ALTER TABLE `booked_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `booked_packages_list`
--
ALTER TABLE `booked_packages_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `booking_list`
--
ALTER TABLE `booking_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=410;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `package_list`
--
ALTER TABLE `package_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ratings_reviews`
--
ALTER TABLE `ratings_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
