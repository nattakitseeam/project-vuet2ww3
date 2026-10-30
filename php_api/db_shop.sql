-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2026 at 06:53 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int(11) NOT NULL,
  `asset_code` varchar(50) NOT NULL COMMENT 'รหัสครุภัณฑ์',
  `asset_name` varchar(255) NOT NULL COMMENT 'ชื่อครุภัณฑ์',
  `purchase_date` date DEFAULT NULL COMMENT 'วันที่ซื้อ',
  `price` decimal(10,2) DEFAULT NULL COMMENT 'ราคา',
  `image` varchar(100) DEFAULT NULL COMMENT 'ชื่อไฟล์หรือ Path รูปภาพ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`asset_id`, `asset_code`, `asset_name`, `purchase_date`, `price`, `image`, `created_at`) VALUES
(1, 'IT001', 'คอมพิวเตอร์ตั้งโต๊ะ', NULL, '25000.00', '1793339363_p5.jpg', '2026-10-30 04:42:14'),
(2, 'IT002', 'โน้ตบุ๊ก', NULL, '32000.00', '1793339355_1793339342_p3.jpg', '2026-10-30 04:42:14'),
(3, 'IT003', 'เครื่องพิมพ์', NULL, '8500.00', '1793339342_p3.jpg', '2026-10-30 04:42:14'),
(4, 'IT004', 'โปรเจกเตอร์', NULL, '18000.00', '1793339329_p2.jpg', '2026-10-30 04:42:14'),
(5, 'IT005', 'เครื่องสำรองไฟ UPS', NULL, '3500.00', '1793339287_1793334436_p5.jpg', '2026-10-30 04:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `fullname` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_id`, `subject`, `detail`, `fullname`, `email`, `created_at`) VALUES
(1, 'สอบถามข้อมูลการสมัครเรียน', 'ต้องการสอบถามรายละเอียดเกี่ยวกับการสมัครเรียน', 'สมชาย ใจดี', 'somchai@gmail.com', '2026-09-18 05:04:22'),
(2, 'sadasd', 'asd', 'asd', 'asd', '2026-09-18 05:26:26'),
(3, 'ซื้อของ', 'ชำรุด', 'ณัฐกิตติ์ ', 'aa@aa.com', '2026-09-18 05:28:58'),
(4, 'sad', 'asd', 'asasd', 'asdas', '2026-10-09 03:34:31'),
(5, 's', 'd', 'sssd', 'sssdddd', '2026-10-09 05:44:21'),
(6, 'น้ำท่วมdd', 'chonburi', 'nattakit', 'fol@sdc.com', '2026-10-09 05:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `firstName`, `lastName`, `phone`, `username`, `password`) VALUES
(00000001, 'มานะ', 'เด็กดี', '038756921', 'mana', '1234'),
(00000002, 'มานี', 'ใจดี', '038756901', 'manee', '1234'),
(00000003, 'www', 'www', 'www', 'www', '$2y$10$Q8N48j9Z.zt3yvrhfkyLGep1gJ/AHgfb5J4LiGThkYHM0.InI6GoW'),
(00000004, 'eeee', 'eee', 'eeeeee', 'eeeeeee', '$2y$10$lQ5tEczcx13aiAvLEGKGi.FvGGCi325/gUnas4zSHirgMdKtTFX9i');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(6) UNSIGNED ZEROFILL NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `firstName`, `lastName`, `phone`, `username`, `password`) VALUES
(000001, 'มีนา', 'มีเงิน', '038756000', 'mena', '1234'),
(000002, 'ใจดี222', 'เจได4', 'sad', 'qwww', '1234'),
(000003, 'เจด', 'สดา', '1222', 'jadesada', '$2y$10$AgbMks0/R1LqQ09EJ7h8pee6BOZCqbuvxZwfeFHRScAM54fAVFZKG'),
(000004, 'node', 'js', '123', 'vscode', '$2y$10$AuC3oLRImmXmdwve2VymLe7qyLNlUBR6arJTLciCJQixyA1fpz5Sm'),
(000005, 'asd', 'asd', 'asd', 'sad', '$2y$10$ymZ.IXN1CeOqbuFvNuovKe0zeUSYM0l3EwQfrbXrRLa2oa/JX2Juq'),
(000006, '444', '444444', '44444', '4444', '$2y$10$AGtxOw4FZmPH0eZEiq3ole5jQpA823zNCOyoaQe6zregb4YpCYOg6');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `image`, `stock`, `created_at`) VALUES
(1, 'เสื้อยืดคอกลม', 'เสื้อยืดผ้าฝ้าย 100% สวมใส่สบาย', '199.00', '1793333926_p3.jpg', 50, '2026-09-04 03:47:42'),
(2, 'กางเกงยีนส์', 'กางเกงยีนส์ทรงกระบอก สีฟ้าอ่อน', '799.00', '1793334398_p4.webp', 30, '2026-09-04 03:47:42'),
(3, 'รองเท้าผ้าใบ', 'รองเท้าผ้าใบสีขาว ใส่ได้ทุกโอกาส', '1299.00', '1793334436_p5.jpg', 20, '2026-09-04 03:47:42'),
(4, 'ไม้บรรทัด', '20', '50.00', '1793334134_p2.jpg', 30, '2026-10-30 04:14:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(6) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
