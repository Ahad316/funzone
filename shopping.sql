-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 11:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `ban_id` int(50) NOT NULL,
  `ban_name` varchar(255) NOT NULL,
  `ban_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`ban_id`, `ban_name`, `ban_img`) VALUES
(2, 'Winter sale', '1.jpg'),
(3, 'Summer sale', '2.jpg'),
(4, 'Kids Fashion sale', '3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(10) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(23, 'Women'),
(26, 'Mens'),
(27, 'Kids'),
(28, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pro_id` int(50) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `pro_desc` varchar(255) NOT NULL,
  `pro_price` int(50) NOT NULL,
  `pro_catid` int(50) NOT NULL,
  `pro_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pro_id`, `pro_name`, `pro_desc`, `pro_price`, `pro_catid`, `pro_img`) VALUES
(1, 'Green Jacket', 'Green Jacket for  women \r\nwinter collection', 3000, 23, 'women-01.jpg'),
(2, 'Black Sweat Shirt	', 'Black Sweat Shirt for boys', 4000, 26, 'men-03.jpg'),
(3, 'Winter Coat', 'Winter Coat for baby girl', 3000, 27, 'kid-01.jpg'),
(4, 'Summer Camp	', 'Summer Camp dress for baby girls', 7000, 27, 'kid-02.jpg'),
(5, 'Grey Top', 'Fleece Grey Top', 3000, 23, 'women-03.jpg'),
(6, 'Denim Shirt', 'Denim shirt for man ', 4000, 26, 'men-02.jpg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `productdata`
-- (See below for the actual view)
--
CREATE TABLE `productdata` (
`pro_id` int(50)
,`pro_name` varchar(255)
,`pro_desc` varchar(255)
,`pro_price` int(50)
,`pro_img` varchar(255)
,`cat_name` varchar(255)
,`cat_id` int(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(50) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_phno` varchar(255) NOT NULL,
  `u_add` varchar(255) NOT NULL,
  `u_city` varchar(255) NOT NULL,
  `u_zip` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_email`, `u_phno`, `u_add`, `u_city`, `u_zip`) VALUES
(0, 'Warda', 'w@gmail.com', '99887765', 'block a', 'karachi', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `order_id` int(50) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `order_price` int(50) NOT NULL,
  `order_qty` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `order_name`, `order_price`, `order_qty`) VALUES
(1, 'Green Jacket', 3000, 5),
(2, 'Black Sweat Shirt	', 4000, 5);

-- --------------------------------------------------------

--
-- Structure for view `productdata`
--
DROP TABLE IF EXISTS `productdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productdata`  AS SELECT `product`.`pro_id` AS `pro_id`, `product`.`pro_name` AS `pro_name`, `product`.`pro_desc` AS `pro_desc`, `product`.`pro_price` AS `pro_price`, `product`.`pro_img` AS `pro_img`, `category`.`cat_name` AS `cat_name`, `category`.`cat_id` AS `cat_id` FROM (`product` join `category` on(`category`.`cat_id` = `product`.`pro_catid`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`ban_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pro_id`),
  ADD KEY `pro_catid` (`pro_catid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `ban_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `pro_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`pro_catid`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
