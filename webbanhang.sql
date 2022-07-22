-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 04:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webbanhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `pre_address`
--

CREATE TABLE `pre_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 0,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_address`
--

INSERT INTO `pre_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'Trần', 'Quy', '', '54/8A Nguyễn Bỉnh Khiêm, Phường Đakao, Quận 1, TP. HCM', '', '', '', 230, 4253, ''),
(2, 2, 'texxt', 'texxt', '', 'test', '', 'hcm', 'hethong', 258, 4236, ''),
(3, 3, 'Nguyễn', 'Hưng', '', '129/23/12 Hoàng Văn Thụ, Phường 8', '', 'Phú Nhuận', '70000', 258, 4240, '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_affiliate`
--

CREATE TABLE `pre_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_affiliate_activity`
--

CREATE TABLE `pre_affiliate_activity` (
  `activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_affiliate_login`
--

CREATE TABLE `pre_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_affiliate_transaction`
--

CREATE TABLE `pre_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_api`
--

CREATE TABLE `pre_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `check_ip` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_api`
--

INSERT INTO `pre_api` (`api_id`, `name`, `key`, `check_ip`, `status`, `date_added`, `date_modified`) VALUES
(2, 'Default', 'pzgx0nXvq853SSJnM65zcbpZ2WalJ0Xk6ZxvsRfa8B0S6gbtCKiscpm7dJcuXJmZUbzAxtWOM5I54CEldgJczqdMNRYE7BVGrhts3GfkYAFIn1rE6q6NgqWke1ynF4Q8R0XDm7fGeag2yHy6vAJODlEtpGjAsqCFvuwGW3brwf3ZoN8ErElLQ7IX3YazJZb0qEEAWB2e6Y8xZEI3JGmMRMnNqXexn7YqSZGpnQnAVn57Tq1n0uVrCDKzrac0qmka', 0, 1, '2016-07-15 13:50:18', '2016-10-04 21:52:51');

-- --------------------------------------------------------

--
-- Table structure for table `pre_api_ip`
--

CREATE TABLE `pre_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_api_ip`
--

INSERT INTO `pre_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(13, 2, '::1'),
(2, 0, ''),
(12, 2, '127.0.0.1'),
(14, 2, '171.233.18.109'),
(15, 2, '116.108.80.23');

-- --------------------------------------------------------

--
-- Table structure for table `pre_api_session`
--

CREATE TABLE `pre_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_api_session`
--

INSERT INTO `pre_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(71, 2, 'Ls76oRKCCgOAOx3lR2XgDQDKj124zmzw', '1vsed7r2906o9rlgbj9sgsobte', 'temp_session_61e901e6a97f6', '116.108.80.23', '2022-01-20 13:32:06', '2022-01-20 13:32:16'),
(72, 2, '3MH13U4oh4QpswYt6NFuJA7YV9A5O4OX', 'app9r51jftu6m1mqg5l0v186n6', 'temp_session_628036ecd0ce2', '::1', '2022-05-15 06:10:36', '2022-05-15 06:10:36'),
(73, 2, 'LnWEQmSIi399ikY8ivAMwFER4hXYWmdq', 'app9r51jftu6m1mqg5l0v186n6', 'temp_session_6280374a185f2', '::1', '2022-05-15 06:12:10', '2022-05-15 06:12:10'),
(74, 2, 'jyKHPJbFWiGYlF453Wdg6OE2hi3rdxmm', 'app9r51jftu6m1mqg5l0v186n6', 'temp_session_62803791d6349', '::1', '2022-05-15 06:13:21', '2022-05-15 06:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `pre_attribute`
--

CREATE TABLE `pre_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_attribute_description`
--

CREATE TABLE `pre_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_attribute_group`
--

CREATE TABLE `pre_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_attribute_group_description`
--

CREATE TABLE `pre_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_banner`
--

CREATE TABLE `pre_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_banner`
--

INSERT INTO `pre_banner` (`banner_id`, `name`, `status`) VALUES
(12, '[Trang chủ] &gt;&gt; Video', 1),
(11, '[Trang chủ] &gt;&gt; Lý do', 1),
(13, '[Trang chủ] &gt;&gt; 2 Banner', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_banner_image`
--

CREATE TABLE `pre_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_banner_image`
--

INSERT INTO `pre_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(134, 13, '#', 'catalog/banner/d2c-bottom-block-11-2021-950x600.jpg', 2),
(133, 13, '#', 'catalog/banner/kitchen-room-950x600.jpg', 1),
(137, 12, 'https://www.youtube.com/watch?v=RhFmi95XhHs', '', 1),
(142, 11, '', 'catalog/icon/4.png', 5),
(141, 11, '', 'catalog/icon/3.png', 4),
(140, 11, '', 'catalog/icon/2.png', 3),
(139, 11, '', 'catalog/icon/1.png', 2),
(138, 11, '', '', 1),
(143, 11, '', 'catalog/icon/5.png', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pre_banner_image_description`
--

CREATE TABLE `pre_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `name_link` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_banner_image_description`
--

INSERT INTO `pre_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`, `description`, `name_link`) VALUES
(139, 1, 11, '90 ngày sử dụng thử', '', ''),
(140, 1, 11, 'Miễn phí vận chuyển', '', ''),
(138, 1, 11, 'Lý do bạn nên mua hàng từ ABC?', 'Áp dụng cho sản phẩm mua tại cửa hàng trực tuyến ABC', ''),
(137, 1, 12, '', '', ''),
(133, 1, 13, 'Hỗ trợ', 'Đăng ký sản phẩm của bạn để nhận được nhiều thông tin về hướng dẫn sử dụng, thông tin mua hàng, bảo hành và đăng ký dịch vụ trong trường hợp cần thiết. Đăng ký sản phẩm sẽ giúp chúng tôi có thể liên hệ bạn để cung cấp những thông tin mới về sản phẩm cũng như những thông tin an toàn khác.', 'Đến trang hỗ trợ khách hàng'),
(134, 1, 13, 'Tươi ngon suốt 7 ngày không cần đông đá', 'Ngăn đông mềm TasteSeal giữ nhiệt độ luôn ở mức -2°C, thực phẩm luôn tươi ngon trong suốt 7 ngày* mà không cần đông đá.', 'Xem thêm'),
(141, 1, 11, 'Miễn phí lắp đặt', '', ''),
(142, 1, 11, 'Trả góp 0%', '', ''),
(143, 1, 11, 'Bảo hành 2 năm', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_bf_attribute_value`
--

CREATE TABLE `pre_bf_attribute_value` (
  `attribute_value_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `value` varchar(200) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_bf_filter`
--

CREATE TABLE `pre_bf_filter` (
  `product_id` int(11) NOT NULL,
  `filter_group` varchar(10) NOT NULL,
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `out_of_stock` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_bf_filter`
--

INSERT INTO `pre_bf_filter` (`product_id`, `filter_group`, `filter_id`, `language_id`, `out_of_stock`) VALUES
(51, 'c0', 104, 2, 0),
(51, 'c0', 100, 2, 0),
(51, 'c0', 78, 2, 0),
(51, 's0', 7, 2, 0),
(51, 'r0', 4, 2, 0),
(51, 'm0', 0, 2, 0),
(52, 'c0', 104, 2, 0),
(52, 'c0', 100, 2, 0),
(52, 'c0', 78, 2, 0),
(52, 's0', 7, 2, 0),
(52, 'r0', 5, 2, 0),
(53, 'c0', 106, 2, 0),
(53, 'c0', 100, 2, 0),
(53, 'c0', 78, 2, 0),
(53, 's0', 7, 2, 0),
(53, 'r0', 5, 2, 0),
(54, 'c0', 78, 2, 0),
(54, 's0', 7, 2, 0),
(54, 'r0', 5, 2, 0),
(55, 's0', 7, 2, 0),
(55, 'r0', 5, 2, 0),
(55, 'm0', 0, 2, 0),
(56, 'c0', 107, 2, 0),
(56, 'c0', 103, 2, 0),
(56, 'c0', 79, 2, 0),
(57, 'f3', 7, 1, 0),
(57, 'f6', 18, 1, 0),
(57, 'f2', 19, 1, 0),
(58, 'c0', 103, 2, 0),
(58, 'c0', 77, 2, 0),
(58, 's0', 7, 2, 0),
(58, 'r0', 5, 2, 0),
(58, 'm0', 0, 2, 0),
(59, 'c0', 113, 2, 0),
(59, 'c0', 103, 2, 0),
(59, 'c0', 81, 2, 0),
(59, 's0', 7, 2, 0),
(60, 'f2', 5, 1, 0),
(60, 'f3', 7, 1, 0),
(60, 'f11', 33, 1, 0),
(60, 'f9', 35, 1, 0),
(61, 's0', 7, 2, 0),
(61, 'r0', 5, 2, 0),
(61, 'm0', 0, 2, 0),
(61, 'f13', 45, 2, 0),
(62, 'c0', 102, 2, 0),
(62, 'c0', 80, 2, 0),
(62, 's0', 7, 2, 0),
(62, 'r0', 5, 2, 0),
(63, 'c0', 83, 2, 0),
(63, 's0', 7, 2, 0),
(64, 'c0', 83, 2, 0),
(64, 's0', 7, 2, 0),
(51, 'f4', 12, 2, 0),
(52, 'm0', 0, 2, 0),
(53, 'm0', 0, 2, 0),
(54, 'm0', 0, 2, 0),
(55, 'f5', 13, 2, 0),
(56, 's0', 7, 2, 0),
(57, 'm0', 0, 1, 0),
(58, 'f10', 30, 2, 0),
(59, 'r0', 5, 2, 0),
(60, 'm0', 0, 1, 0),
(61, 'f12', 42, 2, 0),
(62, 'm0', 0, 2, 0),
(63, 'r0', 5, 2, 0),
(64, 'r0', 5, 2, 0),
(65, 's0', 7, 2, 0),
(51, 'f4', 11, 2, 0),
(51, 'f4', 10, 2, 0),
(52, 'f4', 11, 2, 0),
(53, 'f4', 11, 2, 0),
(54, 'f3', 7, 2, 0),
(55, 'f3', 9, 2, 0),
(56, 'm0', 0, 2, 0),
(57, 's0', 7, 1, 0),
(58, 'f9', 27, 2, 0),
(59, 'm0', 0, 2, 0),
(60, 's0', 7, 1, 0),
(61, 'f2', 19, 2, 0),
(62, 'f13', 44, 2, 0),
(63, 'm0', 0, 2, 0),
(64, 'm0', 0, 2, 0),
(65, 'r0', 5, 2, 0),
(51, 'f3', 7, 2, 0),
(51, 'f2', 4, 2, 0),
(51, 'f1', 3, 2, 0),
(52, 'f4', 10, 2, 0),
(52, 'f3', 7, 2, 0),
(52, 'f2', 5, 2, 0),
(53, 'f4', 10, 2, 0),
(53, 'f3', 8, 2, 0),
(53, 'f2', 6, 2, 0),
(54, 'f2', 6, 2, 0),
(54, 'f1', 2, 2, 0),
(54, 'c0', 106, 1, 0),
(55, 'f2', 6, 2, 0),
(55, 'c0', 100, 1, 0),
(56, 'f6', 16, 2, 0),
(56, 'f3', 8, 2, 0),
(56, 'f2', 5, 2, 0),
(57, 'c0', 79, 1, 0),
(57, 'c0', 103, 1, 0),
(57, 'c0', 108, 1, 0),
(58, 'f2', 24, 2, 0),
(58, 'f7', 22, 2, 0),
(59, 'f6', 37, 2, 0),
(59, 'f8', 25, 2, 0),
(59, 'f2', 24, 2, 0),
(60, 'c0', 97, 1, 0),
(60, 'c0', 103, 1, 0),
(61, 'f3', 8, 2, 0),
(61, 'c0', 102, 1, 0),
(62, 'f12', 40, 2, 0),
(62, 'f3', 9, 2, 0),
(63, 'f3', 9, 2, 0),
(63, 'f2', 6, 2, 0),
(63, 'c0', 116, 1, 0),
(64, 'f2', 46, 2, 0),
(64, 'f3', 9, 2, 0),
(64, 'c0', 116, 1, 0),
(65, 'm0', 0, 2, 0),
(65, 'c0', 102, 1, 0),
(51, 'c0', 104, 1, 0),
(51, 'c0', 100, 1, 0),
(51, 'c0', 78, 1, 0),
(51, 's0', 7, 1, 0),
(51, 'r0', 4, 1, 0),
(51, 'm0', 0, 1, 0),
(52, 'f1', 3, 2, 0),
(52, 'c0', 104, 1, 0),
(52, 'c0', 100, 1, 0),
(52, 'c0', 78, 1, 0),
(52, 's0', 7, 1, 0),
(53, 'f1', 3, 2, 0),
(53, 'c0', 106, 1, 0),
(53, 'c0', 100, 1, 0),
(53, 'c0', 78, 1, 0),
(53, 's0', 7, 1, 0),
(54, 'c0', 100, 1, 0),
(54, 'c0', 78, 1, 0),
(54, 's0', 7, 1, 0),
(55, 'c0', 95, 1, 0),
(55, 's0', 7, 1, 0),
(55, 'r0', 5, 1, 0),
(56, 'c0', 107, 1, 0),
(56, 'c0', 103, 1, 0),
(56, 'c0', 79, 1, 0),
(57, 'f3', 7, 2, 0),
(57, 'f6', 18, 2, 0),
(57, 'f2', 19, 2, 0),
(58, 'f3', 8, 2, 0),
(58, 'c0', 103, 1, 0),
(58, 'c0', 77, 1, 0),
(58, 's0', 7, 1, 0),
(58, 'r0', 5, 1, 0),
(59, 'f3', 9, 2, 0),
(59, 'c0', 113, 1, 0),
(59, 'c0', 103, 1, 0),
(59, 'c0', 81, 1, 0),
(60, 'f2', 5, 2, 0),
(60, 'f3', 7, 2, 0),
(60, 'f11', 33, 2, 0),
(60, 'f9', 35, 2, 0),
(61, 'c0', 80, 1, 0),
(61, 's0', 7, 1, 0),
(61, 'r0', 5, 1, 0),
(61, 'm0', 0, 1, 0),
(62, 'f2', 5, 2, 0),
(62, 'c0', 102, 1, 0),
(62, 'c0', 80, 1, 0),
(62, 's0', 7, 1, 0),
(63, 'c0', 102, 1, 0),
(63, 'c0', 83, 1, 0),
(64, 'c0', 102, 1, 0),
(64, 'c0', 83, 1, 0),
(51, 'f4', 12, 1, 0),
(52, 'r0', 5, 1, 0),
(53, 'r0', 5, 1, 0),
(54, 'r0', 5, 1, 0),
(55, 'm0', 0, 1, 0),
(56, 's0', 7, 1, 0),
(57, 'm0', 0, 2, 0),
(58, 'm0', 0, 1, 0),
(59, 's0', 7, 1, 0),
(60, 'm0', 0, 2, 0),
(61, 'f13', 45, 1, 0),
(62, 'r0', 5, 1, 0),
(63, 's0', 7, 1, 0),
(64, 's0', 7, 1, 0),
(65, 'c0', 99, 1, 0),
(51, 'f4', 11, 1, 0),
(51, 'f4', 10, 1, 0),
(52, 'm0', 0, 1, 0),
(53, 'm0', 0, 1, 0),
(54, 'm0', 0, 1, 0),
(55, 'f5', 13, 1, 0),
(56, 'm0', 0, 1, 0),
(57, 's0', 7, 2, 0),
(58, 'f10', 30, 1, 0),
(59, 'r0', 5, 1, 0),
(60, 's0', 7, 2, 0),
(61, 'f12', 42, 1, 0),
(62, 'm0', 0, 1, 0),
(63, 'r0', 5, 1, 0),
(64, 'r0', 5, 1, 0),
(65, 's0', 7, 1, 0),
(51, 'f3', 7, 1, 0),
(51, 'f2', 4, 1, 0),
(51, 'f1', 3, 1, 0),
(52, 'f4', 11, 1, 0),
(52, 'f4', 10, 1, 0),
(52, 'f3', 7, 1, 0),
(53, 'f4', 11, 1, 0),
(53, 'f4', 10, 1, 0),
(53, 'f3', 8, 1, 0),
(54, 'f3', 7, 1, 0),
(54, 'f2', 6, 1, 0),
(54, 'f1', 2, 1, 0),
(55, 'f3', 9, 1, 0),
(55, 'f2', 6, 1, 0),
(56, 'f6', 16, 1, 0),
(56, 'f3', 8, 1, 0),
(56, 'f2', 5, 1, 0),
(57, 'c0', 79, 2, 0),
(57, 'c0', 103, 2, 0),
(57, 'c0', 108, 2, 0),
(58, 'f9', 27, 1, 0),
(58, 'f2', 24, 1, 0),
(59, 'm0', 0, 1, 0),
(59, 'f6', 37, 1, 0),
(59, 'f8', 25, 1, 0),
(60, 'c0', 97, 2, 0),
(60, 'c0', 103, 2, 0),
(61, 'f2', 19, 1, 0),
(61, 'f3', 8, 1, 0),
(62, 'f13', 44, 1, 0),
(62, 'f12', 40, 1, 0),
(63, 'm0', 0, 1, 0),
(63, 'f3', 9, 1, 0),
(63, 'f2', 6, 1, 0),
(64, 'm0', 0, 1, 0),
(64, 'f2', 46, 1, 0),
(64, 'f3', 9, 1, 0),
(65, 'r0', 5, 1, 0),
(65, 'm0', 0, 1, 0),
(66, 'c0', 77, 2, 0),
(66, 's0', 7, 2, 0),
(66, 'r0', 5, 2, 0),
(66, 'm0', 0, 2, 0),
(66, 'f6', 38, 2, 0),
(66, 'f10', 30, 2, 0),
(67, 'r0', 4, 2, 0),
(67, 'm0', 0, 2, 0),
(67, 'f6', 39, 2, 0),
(67, 'f10', 30, 2, 0),
(67, 'f9', 28, 2, 0),
(67, 'f2', 24, 2, 0),
(68, 'f12', 42, 1, 0),
(68, 'f6', 39, 1, 0),
(68, 'f9', 28, 1, 0),
(68, 'f8', 25, 1, 0),
(68, 'f3', 9, 1, 0),
(68, 'f2', 6, 1, 0),
(69, 'm0', 0, 1, 0),
(69, 'f12', 42, 1, 0),
(69, 'f10', 31, 1, 0),
(69, 'f9', 29, 1, 0),
(69, 'f3', 8, 1, 0),
(69, 'f2', 6, 1, 0),
(70, 'c0', 85, 2, 0),
(70, 's0', 7, 2, 0),
(70, 'r0', 5, 2, 0),
(70, 'm0', 0, 2, 0),
(70, 'f10', 30, 2, 0),
(70, 'f9', 29, 2, 0),
(71, 'f6', 37, 1, 0),
(71, 'f10', 31, 1, 0),
(71, 'f9', 28, 1, 0),
(71, 'f5', 13, 1, 0),
(71, 'f3', 9, 1, 0),
(71, 'f2', 5, 1, 0),
(72, 'f12', 42, 1, 0),
(72, 'f6', 37, 1, 0),
(72, 'f9', 29, 1, 0),
(72, 'f8', 25, 1, 0),
(72, 'f3', 9, 1, 0),
(72, 'f2', 6, 1, 0),
(73, 'c0', 84, 2, 0),
(73, 's0', 7, 2, 0),
(73, 'r0', 5, 2, 0),
(73, 'm0', 0, 2, 0),
(73, 'f12', 42, 2, 0),
(73, 'f9', 29, 2, 0),
(74, 'f6', 39, 1, 0),
(74, 'f9', 29, 1, 0),
(74, 'f8', 25, 1, 0),
(74, 'f2', 24, 1, 0),
(74, 'f5', 14, 1, 0),
(74, 'f3', 9, 1, 0),
(75, 'f3', 9, 2, 1),
(75, 'f8', 25, 2, 1),
(75, 'f10', 31, 2, 1),
(75, 'f9', 34, 2, 1),
(75, 'm0', 0, 2, 1),
(75, 's0', 5, 2, 1),
(75, 'c0', 87, 2, 1),
(75, 'f2', 4, 2, 1),
(75, 'f2', 4, 1, 1),
(75, 'f3', 9, 1, 1),
(75, 'f8', 25, 1, 1),
(75, 'f10', 31, 1, 1),
(75, 'f9', 34, 1, 1),
(75, 'm0', 0, 1, 1),
(75, 'c0', 87, 1, 1),
(75, 's0', 5, 1, 1),
(74, 'f12', 42, 1, 0),
(74, 'm0', 0, 1, 0),
(74, 's0', 7, 1, 0),
(74, 'c0', 87, 1, 0),
(74, 'f3', 9, 2, 0),
(74, 'f5', 14, 2, 0),
(74, 'f2', 24, 2, 0),
(74, 'f8', 25, 2, 0),
(74, 'f9', 29, 2, 0),
(74, 'f6', 39, 2, 0),
(74, 'f12', 42, 2, 0),
(74, 'm0', 0, 2, 0),
(74, 's0', 7, 2, 0),
(74, 'c0', 87, 2, 0),
(73, 'f2', 24, 2, 0),
(73, 'f3', 9, 2, 0),
(73, 'f2', 4, 2, 0),
(73, 'c0', 84, 1, 0),
(73, 's0', 7, 1, 0),
(73, 'r0', 5, 1, 0),
(73, 'm0', 0, 1, 0),
(73, 'f12', 42, 1, 0),
(73, 'f9', 29, 1, 0),
(73, 'f2', 24, 1, 0),
(72, 'm0', 0, 1, 0),
(72, 's0', 7, 1, 0),
(72, 'c0', 84, 1, 0),
(72, 'f2', 6, 2, 0),
(72, 'f3', 9, 2, 0),
(72, 'f8', 25, 2, 0),
(72, 'f9', 29, 2, 0),
(72, 'f6', 37, 2, 0),
(72, 'f12', 42, 2, 0),
(72, 'm0', 0, 2, 0),
(72, 's0', 7, 2, 0),
(72, 'c0', 84, 2, 0),
(71, 'm0', 0, 1, 0),
(71, 's0', 7, 1, 0),
(71, 'c0', 84, 1, 0),
(71, 'f2', 5, 2, 0),
(71, 'f3', 9, 2, 0),
(71, 'f5', 13, 2, 0),
(71, 'f9', 28, 2, 0),
(71, 'f10', 31, 2, 0),
(71, 'f6', 37, 2, 0),
(71, 'm0', 0, 2, 0),
(71, 's0', 7, 2, 0),
(71, 'c0', 84, 2, 0),
(70, 'f8', 25, 2, 0),
(70, 'f2', 24, 2, 0),
(70, 'f3', 7, 2, 0),
(70, 'c0', 85, 1, 0),
(70, 's0', 7, 1, 0),
(70, 'r0', 5, 1, 0),
(70, 'm0', 0, 1, 0),
(70, 'f10', 30, 1, 0),
(70, 'f9', 29, 1, 0),
(70, 'f8', 25, 1, 0),
(69, 's0', 7, 1, 0),
(69, 'c0', 85, 1, 0),
(69, 'f2', 6, 2, 0),
(69, 'f3', 8, 2, 0),
(69, 'f9', 29, 2, 0),
(69, 'f10', 31, 2, 0),
(69, 'f12', 42, 2, 0),
(69, 'm0', 0, 2, 0),
(69, 's0', 7, 2, 0),
(69, 'c0', 85, 2, 0),
(68, 'm0', 0, 1, 0),
(68, 's0', 7, 1, 0),
(68, 'c0', 85, 1, 0),
(68, 'f2', 6, 2, 0),
(68, 'f3', 9, 2, 0),
(68, 'f8', 25, 2, 0),
(68, 'f9', 28, 2, 0),
(68, 'f6', 39, 2, 0),
(68, 'f12', 42, 2, 0),
(68, 'm0', 0, 2, 0),
(68, 's0', 7, 2, 0),
(68, 'c0', 85, 2, 0),
(67, 'f7', 22, 2, 0),
(67, 'f3', 9, 2, 0),
(67, 'c0', 77, 1, 0),
(67, 's0', 7, 1, 0),
(67, 'r0', 4, 1, 0),
(67, 'm0', 0, 1, 0),
(67, 'f6', 39, 1, 0),
(67, 'f10', 30, 1, 0),
(67, 'f9', 28, 1, 0),
(67, 'f2', 24, 1, 0),
(67, 'f7', 22, 1, 0),
(67, 'f3', 9, 1, 0),
(66, 'f9', 29, 2, 0),
(66, 'f2', 24, 2, 0),
(66, 'f7', 23, 2, 0),
(66, 'f3', 8, 2, 0),
(66, 'c0', 77, 1, 0),
(66, 's0', 7, 1, 0),
(66, 'r0', 5, 1, 0),
(66, 'm0', 0, 1, 0),
(66, 'f6', 38, 1, 0),
(66, 'f10', 30, 1, 0),
(66, 'f9', 29, 1, 0),
(66, 'f2', 24, 1, 0),
(67, 's0', 7, 2, 0),
(67, 'c0', 77, 2, 0),
(58, 'f7', 22, 1, 0),
(58, 'f3', 8, 1, 0),
(59, 'f2', 24, 1, 0),
(59, 'f3', 9, 1, 0),
(66, 'f7', 23, 1, 0),
(66, 'f3', 8, 1, 0),
(73, 'f3', 9, 1, 0),
(73, 'f2', 4, 1, 0),
(70, 'f2', 24, 1, 0),
(70, 'f3', 7, 1, 0),
(52, 'f2', 5, 1, 0),
(52, 'f1', 3, 1, 0),
(53, 'f2', 6, 1, 0),
(53, 'f1', 3, 1, 0),
(54, 'c0', 100, 2, 0),
(54, 'c0', 106, 2, 0),
(55, 'c0', 95, 2, 0),
(55, 'c0', 100, 2, 0),
(61, 'c0', 80, 2, 0),
(61, 'c0', 102, 2, 0),
(62, 'f3', 9, 1, 0),
(62, 'f2', 5, 1, 0),
(63, 'c0', 102, 2, 0),
(63, 'c0', 116, 2, 0),
(64, 'c0', 102, 2, 0),
(64, 'c0', 116, 2, 0),
(65, 'c0', 99, 2, 0),
(65, 'c0', 102, 2, 0),
(76, 'c0', 120, 1, 0),
(76, 'c0', 119, 1, 0),
(76, 's0', 7, 1, 0),
(76, 'm0', 11, 1, 0),
(77, 'c0', 120, 2, 0),
(77, 'c0', 119, 2, 0),
(77, 's0', 7, 2, 0),
(77, 'm0', 11, 2, 0),
(77, 'c0', 120, 1, 0),
(77, 'c0', 119, 1, 0),
(77, 's0', 7, 1, 0),
(77, 'm0', 11, 1, 0),
(78, 'c0', 120, 1, 0),
(78, 'c0', 119, 1, 0),
(78, 's0', 7, 1, 0),
(78, 'm0', 11, 1, 0),
(79, 'c0', 120, 2, 0),
(79, 'c0', 119, 2, 0),
(79, 's0', 7, 2, 0),
(79, 'm0', 11, 2, 0),
(79, 'c0', 120, 1, 0),
(79, 'c0', 119, 1, 0),
(79, 's0', 7, 1, 0),
(79, 'm0', 11, 1, 0),
(80, 'c0', 120, 1, 0),
(80, 'c0', 119, 1, 0),
(80, 's0', 7, 1, 0),
(80, 'm0', 11, 1, 0),
(81, 'c0', 120, 1, 0),
(81, 'c0', 119, 1, 0),
(81, 's0', 7, 1, 0),
(81, 'm0', 11, 1, 0),
(82, 'c0', 120, 2, 0),
(82, 'c0', 119, 2, 0),
(82, 's0', 7, 2, 0),
(82, 'm0', 11, 2, 0),
(83, 'c0', 120, 2, 0),
(83, 'c0', 119, 2, 0),
(83, 's0', 7, 2, 0),
(83, 'm0', 11, 2, 0),
(83, 'c0', 120, 1, 0),
(83, 'c0', 119, 1, 0),
(83, 's0', 7, 1, 0),
(83, 'm0', 11, 1, 0),
(82, 'c0', 120, 1, 0),
(82, 'c0', 119, 1, 0),
(82, 's0', 7, 1, 0),
(82, 'm0', 11, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_bf_product_attribute_value`
--

CREATE TABLE `pre_bf_product_attribute_value` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_bf_tax_rate`
--

CREATE TABLE `pre_bf_tax_rate` (
  `id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `percent_rate` decimal(15,4) NOT NULL,
  `fixed_rate` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_bf_tax_rate`
--

INSERT INTO `pre_bf_tax_rate` (`id`, `customer_group_id`, `country_id`, `zone_id`, `tax_class_id`, `based`, `percent_rate`, `fixed_rate`) VALUES
(1, 1, 230, 0, 11, 'payment', '10.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `pre_block`
--

CREATE TABLE `pre_block` (
  `block_id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `key` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `html` mediumtext NOT NULL,
  `html_publish` text NOT NULL,
  `css` text NOT NULL,
  `css_publish` text NOT NULL,
  `css_lib` varchar(4096) NOT NULL DEFAULT '[]',
  `script_lib` varchar(4096) NOT NULL DEFAULT '[]',
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_block`
--

INSERT INTO `pre_block` (`block_id`, `type`, `key`, `code`, `avatar`, `html`, `html_publish`, `css`, `css_publish`, `css_lib`, `script_lib`, `date_modified`, `date_added`) VALUES
(1, 'custom', 'extra-content', 'extra-content-1', 'catalog/block/extra-content-1/avatar.png', '<div class=\"extra-content\" style=\"background-color: #00c0ff; color: #fff\">\r\n  <div class=\"row hover-effect\">\r\n    <div class=\"col-sm-6\">\r\n      <div class=\"row\">\r\n        <div class=\"col-sm-12\">\r\n          <div class=\"box-half-content pull-right\">\r\n            <h1 data-editable=\"true\">Detailed Design</h1>\r\n            <h3 class=\"sub-title\" data-editable=\"true\">Modern solution</h3>\r\n            <p data-editable=\"true\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. </p>\r\n            <p data-editable=\"true\"> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #FFF; border: 1px solid #fff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #FFF; border: 1px solid #fff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> </p>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class=\"col-sm-6 hidden-xs\">\r\n      <div class=\"row\">\r\n        <figure class=\"effect-apollo\"> <img src=\"../image/block/content/bg22.jpg\" alt=\"content\" data-editable=\"true\">\r\n          <figcaption></figcaption>\r\n        </figure>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n', '<div class=\"extra-content-1\" style=\"background-color: #00c0ff; color: #fff\">\r\n  <div class=\"row hover-effect\">\r\n    <div class=\"col-sm-6\">\r\n      <div class=\"row\">\r\n        <div class=\"col-sm-12\">\r\n          <div class=\"box-half-content pull-right\">\r\n            <h1 data-editable=\"true\">Detailed Design</h1>\r\n            <h3 class=\"sub-title\" data-editable=\"true\">Modern solution</h3>\r\n            <p data-editable=\"true\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. </p>\r\n            <p data-editable=\"true\"> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #FFF; border: 1px solid #fff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #FFF; border: 1px solid #fff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> </p>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n    <div class=\"col-sm-6 hidden-xs\">\r\n      <div class=\"row\">\r\n        <figure class=\"effect-apollo\"> <img src=\"../image/block/content/bg22.jpg\" alt=\"content\" data-editable=\"true\">\r\n          <figcaption></figcaption>\r\n        </figure>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n', '', '', '[\"catalog\\/view\\/stylesheet\\/extra-info.css\",\"catalog\\/view\\/stylesheet\\/hover.css\"]', '[]', '2017-01-14 11:40:40', '2017-01-12 22:47:22'),
(2, 'custom', 'extra-content', 'extra-content-2', 'catalog/block/extra-content-2/avatar.png', '<section class=\"extra-content-2\" style=\"background-color: #FFF; color:#222;\">\r\n  <div class=\"row hover-effect\">\r\n    <div class=\"col-sm-6 hidden-xs\">\r\n      <div class=\"row\">\r\n        <figure class=\"effect-apollo\"> <img src=\"../image/block/content/bg4.jpg\" alt=\"content\" data-editable=\"true\">\r\n          <figcaption></figcaption>\r\n        </figure>\r\n      </div>\r\n    </div>\r\n    <div class=\"col-sm-6\">\r\n      <div class=\"row\">\r\n        <div class=\"col-ms-12\">\r\n          <div class=\"box-half-content pull-left\">\r\n            <h1 data-editable=\"true\">Detailed Design</h1>\r\n            <h3 class=\"sub-title\" data-editable=\"true\" style=\"color: #00c0ff;\">Modern solution</h3>\r\n            <p data-editable=\"true\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. </p>\r\n            <p data-editable=\"true\"> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> </p>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n', '<section class=\"extra-content-2\" style=\"background-color: #FFF; color:#222;\">\r\n  <div class=\"row hover-effect\">\r\n    <div class=\"col-sm-6 hidden-xs\">\r\n      <div class=\"row\">\r\n        <figure class=\"effect-apollo\"> <img src=\"../image/block/content/bg4.jpg\" alt=\"content\" data-editable=\"true\">\r\n          <figcaption></figcaption>\r\n        </figure>\r\n      </div>\r\n    </div>\r\n    <div class=\"col-sm-6\">\r\n      <div class=\"row\">\r\n        <div class=\"col-ms-12\">\r\n          <div class=\"box-half-content pull-left\">\r\n            <h1 data-editable=\"true\">Detailed Design</h1>\r\n            <h3 class=\"sub-title\" data-editable=\"true\" style=\"color: #00c0ff;\">Modern solution</h3>\r\n            <p data-editable=\"true\">In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible. </p>\r\n            <p data-editable=\"true\"> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo <i class=\"icon right-icon icon-power\"></i></a> </p>\r\n          </div>\r\n        </div>\r\n      </div>\r\n    </div>\r\n  </div>\r\n</section>\r\n', '', '', '[\"catalog\\/view\\/stylesheet\\/extra-info.css\",\"catalog\\/view\\/stylesheet\\/hover.css\"]', '[]', '2017-01-14 11:40:55', '2017-01-12 23:02:07');

-- --------------------------------------------------------

--
-- Table structure for table `pre_cart`
--

CREATE TABLE `pre_cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_cart`
--

INSERT INTO `pre_cart` (`cart_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(15, 1, '1vsed7r2906o9rlgbj9sgsobte', 51, 0, '[]', 3, '2022-01-17 09:12:31'),
(16, 1, '1vsed7r2906o9rlgbj9sgsobte', 53, 0, '[]', 1, '2022-01-17 09:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `pre_category`
--

CREATE TABLE `pre_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_banner` varchar(255) DEFAULT NULL,
  `image_banner_mobile` text NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_category`
--

INSERT INTO `pre_category` (`category_id`, `image`, `image_banner`, `image_banner_mobile`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(100, '', '', '', 0, 0, 1, 24, 1, '2022-01-14 17:01:18', '2022-01-14 17:01:18'),
(84, 'catalog/danh-muc/8.png', '', '', 0, 0, 1, 8, 1, '2022-01-13 14:03:19', '2022-01-13 14:03:19'),
(85, 'catalog/danh-muc/9.png', '', '', 0, 0, 1, 9, 1, '2022-01-13 14:03:38', '2022-01-13 14:03:38'),
(86, 'catalog/danh-muc/10.png', '', '', 0, 0, 1, 10, 1, '2022-01-13 14:04:00', '2022-01-13 14:04:00'),
(87, 'catalog/danh-muc/11.png', '', '', 0, 0, 1, 11, 1, '2022-01-13 14:04:20', '2022-01-13 14:04:20'),
(88, 'catalog/danh-muc/12.png', '', '', 0, 0, 1, 12, 1, '2022-01-13 14:04:44', '2022-01-13 14:04:44'),
(89, 'catalog/danh-muc/13.png', '', '', 0, 0, 1, 13, 1, '2022-01-13 14:05:09', '2022-01-13 14:05:09'),
(90, 'catalog/danh-muc/14.png', '', '', 0, 0, 1, 14, 1, '2022-01-13 14:05:35', '2022-01-13 14:05:35'),
(91, 'catalog/danh-muc/15.png', '', '', 0, 0, 1, 15, 1, '2022-01-13 14:05:56', '2022-01-13 14:05:56'),
(92, 'catalog/danh-muc/16.png', '', '', 0, 0, 1, 16, 1, '2022-01-13 14:06:19', '2022-01-13 14:06:19'),
(93, 'catalog/danh-muc/17.png', '', '', 0, 0, 1, 17, 1, '2022-01-13 14:06:41', '2022-01-13 14:06:41'),
(94, 'catalog/danh-muc/18.png', '', '', 0, 0, 1, 18, 1, '2022-01-13 14:07:02', '2022-01-13 14:07:02'),
(95, 'catalog/danh-muc/19.png', '', '', 0, 0, 1, 19, 1, '2022-01-13 14:07:28', '2022-01-13 14:07:28'),
(96, 'catalog/danh-muc/20.png', '', '', 0, 0, 1, 20, 1, '2022-01-13 14:07:48', '2022-01-13 14:07:48'),
(97, 'catalog/danh-muc/21.png', '', '', 0, 0, 1, 21, 1, '2022-01-13 14:08:18', '2022-01-13 14:08:18'),
(98, 'catalog/danh-muc/22.png', 'catalog/banner/water-heater-1900x350-nov20.jpg', 'catalog/banner/water-heater-750x730nov20.jpg', 0, 0, 1, 22, 1, '2022-01-13 14:08:42', '2022-01-18 14:20:01'),
(99, 'catalog/danh-muc/23.png', 'catalog/banner/water-heater-1900x350-nov20.jpg', 'catalog/banner/water-heater-750x730nov20.jpg', 0, 0, 1, 23, 1, '2022-01-13 14:09:02', '2022-01-18 14:20:09'),
(77, 'catalog/danh-muc/5.png', '', '', 0, 0, 1, 5, 1, '2022-01-13 13:47:19', '2022-01-20 14:02:09'),
(78, 'catalog/danh-muc/1.png', 'catalog/banner/washerdryer-1900x350-min.jpg', 'catalog/banner/washerdryer-750x730-min.jpg', 0, 0, 1, 1, 1, '2022-01-13 13:59:53', '2022-01-17 15:58:16'),
(79, 'catalog/danh-muc/2.png', 'catalog/banner/ewbrefrigeration1900x350nov20.jpg', 'catalog/banner/ewbrefrigeration750x730nov20.jpg', 0, 0, 1, 2, 1, '2022-01-13 14:00:54', '2022-01-18 12:00:58'),
(80, 'catalog/danh-muc/3.png', 'catalog/banner/e-wb-air-purifier-1900x350-nov20.jpg', 'catalog/banner/e-wb-air-purifier-750x730-nov20.jpg', 0, 0, 1, 3, 1, '2022-01-13 14:01:34', '2022-01-18 13:58:07'),
(81, 'catalog/danh-muc/4.png', 'catalog/banner/bi-cavity-1900x350-min.jpg', 'catalog/banner/ewbbicavity750x730nov20.jpg', 0, 0, 1, 4, 1, '2022-01-13 14:01:56', '2022-01-18 13:49:46'),
(82, 'catalog/danh-muc/6.png', '', '', 0, 0, 1, 6, 1, '2022-01-13 14:02:33', '2022-01-13 14:02:33'),
(83, 'catalog/danh-muc/7.png', 'catalog/banner/ewbvacuum1900x350nov20.jpg', 'catalog/banner/ewbvacuum750x730nov20.jpg', 0, 0, 1, 7, 1, '2022-01-13 14:02:56', '2022-01-18 14:17:00'),
(101, '', '', '', 0, 0, 1, 25, 1, '2022-01-14 17:01:40', '2022-01-14 17:01:40'),
(102, '', '', '', 0, 0, 1, 26, 1, '2022-01-14 17:02:01', '2022-01-14 17:02:01'),
(103, '', '', '', 0, 0, 1, 27, 1, '2022-01-14 17:02:24', '2022-01-14 17:02:24'),
(104, '', '', '', 78, 0, 1, 1, 1, '2022-01-17 15:49:51', '2022-01-17 15:49:51'),
(105, '', '', '', 78, 0, 1, 2, 1, '2022-01-17 15:50:32', '2022-01-17 15:50:32'),
(106, '', '', '', 78, 0, 1, 3, 1, '2022-01-17 15:51:12', '2022-01-17 15:51:12'),
(107, '', '', '', 79, 0, 1, 1, 1, '2022-01-18 11:57:28', '2022-01-18 11:57:28'),
(108, '', '', '', 79, 0, 1, 2, 1, '2022-01-18 11:58:36', '2022-01-18 11:58:36'),
(109, '', '', '', 79, 0, 1, 3, 1, '2022-01-18 12:01:48', '2022-01-18 12:01:48'),
(110, '', '', '', 79, 0, 1, 4, 1, '2022-01-18 12:02:36', '2022-01-18 12:02:36'),
(111, '', '', '', 79, 0, 1, 5, 1, '2022-01-18 12:03:16', '2022-01-18 12:03:16'),
(112, '', '', '', 79, 0, 1, 6, 1, '2022-01-18 12:04:08', '2022-01-18 12:04:08'),
(113, '', '', '', 81, 0, 1, 1, 1, '2022-01-18 13:40:51', '2022-01-18 13:40:51'),
(114, '', '', '', 81, 0, 1, 2, 1, '2022-01-18 13:41:38', '2022-01-18 13:41:38'),
(115, '', '', '', 83, 0, 1, 1, 1, '2022-01-18 14:11:43', '2022-01-18 14:11:43'),
(116, '', '', '', 83, 0, 1, 2, 1, '2022-01-18 14:12:22', '2022-01-18 14:12:22'),
(117, '', '', '', 83, 0, 1, 3, 1, '2022-01-18 14:12:59', '2022-01-18 14:12:59'),
(118, '', '', '', 83, 0, 1, 4, 1, '2022-01-18 14:13:36', '2022-01-18 14:13:36'),
(119, '', '', '', 0, 0, 1, 0, 1, '2022-02-24 13:19:40', '2022-02-24 13:19:40'),
(120, '', '', '', 119, 0, 1, 0, 1, '2022-02-24 13:20:11', '2022-02-24 13:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `pre_category_description`
--

CREATE TABLE `pre_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_category_description`
--

INSERT INTO `pre_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(99, 1, 'Máy nước nóng trực tiếp', '', 'Máy nước nóng trực tiếp', 'Máy nước nóng trực tiếp', 'Máy nước nóng trực tiếp'),
(100, 1, 'Chăm sóc trang phục', '', 'Chăm sóc trang phục', 'Chăm sóc trang phục', 'Chăm sóc trang phục'),
(81, 1, 'Lò nướng', '', 'Lò nướng', 'Lò nướng', 'Lò nướng'),
(82, 1, 'Máy sấy quần áo', '', 'Máy sấy quần áo', 'Máy sấy quần áo', 'Máy sấy quần áo'),
(93, 1, 'Cây nước nóng lạnh', '', 'Cây nước nóng lạnh', 'Cây nước nóng lạnh', 'Cây nước nóng lạnh'),
(94, 1, 'Máy hút ẩm', '', 'Máy hút ẩm', 'Máy hút ẩm', 'Máy hút ẩm'),
(95, 1, 'Bàn ủi hơi nước đứng', '', 'Bàn ủi hơi nước đứng', 'Bàn ủi hơi nước đứng', 'Bàn ủi hơi nước đứng'),
(96, 1, 'Bàn ủi, bàn là', '', 'Bàn ủi, bàn là', 'Bàn ủi, bàn là', 'Bàn ủi, bàn là'),
(97, 1, 'Máy rửa bát', '', 'Máy rửa bát', 'Máy rửa bát', 'Máy rửa bát'),
(98, 1, 'Máy nước nóng gián tiếp', '', 'Máy nước nóng gián tiếp', 'Máy nước nóng gián tiếp', 'Máy nước nóng gián tiếp'),
(87, 1, 'Nồi chiên không dầu', '', 'Nồi chiên không dầu', 'Nồi chiên không dầu', 'Nồi chiên không dầu'),
(88, 1, 'Nồi cơm điện', '', 'Nồi cơm điện', 'Nồi cơm điện', 'Nồi cơm điện'),
(91, 1, 'Bình đun nước', '', 'Bình đun nước', 'Bình đun nước', 'Bình đun nước'),
(92, 1, 'Máy xay sinh tố &amp; Máy ép trái cây', '', 'Máy xay sinh tố &amp; Máy ép trái cây', 'Máy xay sinh tố &amp; Máy ép trái cây', 'Máy xay sinh tố &amp; Máy ép trái cây'),
(89, 1, 'Bếp nướng, máy nướng bánh mì', '', 'Bếp nướng, máy nướng bánh mì', 'Bếp nướng, máy nướng bánh mì', 'Bếp nướng, máy nướng bánh mì'),
(86, 1, 'Thiết bị nấu đứng độc lập', '', 'Thiết bị nấu đứng độc lập', 'Thiết bị nấu đứng độc lập', 'Thiết bị nấu đứng độc lập'),
(85, 1, 'Máy hút mùi', '', 'Máy hút mùi', 'Máy hút mùi', 'Máy hút mùi'),
(83, 1, 'Máy hút bụi', '', 'Máy hút bụi', 'Máy hút bụi', 'Máy hút bụi'),
(77, 1, 'Bếp', '', 'Bếp', 'Bếp', 'Bếp'),
(78, 1, 'Máy giặt', '&lt;p&gt;Cùng bạn giữ trang phục đẹp mãi về sau&lt;/p&gt;\r\n', 'Máy giặt', 'Máy giặt', 'Máy giặt'),
(90, 1, 'Máy đánh trứng', '', 'Máy đánh trứng', 'Máy đánh trứng', 'Máy đánh trứng'),
(84, 1, 'Lò vi sóng', '', 'Lò vi sóng', 'Lò vi sóng', 'Lò vi sóng'),
(107, 1, 'Tủ lạnh ngăn đá dưới', '', 'Tủ lạnh ngăn đá dưới', 'Tủ lạnh ngăn đá dưới', 'Tủ lạnh ngăn đá dưới'),
(80, 1, 'Máy lọc không khí', '', 'Máy lọc không khí', 'Máy lọc không khí', 'Máy lọc không khí'),
(79, 1, 'Tủ lạnh', '', 'Tủ lạnh', 'Tủ lạnh', 'Tủ lạnh'),
(101, 1, 'Giải pháp không khí', '', 'Giải pháp không khí', 'Giải pháp không khí', 'Giải pháp không khí'),
(102, 1, 'Chăm sóc nhà cửa', '', 'Chăm sóc nhà cửa', 'Chăm sóc nhà cửa', 'Chăm sóc nhà cửa'),
(103, 1, 'Nhà bếp', '', 'Nhà bếp', 'Nhà bếp', 'Nhà bếp'),
(104, 1, 'Máy giặt cửa trước', '', 'Máy giặt cửa trước', 'Máy giặt cửa trước', 'Máy giặt cửa trước'),
(105, 1, 'Máy giặt cửa trên', '', 'Máy giặt cửa trên', 'Máy giặt cửa trên', 'Máy giặt cửa trên'),
(106, 1, 'Máy giặt sấy', '', 'Máy giặt sấy', 'Máy giặt sấy', 'Máy giặt sấy'),
(108, 1, 'Tủ lạnh cửa pháp', '', 'Tủ lạnh cửa pháp', 'Tủ lạnh cửa pháp', 'Tủ lạnh cửa pháp'),
(109, 1, 'Tủ lạnh 3 cánh', '', 'Tủ lạnh 3 cánh', 'Tủ lạnh 3 cánh', 'Tủ lạnh 3 cánh'),
(110, 1, 'Tủ lạnh mini', '', 'Tủ lạnh mini', 'Tủ lạnh mini', 'Tủ lạnh mini'),
(111, 1, 'Tủ lạnh side by side', '', 'Tủ lạnh side by side', 'Tủ lạnh side by side', 'Tủ lạnh side by side'),
(112, 1, 'Tủ lạnh ngăn đá trên', '', 'Tủ lạnh ngăn đá trên', 'Tủ lạnh ngăn đá trên', 'Tủ lạnh ngăn đá trên'),
(113, 1, 'Lò nướng âm tủ', '', 'Lò nướng âm tủ', 'Lò nướng âm tủ', 'Lò nướng âm tủ'),
(114, 1, 'Lò nướng điện để bàn', '', 'Lò nướng điện để bàn', 'Lò nướng điện để bàn', 'Lò nướng điện để bàn'),
(115, 1, 'Dạng hộp', '', 'Dạng hộp', 'Dạng hộp', 'Dạng hộp'),
(116, 1, 'Không dây', '', 'Không dây', 'Không dây', 'Không dây'),
(117, 1, 'Máy hút bụi cầm tay', '', 'Máy hút bụi cầm tay', 'Máy hút bụi cầm tay', 'Máy hút bụi cầm tay'),
(118, 1, 'Rô bốt', '', 'Rô bốt', 'Rô bốt', 'Rô bốt'),
(119, 1, 'Chậu rửa chén', '', 'Chậu rửa chén', '', ''),
(120, 1, 'Chậu rửa chén đá', '', 'Chậu rửa chén đá', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_category_filter`
--

CREATE TABLE `pre_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_category_path`
--

CREATE TABLE `pre_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_category_path`
--

INSERT INTO `pre_category_path` (`category_id`, `path_id`, `level`) VALUES
(118, 118, 1),
(118, 83, 0),
(85, 85, 0),
(117, 117, 1),
(117, 83, 0),
(116, 116, 1),
(116, 83, 0),
(115, 115, 1),
(88, 88, 0),
(115, 83, 0),
(114, 114, 1),
(114, 81, 0),
(113, 113, 1),
(113, 81, 0),
(112, 112, 1),
(112, 79, 0),
(111, 111, 1),
(111, 79, 0),
(110, 110, 1),
(110, 79, 0),
(109, 109, 1),
(109, 79, 0),
(108, 108, 1),
(108, 79, 0),
(107, 107, 1),
(107, 79, 0),
(106, 106, 1),
(106, 78, 0),
(105, 105, 1),
(105, 78, 0),
(104, 104, 1),
(104, 78, 0),
(103, 103, 0),
(102, 102, 0),
(101, 101, 0),
(100, 100, 0),
(99, 99, 0),
(98, 98, 0),
(97, 97, 0),
(96, 96, 0),
(95, 95, 0),
(94, 94, 0),
(93, 93, 0),
(92, 92, 0),
(91, 91, 0),
(90, 90, 0),
(89, 89, 0),
(79, 79, 0),
(78, 78, 0),
(87, 87, 0),
(83, 83, 0),
(80, 80, 0),
(77, 77, 0),
(86, 86, 0),
(81, 81, 0),
(82, 82, 0),
(84, 84, 0),
(119, 119, 0),
(120, 119, 0),
(120, 120, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_category_to_layout`
--

CREATE TABLE `pre_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_category_to_layout`
--

INSERT INTO `pre_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(87, 0, 0),
(90, 0, 0),
(88, 0, 0),
(85, 0, 0),
(78, 0, 0),
(89, 0, 0),
(79, 0, 0),
(83, 0, 0),
(80, 0, 0),
(77, 0, 0),
(86, 0, 0),
(81, 0, 0),
(82, 0, 0),
(84, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0),
(106, 0, 0),
(107, 0, 0),
(108, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(113, 0, 0),
(114, 0, 0),
(115, 0, 0),
(116, 0, 0),
(117, 0, 0),
(118, 0, 0),
(119, 0, 0),
(120, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_category_to_store`
--

CREATE TABLE `pre_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_category_to_store`
--

INSERT INTO `pre_category_to_store` (`category_id`, `store_id`) VALUES
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_country`
--

CREATE TABLE `pre_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_country`
--

INSERT INTO `pre_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(322, 'Yên Bái', '', '', '', 0, 1),
(321, 'Vĩnh Phúc', '', '', '', 0, 1),
(320, 'Vĩnh Long', '', '', '', 0, 1),
(319, 'Tuyên Quang', '', '', '', 0, 1),
(318, 'Trà Vinh', '', '', '', 0, 1),
(317, 'Tiền Giang', '', '', '', 0, 1),
(316, 'Thừa Thiên - Huế', '', '', '', 0, 1),
(315, 'Thanh Hóa', '', '', '', 0, 1),
(314, 'Thái Nguyên', '', '', '', 0, 1),
(313, 'Thái Bình', '', '', '', 0, 1),
(312, 'Tây Ninh', '', '', '', 0, 1),
(311, 'Sơn La', '', '', '', 0, 1),
(310, 'Sóc Trăng', '', '', '', 0, 1),
(307, 'Quảng Ninh', '', '', '', 0, 1),
(309, 'Quảng Trị', '', '', '', 0, 1),
(306, 'Quảng Ngãi', '', '', '', 0, 1),
(305, 'Quảng Nam', '', '', '', 0, 1),
(323, 'Hòa Bình', '', '', '', 0, 1),
(303, 'Quảng Bình', '', '', '', 0, 1),
(302, 'Phú Yên', '', '', '', 0, 1),
(301, 'Phú Thọ', '', '', '', 0, 1),
(300, 'Ninh Thuận', '', '', '', 0, 1),
(299, 'Ninh Bình', '', '', '', 0, 1),
(298, 'Nghệ An', '', '', '', 0, 1),
(297, 'Nam Định', '', '', '', 0, 1),
(296, 'Long An', '', '', '', 0, 1),
(295, 'Lâm Đồng', '', '', '', 0, 1),
(294, 'Lạng Sơn', '', '', '', 0, 1),
(293, 'Lào Cai', '', '', '', 0, 1),
(292, 'Lai Châu', '', '', '', 0, 1),
(291, 'Kon Tum', '', '', '', 0, 1),
(290, 'Kiên Giang', '', '', '', 0, 1),
(289, 'Khánh Hòa', '', '', '', 0, 1),
(288, 'Hưng Yên', '', '', '', 0, 1),
(285, 'Hải Phòng', '', '', '', 0, 1),
(286, 'Hồ Chí Minh - Sài Gòn', '', '', '', 0, 1),
(287, 'Hậu Giang', '', '', '', 0, 1),
(284, 'Hải Dương', '', '', '', 0, 1),
(283, 'Hà Tĩnh', '', '', '', 0, 1),
(281, 'Hà Nội', '', '', '', 0, 1),
(280, 'Hà Nam', '', '', '', 0, 1),
(279, 'Hà Giang', '', '', '', 0, 1),
(278, 'Gia Lai', '', '', '', 0, 1),
(277, 'Đồng Tháp', '', '', '', 0, 1),
(276, 'Đồng Nai', '', '', '', 0, 1),
(275, 'Điện Biên', '', '', '', 0, 1),
(274, 'Đắk Nông', '', '', '', 0, 1),
(273, 'Đắk Lắk', '', '', '', 0, 1),
(272, 'Đà Nẳng', '', '', '', 0, 1),
(271, 'Cần Thơ', '', '', '', 0, 1),
(270, 'Cao Bằng', '', '', '', 0, 1),
(269, 'Cà Mau', '', '', '', 0, 1),
(268, 'Bình Thuận', '', '', '', 0, 1),
(267, 'Bình Phước', '', '', '', 0, 1),
(266, 'Bình Định', '', '', '', 0, 1),
(265, 'Bình Dương', '', '', '', 0, 1),
(264, 'Bến Tre', '', '', '', 0, 1),
(263, 'Bắc Ninh', '', '', '', 0, 1),
(262, 'Bắc Giang', '', '', '', 0, 1),
(261, 'Bắc Kạn', '', '', '', 0, 1),
(260, 'Bạc Liêu', '', '', '', 0, 1),
(259, 'Bà Rịa - Vũng Tàu', '', '', '', 0, 1),
(258, 'An Giang', '', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_coupon`
--

CREATE TABLE `pre_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_coupon`
--

INSERT INTO `pre_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `pre_coupon_category`
--

CREATE TABLE `pre_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_coupon_history`
--

CREATE TABLE `pre_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_coupon_product`
--

CREATE TABLE `pre_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_currency`
--

CREATE TABLE `pre_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_currency`
--

INSERT INTO `pre_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.00003394, 1, '2017-05-21 13:21:03'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.00004425, 1, '2017-05-21 13:21:03'),
(3, 'Euro', 'EUR', '', '€', '2', 0.00003949, 1, '2017-05-21 13:21:03'),
(4, 'VNĐ', 'VND', '', 'đ', '0', 1.00000000, 1, '2022-05-15 00:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer`
--

CREATE TABLE `pre_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text DEFAULT NULL,
  `wishlist` text DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer`
--

INSERT INTO `pre_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'Trần', 'Quy', 'longquyawd@gmail.com', '0943348947', '', '37e8fb668c79322e27b61e9edb7a9842b27e60bf', 'T51b6hNyf', NULL, NULL, 0, 1, '', '116.108.80.23', 1, 1, 0, '', '2018-06-07 13:51:13'),
(2, 1, 0, 'texxt', 'texxt', 'texxt@et.com', '+844852528864', '', 'ff7f20383df92c7b485b9dad9a8ac1c11cc81df0', 'Z0yoAUqoL', NULL, NULL, 0, 2, '', '171.252.155.52', 1, 1, 0, '', '2022-03-06 17:47:42'),
(3, 1, 0, 'Nguyễn', 'Hưng', 'quochung9920@gmail.com', '0522956799', '', '19c490611feb13d110b0b4d85eafc86d99be1856', 'AVIWBs3ZE', NULL, NULL, 1, 3, '', '::1', 1, 1, 0, '', '2022-05-15 05:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_activity`
--

CREATE TABLE `pre_customer_activity` (
  `activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_activity`
--

INSERT INTO `pre_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 0, 'order_guest', '{\"name\":\"V\\u0169 \",\"order_id\":1}', '127.0.0.1', '2016-08-25 17:25:51'),
(2, 0, 'order_guest', '{\"name\":\"V\\u0169 An \",\"order_id\":2}', '::1', '2016-10-04 22:27:16'),
(3, 0, 'order_guest', '{\"name\":\" \",\"order_id\":3}', '27.64.32.34', '2016-10-15 14:16:28'),
(4, 1, 'order_account', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\",\"order_id\":11}', '::1', '2018-06-07 13:51:38'),
(5, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '1.53.55.223', '2022-01-14 14:52:30'),
(6, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '1.53.55.223', '2022-01-14 14:53:26'),
(7, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '116.108.84.156', '2022-01-14 16:46:05'),
(8, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '116.108.84.156', '2022-01-14 16:58:08'),
(9, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '116.108.84.156', '2022-01-17 09:12:31'),
(10, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '116.108.84.156', '2022-01-17 09:16:12'),
(11, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":31}', '116.108.80.23', '2022-01-20 10:49:18'),
(12, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":32}', '116.108.80.23', '2022-01-20 10:52:56'),
(13, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":33}', '116.108.80.23', '2022-01-20 10:55:37'),
(14, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":34}', '116.108.80.23', '2022-01-20 10:56:31'),
(15, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":35}', '116.108.80.23', '2022-01-20 10:57:04'),
(16, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":36}', '116.108.80.23', '2022-01-20 10:59:58'),
(17, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":37}', '116.108.80.23', '2022-01-20 11:00:31'),
(18, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":38}', '116.108.80.23', '2022-01-20 11:05:28'),
(19, 0, 'order_guest', '{\"name\":\"tesst \",\"order_id\":39}', '116.108.80.23', '2022-01-20 11:07:34'),
(20, 1, 'login', '{\"customer_id\":\"1\",\"name\":\"Tr\\u1ea7n Quy\"}', '116.108.80.23', '2022-01-20 11:41:19'),
(21, 0, 'order_guest', '{\"name\":\"Nguy\\u1ec5n \",\"order_id\":47}', '171.252.155.52', '2022-03-09 10:16:51'),
(22, 0, 'order_guest', '{\"name\":\"Nguy\\u1ec5n \",\"order_id\":48}', '171.252.155.52', '2022-03-09 10:18:42'),
(23, 0, 'order_guest', '{\"name\":\"Nguy\\u1ec5n \",\"order_id\":49}', '171.252.155.52', '2022-03-09 10:19:23'),
(24, 0, 'order_guest', '{\"name\":\"Nguy\\u1ec5n \",\"order_id\":50}', '171.252.155.52', '2022-03-09 10:20:26'),
(25, 3, 'login', '{\"customer_id\":\"3\",\"name\":\"Nguy\\u1ec5n H\\u01b0ng\"}', '::1', '2022-05-15 05:26:39'),
(26, 3, 'order_account', '{\"customer_id\":\"3\",\"name\":\"Nguy\\u1ec5n H\\u01b0ng\",\"order_id\":57}', '::1', '2022-05-15 05:29:27');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_group`
--

CREATE TABLE `pre_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_group`
--

INSERT INTO `pre_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_group_description`
--

CREATE TABLE `pre_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_group_description`
--

INSERT INTO `pre_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_history`
--

CREATE TABLE `pre_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_ip`
--

CREATE TABLE `pre_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_ip`
--

INSERT INTO `pre_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '::1', '2018-06-07 13:51:30'),
(2, 1, '116.108.84.156', '2022-01-14 14:49:24'),
(3, 1, '1.53.55.223', '2022-01-14 14:52:30'),
(4, 1, '116.108.80.23', '2022-01-20 11:41:19'),
(5, 3, '::1', '2022-05-15 05:26:39');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_login`
--

CREATE TABLE `pre_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_login`
--

INSERT INTO `pre_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'hethong', '::1', 3, '2016-12-22 16:41:17', '2016-12-22 17:21:18'),
(2, 'hethong', '123.26.22.112', 1, '2021-12-19 16:39:11', '2021-12-19 16:39:11'),
(4, 'hethong', '14.174.124.132', 1, '2022-01-21 09:35:25', '2022-01-21 09:35:25'),
(5, 'ka.e.emc.c.oy.1.9.97.@gmail.com', '185.220.100.242', 1, '2022-02-28 03:36:53', '2022-02-28 03:36:53'),
(6, 'k.aee.mc.co.y.1997@gmail.com', '89.58.27.84', 1, '2022-02-28 03:36:58', '2022-02-28 03:36:58'),
(7, 'hethong', '171.252.155.52', 7, '2022-03-09 03:08:52', '2022-03-10 06:59:52'),
(9, 'admin', '::1', 1, '2022-05-15 00:24:47', '2022-05-15 00:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_online`
--

CREATE TABLE `pre_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_reward`
--

CREATE TABLE `pre_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_transaction`
--

CREATE TABLE `pre_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_customer_wishlist`
--

CREATE TABLE `pre_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_customer_wishlist`
--

INSERT INTO `pre_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(3, 70, '2022-05-15 05:33:15'),
(3, 68, '2022-05-15 05:33:16');

-- --------------------------------------------------------

--
-- Table structure for table `pre_custom_field`
--

CREATE TABLE `pre_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_custom_field_customer_group`
--

CREATE TABLE `pre_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_custom_field_description`
--

CREATE TABLE `pre_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_custom_field_value`
--

CREATE TABLE `pre_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_custom_field_value_description`
--

CREATE TABLE `pre_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_download`
--

CREATE TABLE `pre_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_downloadpost`
--

CREATE TABLE `pre_downloadpost` (
  `downloadpost_id` int(11) NOT NULL,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_downloadpost_description`
--

CREATE TABLE `pre_downloadpost_description` (
  `downloadpost_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_download_description`
--

CREATE TABLE `pre_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_dqc_setting`
--

CREATE TABLE `pre_dqc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_dqc_setting`
--

INSERT INTO `pre_dqc_setting` (`setting_id`, `store_id`, `name`, `value`) VALUES
(1, 0, '10/16/2016 04:03:13 pm', '{\"name\":\"10\\/16\\/2016 04:03:13 pm\",\"general\":{\"clear_session\":\"0\",\"login_refresh\":\"0\",\"analytics_event\":\"0\",\"compress\":\"1\",\"config\":\"d_quickcheckout\",\"min_order\":{\"value\":\"0\",\"text\":{\"1\":\"Gi\\u00e1 tr\\u1ecb \\u0111\\u1eb7t h\\u00e0ng thi\\u1ec3u l\\u00e0 %s\",\"2\":\"You must have a sum more then %s to make an order \"}},\"min_quantity\":{\"value\":\"0\",\"text\":{\"1\":\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed1i thi\\u1ec3u l\\u00e0 %s\",\"2\":\"You must have a quantity more then %s to make an order \"}}},\"step\":{\"login\":{\"default_option\":\"guest\",\"option\":{\"login\":{\"display\":\"0\",\"title\":{\"1\":\"\\u0110\\u0103ng nh\\u1eadp\",\"2\":\"Log in\"}},\"register\":{\"display\":\"0\",\"title\":{\"1\":\"\\u0110\\u0103ng k\\u00fd\",\"2\":\"Registration\"}},\"guest\":{\"display\":\"0\",\"title\":{\"1\":\"Kh\\u00e1ch\",\"2\":\"Guest\"}}},\"icon\":\"fa fa-user\",\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"0\"},\"payment_address\":{\"fields\":{\"firstname\":{\"sort_order\":\"0\",\"value\":\"\",\"mask\":\"\"},\"lastname\":{\"sort_order\":\"1\",\"value\":\"\",\"mask\":\"\"},\"email\":{\"sort_order\":\"2\",\"value\":\"\",\"mask\":\"\"},\"email_confirm\":{\"sort_order\":\"3\",\"value\":\"\",\"mask\":\"\"},\"telephone\":{\"sort_order\":\"4\",\"value\":\"\",\"mask\":\"\"},\"fax\":{\"sort_order\":\"5\",\"value\":\"\",\"mask\":\"\"},\"password\":{\"sort_order\":\"6\"},\"confirm\":{\"sort_order\":\"7\"},\"heading\":{\"sort_order\":\"8\"},\"company\":{\"sort_order\":\"9\",\"value\":\"\",\"mask\":\"\"},\"customer_group_id\":{\"sort_order\":\"10\"},\"address_1\":{\"sort_order\":\"11\",\"value\":\"\",\"mask\":\"\"},\"address_2\":{\"sort_order\":\"12\",\"value\":\"\",\"mask\":\"\"},\"city\":{\"sort_order\":\"13\",\"value\":\"\",\"mask\":\"\"},\"postcode\":{\"sort_order\":\"14\",\"value\":\"\",\"mask\":\"\"},\"country_id\":{\"sort_order\":\"15\",\"value\":\"286\"},\"zone_id\":{\"sort_order\":\"16\",\"value\":\"\"},\"newsletter\":{\"sort_order\":\"17\",\"value\":\"0\"},\"shipping_address\":{\"sort_order\":\"18\",\"value\":\"1\"},\"agree\":{\"sort_order\":\"19\",\"value\":\"1\"}},\"icon\":\"fa fa-book\",\"title\":{\"1\":\"Th\\u00f4ng tin kh\\u00e1ch h\\u00e0ng\",\"2\":\"Customer information\"},\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"1\"},\"shipping_address\":{\"fields\":{\"firstname\":{\"sort_order\":\"1\",\"value\":\"\",\"mask\":\"\"},\"lastname\":{\"sort_order\":\"2\",\"value\":\"\",\"mask\":\"\"},\"company\":{\"sort_order\":\"3\",\"value\":\"\",\"mask\":\"\"},\"address_1\":{\"sort_order\":\"4\",\"value\":\"\",\"mask\":\"\"},\"address_2\":{\"sort_order\":\"5\",\"value\":\"\",\"mask\":\"\"},\"city\":{\"sort_order\":\"6\",\"value\":\"\",\"mask\":\"\"},\"postcode\":{\"sort_order\":\"7\",\"value\":\"\",\"mask\":\"\"},\"country_id\":{\"sort_order\":\"8\",\"value\":\"\"},\"zone_id\":{\"sort_order\":\"9\",\"value\":\"\"}},\"icon\":\"fa fa-book\",\"title\":{\"1\":\"\\u0110\\u1ecba ch\\u1ec9 giao h\\u00e0ng\",\"2\":\"Shipping Address\"},\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"2\"},\"shipping_method\":{\"display\":\"1\",\"display_options\":\"1\",\"display_title\":\"1\",\"input_style\":\"radio\",\"default_option\":\"flat\",\"icon\":\"fa fa-truck\",\"title\":{\"1\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n\",\"2\":\"Shipping method\"},\"description\":{\"1\":\"Vui l\\u00f2ng ch\\u1ecdn ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n \\u0111\\u1ec3 s\\u1eed d\\u1ee5ng theo \\u0111\\u01a1n h\\u00e0ng n\\u00e0y.\",\"2\":\"Please select the preferred shipping method to use on this order.\"},\"column\":\"2\",\"row\":\"0\"},\"payment_method\":{\"display\":\"1\",\"display_options\":\"1\",\"display_images\":\"1\",\"input_style\":\"radio\",\"default_option\":\"free_checkout\",\"icon\":\"fa fa-credit-card\",\"title\":{\"1\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n\",\"2\":\"Payment method\"},\"description\":{\"1\":\"Vui l\\u00f2ng ch\\u1ecdn ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n \\u0111\\u1ec3 s\\u1eed d\\u1ee5ng cho \\u0111\\u01a1n \\u0111\\u1eb7t h\\u00e0ng n\\u00e0y.\",\"2\":\"Please select the preferred payment method to use on this order.\"},\"column\":\"3\",\"row\":\"0\"},\"payment\":{\"default_payment_popup\":\"0\",\"payment_popups\":{\"amazon_login_pay\":\"0\",\"authorizenet_aim\":\"0\",\"authorizenet_sim\":\"0\",\"bank_transfer\":\"0\",\"bluepay_hosted\":\"0\",\"bluepay_redirect\":\"0\",\"cheque\":\"0\",\"cod\":\"0\",\"firstdata\":\"0\",\"firstdata_remote\":\"0\",\"free_checkout\":\"0\",\"g2apay\":\"0\",\"globalpay\":\"0\",\"globalpay_remote\":\"0\",\"klarna_account\":\"0\",\"klarna_invoice\":\"0\",\"liqpay\":\"0\",\"nochex\":\"0\",\"paymate\":\"0\",\"paypoint\":\"0\",\"payza\":\"0\",\"perpetual_payments\":\"0\",\"pp_express\":\"0\",\"pp_payflow\":\"0\",\"pp_payflow_iframe\":\"0\",\"pp_pro\":\"0\",\"pp_pro_iframe\":\"0\",\"pp_standard\":\"0\",\"realex\":\"0\",\"realex_remote\":\"0\",\"sagepay_direct\":\"0\",\"sagepay_server\":\"0\",\"sagepay_us\":\"0\",\"securetrading_pp\":\"0\",\"securetrading_ws\":\"0\",\"skrill\":\"0\",\"twocheckout\":\"0\",\"web_payment_software\":\"0\",\"worldpay\":\"0\"},\"column\":\"4\",\"row\":\"1\"},\"cart\":{\"icon\":\"fa fa-shopping-cart\",\"title\":{\"1\":\"Gi\\u1ecf h\\u00e0ng\",\"2\":\"Shopping cart\"},\"description\":{\"1\":\"Th\\u00f4ng tin s\\u1ea3n ph\\u1ea9m trong gi\\u1ecf h\\u00e0ng\",\"2\":\"Product information in the cart\"},\"column\":\"4\",\"row\":\"0\"},\"confirm\":{\"fields\":{\"comment\":{\"sort_order\":\"0\"},\"agree\":{\"sort_order\":\"1\",\"value\":\"0\"}},\"column\":\"4\",\"row\":\"3\"}},\"design\":{\"login_style\":\"popup\",\"theme\":\"default\",\"block_style\":\"row\",\"placeholder\":\"1\",\"breadcrumb\":\"1\",\"address_style\":\"radio\",\"cart_image_size\":{\"width\":\"80\",\"height\":\"80\"},\"max_width\":\"\",\"bootstrap\":\"0\",\"only_quickcheckout\":\"0\",\"column_width\":{\"1\":\"4\",\"2\":\"4\",\"3\":\"4\",\"4\":\"8\"},\"custom_style\":\"\"},\"account\":{\"guest\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"email\":{\"display\":\"1\",\"require\":\"1\"},\"email_confirm\":{\"display\":\"0\",\"require\":\"0\"},\"telephone\":{\"display\":\"1\",\"require\":\"1\"},\"fax\":{\"display\":\"0\",\"require\":\"0\"},\"heading\":{\"display\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"customer_group_id\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"shipping_address\":{\"display\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}},\"register\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"email\":{\"display\":\"1\",\"require\":\"1\"},\"email_confirm\":{\"display\":\"0\",\"require\":\"0\"},\"telephone\":{\"display\":\"1\",\"require\":\"1\"},\"fax\":{\"display\":\"0\",\"require\":\"0\"},\"password\":{\"display\":\"1\"},\"confirm\":{\"display\":\"1\"},\"heading\":{\"display\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"customer_group_id\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"newsletter\":{\"display\":\"0\"},\"shipping_address\":{\"display\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}},\"logged\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"shipping_address\":{\"display\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `pre_dqc_statistic`
--

CREATE TABLE `pre_dqc_statistic` (
  `statistic_id` int(11) NOT NULL,
  `setting_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `data` text NOT NULL,
  `rating` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_dqc_statistic`
--

INSERT INTO `pre_dqc_statistic` (`statistic_id`, `setting_id`, `order_id`, `customer_id`, `data`, `rating`, `date_added`, `date_modified`) VALUES
(1, 1, 4, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":8,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}},\"click\":{\"cart\":4,\"login\":4},\"update\":{\"shipping_method\":4,\"payment_address\":6,\"confirm\":2}}', 0, '2016-10-16 23:17:31', '2016-10-16 23:25:41'),
(2, 1, 5, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":8,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}}}', 0, '2016-12-19 17:30:26', '2016-12-19 17:30:26'),
(3, 1, 6, 0, '{\"account\":\"register\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":8,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}},\"click\":{\"login\":3}}', 0, '2016-12-22 19:35:29', '2016-12-22 23:32:06'),
(4, 1, 7, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":8,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}}}', 0, '2016-12-23 12:44:54', '2016-12-23 12:44:54'),
(5, 1, 8, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":16,\"shipping_address\":8,\"confirm\":2},\"register\":{\"payment_address\":19,\"shipping_address\":7,\"confirm\":2},\"logged\":{\"payment_address\":9,\"shipping_address\":7,\"confirm\":2}}}', 0, '2017-09-08 10:39:48', '2017-09-08 10:39:48'),
(6, 1, 9, 0, '{\"account\":\"register\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"click\":{\"login\":3}}', 0, '2018-05-06 19:44:13', '2018-05-06 20:04:32'),
(7, 1, 10, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":1,\"shipping_method\":1}}', 0, '2018-06-07 13:40:09', '2018-06-07 13:41:28'),
(8, 1, 11, 1, '{\"account\":\"register\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"shipping_method\":12,\"payment_address\":9},\"click\":{\"confirm\":2,\"login\":1,\"cart\":8}}', 0, '2018-06-07 13:42:34', '2018-06-07 13:51:36'),
(9, 1, 12, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"click\":{\"login\":20},\"update\":{\"payment_address\":5}}', 0, '2019-01-19 15:16:19', '2019-01-19 15:17:17'),
(10, 1, 13, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":7},\"click\":{\"confirm\":1}}', 0, '2019-04-20 10:32:49', '2019-04-20 10:48:24'),
(11, 1, 14, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}}}', 0, '2019-04-20 11:01:54', '2019-04-20 11:01:54'),
(12, 1, 15, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":6},\"click\":{\"cart\":14}}', 0, '2019-05-08 10:48:48', '2019-05-08 10:56:34'),
(13, 1, 16, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}}}', 0, '2021-12-29 10:26:20', '2021-12-29 10:26:20'),
(14, 1, 17, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_method\":4,\"confirm\":1,\"payment_address\":9,\"shipping_method\":1},\"click\":{\"confirm\":9}}', 0, '2021-12-29 13:53:45', '2021-12-29 13:54:46'),
(15, 1, 18, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2021-12-29 13:54:51', '2021-12-29 13:55:27'),
(16, 1, 19, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2021-12-29 13:56:07', '2021-12-29 15:33:39'),
(17, 1, 20, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_method\":2}}', 0, '2021-12-29 15:36:23', '2021-12-29 16:10:17'),
(18, 1, 21, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-01-03 08:56:07', '2022-01-03 08:56:33'),
(19, 1, 22, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-01-10 11:46:30', '2022-01-10 11:46:38'),
(20, 1, 23, 1, '{\"account\":\"logged\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}}}', 0, '2022-01-14 16:44:22', '2022-01-14 16:44:22'),
(21, 1, 24, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":4}}', 0, '2022-01-14 16:44:41', '2022-01-14 16:44:47'),
(22, 1, 25, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-01-17 10:07:29', '2022-01-17 10:07:32'),
(23, 1, 26, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":1}}', 0, '2022-01-18 16:43:48', '2022-01-18 16:43:49'),
(24, 1, 27, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":9,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":11,\"shipping_address\":3,\"confirm\":1},\"logged\":{\"payment_address\":5,\"shipping_address\":3,\"confirm\":1}},\"update\":{\"payment_address\":3}}', 0, '2022-01-19 14:11:44', '2022-01-19 15:56:43'),
(25, 1, 28, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-01-20 09:42:37', '2022-01-20 09:42:37'),
(26, 1, 29, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":7,\"payment_method\":3,\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 09:54:02', '2022-01-20 10:47:22'),
(27, 1, 30, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-01-20 10:11:29', '2022-01-20 10:11:29'),
(28, 1, 31, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:48:01', '2022-01-20 10:49:16'),
(29, 1, 32, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:52:34', '2022-01-20 10:52:54'),
(30, 1, 33, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:55:30', '2022-01-20 10:55:35'),
(31, 1, 34, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:56:27', '2022-01-20 10:56:30'),
(32, 1, 35, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_method\":1,\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:57:00', '2022-01-20 10:57:04'),
(33, 1, 36, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_method\":3,\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 10:57:28', '2022-01-20 10:59:56'),
(34, 1, 37, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_method\":1,\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 11:00:25', '2022-01-20 11:00:31'),
(35, 1, 38, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 11:05:20', '2022-01-20 11:05:26'),
(36, 1, 39, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":1},\"click\":{\"confirm\":1}}', 0, '2022-01-20 11:07:31', '2022-01-20 11:07:33'),
(37, 1, 40, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_method\":1,\"shipping_method\":2}}', 0, '2022-01-20 11:07:48', '2022-01-20 11:35:15'),
(38, 1, 41, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"shipping_method\":13,\"payment_method\":2,\"payment_address\":2},\"click\":{\"cart\":18}}', 0, '2022-01-20 13:38:55', '2022-01-20 13:50:45'),
(39, 1, 42, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-01-20 14:20:31', '2022-01-20 14:20:32'),
(40, 1, 43, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":3}}', 0, '2022-01-20 16:13:02', '2022-01-20 16:13:29'),
(41, 1, 44, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":2,\"payment_method\":2}}', 0, '2022-01-21 08:51:13', '2022-01-21 08:51:45'),
(42, 1, 45, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-01-28 14:25:34', '2022-01-28 14:25:34'),
(43, 1, 46, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-02-20 19:19:32', '2022-02-20 19:19:32'),
(44, 1, 47, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":12,\"payment_method\":3},\"click\":{\"confirm\":1}}', 0, '2022-03-09 10:07:03', '2022-03-09 10:16:49'),
(45, 1, 48, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2022-03-09 10:18:36', '2022-03-09 10:18:40'),
(46, 1, 49, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2022-03-09 10:19:18', '2022-03-09 10:19:21'),
(47, 1, 50, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2022-03-09 10:20:22', '2022-03-09 10:20:24'),
(48, 1, 51, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-03-09 14:41:11', '2022-03-09 14:41:11'),
(49, 1, 52, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-03-10 13:59:29', '2022-03-10 13:59:45'),
(50, 1, 53, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":4,\"payment_method\":1}}', 0, '2022-03-10 20:05:46', '2022-03-10 20:07:03'),
(51, 1, 54, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-03-11 14:54:00', '2022-03-11 14:54:00'),
(52, 1, 55, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-03-11 15:35:08', '2022-03-11 15:35:12'),
(53, 1, 56, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}}}', 0, '2022-05-15 04:13:40', '2022-05-15 04:13:40'),
(54, 1, 57, 3, '{\"account\":\"logged\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"click\":{\"confirm\":1}}', 0, '2022-05-15 05:29:15', '2022-05-15 05:29:25'),
(55, 1, 58, 0, '{\"account\":\"guest\",\"field\":{\"guest\":{\"payment_address\":6,\"shipping_address\":4,\"confirm\":1},\"register\":{\"payment_address\":8,\"shipping_address\":4,\"confirm\":1},\"logged\":{\"payment_address\":4,\"shipping_address\":4,\"confirm\":1}},\"update\":{\"payment_address\":2}}', 0, '2022-05-15 05:39:42', '2022-05-15 05:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `pre_email_subscribed`
--

CREATE TABLE `pre_email_subscribed` (
  `id` int(10) NOT NULL,
  `email` text NOT NULL,
  `confirm_sent` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0: disabled; 1: enabled; 2: blacklist; 3: un-subscribed; 4: not verified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_email_subscribed`
--

INSERT INTO `pre_email_subscribed` (`id`, `email`, `confirm_sent`, `created_date`, `updated_date`, `status`) VALUES
(1, 'brat@website500k.com', 1, '2016-12-23 09:04:57', '0000-00-00 00:00:00', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pre_event`
--

CREATE TABLE `pre_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_event`
--

INSERT INTO `pre_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send'),
(2, 'brainyfilter', 'post.admin.product.add', 'module/brainyfilter/eventEditProduct'),
(3, 'brainyfilter', 'post.admin.product.edit', 'module/brainyfilter/eventEditProduct'),
(4, 'brainyfilter', 'post.admin.product.delete', 'module/brainyfilter/eventDeleteProduct'),
(5, 'brainyfilter', 'post.admin.review.add', 'module/brainyfilter/eventEditReview'),
(6, 'brainyfilter', 'post.admin.review.edit', 'module/brainyfilter/eventEditReview'),
(7, 'brainyfilter', 'post.admin.review.delete', 'module/brainyfilter/eventEditReview');

-- --------------------------------------------------------

--
-- Table structure for table `pre_extension`
--

CREATE TABLE `pre_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_extension`
--

INSERT INTO `pre_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(52, 'module', 'brainyfilter'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(51, 'module', 'advanced_newsletter'),
(22, 'module', 'visualbuilder'),
(25, 'module', 'xform'),
(39, 'module', 'd_quickcheckout'),
(31, 'module', 'special'),
(34, 'module', 'visitor_counter'),
(46, 'module', 'latest'),
(101, 'shipping', 'free'),
(57, 'module', 'post'),
(48, 'module', 'banner_grid'),
(47, 'module', 'bestseller'),
(58, 'module', 'latest_products_brand'),
(59, 'module', 'latest_products_category'),
(60, 'module', 'product_tab'),
(61, 'module', 'postmostviewd'),
(62, 'module', 'plgselectthread'),
(63, 'feed', 'google_sitemap'),
(64, 'module', 'productcategory'),
(102, 'payment', 'bank_transfer'),
(66, 'module', 'ckeditorfull'),
(67, 'module', 'pim'),
(68, 'module', 'postselected'),
(69, 'module', 'html');

-- --------------------------------------------------------

--
-- Table structure for table `pre_extra_info`
--

CREATE TABLE `pre_extra_info` (
  `extra_info_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `css_lib` varchar(4096) NOT NULL DEFAULT '[]',
  `script_lib` varchar(4096) NOT NULL DEFAULT '[]',
  `backup` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_extra_info`
--

INSERT INTO `pre_extra_info` (`extra_info_id`, `status`, `css_lib`, `script_lib`, `backup`, `date_added`, `date_modified`) VALUES
(1, 1, '[\"catalog\\/view\\/stylesheet\\/extra-info.css\",\"catalog\\/view\\/stylesheet\\/hover.css\"]', '[]', '{\"extra_info_id\":\"1\",\"status\":\"1\",\"css_lib\":\"[\\\"catalog\\\\\\/view\\\\\\/stylesheet\\\\\\/extra-info.css\\\",\\\"catalog\\\\\\/view\\\\\\/stylesheet\\\\\\/hover.css\\\"]\",\"script_lib\":\"[]\",\"date_added\":\"2017-01-12 23:47:33\",\"date_modified\":\"2017-01-14 11:52:33\",\"extra_info_description\":{\"1\":{\"name\":\"Content\",\"content\":\"<div class=\\\"extra-info-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"element-mark\\\"><div class=\\\"extra-content-1\\\" style=\\\"background-color: #00c0ff; color: #fff\\\"><div class=\\\"row hover-effect\\\"><div class=\\\"col-sm-6\\\"><div class=\\\"row\\\"><div class=\\\"col-sm-12\\\"><div class=\\\"box-half-content pull-right\\\"><h1>Detailed Design<\\/h1><h3 class=\\\"sub-title\\\">Modern solution<\\/h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.<\\/p><p><a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\">Live Demo <\\/a> <a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\">Live Demo <\\/a><\\/p><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-6 hidden-xs\\\"><div class=\\\"row\\\"><figure class=\\\"effect-apollo\\\"> <img src=\\\"\\/oc21ct\\/image\\/block\\/content\\/bg22.jpg\\\" alt=\\\"content\\\" data-mce-src=\\\"\\/oc21ct\\/image\\/block\\/content\\/bg22.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" caption=\\\"false\\\"><\\/img><figcaption><\\/figcaption><\\/figure><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><div class=\\\"extra-info-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"element-mark\\\"><section class=\\\"extra-content-2\\\" style=\\\"background-color: #FFF; color:#222;\\\"><div class=\\\"row hover-effect\\\"><div class=\\\"col-sm-6 hidden-xs\\\"><div class=\\\"row\\\"><figure class=\\\"effect-apollo\\\"> <img src=\\\"\\/oc21ct\\/image\\/block\\/content\\/bg4.jpg\\\" alt=\\\"content\\\" data-mce-src=\\\"\\/oc21ct\\/image\\/block\\/content\\/bg4.jpg\\\" width=\\\"100%\\\" height=\\\"auto\\\" caption=\\\"false\\\"><\\/img><figcaption><\\/figcaption><\\/figure><\\/div><\\/div><div class=\\\"col-sm-6\\\"><div class=\\\"row\\\"><div class=\\\"col-ms-12\\\"><div class=\\\"box-half-content pull-left\\\"><h1>Detailed Design<\\/h1><h3 class=\\\"sub-title\\\">Modern solution<\\/h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.<\\/p><p><a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\">Live Demo <\\/a> <a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\">Live Demo <\\/a><\\/p><\\/div><\\/div><\\/div><\\/div><\\/div><\\/section><\\/div><\\/div><\\/div>\",\"raw\":\"&lt;div class=&quot;col-sm-12 extra-info-frame&quot; style=&quot;display: block;&quot; id=&quot;extra-info-frame-0&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;div class=&quot;extra-content-1&quot; style=&quot;background-color: #00c0ff; color: #fff&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;&lt;div class=&quot;box-half-content pull-right&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_0&quot;&gt;Detailed Design&lt;\\/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_1&quot;&gt;Modern solution&lt;\\/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_2&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;\\/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_3&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;\\/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;\\/a&gt;&lt;\\/p&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;\\/oc21ct\\/image\\/block\\/content\\/bg22.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; id=&quot;mce_4&quot; data-mce-src=&quot;\\/oc21ct\\/image\\/block\\/content\\/bg22.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot;&gt;&lt;\\/img&gt;&lt;figcaption&gt;&lt;\\/figcaption&gt;&lt;\\/figure&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design\\/block\\/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-1&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;col-sm-12 extra-info-frame&quot; style=&quot;display: block;&quot; id=&quot;extra-info-frame-1&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;section class=&quot;extra-content-2&quot; style=&quot;background-color: #FFF; color:#222;&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;\\/oc21ct\\/image\\/block\\/content\\/bg4.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; id=&quot;mce_5&quot; data-mce-src=&quot;\\/oc21ct\\/image\\/block\\/content\\/bg4.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot;&gt;&lt;\\/img&gt;&lt;figcaption&gt;&lt;\\/figcaption&gt;&lt;\\/figure&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-ms-12&quot;&gt;&lt;div class=&quot;box-half-content pull-left&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_6&quot;&gt;Detailed Design&lt;\\/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; style=&quot;color: rgb(0, 192, 255); position: relative;&quot; spellcheck=&quot;false&quot; id=&quot;mce_7&quot;&gt;Modern solution&lt;\\/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_8&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;\\/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_9&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;\\/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;\\/a&gt;&lt;\\/p&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/section&gt;&lt;\\/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design\\/block\\/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-2&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"},\"2\":{\"name\":\"Content\",\"content\":\"<div class=\\\"extra-info-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"element-mark\\\"><div class=\\\"extra-content-1\\\" style=\\\"background-color: #00c0ff; color: #fff\\\"><div class=\\\"row hover-effect\\\"><div class=\\\"col-sm-6\\\"><div class=\\\"row\\\"><div class=\\\"col-sm-12\\\"><div class=\\\"box-half-content pull-right\\\"><h1>Detailed Design<\\/h1><h3 class=\\\"sub-title\\\">Modern solution<\\/h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.<\\/p><p><a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\">Live Demo <\\/a> <a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #fff; border: 1px solid #fff;\\\">Live Demo <\\/a><\\/p><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-6 hidden-xs\\\"><div class=\\\"row\\\"><figure class=\\\"effect-apollo\\\"> <img src=\\\"..\\/image\\/block\\/content\\/bg22.jpg\\\" alt=\\\"content\\\"><\\/img><figcaption><\\/figcaption><\\/figure><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><div class=\\\"extra-info-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"element-mark\\\"><section class=\\\"extra-content-2\\\" style=\\\"background-color: #FFF; color:#222;\\\"><div class=\\\"row hover-effect\\\"><div class=\\\"col-sm-6 hidden-xs\\\"><div class=\\\"row\\\"><figure class=\\\"effect-apollo\\\"> <img src=\\\"..\\/image\\/block\\/content\\/bg4.jpg\\\" alt=\\\"content\\\"><\\/img><figcaption><\\/figcaption><\\/figure><\\/div><\\/div><div class=\\\"col-sm-6\\\"><div class=\\\"row\\\"><div class=\\\"col-ms-12\\\"><div class=\\\"box-half-content pull-left\\\"><h1>Detailed Design<\\/h1><h3 class=\\\"sub-title\\\">Modern solution<\\/h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.<\\/p><p><a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\">Live Demo <\\/a> <a class=\\\"btn btn-default btn-lg\\\" href=\\\"#\\\" style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\" data-mce-href=\\\"#\\\" data-mce-style=\\\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\\\">Live Demo <\\/a><\\/p><\\/div><\\/div><\\/div><\\/div><\\/div><\\/section><\\/div><\\/div><\\/div>\",\"raw\":\"&lt;div class=&quot;extra-info-frame&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;div class=&quot;extra-content-1&quot; style=&quot;background-color: #00c0ff; color: #fff&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;&lt;div class=&quot;box-half-content pull-right&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_10&quot;&gt;Detailed Design&lt;\\/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_11&quot;&gt;Modern solution&lt;\\/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_12&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;\\/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_13&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;\\/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;\\/a&gt;&lt;\\/p&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;..\\/image\\/block\\/content\\/bg22.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; id=&quot;mce_14&quot;&gt;&lt;\\/img&gt;&lt;figcaption&gt;&lt;\\/figcaption&gt;&lt;\\/figure&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design\\/block\\/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-1&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;extra-info-frame&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;\\/i&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;section class=&quot;extra-content-2&quot; style=&quot;background-color: #FFF; color:#222;&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;..\\/image\\/block\\/content\\/bg4.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; id=&quot;mce_15&quot;&gt;&lt;\\/img&gt;&lt;figcaption&gt;&lt;\\/figcaption&gt;&lt;\\/figure&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-ms-12&quot;&gt;&lt;div class=&quot;box-half-content pull-left&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_16&quot;&gt;Detailed Design&lt;\\/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; style=&quot;color: rgb(0, 192, 255); position: relative;&quot; spellcheck=&quot;false&quot; id=&quot;mce_17&quot;&gt;Modern solution&lt;\\/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_18&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;\\/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_19&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;\\/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;\\/a&gt;&lt;\\/p&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/section&gt;&lt;\\/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design\\/block\\/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-2&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;\\/i&gt;&lt;\\/a&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"}}}', '2017-01-12 23:47:33', '2017-01-14 11:52:43');

-- --------------------------------------------------------

--
-- Table structure for table `pre_extra_info_description`
--

CREATE TABLE `pre_extra_info_description` (
  `extra_info_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `content` text NOT NULL,
  `raw` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_extra_info_description`
--

INSERT INTO `pre_extra_info_description` (`extra_info_id`, `language_id`, `name`, `content`, `raw`) VALUES
(1, 1, 'Content', '<div class=\"extra-info-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"element-mark\"><div class=\"extra-content-1\" style=\"background-color: #00c0ff; color: #fff\"><div class=\"row hover-effect\"><div class=\"col-sm-6\"><div class=\"row\"><div class=\"col-sm-12\"><div class=\"box-half-content pull-right\"><h1>Detailed Design</h1><h3 class=\"sub-title\">Modern solution</h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.</p><p><a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #fff; border: 1px solid #fff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #fff; border: 1px solid #fff;\">Live Demo </a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #fff; border: 1px solid #fff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #fff; border: 1px solid #fff;\">Live Demo </a></p></div></div></div></div><div class=\"col-sm-6 hidden-xs\"><div class=\"row\"><figure class=\"effect-apollo\"> <img src=\"/oc21ct/image/block/content/bg22.jpg\" alt=\"content\" data-mce-src=\"/oc21ct/image/block/content/bg22.jpg\" width=\"100%\" height=\"auto\" caption=\"false\" data-mce-selected=\"1\"></img><figcaption></figcaption></figure></div></div></div></div></div></div></div><div class=\"extra-info-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"element-mark\"><section class=\"extra-content-2\" style=\"background-color: #FFF; color:#222;\"><div class=\"row hover-effect\"><div class=\"col-sm-6 hidden-xs\"><div class=\"row\"><figure class=\"effect-apollo\"> <img src=\"/oc21ct/image/block/content/bg4.jpg\" alt=\"content\" data-mce-src=\"/oc21ct/image/block/content/bg4.jpg\" width=\"100%\" height=\"auto\" caption=\"false\" data-mce-selected=\"1\"></img><figcaption></figcaption></figure></div></div><div class=\"col-sm-6\"><div class=\"row\"><div class=\"col-ms-12\"><div class=\"box-half-content pull-left\"><h1>Detailed Design</h1><h3 class=\"sub-title\">Modern solution</h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.</p><p><a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo </a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo </a></p></div></div></div></div></div></section></div></div></div> ', '&lt;div class=&quot;col-sm-12 extra-info-frame&quot; style=&quot;display: block;&quot; id=&quot;extra-info-frame-0&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;div class=&quot;extra-content-1&quot; style=&quot;background-color: #00c0ff; color: #fff&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;&lt;div class=&quot;box-half-content pull-right&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_47&quot;&gt;Detailed Design&lt;/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_48&quot;&gt;Modern solution&lt;/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_49&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_50&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;/oc21ct/image/block/content/bg22.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; data-mce-src=&quot;/oc21ct/image/block/content/bg22.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot; data-mce-selected=&quot;1&quot; id=&quot;mce_51&quot;&gt;&lt;/img&gt;&lt;figcaption&gt;&lt;/figcaption&gt;&lt;/figure&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design/block/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-1&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;col-sm-12 extra-info-frame&quot; style=&quot;display: block;&quot; id=&quot;extra-info-frame-1&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;section class=&quot;extra-content-2&quot; style=&quot;background-color: #FFF; color:#222;&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;/oc21ct/image/block/content/bg4.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; data-mce-src=&quot;/oc21ct/image/block/content/bg4.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot; data-mce-selected=&quot;1&quot; id=&quot;mce_52&quot;&gt;&lt;/img&gt;&lt;figcaption&gt;&lt;/figcaption&gt;&lt;/figure&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-ms-12&quot;&gt;&lt;div class=&quot;box-half-content pull-left&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_53&quot;&gt;Detailed Design&lt;/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; style=&quot;color: rgb(0, 192, 255); position: relative;&quot; spellcheck=&quot;false&quot; id=&quot;mce_54&quot;&gt;Modern solution&lt;/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_55&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_56&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/section&gt;&lt;/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design/block/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-2&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt; '),
(1, 2, 'Content', '<div class=\"extra-info-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"element-mark\"><div class=\"extra-content-1\" style=\"background-color: #00c0ff; color: #fff\"><div class=\"row hover-effect\"><div class=\"col-sm-6\"><div class=\"row\"><div class=\"col-sm-12\"><div class=\"box-half-content pull-right\"><h1>Detailed Design</h1><h3 class=\"sub-title\">Modern solution</h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.</p><p><a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #fff; border: 1px solid #fff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #fff; border: 1px solid #fff;\">Live Demo </a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #fff; border: 1px solid #fff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #fff; border: 1px solid #fff;\">Live Demo </a></p></div></div></div></div><div class=\"col-sm-6 hidden-xs\"><div class=\"row\"><figure class=\"effect-apollo\"> <img src=\"/oc21ct/image/block/content/bg22.jpg\" alt=\"content\" data-mce-src=\"/oc21ct/image/block/content/bg22.jpg\" width=\"100%\" height=\"auto\" caption=\"false\" data-mce-selected=\"1\"></img><figcaption></figcaption></figure></div></div></div></div></div></div></div><div class=\"extra-info-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"element-mark\"><section class=\"extra-content-2\" style=\"background-color: #FFF; color:#222;\"><div class=\"row hover-effect\"><div class=\"col-sm-6 hidden-xs\"><div class=\"row\"><figure class=\"effect-apollo\"> <img src=\"/oc21ct/image/block/content/bg4.jpg\" alt=\"content\" data-mce-src=\"/oc21ct/image/block/content/bg4.jpg\" width=\"100%\" height=\"auto\" caption=\"false\" data-mce-selected=\"1\"></img><figcaption></figcaption></figure></div></div><div class=\"col-sm-6\"><div class=\"row\"><div class=\"col-ms-12\"><div class=\"box-half-content pull-left\"><h1>Detailed Design</h1><h3 class=\"sub-title\">Modern solution</h3><p>In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.</p><p><a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo </a> <a class=\"btn btn-default btn-lg\" href=\"#\" style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\" data-mce-href=\"#\" data-mce-style=\"background: none; color: #00c0ff; border: 1px solid #00c0ff;\">Live Demo </a></p></div></div></div></div></div></section></div></div></div> ', '&lt;div class=&quot;extra-info-frame&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;div class=&quot;extra-content-1&quot; style=&quot;background-color: #00c0ff; color: #fff&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-sm-12&quot;&gt;&lt;div class=&quot;box-half-content pull-right&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_57&quot;&gt;Detailed Design&lt;/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_58&quot;&gt;Modern solution&lt;/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_59&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_60&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #fff; border: 1px solid #fff;&quot;&gt;Live Demo &lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;/oc21ct/image/block/content/bg22.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; data-mce-src=&quot;/oc21ct/image/block/content/bg22.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot; data-mce-selected=&quot;1&quot; id=&quot;mce_61&quot;&gt;&lt;/img&gt;&lt;figcaption&gt;&lt;/figcaption&gt;&lt;/figure&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design/block/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-1&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;extra-info-frame&quot; style=&quot;display: block;&quot;&gt;&lt;div class=&quot;frame-header&quot;&gt;&lt;div class=&quot;frame-down&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-down&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-up&quot;&gt;&lt;i class=&quot;fa fa-long-arrow-up&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;div class=&quot;frame-remove&quot;&gt;&lt;i class=&quot;fa fa-trash&quot;&gt;&lt;/i&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;element-mark&quot;&gt;&lt;section class=&quot;extra-content-2&quot; style=&quot;background-color: #FFF; color:#222;&quot;&gt;&lt;div class=&quot;row hover-effect&quot;&gt;&lt;div class=&quot;col-sm-6 hidden-xs&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;figure class=&quot;effect-apollo&quot;&gt; &lt;img src=&quot;/oc21ct/image/block/content/bg4.jpg&quot; alt=&quot;content&quot; data-editable=&quot;true&quot; spellcheck=&quot;false&quot; data-mce-src=&quot;/oc21ct/image/block/content/bg4.jpg&quot; width=&quot;100%&quot; height=&quot;auto&quot; caption=&quot;false&quot; data-mce-selected=&quot;1&quot; id=&quot;mce_62&quot;&gt;&lt;/img&gt;&lt;figcaption&gt;&lt;/figcaption&gt;&lt;/figure&gt;&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;col-sm-6&quot;&gt;&lt;div class=&quot;row&quot;&gt;&lt;div class=&quot;col-ms-12&quot;&gt;&lt;div class=&quot;box-half-content pull-left&quot;&gt;&lt;h1 data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_63&quot;&gt;Detailed Design&lt;/h1&gt;&lt;h3 class=&quot;sub-title&quot; data-editable=&quot;true&quot; style=&quot;color: rgb(0, 192, 255); position: relative;&quot; spellcheck=&quot;false&quot; id=&quot;mce_64&quot;&gt;Modern solution&lt;/h3&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_65&quot;&gt;In our work we try to use only the most modern, convenient and interesting solutions. We want the template you downloaded look unique and new for such a long time as it is possible.&lt;/p&gt;&lt;p data-editable=&quot;true&quot; spellcheck=&quot;false&quot; style=&quot;position: relative;&quot; id=&quot;mce_66&quot;&gt;&lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;/a&gt; &lt;a class=&quot;btn btn-default btn-lg&quot; href=&quot;#&quot; style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot; data-mce-href=&quot;#&quot; data-mce-style=&quot;background: none; color: #00c0ff; border: 1px solid #00c0ff;&quot;&gt;Live Demo &lt;/a&gt;&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/section&gt;&lt;/div&gt;&lt;div class=&quot;element-tool&quot;&gt;&lt;div class=&quot;element-block-edit&quot;&gt;&lt;a href=&quot;index.php?route=design/block/editByCode&amp;amp;token=38H8TfZuh17UIExxwfJaz4YMboyBLpRo&amp;amp;code=extra-content-2&quot; target=&quot;_blank&quot; data-toggle=&quot;extra-info&quot; data-id=&quot;&quot; data-type=&quot;content&quot;&gt;&lt;i class=&quot;fa fa-code&quot;&gt;&lt;/i&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt; ');

-- --------------------------------------------------------

--
-- Table structure for table `pre_filter`
--

CREATE TABLE `pre_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_filter`
--

INSERT INTO `pre_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(24, 2, 5),
(4, 2, 3),
(5, 2, 1),
(7, 3, 1),
(8, 3, 2),
(9, 3, 3),
(12, 4, 3),
(11, 4, 2),
(10, 4, 1),
(13, 5, 1),
(14, 5, 2),
(15, 5, 3),
(16, 6, 1),
(17, 6, 2),
(18, 6, 3),
(6, 2, 2),
(23, 7, 4),
(22, 7, 3),
(21, 7, 2),
(20, 7, 1),
(19, 2, 4),
(25, 8, 1),
(26, 8, 2),
(29, 9, 3),
(28, 9, 2),
(27, 9, 1),
(30, 10, 1),
(31, 10, 2),
(32, 11, 1),
(33, 11, 2),
(34, 9, 4),
(35, 9, 5),
(36, 9, 6),
(37, 6, 4),
(38, 6, 5),
(39, 6, 6),
(40, 12, 1),
(41, 12, 2),
(42, 12, 3),
(45, 13, 3),
(44, 13, 2),
(43, 13, 1),
(46, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `pre_filter_description`
--

CREATE TABLE `pre_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_filter_description`
--

INSERT INTO `pre_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(1, 1, 1, 'Dưới 8 kg'),
(2, 1, 1, 'Từ 8 đến 10 kg'),
(3, 1, 1, 'Lớn hơn 11 kg'),
(24, 1, 2, 'Đen'),
(4, 1, 2, 'Xám đen Onyx'),
(7, 1, 3, '20 Triệu hoặc hơn'),
(8, 1, 3, '12 - 20 Triệu'),
(9, 1, 3, 'Dưới 12 Triệu'),
(12, 1, 4, 'Định lượng tự động AutoDose'),
(11, 1, 4, 'Công nghệ UltraMix'),
(10, 1, 4, 'Cảm biến giặt SensorWash'),
(13, 1, 5, 'Dưới 1.500'),
(14, 1, 5, '1.500 - 1.999'),
(15, 1, 5, '2.000 hoặc hơn'),
(16, 1, 6, '&lt; 400'),
(17, 1, 6, '400 - 499'),
(18, 1, 6, '&gt; 500'),
(5, 1, 2, 'Bạc'),
(6, 1, 2, 'Trắng'),
(23, 1, 7, '4'),
(22, 1, 7, '3'),
(21, 1, 7, '2'),
(20, 1, 7, '1'),
(19, 1, 2, 'Xám đậm'),
(25, 1, 8, 'Điện'),
(26, 1, 8, 'Ga'),
(29, 1, 9, '800 mm (R) hoặc hơn'),
(28, 1, 9, '700 - 799 mm (R)'),
(27, 1, 9, 'Dưới 700 mm (R)'),
(30, 1, 10, 'Âm tường'),
(31, 1, 10, 'Đứng độc lập'),
(32, 1, 11, '8'),
(33, 1, 11, '13'),
(34, 1, 9, 'Dưới 500 mm (R)'),
(35, 1, 9, '500 - 599 mm (R)'),
(36, 1, 9, '600 mm (R) hoặc hơn'),
(37, 1, 6, 'Dưới 60 L'),
(38, 1, 6, '60 - 69 L'),
(39, 1, 6, '70 L hoặc hơn'),
(40, 1, 12, 'Dưới 30'),
(41, 1, 12, '30 - 59'),
(42, 1, 12, '60 hoặc hơn'),
(45, 1, 13, '5'),
(44, 1, 13, '4'),
(43, 1, 13, '3'),
(46, 1, 2, 'Màu đồng Mahogany');

-- --------------------------------------------------------

--
-- Table structure for table `pre_filter_group`
--

CREATE TABLE `pre_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_filter_group`
--

INSERT INTO `pre_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1),
(2, 2),
(3, 4),
(4, 3),
(5, 6),
(6, 7),
(7, 11),
(8, 8),
(9, 9),
(10, 10),
(11, 12),
(12, 13),
(13, 14);

-- --------------------------------------------------------

--
-- Table structure for table `pre_filter_group_description`
--

CREATE TABLE `pre_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_filter_group_description`
--

INSERT INTO `pre_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Khối lượng giặt (Kg)'),
(3, 1, 'Giá'),
(4, 1, 'Tính năng'),
(5, 1, 'Điện năng tiêu thụ (W)'),
(6, 1, 'Dung tích (L)'),
(2, 1, 'Màu sắc'),
(7, 1, 'Số lượng vùng nấu'),
(8, 1, 'Nguồn năng lượng'),
(9, 1, 'Chiều rộng sản phẩm'),
(10, 1, 'Lắp đặt'),
(11, 1, 'Số bộ chén đĩa'),
(12, 1, 'Diện tích lọc tối đa (m2)'),
(13, 1, 'Số bộ lọc');

-- --------------------------------------------------------

--
-- Table structure for table `pre_geo_zone`
--

CREATE TABLE `pre_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_geo_zone`
--

INSERT INTO `pre_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(5, 'Việt Nam', 'Việt Nam', '0000-00-00 00:00:00', '2018-06-07 13:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `pre_information`
--

CREATE TABLE `pre_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `bottom2` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_information`
--

INSERT INTO `pre_information` (`information_id`, `bottom`, `bottom2`, `sort_order`, `status`) VALUES
(3, 0, 1, 2, 1),
(4, 1, 0, 1, 1),
(5, 0, 1, 1, 1),
(6, 1, 0, 2, 1),
(7, 0, 1, 3, 1),
(8, 1, 0, 3, 1),
(9, 1, 0, 4, 1),
(10, 1, 0, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_information_description`
--

CREATE TABLE `pre_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_information_description`
--

INSERT INTO `pre_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'Giới thiệu', '&lt;p&gt;Giới thiệu&lt;/p&gt;\r\n', 'Giới thiệu', '', ''),
(6, 1, 'Thông tin giao hàng', '&lt;p&gt;Th&amp;ocirc;ng tin giao h&amp;agrave;ng&lt;/p&gt;\r\n', 'Thông tin giao hàng', '', ''),
(7, 1, 'Hướng dẫn sử dụng Cookie', '&lt;h4 style=&quot;text-align:center&quot;&gt;Trong hướng dẫn này, chúng tôi dùng từ “cookies” để chỉ các tập tin cookies và các công nghệ tương tự được nêu trong Chỉ Thị EU về quyền cá nhân trong truyền thông điện tử.&lt;/h4&gt;\r\n\r\n&lt;h4&gt;&amp;nbsp;&lt;/h4&gt;\r\n\r\n&lt;h4 style=&quot;text-align:center&quot;&gt;Cookie là gì?&lt;/h4&gt;\r\n\r\n&lt;p&gt;Cookies là các tệp chữ nhỏ chưa dữ liệu được tạo ra từ những trang web đã truy cập. Chúng được lưu trong máy tính của người truy cập để giúp họ có thể sử dụng nhiều tính năng khác.&lt;/p&gt;\r\n\r\n&lt;p&gt;Các trang web của chúng tôi đều dùng tập tin cookie tạm thời và cookie vĩnh viễn.&lt;/p&gt;\r\n\r\n&lt;p&gt;Cookie tạm thời được lưu trữ tạm thời trong bộ nhứo máy tính trong khi người xem đang truy cập trang web. Tập tin cookie này sẽ được xóa khi người dùng đóng trình duyệt web hay sau một thời gian nhất định (khi thời gian truy cập kết thúc)&lt;/p&gt;\r\n\r\n&lt;p&gt;Cookie vĩnh viễn sẽ nằm trong máy tính của quý khách đến khi chúng được xóa.&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:center&quot;&gt;Tại sao chúng tôi sử dụng các tập tin cookie?&lt;/h4&gt;\r\n\r\n&lt;p&gt;Chúng tôi sử dụng tập tin cookie để tìm hiểu thêm về các người truy cập tương tác với nội dung và giúp chúng tôi cải thiện kinh nghiệm khi truy cập trang web&lt;/p&gt;\r\n\r\n&lt;h4&gt;&amp;nbsp;&lt;/h4&gt;\r\n\r\n&lt;h4 style=&quot;text-align:center&quot;&gt;Nội dung và tính năng của trang web&lt;/h4&gt;\r\n\r\n&lt;p&gt;Chức năng chia sẻ được người truy cập sử dụng để giới thiệu trang web và thông tin của chúng tôi lên các mạng lưới xã hội như Facebook và Twitter. Các tập tin cookie lưu trữ thông tin cách người truy cập sử dụng tính năng chia sẻ- mặc dù không phải ở mức độ cá nhân- để trang web được cải thiện. Nếu quý khách không cho chấp nhận dùng cookie, sẽ không có thông tin nào được lưu.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chúng tôi sử dụng nhà cung cấp thứ ba cho một số tính năng trong trang web, ví dụ, khi quý khách truy cập vào một trang có video được gắn liền hay có các đường dẫn từ YouTube. Các video và đường dẫn này (hay bất kỳ thông tin nào từ các nhà cung cấp bên thứ ba) có thể chứa tậo cookie từ bên thứ ba và quý khách có thể tham khảo thông tin quy định về tập tin cookie của những trang web của bên thứ ba&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:center&quot;&gt;Phân tích trang web&lt;/h4&gt;\r\n\r\n&lt;p&gt;Trang web này sử dụng Google Analytics. Ở cấp độ tổng hợp, cookies lưu trữ thông tin về cách khách truy cập sử dụng trang web, bao gồm cả số lượng của các trang được hiển thị, địa điểm mà khách truy cập, và số lượt truy cập, để cải thiện trang web và rút ra kinh nghiệm sử dụng hiệu quả. Nếu quý khách không cho chấp nhận dùng cookie, sẽ không có thông tin nào được lưu.&lt;/p&gt;\r\n\r\n&lt;h4&gt;&amp;nbsp;&lt;/h4&gt;\r\n\r\n&lt;h4 style=&quot;text-align:center&quot;&gt;Làm sao để xóa bỏ các tập tin cookie?&lt;/h4&gt;\r\n\r\n&lt;p&gt;Chúng tôi không dùng cookie để lấy thông tin cá nhân của khách truy cập.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tuy nhiên, quý khách có thể chọn xóa bỏ hoặc chặn các tập tin cookie cài đặt bởi Maadela hay các trang web của nha cung cấp bên thứ ba bằng cách thay đổi chế độn trình duyệt – hãy xem mục “Tính năng trợ giúp” trong trình duyệt của quý khách để biết thêm chi tiết.&lt;/p&gt;\r\n\r\n&lt;p&gt;Xin lưu ý rằng hầu hết các trình duyệt tự động đồng ý cookie nên nếu quý khách không muốn dùng cookie thì quý khách cần tích cực xóa hoặc chặn cookie.&lt;/p&gt;\r\n\r\n&lt;p&gt;Để biết thêm thông tin sử dụng cookie trên trình duyệt của điện thoại và các chi tiết về cách xóa bỏ cookie, hãy tham khảo hướng dẫn sử dụng điện thoại của quý khách.&lt;/p&gt;\r\n\r\n&lt;p&gt;Tuy nhiên hãy lưu ý rằng nếu quý khách không sử dụng tập tin cookie,quý khách vẫn có thể truy cập trang web của chúng tôi nhưng một vài tính năng sẽ không hoạt đúng cách.&lt;/p&gt;\r\n', 'Hướng dẫn sử dụng Cookie', 'Hướng dẫn sử dụng Cookie', 'Hướng dẫn sử dụng Cookie'),
(3, 1, 'Chính sách bảo mật thông tin', '&lt;p&gt;Chính sách bảo mật&lt;/p&gt;\r\n', 'Chính sách bảo mật thông tin', '', ''),
(5, 1, 'Các điều khoản sử dụng trang web', '&lt;p&gt;Điều khoản và điều kiện&lt;/p&gt;\r\n', 'Các điều khoản sử dụng trang web', '', ''),
(8, 1, 'Bảo vệ môi trường', '&lt;p&gt;Bảo vệ môi trường&lt;/p&gt;\r\n', 'Bảo vệ môi trường', 'Bảo vệ môi trường', 'Bảo vệ môi trường'),
(9, 1, 'Mục tiêu nghề nghiệp', '&lt;p&gt;Mục tiêu nghề nghiệp&lt;/p&gt;\r\n', 'Mục tiêu nghề nghiệp', 'Mục tiêu nghề nghiệp', 'Mục tiêu nghề nghiệp'),
(10, 1, 'Dự án Nâng tầm cuộc sống', '&lt;p&gt;Dự án Nâng tầm cuộc sống&lt;/p&gt;\r\n', 'Dự án Nâng tầm cuộc sống', 'Dự án Nâng tầm cuộc sống', 'Dự án Nâng tầm cuộc sống');

-- --------------------------------------------------------

--
-- Table structure for table `pre_information_to_layout`
--

CREATE TABLE `pre_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_information_to_layout`
--

INSERT INTO `pre_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(4, 0, 0),
(6, 0, 0),
(3, 0, 0),
(5, 0, 0),
(7, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_information_to_store`
--

CREATE TABLE `pre_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_information_to_store`
--

INSERT INTO `pre_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_language`
--

CREATE TABLE `pre_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_language`
--

INSERT INTO `pre_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'VN', 'vi', 'vi_VN.UTF-8,vi_VN,vi-vn,vietnamese', 'vn.png', 'vietnamese', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_layout`
--

CREATE TABLE `pre_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_layout`
--

INSERT INTO `pre_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'Special'),
(15, 'Brainy Filter Layout'),
(16, 'Thread'),
(17, 'Post');

-- --------------------------------------------------------

--
-- Table structure for table `pre_layout_module`
--

CREATE TABLE `pre_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_layout_module`
--

INSERT INTO `pre_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(250, 15, 'brainyfilter.42', 'column_left', 0),
(398, 3, 'brainyfilter.43', 'column_left', 0),
(389, 1, 'banner_grid.56', 'content_top', 6),
(387, 1, 'category', 'content_top', 2),
(388, 1, 'banner_grid.55', 'content_top', 5),
(386, 1, 'slideshow.27', 'content_top', 1),
(385, 1, 'banner_grid.54', 'content_top', 3),
(384, 1, 'featured.28', 'content_top', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pre_layout_route`
--

CREATE TABLE `pre_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_layout_route`
--

INSERT INTO `pre_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(57, 3, 0, 'product/category'),
(70, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(54, 14, 0, 'product/special'),
(56, 15, 0, 'module/brainyfilter/filter'),
(61, 16, 0, 'information/thread'),
(62, 17, 0, 'information/post');

-- --------------------------------------------------------

--
-- Table structure for table `pre_length_class`
--

CREATE TABLE `pre_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_length_class`
--

INSERT INTO `pre_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `pre_length_class_description`
--

CREATE TABLE `pre_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_length_class_description`
--

INSERT INTO `pre_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimet', 'cm'),
(2, 1, 'Milimet', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `pre_location`
--

CREATE TABLE `pre_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_manufacturer`
--

CREATE TABLE `pre_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_manufacturer`
--

INSERT INTO `pre_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(11, 'Maadela', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_manufacturer_to_store`
--

CREATE TABLE `pre_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_manufacturer_to_store`
--

INSERT INTO `pre_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(11, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_marketing`
--

CREATE TABLE `pre_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_megamenu`
--

CREATE TABLE `pre_megamenu` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` text NOT NULL,
  `url` varchar(128) NOT NULL,
  `parent_id` int(128) NOT NULL DEFAULT 0,
  `subcontent` text NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(128) DEFAULT NULL,
  `widths` int(11) DEFAULT NULL,
  `columns` int(11) DEFAULT NULL,
  `activemega` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_megamenu`
--

INSERT INTO `pre_megamenu` (`id`, `title`, `image`, `url`, `parent_id`, `subcontent`, `type`, `type_id`, `widths`, `columns`, `activemega`) VALUES
(1, 'eyIxIjoiVHJhbmcgY2hcdTFlZTciLCIyIjoiSG9tZSJ9', '', 'index.php', 0, '', 'custom', 0, NULL, NULL, 0),
(2, 'eyIxIjoiU1x1MWVhM24gcGhcdTFlYTltIiwiMiI6IlByb2R1Y3RzIn0=', '', 'javascript:void(0)', 0, '', 'custom', 0, NULL, NULL, 1),
(3, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 2, '', 'custom', 0, NULL, NULL, 0),
(4, 'eyIxIjoiQ2hcdTAxMDNtIHMmb2FjdXRlO2MgdHJhbmcgcGhcdTFlZTVjIiwiMiI6IkxhdW5kcnkifQ==', 'catalog/danh-muc/megamenu/1.png', 'javascript:void(0)', 3, '', 'custom', 0, NULL, NULL, 0),
(5, 'eyIxIjoiTSZhYWN1dGU7eSBnaVx1MWViN3QiLCIyIjoiV2FzaGluZyBtYWNoaW5lcyJ9', '', '', 4, '', 'category', 78, NULL, NULL, 0),
(6, 'eyIxIjoiTSZhYWN1dGU7eSBzXHUxZWE1eSBxdVx1MWVhN24gJmFhY3V0ZTtvIiwiMiI6IkRyeWVycyJ9', '', '', 4, '', 'category', 82, NULL, NULL, 0),
(7, 'eyIxIjoiQiZhZ3JhdmU7biBcdTFlZTdpLCBiJmFncmF2ZTtuIGwmYWdyYXZlOyIsIjIiOiJJcm9ucyJ9', '', '', 4, '', 'category', 96, NULL, NULL, 0),
(8, 'eyIxIjoiQiZhZ3JhdmU7biBcdTFlZTdpIGhcdTAxYTFpIG5cdTAxYjBcdTFlZGJjIFx1MDExMVx1MWVlOW5nIiwiMiI6Ikdhcm1lbnQgc3RlYW1lcnMifQ==', '', '', 4, '', 'category', 95, NULL, NULL, 0),
(9, 'eyIxIjoiQ2hcdTAxMDNtIHMmb2FjdXRlO2MgbmgmYWdyYXZlOyBjXHUxZWVkYSIsIjIiOiJGbG9vciJ9', 'catalog/danh-muc/megamenu/2.png', 'javascript:void(0)', 3, '', 'custom', 0, NULL, NULL, 0),
(10, 'eyIxIjoiTSZhYWN1dGU7eSBoJnVhY3V0ZTt0IGJcdTFlZTVpIiwiMiI6IlZhY3V1bSBjbGVhbmVycyJ9', '', '', 9, '', 'category', 83, NULL, NULL, 0),
(11, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 2, '', 'custom', 0, NULL, NULL, 0),
(12, 'eyIxIjoiU1x1MWVhM24gcGhcdTFlYTltIG5oJmFncmF2ZTsgYlx1MWViZnAiLCIyIjoiS2l0Y2hlbiJ9', 'catalog/danh-muc/megamenu/3.png', 'javascript:void(0)', 11, '', 'custom', 0, NULL, NULL, 0),
(13, 'eyIxIjoiVFx1MWVlNyBsXHUxZWExbmgiLCIyIjoiUmVmcmlnZXJhdG9ycyJ9', '', '', 12, '', 'category', 79, NULL, NULL, 0),
(14, 'eyIxIjoiQlx1MWViZnAiLCIyIjoiSG9icyJ9', '', '', 12, '', 'category', 77, NULL, NULL, 0),
(15, 'eyIxIjoiTSZhYWN1dGU7eSBoJnVhY3V0ZTt0IG0mdWdyYXZlO2kiLCIyIjoiRnJlZXN0YW5kaW5nIGNvb2tlcnMifQ==', '', '', 12, '', 'category', 85, NULL, NULL, 0),
(16, 'eyIxIjoiTCZvZ3JhdmU7IG5cdTAxYjBcdTFlZGJuZyIsIjIiOiJPdmVucyJ9', '', '', 12, '', 'category', 81, NULL, NULL, 0),
(17, 'eyIxIjoiTSZhYWN1dGU7eSByXHUxZWVkYSBiJmFhY3V0ZTt0IiwiMiI6IkRpc2h3YXNoZXJzIn0=', '', '', 12, '', 'category', 97, NULL, NULL, 0),
(18, 'eyIxIjoiTCZvZ3JhdmU7IHZpIHMmb2FjdXRlO25nIiwiMiI6Ik1pY3Jvd2F2ZXMifQ==', '', '', 12, '', 'category', 84, NULL, NULL, 0),
(19, 'eyIxIjoiTiZvY2lyYztcdTAzMDBpIGNoaSZlY2lyYztuIGtoJm9jaXJjO25nIGQmYWNpcmM7XHUwMzAwdSIsIjIiOiJBaXIgZnJ5ZXJzIn0=', '', '', 12, '', 'category', 87, NULL, NULL, 0),
(20, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 2, '', 'custom', 0, NULL, NULL, 0),
(21, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 20, '', 'custom', 0, NULL, NULL, 0),
(22, 'eyIxIjoiTlx1MWVkM2kgY1x1MDFhMW0gXHUwMTExaVx1MWVjN24iLCIyIjoiUmljZSBjb29rZXJzIn0=', '', '', 21, '', 'category', 88, NULL, NULL, 0),
(23, 'eyIxIjoiTSZhYWN1dGU7eSBcdTAxMTEmYWFjdXRlO25oIHRyXHUxZWU5bmciLCIyIjoiTWl4ZXIifQ==', '', '', 21, '', 'category', 90, NULL, NULL, 0),
(24, 'eyIxIjoiQlx1MWViZnAgblx1MDFiMFx1MWVkYm5nLCBtJmFhY3V0ZTt5IG5cdTAxYjBcdTFlZGJuZyBiJmFhY3V0ZTtuaCBtJmlncmF2ZTsiLCIyIjoiVG9hc3RlcnMifQ==', '', '', 21, '', 'category', 89, NULL, NULL, 0),
(25, 'eyIxIjoiQiZpZ3JhdmU7bmggXHUwMTExdW4gblx1MDFiMFx1MWVkYmMiLCIyIjoiRWxlY3RyaWMga2V0dGxlcyJ9', '', '', 21, '', 'category', 91, NULL, NULL, 0),
(26, 'eyIxIjoiTSZhYWN1dGU7eSB4YXkgc2luaCB0XHUxZWQxICZhbXA7YW1wOyBNJmFhY3V0ZTt5ICZlYWN1dGU7cCB0ciZhYWN1dGU7aSBjJmFjaXJjO3kiLCIyIjoiQmxlbmRlcnMgJmFtcDthbXA7IGp1aWNlcnMifQ==', '', '', 21, '', 'category', 92, NULL, NULL, 0),
(27, 'eyIxIjoiQyZhY2lyYzt5IG5cdTAxYjBcdTAxYTFcdTAzMDFjIG5vXHUwMzAxbmcgbGFcdTAzMjNuaCIsIjIiOiJXYXRlciBkaXNwZW5zZXJzICZhbXA7YW1wOyBwdXJpZmllcnMifQ==', '', '', 21, '', 'category', 93, NULL, NULL, 0),
(28, 'eyIxIjoiQ2hcdTFlYWR1IHJcdTFlZWRhIGNoJmVhY3V0ZTtuIiwiMiI6IkNoXHUxZWFkdSByXHUxZWVkYSBjaCZlYWN1dGU7biJ9', '', '', 21, '', 'category', 119, NULL, NULL, 0),
(29, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 2, '', 'custom', 0, NULL, NULL, 0),
(30, 'eyIxIjoiR2lcdTFlYTNpIHBoJmFhY3V0ZTtwIGtoJm9jaXJjO25nIGtoJmlhY3V0ZTsiLCIyIjoiQWlyIn0=', 'catalog/danh-muc/megamenu/4.png', 'javascript:void(0)', 29, '', 'custom', 0, NULL, NULL, 0),
(31, 'eyIxIjoiTSZhYWN1dGU7eSBsXHUxZWNkYyBraCZvY2lyYztuZyBraCZpYWN1dGU7IiwiMiI6IkRlaHVtaWRpZmllciJ9', '', '', 30, '', 'category', 80, NULL, NULL, 0),
(32, 'eyIxIjoiTWFcdTAzMDF5IGh1XHUwMzAxdCAmYWNpcmM7XHUwMzA5bSIsIjIiOiJBaXIgcHVyaWZpZXJzIn0=', '', '', 30, '', 'category', 94, NULL, NULL, 0),
(33, 'eyIxIjoiVGhpXHUxZWJmdCBiXHUxZWNiIHBoJm9ncmF2ZTtuZyB0XHUxZWFmbSIsIjIiOiJCYXRocm9vbSJ9', 'catalog/danh-muc/megamenu/5.png', 'javascript:void(0)', 29, '', 'custom', 0, NULL, NULL, 0),
(34, 'eyIxIjoiTSZhYWN1dGU7eSBuXHUwMWIwXHUxZWRiYyBuJm9hY3V0ZTtuZyB0clx1MWVmMWMgdGlcdTFlYmZwIiwiMiI6Ikluc3RhbnQgd2F0ZXIgaGVhdGVycyJ9', '', '', 33, '', 'category', 99, NULL, NULL, 0),
(35, 'eyIxIjoiTSZhYWN1dGU7eSBuXHUwMWIwXHUxZWRiYyBuJm9hY3V0ZTtuZyBnaSZhYWN1dGU7biB0aVx1MWViZnAiLCIyIjoiU3RvcmFnZSB3YXRlciBoZWF0ZXJzIn0=', '', '', 33, '', 'category', 98, NULL, NULL, 0),
(36, 'eyIxIjoiIiwiMiI6IiJ9', '', '', 2, '', 'custom', 0, NULL, NULL, 0),
(37, 'eyIxIjoiUGhcdTFlZTUga2lcdTFlYzduIGNoJmlhY3V0ZTtuaCBoJmF0aWxkZTtuZyIsIjIiOiJBY2Nlc3NvcmllcyJ9', 'catalog/danh-muc/megamenu/6.png', 'javascript:void(0)', 36, '', 'custom', 0, NULL, NULL, 0),
(38, 'eyIxIjoiQ2hcdTAxMDNtIHMmb2FjdXRlO2MgdHJhbmcgcGhcdTFlZTVjIiwiMiI6IkxhdW5kcnkifQ==', '', '', 37, '', 'category', 100, NULL, NULL, 0),
(39, 'eyIxIjoiR2lcdTFlYTNpIHBoJmFhY3V0ZTtwIGtoJm9jaXJjO25nIGtoJmlhY3V0ZTsiLCIyIjoiQWlyIn0=', '', '', 37, '', 'category', 101, NULL, NULL, 0),
(40, 'eyIxIjoiQ2hcdTAxMDNtIHMmb2FjdXRlO2MgbmgmYWdyYXZlOyBjXHUxZWVkYSIsIjIiOiJGbG9vciJ9', '', '', 37, '', 'category', 102, NULL, NULL, 0),
(41, 'eyIxIjoiTmgmYWdyYXZlOyBiXHUxZWJmcCIsIjIiOiJLaXRjaGVuIn0=', '', '', 37, '', 'category', 103, NULL, NULL, 0),
(42, 'eyIxIjoiVGluIHRcdTFlZTljIiwiMiI6Ik5ld3MifQ==', '', '', 0, '', 'thread', 1, NULL, NULL, 0),
(43, 'eyIxIjoiS2h1eVx1MWViZm4gbSZhdGlsZGU7aSIsIjIiOiJQcm9tb3Rpb25zIn0=', '', '', 0, '', 'thread', 5, NULL, NULL, 0),
(44, 'eyIxIjoiRWNhdGFsb2ciLCIyIjoiRWNhdGFsb2cifQ==', '', '', 0, '', 'thread', 6, NULL, NULL, 0),
(45, 'eyIxIjoiSFx1MWVkNyB0clx1MWVlMyBiXHUxZWEzbyBoJmFncmF2ZTtuaCIsIjIiOiJQcm9kdWN0IHdhcnJhbnR5In0=', '', '', 0, '', 'thread', 7, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_megamenu_options`
--

CREATE TABLE `pre_megamenu_options` (
  `id` int(11) NOT NULL,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pre_megamenu_options`
--

INSERT INTO `pre_megamenu_options` (`id`, `name`, `value`) VALUES
(16, 'menu_height', '50'),
(17, 'submenu_width', '200'),
(18, 'submenu_height', '35'),
(19, 'menu_font_style', 'uppercase'),
(20, 'menu_font_size', '15'),
(21, 'menu_font_color', 'ffffff'),
(22, 'menu_font_color_hover', 'ffffff'),
(23, 'submenu_font_style', 'capitalize'),
(24, 'submenu_font_size', '15'),
(25, 'submenu_font_color', '464646'),
(26, 'submenu_font_color_hover', '3cb7e7'),
(27, 'menu_background', '323a45'),
(28, 'menu_background_hover', '3cb7e7'),
(29, 'submenu_background', 'e6e6e6'),
(30, 'submenu_background_hover', 'd0d0d0');

-- --------------------------------------------------------

--
-- Table structure for table `pre_menu`
--

CREATE TABLE `pre_menu` (
  `menu_id` int(11) NOT NULL,
  `code` varchar(500) NOT NULL,
  `type` varchar(255) NOT NULL,
  `picture` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_menu`
--

INSERT INTO `pre_menu` (`menu_id`, `code`, `type`, `picture`, `image`, `name`, `status`) VALUES
(1, 'MG01', 'horizontal', 1, 'catalog/logo.png', 'Header Menu Groups', 1),
(2, 'MG02', 'horizontal', 1, '', 'Footer Menu Groups', 1),
(3, 'MG3', 'horizontal', 1, 'catalog/demo/apple_cinema_30.jpg', 'Menu header', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_menu_group`
--

CREATE TABLE `pre_menu_group` (
  `menu_group_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) NOT NULL DEFAULT 0,
  `module_type` varchar(250) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT 0,
  `url` varchar(250) NOT NULL,
  `keyword` varchar(600) NOT NULL,
  `window` varchar(250) NOT NULL,
  `style` varchar(250) NOT NULL,
  `font` varchar(250) NOT NULL,
  `image` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_menu_group`
--

INSERT INTO `pre_menu_group` (`menu_group_id`, `menu_id`, `parent_id`, `module_id`, `module_type`, `sort`, `url`, `keyword`, `window`, `style`, `font`, `image`) VALUES
(1, 1, 0, 0, 'link', 2, '', '', '0', 'tabbed', '', ''),
(2, 1, 0, 0, 'link', 64, '', '', '0', 'lists', '', ''),
(3, 1, 0, 0, 'link', 98, '', '', '0', 'dropdown', '', ''),
(4, 1, 0, 0, 'link', 111, 'index.php?route=information/contact', '', '0', 'dropdown', '', ''),
(5, 1, 1, 0, 'link', 3, '', '', '0', 'dropdown', '', ''),
(6, 1, 1, 0, 'link', 33, '', '', '0', 'dropdown', '', ''),
(7, 1, 1, 0, 'link', 59, '', '', '0', 'dropdown', '', ''),
(8, 1, 1, 0, 'link', 52, '', '', '0', 'dropdown', '', ''),
(9, 1, 0, 0, 'link', 104, '', '', '0', 'lists', '', ''),
(10, 1, 0, 4, 'information', 1, 'information_id=4', '', '0', 'dropdown', '', ''),
(11, 1, 9, 8, 'manufacturer', 105, 'manufacturer_id=8', '', '0', 'dropdown', '', 'catalog/demo/apple_logo.jpg'),
(12, 1, 9, 9, 'manufacturer', 108, 'manufacturer_id=9', '', '0', 'dropdown', '', 'catalog/demo/manufacturer/canon.png'),
(13, 1, 9, 7, 'manufacturer', 107, 'manufacturer_id=7', '', '0', 'dropdown', '', 'catalog/demo/manufacturer/brands-hp.png'),
(14, 1, 9, 5, 'manufacturer', 106, 'manufacturer_id=5', '', '0', 'dropdown', '', 'catalog/demo/manufacturer/brands-htc.png'),
(15, 1, 9, 6, 'manufacturer', 109, 'manufacturer_id=6', '', '0', 'dropdown', '', 'catalog/demo/palm_logo.jpg'),
(16, 1, 9, 10, 'manufacturer', 110, 'manufacturer_id=10', '', '0', 'dropdown', '', 'catalog/demo/sony_logo.jpg'),
(17, 1, 2, 0, 'link', 72, '', '', '0', 'dropdown', '', ''),
(18, 1, 2, 0, 'link', 65, '', '', '0', 'dropdown', '', ''),
(19, 1, 2, 0, 'link', 86, '', '', '0', 'dropdown', '', ''),
(20, 1, 2, 0, 'link', 93, '', '', '0', 'dropdown', '', ''),
(21, 1, 20, 4, 'information', 94, 'information_id=4', '', '0', '', '', ''),
(22, 1, 20, 6, 'information', 96, 'information_id=6', '', '0', '', '', ''),
(23, 1, 20, 3, 'information', 97, 'information_id=3', '', '0', '', '', ''),
(24, 1, 20, 5, 'information', 95, 'information_id=5', '', '0', '', '', ''),
(25, 1, 19, 8, 'manufacturer', 87, 'manufacturer_id=8', '', '0', '', '', ''),
(26, 1, 19, 9, 'manufacturer', 88, 'manufacturer_id=9', '', '0', '', '', ''),
(27, 1, 19, 7, 'manufacturer', 89, 'manufacturer_id=7', '', '0', '', '', ''),
(28, 1, 19, 5, 'manufacturer', 90, 'manufacturer_id=5', '', '0', '', '', ''),
(29, 1, 19, 6, 'manufacturer', 91, 'manufacturer_id=6', '', '0', '', '', ''),
(30, 1, 19, 10, 'manufacturer', 92, 'manufacturer_id=10', '', '0', '', '', ''),
(31, 1, 17, 42, 'product', 73, 'product_id=42', '', '0', '', '', ''),
(32, 1, 17, 30, 'product', 74, 'product_id=30', '', '0', '', '', ''),
(33, 1, 17, 28, 'product', 75, 'product_id=28', '', '0', '', '', ''),
(34, 1, 17, 41, 'product', 76, 'product_id=41', '', '0', '', '', ''),
(35, 1, 17, 48, 'product', 77, 'product_id=48', '', '0', '', '', ''),
(36, 1, 17, 32, 'product', 78, 'product_id=32', '', '0', '', '', ''),
(37, 1, 17, 44, 'product', 79, 'product_id=44', '', '0', '', '', ''),
(38, 1, 17, 45, 'product', 80, 'product_id=45', '', '0', '', '', ''),
(39, 1, 17, 31, 'product', 81, 'product_id=31', '', '0', '', '', ''),
(40, 1, 17, 29, 'product', 82, 'product_id=29', '', '0', '', '', ''),
(41, 1, 17, 49, 'product', 83, 'product_id=49', '', '0', '', '', ''),
(42, 1, 17, 33, 'product', 84, 'product_id=33', '', '0', '', '', ''),
(43, 1, 17, 46, 'product', 85, 'product_id=46', '', '0', '', '', ''),
(44, 1, 18, 20, 'category', 66, 'category_id=20', '', '0', '', '', ''),
(45, 1, 18, 57, 'category', 67, 'category_id=57', '', '0', '', '', ''),
(46, 1, 18, 17, 'category', 68, 'category_id=17', '', '0', '', '', ''),
(47, 1, 18, 24, 'category', 69, 'category_id=24', '', '0', '', '', ''),
(48, 1, 18, 33, 'category', 70, 'category_id=33', '', '0', '', '', ''),
(49, 1, 18, 34, 'category', 71, 'category_id=34', '', '0', '', '', ''),
(50, 1, 5, 0, 'link', 4, '', '', '0', 'dropdown', '', ''),
(51, 1, 5, 0, 'link', 11, '', '', '0', 'dropdown', '', ''),
(52, 1, 5, 0, 'link', 21, '', '', '0', 'dropdown', '', ''),
(53, 1, 5, 0, 'link', 25, '', '', '0', 'dropdown', '', ''),
(54, 1, 50, 42, 'product', 5, 'product_id=42', '', '0', '', '', ''),
(55, 1, 50, 30, 'product', 6, 'product_id=30', '', '0', '', '', ''),
(56, 1, 50, 47, 'product', 7, 'product_id=47', '', '0', '', '', ''),
(57, 1, 50, 28, 'product', 8, 'product_id=28', '', '0', '', '', ''),
(58, 1, 50, 41, 'product', 9, 'product_id=41', '', '0', '', '', ''),
(59, 1, 50, 40, 'product', 10, 'product_id=40', '', '0', '', '', ''),
(60, 1, 51, 48, 'product', 12, 'product_id=48', '', '0', '', '', ''),
(61, 1, 51, 36, 'product', 13, 'product_id=36', '', '0', '', '', ''),
(62, 1, 51, 34, 'product', 14, 'product_id=34', '', '0', '', '', ''),
(63, 1, 51, 32, 'product', 15, 'product_id=32', '', '0', '', '', ''),
(64, 1, 51, 43, 'product', 16, 'product_id=43', '', '0', '', '', ''),
(65, 1, 51, 44, 'product', 17, 'product_id=44', '', '0', '', '', ''),
(66, 1, 51, 45, 'product', 18, 'product_id=45', '', '0', '', '', ''),
(67, 1, 51, 31, 'product', 19, 'product_id=31', '', '0', '', '', ''),
(68, 1, 51, 29, 'product', 20, 'product_id=29', '', '0', '', '', ''),
(69, 1, 52, 49, 'product', 22, 'product_id=49', '', '0', '', '', ''),
(70, 1, 52, 33, 'product', 23, 'product_id=33', '', '0', '', '', ''),
(71, 1, 52, 46, 'product', 24, 'product_id=46', '', '0', '', '', ''),
(72, 1, 53, 30, 'product', 26, 'product_id=30', '', '0', '', '', ''),
(73, 1, 53, 28, 'product', 27, 'product_id=28', '', '0', '', '', ''),
(74, 1, 53, 48, 'product', 28, 'product_id=48', '', '0', '', '', ''),
(75, 1, 53, 44, 'product', 29, 'product_id=44', '', '0', '', '', ''),
(76, 1, 53, 31, 'product', 30, 'product_id=31', '', '0', '', '', ''),
(77, 1, 53, 49, 'product', 31, 'product_id=49', '', '0', '', '', ''),
(78, 1, 53, 46, 'product', 32, 'product_id=46', '', '0', '', '', ''),
(79, 1, 80, 17, 'category', 35, 'category_id=17', '', '0', 'dropdown', '', ''),
(80, 1, 6, 0, 'link', 34, '', '', '0', 'dropdown', '', ''),
(81, 1, 6, 0, 'link', 40, '', '', '0', 'dropdown', '', ''),
(82, 1, 6, 0, 'link', 44, '', '', '0', 'dropdown', '', ''),
(83, 1, 6, 0, 'link', 47, '', '', '0', 'dropdown', '', ''),
(84, 1, 80, 25, 'category', 36, 'category_id=25', '', '0', '', '', ''),
(85, 1, 80, 57, 'category', 37, 'category_id=57', '', '0', '', '', ''),
(86, 1, 80, 24, 'category', 38, 'category_id=24', '', '0', '', '', ''),
(87, 1, 81, 33, 'category', 42, 'category_id=33', '', '0', '', '', ''),
(88, 1, 80, 34, 'category', 39, 'category_id=34', '', '0', '', '', ''),
(89, 1, 81, 26, 'category', 41, 'category_id=26', '', '0', '', '', ''),
(90, 1, 81, 27, 'category', 43, 'category_id=27', '', '0', '', '', ''),
(91, 1, 82, 45, 'category', 46, 'category_id=45', '', '0', '', '', ''),
(92, 1, 82, 46, 'category', 45, 'category_id=46', '', '0', '', '', ''),
(93, 1, 83, 18, 'category', 48, 'category_id=18', '', '0', '', '', ''),
(94, 1, 83, 57, 'category', 49, 'category_id=57', '', '0', '', '', ''),
(95, 1, 83, 24, 'category', 50, 'category_id=24', '', '0', '', '', ''),
(96, 1, 83, 34, 'category', 51, 'category_id=34', '', '0', '', '', ''),
(97, 1, 7, 4, 'information', 60, 'information_id=4', '', '0', '', '', ''),
(98, 1, 7, 6, 'information', 61, 'information_id=6', '', '0', '', '', ''),
(99, 1, 7, 3, 'information', 62, 'information_id=3', '', '0', '', '', ''),
(100, 1, 7, 5, 'information', 63, 'information_id=5', '', '0', '', '', ''),
(101, 1, 3, 44, 'product', 99, 'product_id=44', '', '0', '', '', ''),
(102, 1, 3, 33, 'category', 100, 'category_id=33', '', '0', '', '', ''),
(103, 1, 3, 6, 'information', 102, 'information_id=6', '', '0', '', '', ''),
(104, 1, 3, 9, 'manufacturer', 103, 'manufacturer_id=9', '', '0', '', '', ''),
(105, 1, 3, 0, 'link', 101, 'index.php?route=account/return/add', '', '0', 'dropdown', '', ''),
(106, 1, 8, 8, 'manufacturer', 53, 'manufacturer_id=8', '', '0', 'dropdown', '', 'catalog/demo/apple_logo.jpg'),
(107, 1, 8, 9, 'manufacturer', 54, 'manufacturer_id=9', '', '0', 'dropdown', '', 'catalog/demo/canon_logo.jpg'),
(108, 1, 8, 7, 'manufacturer', 55, 'manufacturer_id=7', '', '0', 'dropdown', '', 'catalog/demo/manufacturer/brands-hp.png'),
(109, 1, 8, 5, 'manufacturer', 56, 'manufacturer_id=5', '', '0', 'dropdown', '', 'catalog/demo/manufacturer/brands-htc.png'),
(110, 1, 8, 6, 'manufacturer', 57, 'manufacturer_id=6', '', '0', 'dropdown', '', 'catalog/demo/palm_logo.jpg'),
(111, 1, 8, 10, 'manufacturer', 58, 'manufacturer_id=10', '', '0', 'dropdown', '', 'catalog/demo/sony_logo.jpg'),
(112, 1, 0, 0, 'link', 0, 'index.php?route=common/home', '', '0', 'dropdown', '', ''),
(113, 2, 0, 0, 'link', 0, 'index.php?route=common/home', '', '0', 'dropdown', '', ''),
(114, 2, 0, 3, 'information', 1, 'information_id=3', '', '0', 'dropdown', '', ''),
(115, 2, 0, 0, 'link', 2, 'index.php?route=information/sitemap', '', '0', 'dropdown', '', ''),
(116, 2, 0, 0, 'link', 3, 'index.php?route=information/contact', '', '0', 'dropdown', '', ''),
(117, 3, 0, 0, 'link', 0, '', '', '0', 'dropdown', 'fa-home', ''),
(118, 3, 0, 33, 'category', 6, 'category_id=33', '', '0', '', '', ''),
(119, 3, 0, 25, 'category', 7, 'category_id=25', '', '0', '', '', ''),
(120, 3, 0, 29, 'category', 8, 'category_id=29', '', '0', '', '', ''),
(121, 3, 120, 28, 'category', 9, 'category_id=28', '', '0', '', '', ''),
(122, 3, 121, 35, 'category', 10, 'category_id=35', '', '0', '', '', ''),
(123, 3, 117, 43, 'category', 1, 'category_id=43', '', '0', '', '', ''),
(124, 3, 117, 44, 'category', 2, 'category_id=44', '', '0', '', '', ''),
(125, 3, 117, 47, 'category', 3, 'category_id=47', '', '0', '', '', ''),
(126, 3, 117, 35, 'category', 4, 'category_id=35', '', '0', '', '', ''),
(127, 3, 0, 28, 'category', 5, 'category_id=28', '', '0', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_menu_group_description`
--

CREATE TABLE `pre_menu_group_description` (
  `menu_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_menu_group_description`
--

INSERT INTO `pre_menu_group_description` (`menu_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Tabbed'),
(2, 1, 'Lists'),
(3, 1, 'DropDown'),
(4, 1, 'Contact Us'),
(5, 1, 'Products'),
(6, 1, 'Categories'),
(7, 1, 'Pages'),
(8, 1, 'Manufacturers'),
(9, 1, 'Manufacturers'),
(10, 1, 'About Us'),
(11, 1, 'Apple'),
(12, 1, 'Canon'),
(13, 1, 'Hewlett-Packard'),
(14, 1, 'HTC'),
(15, 1, 'Palm'),
(16, 1, 'Sony'),
(17, 1, 'Products'),
(18, 1, 'Categories'),
(19, 1, 'Manufacturers'),
(20, 1, 'Pages'),
(21, 1, 'About Us'),
(22, 1, 'Delivery Information'),
(23, 1, 'Privacy Policy'),
(24, 1, 'Terms &amp; Conditions'),
(25, 1, 'Apple'),
(26, 1, 'Canon'),
(27, 1, 'Hewlett-Packard'),
(28, 1, 'HTC'),
(29, 1, 'Palm'),
(30, 1, 'Sony'),
(31, 1, 'Apple Cinema 30&quot;'),
(32, 1, 'Canon EOS 5D'),
(33, 1, 'HTC Touch HD'),
(34, 1, 'iMac'),
(35, 1, 'iPod Classic'),
(36, 1, 'iPod Touch'),
(37, 1, 'MacBook Air'),
(38, 1, 'MacBook Pro'),
(39, 1, 'Nikon D300'),
(40, 1, 'Palm Treo Pro'),
(41, 1, 'Samsung Galaxy Tab 10.1'),
(42, 1, 'Samsung SyncMaster 941BW'),
(43, 1, 'Sony VAIO'),
(44, 1, 'Desktops'),
(45, 1, 'Tablets'),
(46, 1, 'Software'),
(47, 1, 'Phones &amp; PDAs'),
(48, 1, 'Cameras'),
(49, 1, 'MP3 Players'),
(50, 1, 'Products Set 01'),
(51, 1, 'Products Set 02'),
(52, 1, 'Products Set 03'),
(53, 1, 'Products Set 04'),
(54, 1, 'Apple Cinema 30&quot;'),
(55, 1, 'Canon EOS 5D'),
(56, 1, 'HP LP3065'),
(57, 1, 'HTC Touch HD'),
(58, 1, 'iMac'),
(59, 1, 'iPhone'),
(60, 1, 'iPod Classic'),
(61, 1, 'iPod Nano'),
(62, 1, 'iPod Shuffle'),
(63, 1, 'iPod Touch'),
(64, 1, 'MacBook'),
(65, 1, 'MacBook Air'),
(66, 1, 'MacBook Pro'),
(67, 1, 'Nikon D300'),
(68, 1, 'Palm Treo Pro'),
(69, 1, 'Samsung Galaxy Tab 10.1'),
(70, 1, 'Samsung SyncMaster 941BW'),
(71, 1, 'Sony VAIO'),
(72, 1, 'Canon EOS 5D'),
(73, 1, 'HTC Touch HD'),
(74, 1, 'iPod Classic'),
(75, 1, 'MacBook Air'),
(76, 1, 'Nikon D300'),
(77, 1, 'Samsung Galaxy Tab 10.1'),
(78, 1, 'Sony VAIO'),
(79, 1, 'Software'),
(80, 1, 'Categories Set 01'),
(81, 1, 'Categories Set 02'),
(82, 1, 'Categories Set 03'),
(83, 1, 'Categories Set 04'),
(84, 1, 'Components'),
(85, 1, 'Tablets'),
(86, 1, 'Phones &amp; PDAs'),
(87, 1, 'Cameras'),
(88, 1, 'MP3 Players'),
(89, 1, 'PC'),
(90, 1, 'Mac'),
(91, 1, 'Windows'),
(92, 1, 'Macs'),
(93, 1, 'Laptops &amp; Notebooks'),
(94, 1, 'Tablets'),
(95, 1, 'Phones &amp; PDAs'),
(96, 1, 'MP3 Players'),
(97, 1, 'About Us'),
(98, 1, 'Delivery Information'),
(99, 1, 'Privacy Policy'),
(100, 1, 'Terms &amp; Conditions'),
(101, 1, 'MacBook Air'),
(102, 1, 'Cameras'),
(103, 1, 'Delivery Information'),
(104, 1, 'Canon'),
(105, 1, 'Returns'),
(106, 1, 'Apple'),
(107, 1, 'Canon'),
(108, 1, 'Hewlett-Packard'),
(109, 1, 'HTC'),
(110, 1, 'Palm'),
(111, 1, 'Sony'),
(112, 1, 'Home'),
(113, 1, 'Home'),
(114, 1, 'Privacy Policy'),
(115, 1, 'Site Map'),
(116, 1, 'Contact Us'),
(117, 1, 'Trang chủ'),
(118, 1, 'Cameras'),
(119, 1, 'Components'),
(120, 1, 'Mice and Trackballs'),
(121, 1, 'Monitors'),
(122, 1, 'test 1'),
(123, 1, 'test 11'),
(124, 1, 'test 12'),
(125, 1, 'test 15'),
(126, 1, 'test 1'),
(127, 1, 'Monitors');

-- --------------------------------------------------------

--
-- Table structure for table `pre_modification`
--

CREATE TABLE `pre_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_modification`
--

INSERT INTO `pre_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(5, 'AJAX QUICK CHECKOUT V5.0 BY DREAMVENTION', 'ajax_quick_checkout', 'dreamvention.com', '2.0.0.0', '', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<modification>\n	<name>AJAX QUICK CHECKOUT V5.0 BY DREAMVENTION</name>\n	<code>ajax_quick_checkout</code>\n	<id>ajax_quick_checkout</id>\n	<version>2.0.0.0</version>\n	<author>dreamvention.com</author>\n	<file path=\"catalog/controller/checkout/checkout.php\">\n		<operation>\n			<search><![CDATA[if (file_exists(DIR_TEMPLATE . $this->config->get(\'config_template\') . \'/template/checkout/checkout.tpl\')) {]]></search>\n			<add position=\"replace\" offset=\"4\"><![CDATA[\n			// a_vqmod_d_quickcheckout.xml\n			\n			if($this->config->get(\'d_quickcheckout_status\')){\n				$template = \'d_quickcheckout\';\n			}else{\n				$template = \'checkout\';\n			}\n			\n			if (file_exists(DIR_TEMPLATE . $this->config->get(\'config_template\') . \'/template/checkout/\'.$template.\'.tpl\')) {\n				$this->template = $this->config->get(\'config_template\') . \'/template/checkout/\'.$template.\'.tpl\';\n			} else {\n				$this->template = \'default/template/checkout/\'.$template.\'.tpl\';\n			}\n			$this->response->setOutput($this->load->view($this->template, $data));]]></add>\n		</operation>\n		<operation>\n			<search><![CDATA[$data[\'header\'] = $this->load->controller(\'common/header\');]]></search>\n			<add position=\"before\"><![CDATA[$data[\'d_quickcheckout\'] = $this->load->controller(\'module/d_quickcheckout\');]]></add>\n		</operation>\n	</file>\n	<file path=\"system/library/tax.php\">\n		<operation>\n			<search><![CDATA[final class Tax {]]></search>\n			<add position=\"after\"><![CDATA[\n	// a_vqmod_d_quickcheckout.xml\n	public function clearRates(){\n		$this->tax_rates = array();\n	}\n			]]></add>\n		</operation>\n\n	</file>\n	<!-- payment methods fix -->\n	<file path=\"catalog/view/theme/default/template/payment/cheque.tpl\">\n		<operation>\n			<search><![CDATA[$(\'#button-confirm\').bind(\'click\', function() {]]></search>\n			<add position=\"replace\"><![CDATA[$(\'#button-confirm\').bind(\'click\', function(event) {\n				event.stopImmediatePropagation()]]></add>\n		</operation>\n	</file>\n	<file path=\"catalog/view/theme/default/template/payment/pp_pro_uk.tpl\">\n		<operation>\n			<search><![CDATA[$(\'#button-confirm\').bind(\'click\', function() {]]></search>\n			<add position=\"replace\"><![CDATA[$(\'#button-confirm\').bind(\'click\', function(event) {\n				event.stopImmediatePropagation()]]></add>\n		</operation>\n	</file>\n	<file path=\"catalog/view/theme/default/template/payment/pp_pro.tpl\">\n		<operation>\n			<search><![CDATA[$(\'#button-confirm\').bind(\'click\', function() {]]></search>\n			<add position=\"replace\"><![CDATA[$(\'#button-confirm\').bind(\'click\', function(event) {\n				event.stopImmediatePropagation()]]></add>\n		</operation>\n	</file>\n</modification>\n', 1, '2016-10-16 22:58:23'),
(6, 'Infinite Scrolling', 'infinite-ccrolling', 'An Vũ', '1.0.0', '', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<modification>\n	<name>Infinite Scrolling</name>\n	<code>infinite-ccrolling</code>\n	<version>1.0.0</version>\n	<author>An Vũ</author>\n	<date>2016-10-17</date>\n	<file path=\"catalog/controller/product/category.php|catalog/controller/product/manufacturer.php|catalog/controller/product/search.php|catalog/controller/product/special.php\">\n        <operation>\n        	<search><![CDATA[$product_total]]></search>\n    		<add position=\"before\"><![CDATA[$data[\'next_page\'] = ($page+1);]]></add>\n        </operation>\n	</file>\n	<file path=\"catalog/view/theme/default/template/product/category.tpl|catalog/view/theme/default/template/product/manufacturer_list.tpl|catalog/view/theme/default/template/product/search.tpl|catalog/view/theme/default/template/product/special.tpl\">\n        <operation>\n        	<search><![CDATA[<?php echo $footer; ?>]]></search>\n    		<add position=\"before\"><![CDATA[\n<div id=\"infscrl_loader\" style=\"text-align:center\"><img src=\"image/catalog/loadingplswait.gif\" /></div>\n<input type=\"hidden\" id=\"pagenext\" value=\"<?php echo $next_page; ?>\" />\n<script language=\"javascript\">\n$(document).ready(function(){ \n	$(\'.product-layout\').parent().addClass(\"infscrlintro\"); \n});\n\n$(\'.pagination\').parent().parent().hide(); \n\nvar _throttleTimer = null;\nvar _throttleDelay = 100;\nvar $window = $(window);\nvar $document = $(document);\n\n$document.ready(function () {\n	$window\n		.off(\'scroll\', ScrollHandler)\n		.on(\'scroll\', ScrollHandler);\n});\n\nfunction ScrollHandler(e) {\n	//throttle event:\n	clearTimeout(_throttleTimer);\n	_throttleTimer = setTimeout(function () {\n		console.log(\'scroll\');\n\n		//do work\n		if ($window.scrollTop() + $window.height() > $document.height() - 400) {	\n			var pagenext = parseInt($(\'#pagenext\').val());\n			$.ajax({\n				url: \'<?php echo $_SERVER[\'REQUEST_URI\']; ?>&page=\'+pagenext,\n				dataType: \'html\',\n				beforeSend: function() {\n					var pagenext = parseInt($(\'#pagenext\').val());\n					$(\'#pagenext\').val(pagenext+1);\n					$(\'#infscrl_loader\').show(\'fade slow\'); \n				}, \n				success: function(html) {\n					var div = $(\'.product-layout\', $(html));\n					$(\'.infscrlintro\').append(div);\n					$(\'#grid-view\').trigger(\'click\');\n					if(!div || 0 === div.length) {\n						$(\'#infscrl_loader\').html(\'<strong>No More Products !!</strong>\'); \n					} else {\n						$(\'#infscrl_loader\').hide(\'fade slow\'); \n					}\n				}\n			});\n		}\n\n	}, _throttleDelay);\n}\n</script> \n			]]></add>\n        </operation>\n	</file>\n\n</modification>', 0, '2016-10-17 15:12:59'),
(14, 'Advanced Newsletter Subscribe PRO', 'adv_newsletter', 'anh.to87@gmail.com', '1.0', 'http://www.opcartstore.com', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<modification>\n    <name>Advanced Newsletter Subscribe PRO</name>\n    <code>adv_newsletter</code>\n    <version>1.0</version>\n    <author>anh.to87@gmail.com</author>\n    <link>http://www.opcartstore.com</link>\n    <file path=\"admin/controller/marketing/contact.php\">\n        <operation>\n            <search index=\"0\" trim=\"true\">\n                <![CDATA[$results = $this->model_customer_customer->getCustomers($customer_data);]]>\n            </search>\n            <add position=\"after\">\n                <![CDATA[\n                        if ($this->config->get(\'advanced_newsletter_status\'))\n                        {\n                            $this->load->model(\'module/adv_newsletter\');\n							\n							$send_for = $this->config->get(\'advanced_newsletter_send_for\');\n							\n                            $filter_data = array(\n                                \'filter_status\'  => (!empty($send_for) ? implode(\",\", $send_for) : 1)\n                            );\n                            $emails_newsletter    = $this->model_module_adv_newsletter->getEmails($filter_data);\n\n                            $results = array_merge($results, $emails_newsletter);\n                        }\n                ]]>\n            </add>\n        </operation>\n    </file>\n</modification>', 1, '2017-01-11 17:00:01'),
(10, 'Brainy Filter', 'brainyfilter', 'Giant Leap Lab', 'Ultimate 5.1.2 OC2', '', '<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>  \r\n   <id>Brainy Filter</id>\r\n   <name>Brainy Filter</name>\r\n   <code>brainyfilter</code>\r\n   <version>Ultimate 5.1.2 OC2</version>\r\n   <author>Giant Leap Lab</author>\r\n   \r\n   <file path=\"catalog/controller/product/*.php\">\r\n       <operation>\r\n           <search><![CDATA[$this->model_catalog_product->getProducts($filter_data)]]></search>\r\n           <add position=\"before\"><![CDATA[            $filter_data[\'filter_bfilter\'] = true;]]></add>\r\n       </operation>\r\n       <operation>\r\n           <search><![CDATA[= $this->model_catalog_product->getTotalProducts($filter_data)]]></search>\r\n           <add position=\"before\"><![CDATA[            $filter_data[\'filter_bfilter\'] = true;]]></add>\r\n       </operation>\r\n   </file>\r\n   \r\n   <file path=\"catalog/controller/product/category.php\">\r\n	  <operation>\r\n			<search><![CDATA[$category_info = $this->model_catalog_category->getCategory($category_id);]]></search>\r\n            <add position=\"after\"><![CDATA[\r\n                /* Brainy Filter (brainyfilter.xml) - Start ->*/\r\n                if (!$category_info) {\r\n                    $this->load->language(\'module/brainyfilter\');\r\n                    $category_info = array(\r\n                        \'name\' => $this->language->get(\'text_bf_page_title\'),\r\n                        \'description\' => \'\',\r\n                        \'meta_description\' => \'\',\r\n                        \'meta_keyword\' => \'\',\r\n                        \'meta_title\' => $this->language->get(\'text_bf_page_title\'),\r\n                        \'image\' => \'\',\r\n                    );\r\n                    $this->request->get[\'path\'] = 0;\r\n                    $showCategories = false;\r\n                    $route = \'module/brainyfilter/filter\';\r\n                    $path  = \'\';\r\n                } else {\r\n                    $route = \'product/category\';\r\n                    $path  = \'path=\' . $this->request->get[\'path\'];\r\n                    $showCategories = true;\r\n                }\r\n                /* Brainy Filter (brainyfilter.xml) - End ->*/\r\n                ]]>\r\n			</add>\r\n	  </operation>\r\n	  <operation>\r\n			<search><![CDATA[$results = $this->model_catalog_category->getCategories($category_id);]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n                /* Brainy Filter (brainyfilter.xml) - Start ->*/\r\n                if ($showCategories) {\r\n                $results = $this->model_catalog_category->getCategories($category_id);\r\n                } else {\r\n                    $results = array();\r\n                }\r\n                /* Brainy Filter (brainyfilter.xml) - End ->*/\r\n            ]]>\r\n			</add>\r\n	  </operation>\r\n	  <operation>\r\n			<search regex=\"true\"><![CDATA[/\\\'product\\/category\\\', \\\'path\\=\\\' \\. \\$this\\-\\>request\\-\\>get\\[\\\'path\\\'\\]/]]></search>\r\n            <add position=\"replace\"><![CDATA[$route, $path]]>\r\n			</add>\r\n	  </operation>\r\n        <operation>\r\n            <search><![CDATA[if ($page == 1) {]]></search>\r\n            <add position=\"before\">\r\n                <![CDATA[\r\n                /* Brainy Filter (brainyfilter.xml) - Start ->*/\r\n                if (isset($category_info[\'category_id\'])) {\r\n                /* Brainy Filter (brainyfilter.xml) - End ->*/]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[if ($limit && ceil($product_total / $limit) > $page) {]]></search>\r\n            <add position=\"after\" offset=\"2\">\r\n                <![CDATA[\r\n                /* Brainy Filter (brainyfilter.xml) - Start ->*/\r\n                }\r\n                /* Brainy Filter (brainyfilter.xml) - End ->*/]]>\r\n            </add>\r\n        </operation>\r\n   </file>\r\n   \r\n   <file path=\"catalog/controller/product/special.php\">\r\n        <operation>\r\n            <search><![CDATA[$product_total = $this->model_catalog_product->getTotalProductSpecials();]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n                $filter_data[\'filter_bfilter\'] = true;\r\n                $filter_data[\'filter_specials_only\'] = true;\r\n                $product_total = $this->model_catalog_product->getTotalProducts($filter_data);\r\n            ]]></add>\r\n        </operation>\r\n        <operation>\r\n            <search><![CDATA[$results = $this->model_catalog_product->getProductSpecials($filter_data);]]></search>\r\n            <add position=\"replace\"><![CDATA[\r\n                $results = $this->model_catalog_product->getProducts($filter_data);\r\n            ]]></add>\r\n        </operation>\r\n   </file>\r\n   \r\n   <file path=\"catalog/controller/product/search.php\">\r\n       <operation>\r\n           <search><![CDATA[if (isset($this->request->get[\'search\']) || isset($this->request->get[\'tag\'])) {]]></search>\r\n           <add position=\"replace\"><![CDATA[\r\n                    /* Brainy Filter (brainyfilter.xml) - Start ->*/\r\n                    /* Show product list in any case */\r\n					if (true) {\r\n                    /* Brainy Filter (brainyfilter.xml) - End ->*/\r\n                ]]>\r\n           </add>\r\n       </operation>\r\n   </file>\r\n   \r\n    <file path=\"catalog/model/catalog/product.php\">\r\n        <operation>\r\n            <search><![CDATA[public function getProducts($data = array()) {]]></search>\r\n            <add>\r\n                <![CDATA[\r\n    /**\r\n     * Custom getProducts() method added by Brainy Filter extension\r\n     */\r\n    public function getProducts($data = array()) \r\n    {\r\n        if (!isset($data[\'filter_bfilter\'])) {\r\n            return $this->getProductsOriginal($data);\r\n        }\r\n        $settings = $this->config->get(\'brainyfilter_layout_basic\');\r\n        if (isset($settings[\'global\'][\'subcategories_fix\']) && $settings[\'global\'][\'subcategories_fix\']) {\r\n            $data[\'filter_sub_category\'] = true;\r\n        }\r\n        $this->load->model(\'module/brainyfilter\');\r\n        $model = new ModelModuleBrainyFilter($this->registry);\r\n        $model->setData($data);\r\n        $sql = $model->prepareQueryForCategory();\r\n        $query = $this->db->query($sql);\r\n\r\n        $product_data = array();\r\n		foreach ($query->rows as $result) {\r\n			$product_data[$result[\'product_id\']] = $this->getProduct($result[\'product_id\']);\r\n		}\r\n\r\n		return $product_data;\r\n    }\r\n    \r\n    /** \r\n     * It is the original getProducts() method, which was renamed by Brainy Filter modification.\r\n     * A custom getProduct() method was added instead. \r\n     * Disable the Brainy Filter OCMOD modification in order to reset the method.\r\n     * Note: disabling of Brainy Filter modification will break the work of Brainy Filter extension.\r\n     */\r\n     public function getProductsOriginal($data = array()) { ]]>\r\n            </add>\r\n        </operation>\r\n        \r\n        <operation>\r\n            <search><![CDATA[public function getTotalProducts($data = array()) {]]></search>\r\n            <add>\r\n                <![CDATA[\r\n    /**\r\n     * Custom getTotalProducts() method added by Brainy Filter extension\r\n     */\r\n    public function getTotalProducts($data = array())\r\n    {\r\n        if (!isset($data[\'filter_bfilter\'])) {\r\n            return $this->getTotalProductsOriginal($data);\r\n        }\r\n        $settings = $this->config->get(\'brainyfilter_layout_basic\');\r\n        if (isset($settings[\'global\'][\'subcategories_fix\']) && $settings[\'global\'][\'subcategories_fix\']) {\r\n            $data[\'filter_sub_category\'] = true;\r\n        }\r\n        $this->load->model(\'module/brainyfilter\');\r\n        $model = new ModelModuleBrainyFilter($this->registry);\r\n        $model->setData($data);\r\n        $sql = $model->prepareQueryForTotal();\r\n		$query = $this->db->query($sql);\r\n\r\n		return $query->row[\'total\'];\r\n    }\r\n    \r\n    /** \r\n     * It is the original getTotalProducts() method, which was renamed by Brainy Filter modification.\r\n     * A custom getTotalProducts() method was added instead. \r\n     * Disable the Brainy Filter OCMOD modification in order to reset the method.\r\n     * Note: disabling of Brainy Filter modification will break the work of Brainy Filter extension.\r\n     */\r\n     public function getTotalProductsOriginal($data = array()) { ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n    <file path=\"catalog/model/checkout/order.php\">\r\n        <operation>\r\n            <search><![CDATA[$this->cache->delete(\'product\');]]></search>\r\n            <add position=\"before\"><![CDATA[\r\n                $this->load->model(\'module/brainyfilter\');\r\n                $bfModel = new ModelModuleBrainyFilter($this->registry);\r\n                $prodIds = array();\r\n                $res = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"order_product WHERE order_id = \'\" . (int)$order_id . \"\'\");\r\n                foreach($res->rows as $prod) {\r\n                    $prodIds[] = $prod[\'product_id\'];\r\n                }\r\n                $bfModel->updateStockCache($prodIds);\r\n            ]]></add>\r\n        </operation>\r\n    </file>\r\n</modification>', 1, '2017-01-08 16:17:38'),
(15, 'Oc2x post', 'Oc2x post', 'PhongLG', 'OC 2.x', '', '<modification>\r\n	<name>Oc2x post</name>\r\n	<code>Oc2x post</code>\r\n	<id>Oc2x post</id>\r\n	<version>OC 2.x</version>\r\n	<author>PhongLG</author>\r\n\r\n	<file path=\"admin/controller/common/menu.php\">\r\n		<operation>\r\n			<search><![CDATA[\r\n				$this->load->language(\'common/menu\');	\r\n			]]></search>\r\n			<add position=\"after\"><![CDATA[\r\n				$this->load->model(\'user/mangeuser\');\r\n				$this->session->data[\'userpost\']=$this->model_user_mangeuser->getUserpostpermission($this->session->data[\'user_id\']);\r\n				$data[\'postpermission\']=$this->session->data[\'userpost\'][\'postpermission\'];\r\n				$this->load->language(\'common/menupost\');\r\n				$data[\'text_oc2xpost\'] = $this->language->get(\'text_oc2xpost\');\r\n				$data[\'text_post\'] = $this->language->get(\'text_post\');\r\n				$data[\'text_downloadpost\'] = \'Download File\';\r\n				$data[\'text_thread\'] = $this->language->get(\'text_thread\');\r\n				$data[\'text_relatespost\'] = $this->language->get(\'text_relatespost\');\r\n				$data[\'text_commentspost\'] = $this->language->get(\'text_commentspost\');\r\n				$data[\'text_reportspost\'] = $this->language->get(\'text_reportspost\');\r\n				$data[\'text_mangeuser\'] = $this->language->get(\'text_mangeuser\');\r\n				$data[\'text_settingpost\'] = $this->language->get(\'text_settingpost\');\r\n				\r\n				\r\n				$data[\'post\'] = $this->url->link(\'catalog/post\', \'token=\' . $this->session->data[\'token\'], \'SSL\');	\r\n				$data[\'thread\'] = $this->url->link(\'catalog/thread\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n				$data[\'downloadpost\'] = $this->url->link(\'catalog/downloadpost\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n				$data[\'commentspost\'] = $this->url->link(\'catalog/reviewpost\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n				$data[\'reportspost\'] = $this->url->link(\'report/post_viewed\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n				$data[\'mangeuser\'] = $this->url->link(\'user/mangeuser\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n				$data[\'settingpost\'] = $this->url->link(\'setting/settingpost\', \'token=\' . $this->session->data[\'token\'], \'SSL\');\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	\r\n	<file path=\"admin/view/template/common/menu.tpl\">\r\n		<operation>\r\n			<search><![CDATA[\r\n				 <li id=\"sale\"><a class=\"parent\"><i class=\"fa fa-shopping-cart fa-fw\"></i> <span><?php echo $text_sale; ?></span></a>\r\n			]]></search>\r\n			<add  position=\"before\"><![CDATA[\r\n				<li><a class=\"parent\"><i class=\"fa fa-file-text-o fa-fw\"></i> <span><?php echo $text_oc2xpost;?></span></a>\r\n					<ul>\r\n					  <?php\r\n						if($postpermission>0){\r\n							echo \"<li><a href=\'\".$post.\"\'>\".$text_post.\"</a></li>\";\r\n							echo \"<li><a href=\'\".$downloadpost.\"\'>\".$text_downloadpost.\"</a></li>\";\r\n						}\r\n						if($postpermission==3)\r\n						echo \"\r\n							<li><a href=\'\".$commentspost.\"\'>\".$text_commentspost.\"</a></li>\r\n							<li><a href=\'\".$reportspost.\"\'>\".$text_reportspost.\"</a></li>\r\n							  <li><a href=\'\".$thread.\"\'>\".$text_thread.\"</a></li>\r\n							 <li><a href=\'\".$mangeuser.\"\'>\".$text_mangeuser.\"</a></li>\r\n							 <li><a href=\'\".$settingpost.\"\'>\".$text_settingpost.\"</a></li>\r\n						\";\r\n					  ?>\r\n					</ul>\r\n				</li>\r\n			]]></add>\r\n		</operation>\r\n	</file>	\r\n	<file path=\"catalog/controller/common/seo_url.php\">\r\n		<operation>\r\n			<search ><![CDATA[if ($url[0] == \'manufacturer_id\') {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n					if ($url[0] == \'thread_id\') {\r\n						if (!isset($this->request->get[\'thread\'])) {\r\n							$this->request->get[\'thread\'] = $url[1];\r\n						} else {\r\n							$this->request->get[\'thread\'] .= \'_\' . $url[1];\r\n						}\r\n					}\r\n\r\n					if ($url[0] == \'post_id\') {\r\n						$this->request->get[\'post_id\'] = $url[1];\r\n					}\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search ><![CDATA[} elseif (isset($this->request->get[\'information_id\'])) {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				} elseif (isset($this->request->get[\'post_id\'])) {\r\n					$this->request->get[\'route\'] = \'information/post\';\r\n				} elseif (isset($this->request->get[\'thread\'])) {\r\n					$this->request->get[\'route\'] = \'information/thread\';\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search ><![CDATA[($data[\'route\'] == \'information/information\' && $key == \'information_id\')]]></search>\r\n			<add position=\"replace\"><![CDATA[($data[\'route\'] == \'information/information\' && $key == \'information_id\') || ($data[\'route\'] == \'information/post\' && $key == \'post_id\')]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search ><![CDATA[} elseif ($key == \'path\') {]]></search>\r\n			<add position=\"before\"><![CDATA[\r\n				} elseif ($key == \'thread\') {\r\n					$threads = explode(\'_\', $value);\r\n\r\n					foreach ($threads as $thread) {\r\n						$query = $this->db->query(\"SELECT * FROM \" . DB_PREFIX . \"url_alias WHERE `query` = \'thread_id=\" . (int)$thread . \"\'\");\r\n\r\n						if ($query->num_rows && $query->row[\'keyword\']) {\r\n							$url .= \'/\' . $query->row[\'keyword\'];\r\n						} else {\r\n							$url = \'\';\r\n\r\n							break;\r\n						}\r\n					}\r\n\r\n					unset($data[$key]);\r\n			]]></add>\r\n		</operation>\r\n		<operation>\r\n			<search><![CDATA[$url[0] != \'product_id\']]></search>\r\n			<add  position=\"replace\"><![CDATA[$url[0] != \'product_id\' && $url[0] != \'thread_id\' && $url[0] != \'post_id\']]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2017-01-16 16:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `pre_module`
--

CREATE TABLE `pre_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_module`
--

INSERT INTO `pre_module` (`module_id`, `name`, `code`, `setting`) VALUES
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, '[Trang chủ] &gt;&gt; Sản phẩm nổi bật', 'featured', '{\"name\":\"[Trang ch\\u1ee7] &gt;&gt; S\\u1ea3n ph\\u1ea9m n\\u1ed5i b\\u1eadt\",\"title\":{\"1\":\"Thi\\u1ebft b\\u1ecb nh\\u00e0 b\\u1ebfp\",\"2\":\"Kitchen\"},\"product\":[\"58\",\"59\",\"66\",\"73\",\"70\"],\"title2\":{\"1\":\"Ch\\u0103m s\\u00f3c trang ph\\u1ee5c\",\"2\":\"Laundry\"},\"product2\":[\"51\",\"53\",\"52\",\"54\",\"55\"],\"title3\":{\"1\":\"Ch\\u0103m s\\u00f3c nh\\u00e0 c\\u1eeda\",\"2\":\"Wellbeing\"},\"product3\":[\"61\",\"62\",\"63\",\"64\",\"65\"],\"limit\":\"5\",\"width\":\"720\",\"height\":\"720\",\"status\":\"1\",\"banner_left\":{\"image\":\"\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_right\":{\"image\":\"\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_bottom1\":{\"image\":\"\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"}}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"width\":\"1900\",\"width_mobile\":\"750\",\"height\":\"500\",\"height_mobile\":\"730\",\"mode\":\"cover\",\"effect\":\"simpleFade\",\"thumbnail\":\"false\",\"loader\":\"bar\",\"bar_position\":\"bottom\",\"hover\":\"true\",\"navigation_hover\":\"true\",\"pagination\":\"false\",\"time\":\"5\",\"skin\":\"camera_black_skin\",\"status\":\"1\",\"banners\":[{\"image\":\"catalog\\/slideshow\\/slideshow-desktop-3.jpg\",\"image_mobile\":\"catalog\\/slideshow\\/slideshow-mobile-3.jpg\",\"link\":\"#\",\"name_link\":{\"1\":\"Xem ngay\",\"2\":\"See more\"},\"video\":\"\",\"html_effect\":\"\",\"html\":{\"1\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:36px&quot;&gt;\\u01afu \\u0111\\u00e3i \\u0111\\u1eb7c bi\\u1ec7t khi mua b\\u1ebfp \\u00e2m&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\",\"2\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:36px&quot;&gt;Special offer when buying a built-in stove&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\"}},{\"image\":\"catalog\\/slideshow\\/slideshow-desktop-4.jpg\",\"image_mobile\":\"catalog\\/slideshow\\/slideshow-mobile-4.jpg\",\"link\":\"#\",\"name_link\":{\"1\":\"Xem ngay\",\"2\":\"See more\"},\"video\":\"\",\"html_effect\":\"\",\"html\":{\"1\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:36px&quot;&gt;\\u01afu \\u0111\\u00e3i cho m\\u00e1y l\\u1ecdc kh\\u00f4ng kh\\u00ed&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\",\"2\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:36px&quot;&gt;Deals for air purifiers&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\"}},{\"image\":\"catalog\\/slideshow\\/slideshow-desktop-5.jpg\",\"image_mobile\":\"catalog\\/slideshow\\/slideshow-mobile-5.jpg\",\"link\":\"\",\"name_link\":{\"1\":\"\",\"2\":\"\"},\"video\":\"\",\"html_effect\":\"\",\"html\":{\"1\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:28px&quot;&gt;T\\u01b0 duy Thu\\u0323y \\u0110i\\u00ea\\u0309n.&lt;br \\/&gt;\\r\\nN\\u00e2ng t\\u00e2\\u0300m cu\\u00f4\\u0323c s\\u00f4\\u0301ng.&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\",\"2\":\"&lt;p&gt;&lt;strong&gt;&lt;span style=&quot;font-size:28px&quot;&gt;Swedish thinking.&lt;br \\/&gt;\\r\\nElevate life.&lt;\\/span&gt;&lt;\\/strong&gt;&lt;\\/p&gt;\\r\\n\"}},{\"image\":\"catalog\\/banner\\/Untitled-3.png\",\"image_mobile\":\"catalog\\/banner\\/Untitled34.png\",\"link\":\"\",\"name_link\":{\"1\":\"\",\"2\":\"\"},\"video\":\"\",\"html_effect\":\"\",\"html\":{\"1\":\"&lt;p&gt;&lt;span style=&quot;font-size:26px&quot;&gt;&lt;strong&gt;Kh\\u00e1m ph\\u00e1 d\\u00f2ng&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;&amp;nbsp;&lt;\\/p&gt;\\r\\n\\r\\n&lt;p&gt;&lt;span style=&quot;font-size:26px&quot;&gt;&lt;strong&gt;N\\u1ed3i \\u00c1p Su\\u1ea5t&amp;nbsp;UltimateCare M\\u1edbi&lt;\\/strong&gt;&lt;\\/span&gt;&lt;\\/p&gt;\\r\\n\",\"2\":\"\"}}]}'),
(56, '[Trang chủ] &gt;&gt; 2 Banner', 'banner_grid', '{\"name\":\"[Trang ch\\u1ee7] &gt;&gt; 2 Banner\",\"banner_id\":\"13\",\"perrow_id\":\"col-lg-12 col-md-12 col-sm-12 col-xs-12\",\"width\":\"950\",\"height\":\"600\",\"status\":\"4\"}'),
(43, 'Category / Column Left', 'brainyfilter', '{\"layout_id\":\"3\",\"position\":\"column_left\",\"sort_order\":\"0\",\"status\":\"1\",\"bf_layout_id\":\"43\",\"name\":\"Category \\/ Column Left\"}'),
(36, 'Home page', 'special', '{\"name\":\"Home page\",\"limit\":\"8\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_left\":{\"image\":\"catalog\\/banner\\/banner6-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_right\":{\"image\":\"catalog\\/banner\\/banner4-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner8.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"}}'),
(42, 'Brainy Filter Layout / Column Left', 'brainyfilter', '{\"layout_id\":\"15\",\"position\":\"column_left\",\"sort_order\":\"0\",\"status\":\"1\",\"bf_layout_id\":\"42\",\"name\":\"Brainy Filter Layout \\/ Column Left\"}'),
(54, '[Trang chủ] &gt;&gt; Lý do', 'banner_grid', '{\"name\":\"[Trang ch\\u1ee7] &gt;&gt; Ly\\u0301 do\",\"banner_id\":\"11\",\"perrow_id\":\"col-lg-12 col-md-12 col-sm-12 col-xs-12\",\"width\":\"50\",\"height\":\"50\",\"status\":\"2\"}'),
(39, 'Home page', 'latest', '{\"name\":\"Home page\",\"limit\":\"8\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_left\":{\"image\":\"catalog\\/banner\\/banner4-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_right\":{\"image\":\"catalog\\/banner\\/banner7-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner8.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"}}'),
(40, 'Home page', 'bestseller', '{\"name\":\"Home page\",\"limit\":\"5\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_left\":{\"image\":\"catalog\\/banner\\/banner4-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"http:\\/\\/localhost\\/oc21ct\\/quantri\\/\"},\"banner_right\":{\"image\":\"catalog\\/banner\\/banner5-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"}}'),
(44, 'Home page', 'latest_products_brand', '{\"name\":\"Home page\",\"manufacturer_id\":\"8\",\"limit\":\"8\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_left\":{\"image\":\"catalog\\/banner\\/banner5-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_right\":{\"image\":\"catalog\\/banner\\/banner7-279x414.png\",\"width\":\"270\",\"height\":\"350\",\"link\":\"\"},\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"catalog\\/banner\\/banner8.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"\",\"scale\":\"100%\"}}'),
(45, 'Home page', 'latest_products_category', '{\"name\":\"Home page\",\"category_id\":\"20\",\"subcats\":\"ctabs\",\"pmin\":\"1\",\"limit\":\"8\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"http:\\/\\/localhost\\/oc21ct\\/quantri\\/\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"http:\\/\\/localhost\\/oc21ct\\/quantri\\/\",\"scale\":\"100%\"}}'),
(46, 'Home page', 'product_tab', '{\"name\":\"Home page\",\"featured_products_status\":\"1\",\"latest_products_status\":\"1\",\"bestseller_products_status\":\"1\",\"special_products_status\":\"1\",\"product\":[\"42\",\"30\",\"47\",\"28\",\"41\"],\"limit\":\"8\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\",\"banner_bottom1\":{\"image\":\"catalog\\/banner\\/banner3.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"http:\\/\\/localhost\\/oc21ct\\/quantri\\/\",\"scale\":\"100%\"},\"banner_bottom2\":{\"image\":\"catalog\\/banner\\/banner8.jpg\",\"width\":\"1170\",\"height\":\"150\",\"link\":\"http:\\/\\/localhost\\/oc21ct\\/quantri\\/\",\"scale\":\"100%\"}}'),
(47, 'Home page', 'plgselectthread', '{\"name\":\"Home page\",\"module_description\":{\"1\":{\"title\":\"What is this?\",\"description\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"2\":{\"title\":\"What is this?\",\"description\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\"}},\"status\":\"1\",\"path\":\"Tin t\\u1ee9c\",\"parent_id\":\"1\",\"showsubthread\":\"1\",\"width\":\"500\",\"height\":\"333\",\"limit\":\"5\"}'),
(48, 'ATT FILE', 'xform', '{\"name\":\"ATT FILE\",\"formId\":\"4\",\"status\":1}'),
(49, '[Trang chủ] &gt; Tin tức nổi bật', 'postselected', '{\"name\":\"[Trang ch\\u1ee7] &gt; Tin t\\u1ee9c n\\u1ed5i b\\u1eadt\",\"post\":[\"1\",\"2\"],\"limit\":\"5\",\"width\":\"220\",\"height\":\"220\",\"status\":\"1\"}'),
(52, 'Sản phẩm nổi bật', 'productcategory', '{\"name\":\"S\\u1ea3n ph\\u1ea9m n\\u1ed5i b\\u1eadt\",\"category\":[\"25\"],\"limit\":\"5\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(55, '[Trang chủ] &gt;&gt; Video', 'banner_grid', '{\"name\":\"[Trang ch\\u1ee7] &gt;&gt; Video\",\"banner_id\":\"12\",\"perrow_id\":\"col-lg-12 col-md-12 col-sm-12 col-xs-12\",\"width\":\"1900\",\"height\":\"600\",\"status\":\"3\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pre_navigation`
--

CREATE TABLE `pre_navigation` (
  `id` int(11) NOT NULL,
  `title` longtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `parent_id` int(128) NOT NULL DEFAULT 0,
  `subcontent` text NOT NULL,
  `type` varchar(128) NOT NULL,
  `type_id` int(128) NOT NULL,
  `widths` int(11) NOT NULL,
  `columns` int(11) NOT NULL,
  `activemega` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_option`
--

CREATE TABLE `pre_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_option_description`
--

CREATE TABLE `pre_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_option_value`
--

CREATE TABLE `pre_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_option_value_description`
--

CREATE TABLE `pre_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_order`
--

CREATE TABLE `pre_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order`
--

INSERT INTO `pre_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(10, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', 'Tiền Giang', '000000', 'Việt Nam', 230, 'Tiền Giang', 4257, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'Tiền Giang', '000000', 'Việt Nam', 230, 'Tiền Giang', 4257, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '1100080.3000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/70.4.222 Chrome/64.4.3282.222 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2018-06-07 13:41:48', '2018-06-07 13:41:48'),
(4, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/oc21ct/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '605.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2016-10-16 23:25:41', '2016-10-16 23:25:41'),
(5, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/oc21ct/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '105.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2016-12-19 17:30:26', '2016-12-19 17:30:26'),
(6, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/oc21ct/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'Hà Giang', '000000', 'Việt Nam', 230, 'Hà Giang', 3772, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '85.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2016-12-22 23:31:54', '2016-12-22 23:31:54'),
(7, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/oc21ct/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '1005.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2016-12-23 12:44:54', '2016-12-23 12:44:54'),
(8, 0, 'INV-2013-00', 0, 'Your Store', 'http://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '500.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.234.230.186', '171.234.230.186', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/66.4.104 Chrome/60.4.3112.104 Safari/537.36', 'vi-VN,vi;q=0.8,fr-FR;q=0.6,fr;q=0.4,en-US;q=0.2,en;q=0.2', '2017-09-08 10:39:48', '2017-09-08 10:39:48'),
(9, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '500.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/68.4.194 Chrome/62.4.3202.194 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2018-05-06 20:06:47', '2018-05-06 20:06:47'),
(12, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, 'tesst', 'tesst', 'tesst@mail.com', '123456789', '', '[]', 'tesst', 'tesst', '', 'tesst', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', 'tesst', 'tesst', '', 'tesst', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55101.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8,pt;q=0.7,zh-CN;q=0.6,zh;q=0.5', '2019-01-19 15:17:17', '2019-01-19 15:17:17'),
(13, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, 'tesst', 'tesst', 'tesst@mail.com', 'quy_kt', '', '[]', 'tesst', 'tesst', '', 'tesst', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '500.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8,pt;q=0.7,zh-CN;q=0.6,zh;q=0.5', '2019-04-20 10:48:24', '2019-04-20 10:48:24'),
(14, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, 'tesst', 'tesst', 'tesst@mail.com', 'quy_kt', '', '[]', 'tesst', 'tesst', '', 'tesst', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '500.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8,pt;q=0.7,zh-CN;q=0.6,zh;q=0.5', '2019-04-20 11:01:54', '2019-04-20 11:01:54'),
(15, 0, 'INV-2013-00', 0, 'Your Store', 'http://localhost/source/', 0, 1, '', '', '', 'quy_kt', '', '[]', '', '', '', '', '', 'Hòa Bình', '000000', 'Việt Nam', 230, 'Hòa Bình', 3778, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '', '', 0, '', 0, '', '[]', '', '', '', '2500.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8,pt;q=0.7,zh-CN;q=0.6,zh;q=0.5', '2019-05-08 10:56:34', '2019-05-08 10:56:34'),
(16, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55200.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '123.26.22.112', '123.26.22.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2021-12-29 10:26:21', '2021-12-29 10:26:21'),
(17, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, 'Hoàng', 'Trường', 'cdcntt18truong@gmail.com', 'hethong', '', '[]', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Online payment with VTC Pay <a  target=\"_blank\" href=\"https://pay.vtc.vn/huong-dan-472/tich-hop-23/huong-dan-tich-hop-website-12', 'vtcpay', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', 'dấdasdasdasdasdasd', '200.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '123.26.22.112', '123.26.22.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2021-12-29 13:54:46', '2021-12-29 13:54:46'),
(18, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, 'Hoàng', 'Trường', 'cdcntt18truong@gmail.com', 'hethong', '', '[]', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Online payment with VTC Pay <a  target=\"_blank\" href=\"https://pay.vtc.vn/huong-dan-472/tich-hop-23/huong-dan-tich-hop-website-12', 'vtcpay', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', 'dấdasdasdasdasdasd', '200.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '123.26.22.112', '123.26.22.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2021-12-29 13:55:27', '2021-12-29 13:55:27'),
(19, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, 'Hoàng', 'Trường', 'cdcntt18truong@gmail.com', 'hethong', '', '[]', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Online payment with VTC Pay <a  target=\"_blank\" href=\"https://pay.vtc.vn/huong-dan-472/tich-hop-23/huong-dan-tich-hop-website-12', 'vtcpay', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', 'dấdasdasdasdasdasd', '55100.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '123.26.22.112', '123.26.22.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2021-12-29 15:33:39', '2021-12-29 15:33:39'),
(20, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, 'Hoàng', 'Trường', 'cdcntt18truong@gmail.com', 'hethong', '', '[]', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Payments Online via VNPAY', 'vnpay_payment', 'Hoàng', 'Trường', '', 'hcm', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', 'dấdasdasdasdasdasd', '55200.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '14.165.196.235', '14.165.196.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2021-12-30 13:44:05', '2021-12-30 13:44:05'),
(21, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55200.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '14.174.124.132', '14.174.124.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', 'en-US,en;q=0.9', '2022-01-03 11:04:51', '2022-01-03 11:04:51'),
(22, 0, 'INV-2013-00', 0, 'Your Store', 'https://maadela.com.vn/', 0, 1, '', '', '', 'admin_maadela', '', '[]', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55100.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.84.156', '116.108.84.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-10 16:36:46', '2022-01-10 16:36:46'),
(23, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 1, 1, 'Trần', 'Quy', 'longquyawd@gmail.com', '0943348947', '', '', 'Trần', 'Quy', '', '54/8A Nguyễn Bỉnh Khiêm, Phường Đakao, Quận 1, TP. HCM', '', 'Thái Bình', '000000', 'Việt Nam', 230, 'Thái Bình', 4253, '{firstname} {lastname}{company}\n{address_1}{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', 'Trần', 'Quy', '', '54/8A Nguyễn Bỉnh Khiêm, Phường Đakao, Quận 1, TP. HCM', '', 'Thái Bình', '000000', 'Việt Nam', 230, 'Thái Bình', 4253, '{firstname} {lastname}{company}\n{address_1}{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55720.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.84.156', '116.108.84.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-14 16:44:22', '2022-01-14 16:44:22'),
(24, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', 'TP Hồ Chí Minh', '000000', 'Việt Nam', 230, 'TP Hồ Chí Minh', 3780, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '55080.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.84.156', '116.108.84.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.55', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-14 16:44:47', '2022-01-14 16:44:47'),
(25, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'longquyawd@gmail.com', '', '[]', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '114205000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.84.156', '116.108.84.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-17 10:07:32', '2022-01-17 10:07:32'),
(26, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '22745000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:96.0) Gecko/20100101 Firefox/96.0', 'vi-VN,vi;q=0.8,en-US;q=0.5,en;q=0.3', '2022-01-18 16:43:49', '2022-01-18 16:43:49'),
(27, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'admin_maadela2', '', '[]', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 230, '', 3780, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '24540000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-19 17:16:47', '2022-01-19 17:16:47'),
(28, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '45430000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.53 Mobile/15E148 Safari/604.1', 'vi-vn', '2022-01-20 09:43:01', '2022-01-20 09:43:01'),
(29, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'tesst', 'tesst@mail.com', '+84123456789', '', '[]', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '22690000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-20 10:47:22', '2022-01-20 10:47:22'),
(30, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Phí vận chuyển cố định', 'flat.flat', '', '22740000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi', '2022-01-20 10:13:31', '2022-01-20 10:13:31'),
(41, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'admin_maadela2', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '24490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-20 14:02:38', '2022-01-20 14:02:38'),
(42, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '14990000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36', 'vi,en;q=0.9,en-US;q=0.8', '2022-01-20 14:21:59', '2022-01-20 14:21:59'),
(43, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '19790000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '1.53.56.44', '1.53.56.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5,de;q=0.4,es;q=0.3,ko;q=0.2', '2022-01-20 16:13:29', '2022-01-20 16:13:29'),
(44, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '22690000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1 Edg/97.0.4692.71', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-21 08:51:50', '2022-01-21 08:51:50'),
(35, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'tesst', 'tesst@mail.com', '+84123456789', '', '[]', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '22690000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-20 10:57:04', '2022-01-20 10:57:04'),
(37, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'tesst', 'tesst@mail.com', '+84123456789', '', '[]', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '22690000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-20 11:00:31', '2022-01-20 11:00:31'),
(40, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'tesst', 'tesst@mail.com', '+84123456789', '', '[]', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', 'tesst', '', 'test', '', 'Quận 1', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 1', 4466, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '45380000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.108.80.23', '116.108.80.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36 Edg/97.0.1072.62', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-20 11:35:44', '2022-01-20 11:35:44'),
(45, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Miễn phí vận chuyển', 'free.free', '', '24490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '113.169.79.50', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 Edg/97.0.1072.69', 'vi,en-US;q=0.9,en;q=0.8', '2022-01-28 14:25:34', '2022-01-28 14:25:34'),
(46, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Miễn phí vận chuyển', 'free.free', '', '4490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '113.185.74.91', '', 'Mozilla/5.0 (Linux; Android 11; V2116) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.101 Mobile Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2022-02-20 19:24:03', '2022-02-20 19:24:03'),
(47, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'Nguyễn', 'quochung9920@gmail.com', '+84522956799', '', '[]', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '8490000.0000', 1, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-09 10:16:49', '2022-03-09 10:16:49'),
(48, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'Nguyễn', 'quochung9920@gmail.com', '+84522956799', '', '[]', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '12690000.0000', 1, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-09 10:18:40', '2022-03-09 10:18:41'),
(49, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'Nguyễn', 'quochung9920@gmail.com', '+84522956799', '', '[]', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '12690000.0000', 1, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-09 10:19:21', '2022-03-09 10:19:22'),
(50, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'Nguyễn', 'quochung9920@gmail.com', '+84522956799', '', '[]', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '26890000.0000', 1, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-09 10:20:24', '2022-03-09 10:20:24'),
(51, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', 'Nguyễn', 'quochung9920@gmail.com', '+84522956799', '', '[]', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', 'Nguyễn', '', 'trgfdfsfdsfs', '', 'Huyện Củ Chi', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Huyện Củ Chi', 4487, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '15690000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-09 14:46:33', '2022-03-09 14:46:33'),
(52, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '11480000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '171.252.155.52', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-10 13:59:45', '2022-03-10 13:59:45'),
(53, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', 'conghoang@gmail.com', '0907638322', '', '[]', '', '', '', '154 Nguyễn Đình Chiều', '', 'Quận 3', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 3', 4468, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Chuyển khoản ngân hàng', 'bank_transfer', '', '', '', '154 Nguyễn Đình Chiều', '', 'Quận 3', '000000', 'Hồ Chí Minh - Sài Gòn', 286, 'Quận 3', 4468, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '8490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '113.173.88.12', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/99.0.94 Chrome/93.0.4577.94 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2022-03-10 20:07:03', '2022-03-10 20:07:03'),
(54, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Miễn phí vận chuyển', 'free.free', '', '8490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '116.109.184.112', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'vi-VN,vi;q=0.9,fr-FR;q=0.8,fr;q=0.7,en-US;q=0.6,en;q=0.5', '2022-03-11 16:55:30', '2022-03-11 16:55:30'),
(55, 0, 'INV-2013-00', 0, 'Maadela', 'https://maadela.com.vn/', 0, 1, '', '', '', 'hethong', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '8490000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '1.53.171.224', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-03-11 16:47:32', '2022-03-11 16:47:32'),
(56, 0, 'INV-2013-00', 0, 'ABC', 'http://localhost/webbanhang/', 0, 1, '', '', '', '', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', '', 0, '', 0, '', '[]', 'Miễn phí vận chuyển', 'free.free', '', '3000000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-05-15 04:13:40', '2022-05-15 04:13:40'),
(57, 0, 'INV-2013-00', 0, 'ABC', 'http://localhost/webbanhang/', 3, 1, 'Nguyễn', 'Hưng', 'quochung9920@gmail.com', '0522956799', '', '', 'Nguyễn', 'Hưng', '', '129/23/12 Hoàng Văn Thụ, Phường 8', '', 'Phú Nhuận', '70000', 'An Giang', 258, 'Huyện Tịnh Biên', 4240, '{firstname} {lastname}{company}\n{address_1}{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', 'Nguyễn', 'Hưng', '', '129/23/12 Hoàng Văn Thụ, Phường 8', '', 'Phú Nhuận', '70000', 'An Giang', 258, 'Huyện Tịnh Biên', 4240, '{firstname} {lastname}{company}\n{address_1}{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '13658000.0000', 1, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-05-15 05:29:25', '2022-05-15 05:29:25'),
(58, 0, 'INV-2013-00', 0, 'ABC', 'http://localhost/webbanhang/', 0, 1, '', '', '', 'test_pdo', '', '[]', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Thu tiền khi giao hàng', 'cod', '', '', '', '', '', '', '000000', 'Hồ Chí Minh - Sài Gòn', 286, '', 0, '{firstname} {lastname}\n{company}\n{address_1}\n{address_2}\n{city} {postcode}\n{zone}\n{country}', '[]', 'Miễn phí vận chuyển', 'free.free', '', '90470000.0000', 0, 0, '0.0000', 0, '', 1, 4, 'VND', '1.00000000', '::1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36', 'en-US,en;q=0.9,vi;q=0.8', '2022-05-15 05:41:12', '2022-05-15 05:41:12');

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_custom_field`
--

CREATE TABLE `pre_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_history`
--

CREATE TABLE `pre_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order_history`
--

INSERT INTO `pre_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(27, 47, 1, 1, 'HƯỚNG DẪN THANH TOÁN QUA NGÂN HÀNG\n\nSố tài khoản: ...\r\nTên chủ tài khoản: ...\r\nNgân hàng: ...\r\nChi nhánh: ...\n\nSau khi chuyển tiền, Quý khách liên hệ bộ phận chăm sóc khách hàng để được xác nhận đã thanh toán xong tiền hàng và tiền cước vận chuyển (nếu có).', '2022-03-09 10:16:49'),
(28, 48, 1, 0, '', '2022-03-09 10:18:41'),
(29, 49, 1, 0, '', '2022-03-09 10:19:22'),
(30, 50, 1, 0, '', '2022-03-09 10:20:24'),
(31, 57, 1, 0, '', '2022-05-15 05:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_option`
--

CREATE TABLE `pre_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order_option`
--

INSERT INTO `pre_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(24, 4, 43, 225, 0, 'Delivery Date', '2011-04-22', 'date'),
(29, 6, 50, 226, 15, 'Select', 'Red', 'select'),
(85, 10, 74, 220, 0, 'Date &amp; Time', '2011-02-20 22:25', 'datetime'),
(84, 10, 74, 221, 0, 'Time', '22:25', 'time'),
(83, 10, 74, 219, 0, 'Date', '2011-02-20', 'date'),
(82, 10, 74, 222, 0, 'File', 'b5e6e209d7237fb41444fc5923ffeabc102b1637', 'file'),
(79, 10, 74, 208, 0, 'Text', 'test', 'text'),
(80, 10, 74, 217, 3, 'Select', 'Blue', 'select'),
(81, 10, 74, 209, 0, 'Textarea', 'ádfasdfasdf', 'textarea'),
(78, 10, 74, 223, 11, 'Checkbox', 'Checkbox 4', 'checkbox'),
(77, 10, 74, 218, 7, 'Radio', 'Large', 'radio'),
(410, 23, 246, 226, 16, 'Select', 'Blue', 'select'),
(411, 23, 247, 226, 15, 'Select', 'Red', 'select'),
(416, 24, 252, 226, 15, 'Select', 'Red', 'select');

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_product`
--

CREATE TABLE `pre_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order_product`
--

INSERT INTO `pre_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(42, 4, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(43, 4, 47, 'HP LP3065', 'Product 21', 1, '100.0000', '100.0000', '0.0000', 300),
(44, 5, 28, 'HTC Touch HD', 'Product 1', 1, '100.0000', '100.0000', '0.0000', 400),
(50, 6, 30, 'Canon EOS 5D', 'Product 3', 1, '80.0000', '80.0000', '0.0000', 200),
(51, 7, 44, 'MacBook Air', 'Product 17', 1, '1000.0000', '1000.0000', '0.0000', 700),
(149, 15, 43, 'MacBook', 'Product 16', 5, '500.0000', '2500.0000', '0.0000', 3000),
(56, 8, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(61, 9, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(116, 12, 40, 'iPhone', 'product 11', 1, '101.0000', '101.0000', '0.0000', 0),
(127, 14, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(74, 10, 42, 'Apple Cinema 30&quot;', 'Product 15', 1, '1000073.0000', '1000073.0000', '100007.3000', 100),
(126, 13, 43, 'MacBook', 'Product 16', 1, '500.0000', '500.0000', '0.0000', 600),
(150, 16, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(174, 17, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(176, 18, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(181, 19, 48, 'iPod Classic', 'product 20', 1, '100.0000', '100.0000', '0.0000', 0),
(237, 21, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(233, 20, 33, 'Samsung SyncMaster 941BW', 'Product 6', 1, '200.0000', '200.0000', '0.0000', 0),
(244, 22, 28, 'HTC Touch HD', 'Product 1', 1, '100.0000', '100.0000', '0.0000', 400),
(245, 23, 28, 'HTC Touch HD', 'Product 1', 4, '100.0000', '400.0000', '0.0000', 1600),
(246, 23, 30, 'Canon EOS 5D', 'Product 3', 3, '80.0000', '240.0000', '0.0000', 600),
(247, 23, 30, 'Canon EOS 5D', 'Product 3', 1, '80.0000', '80.0000', '0.0000', 200),
(252, 24, 30, 'Canon EOS 5D', 'Product 3', 1, '80.0000', '80.0000', '0.0000', 200),
(259, 25, 52, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141AESA', 2, '24490000.0000', '48980000.0000', '0.0000', 0),
(260, 25, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 2, '22690000.0000', '45380000.0000', '0.0000', 0),
(261, 25, 53, 'Máy giặt sấy 11/7kg UltimateCare 700', 'EWW1142Q7WB', 1, '19790000.0000', '19790000.0000', '0.0000', 0),
(263, 26, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(276, 27, 52, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141AESA', 1, '24490000.0000', '24490000.0000', '0.0000', 0),
(278, 28, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 2, '22690000.0000', '45380000.0000', '0.0000', 0),
(512, 43, 53, 'Máy giặt sấy 11/7kg UltimateCare 700', 'EWW1142Q7WB', 1, '19790000.0000', '19790000.0000', '0.0000', 0),
(366, 29, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(296, 30, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(501, 41, 52, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141AESA', 1, '24490000.0000', '24490000.0000', '0.0000', 0),
(506, 42, 61, 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2', 'PA91-606DG', 1, '14990000.0000', '14990000.0000', '0.0000', 0),
(381, 35, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(519, 44, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(395, 37, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 1, '22690000.0000', '22690000.0000', '0.0000', 0),
(417, 40, 51, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141R9SB', 2, '22690000.0000', '45380000.0000', '0.0000', 0),
(520, 45, 52, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141AESA', 1, '24490000.0000', '24490000.0000', '0.0000', 0),
(523, 46, 65, 'Máy nước nóng ComfortFlow™ 800', 'EWE451MB-DST2', 1, '4490000.0000', '4490000.0000', '0.0000', 0),
(546, 47, 59, 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'EOB2100COX', 1, '8490000.0000', '8490000.0000', '0.0000', 0),
(548, 48, 58, 'Bếp từ âm 3 vùng nấu 60cm', 'LIT60336', 1, '12690000.0000', '12690000.0000', '0.0000', 0),
(551, 49, 66, 'Bếp từ âm 4 vùng nấu 60cm', 'EIV644', 1, '12690000.0000', '12690000.0000', '0.0000', 0),
(553, 50, 70, 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', 'KFVB19K', 1, '26890000.0000', '26890000.0000', '0.0000', 0),
(562, 51, 58, 'Bếp từ âm 3 vùng nấu 60cm', 'LIT60336', 1, '12690000.0000', '12690000.0000', '0.0000', 0),
(563, 51, 73, 'Lò vi sóng tích hợp nướng 25L', 'EMG25D59EB', 1, '3000000.0000', '3000000.0000', '0.0000', 0),
(568, 52, 64, 'Máy hút bụi không dây Pure Q9 – màu đồng', 'PQ91-3EM', 1, '6990000.0000', '6990000.0000', '0.0000', 0),
(569, 52, 65, 'Máy nước nóng ComfortFlow™ 800', 'EWE451MB-DST2', 1, '4490000.0000', '4490000.0000', '0.0000', 0),
(575, 53, 59, 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'EOB2100COX', 1, '8490000.0000', '8490000.0000', '0.0000', 0),
(591, 54, 59, 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'EOB2100COX', 1, '8490000.0000', '8490000.0000', '0.0000', 0),
(589, 55, 59, 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'EOB2100COX', 1, '8490000.0000', '8490000.0000', '0.0000', 0),
(592, 56, 73, 'Lò vi sóng tích hợp nướng 25L', 'EMG25D59EB', 1, '3000000.0000', '3000000.0000', '0.0000', 0),
(594, 57, 67, 'Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu', 'EHG8321BC', 2, '6829000.0000', '13658000.0000', '0.0000', 0),
(609, 58, 52, 'Máy giặt cửa trước 11kg UltimateCare 900', 'EWF1141AESA', 1, '24490000.0000', '24490000.0000', '0.0000', 0),
(608, 58, 54, 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', 'EDH903BEWA', 1, '24990000.0000', '24990000.0000', '0.0000', 0),
(607, 58, 60, 'Máy rửa bát đứng độc lập ComfortLift 60cm cho 13 bộ chén dĩa', 'ESF8730ROX', 1, '40990000.0000', '40990000.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_recurring`
--

CREATE TABLE `pre_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_recurring_transaction`
--

CREATE TABLE `pre_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_status`
--

CREATE TABLE `pre_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order_status`
--

INSERT INTO `pre_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Đang xử lý'),
(3, 1, 'Đã giao hàng'),
(7, 1, 'Hủy'),
(5, 1, 'Hoàn tất'),
(8, 1, 'Từ chối'),
(9, 1, 'Hủy bỏ không được thực hiện'),
(10, 1, 'Thất bại'),
(11, 1, 'Đã hoàn tiền'),
(12, 1, 'Đã đảo ngược'),
(13, 1, 'Khoản bồi hoàn'),
(1, 1, 'Chờ duyệt'),
(16, 1, 'Vô hiệu'),
(15, 1, 'Xử lý'),
(14, 1, 'Đã hết hạn'),
(20, 1, 'Gian lận');

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_total`
--

CREATE TABLE `pre_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_order_total`
--

INSERT INTO `pre_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(381, 15, 'total', 'Tổng cộng ', '2500.0000', 9),
(337, 14, 'total', 'Tổng cộng ', '500.0000', 9),
(72, 4, 'shipping', 'Phí vận chuyển cố định', '5.0000', 3),
(73, 4, 'total', 'Tổng cộng ', '605.0000', 9),
(71, 4, 'sub_total', 'Thành tiền', '600.0000', 1),
(74, 5, 'sub_total', 'Thành tiền', '100.0000', 1),
(75, 5, 'shipping', 'Phí vận chuyển cố định', '5.0000', 3),
(76, 5, 'total', 'Tổng cộng ', '105.0000', 9),
(94, 6, 'total', 'Tổng cộng ', '85.0000', 9),
(93, 6, 'shipping', 'Phí vận chuyển cố định', '5.0000', 3),
(92, 6, 'sub_total', 'Thành tiền', '80.0000', 1),
(95, 7, 'sub_total', 'Thành tiền', '1000.0000', 1),
(96, 7, 'shipping', 'Phí vận chuyển cố định', '5.0000', 3),
(97, 7, 'total', 'Tổng cộng ', '1005.0000', 9),
(336, 14, 'sub_total', 'Thành tiền', '500.0000', 1),
(104, 8, 'sub_total', 'Thành tiền', '500.0000', 1),
(105, 8, 'total', 'Tổng cộng ', '500.0000', 9),
(115, 9, 'total', 'Tổng cộng ', '500.0000', 9),
(114, 9, 'sub_total', 'Thành tiền', '500.0000', 1),
(315, 12, 'total', 'Tổng cộng ', '55101.0000', 9),
(334, 13, 'sub_total', 'Thành tiền', '500.0000', 1),
(147, 10, 'total', 'Tổng cộng ', '1100080.3000', 9),
(144, 10, 'sub_total', 'Thành tiền', '1000073.0000', 1),
(146, 10, 'tax', 'VAT 10% (VN)', '100007.3000', 5),
(145, 10, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(314, 12, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(313, 12, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(312, 12, 'sub_total', 'Thành tiền', '101.0000', 1),
(335, 13, 'total', 'Tổng cộng ', '500.0000', 9),
(380, 15, 'sub_total', 'Thành tiền', '2500.0000', 1),
(382, 16, 'sub_total', 'Thành tiền', '200.0000', 1),
(383, 16, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(384, 16, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(385, 16, 'total', 'Tổng cộng ', '55200.0000', 9),
(469, 18, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(462, 17, 'sub_total', 'Thành tiền', '200.0000', 1),
(463, 17, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(464, 17, 'total', 'Tổng cộng ', '200.0000', 9),
(468, 18, 'sub_total', 'Thành tiền', '200.0000', 1),
(470, 18, 'total', 'Tổng cộng ', '200.0000', 9),
(487, 19, 'total', 'Tổng cộng ', '55100.0000', 9),
(486, 19, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(485, 19, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(484, 19, 'sub_total', 'Thành tiền', '100.0000', 1),
(607, 20, 'total', 'Tổng cộng ', '55200.0000', 9),
(606, 20, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(604, 20, 'sub_total', 'Thành tiền', '200.0000', 1),
(605, 20, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(623, 21, 'total', 'Tổng cộng ', '55200.0000', 9),
(622, 21, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(621, 21, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(620, 21, 'sub_total', 'Thành tiền', '200.0000', 1),
(651, 22, 'total', 'Tổng cộng ', '55100.0000', 9),
(650, 22, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(648, 22, 'sub_total', 'Thành tiền', '100.0000', 1),
(649, 22, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(652, 23, 'sub_total', 'Thành tiền', '720.0000', 1),
(653, 23, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(654, 23, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(655, 23, 'total', 'Tổng cộng ', '55720.0000', 9),
(675, 24, 'total', 'Tổng cộng ', '55080.0000', 9),
(674, 24, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(672, 24, 'sub_total', 'Thành tiền', '80.0000', 1),
(673, 24, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(686, 25, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(685, 25, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(684, 25, 'sub_total', 'Thành tiền', '114150000.0000', 1),
(687, 25, 'total', 'Tổng cộng ', '114205000.0000', 9),
(694, 26, 'tax', 'VAT 10% (VN)', '5000.0000', 5),
(693, 26, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(692, 26, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(695, 26, 'total', 'Tổng cộng ', '22745000.0000', 9),
(738, 27, 'total', 'Tổng cộng ', '24540000.0000', 9),
(736, 27, 'sub_total', 'Thành tiền', '24490000.0000', 1),
(737, 27, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(743, 28, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(742, 28, 'sub_total', 'Thành tiền', '45380000.0000', 1),
(744, 28, 'total', 'Tổng cộng ', '45430000.0000', 9),
(895, 29, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(896, 29, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(897, 29, 'total', 'Tổng cộng ', '22690000.0000', 9),
(780, 30, 'total', 'Tổng cộng ', '22740000.0000', 9),
(779, 30, 'shipping', 'Phí vận chuyển cố định', '50000.0000', 3),
(778, 30, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(1271, 44, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1272, 44, 'total', 'Tổng cộng ', '22690000.0000', 9),
(1251, 43, 'total', 'Tổng cộng ', '19790000.0000', 9),
(1250, 43, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1249, 43, 'sub_total', 'Thành tiền', '19790000.0000', 1),
(1233, 42, 'total', 'Tổng cộng ', '14990000.0000', 9),
(1232, 42, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1231, 42, 'sub_total', 'Thành tiền', '14990000.0000', 1),
(1218, 41, 'total', 'Tổng cộng ', '24490000.0000', 9),
(1217, 41, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1216, 41, 'sub_total', 'Thành tiền', '24490000.0000', 1),
(942, 35, 'total', 'Tổng cộng ', '22690000.0000', 9),
(940, 35, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(941, 35, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1270, 44, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(984, 37, 'total', 'Tổng cộng ', '22690000.0000', 9),
(982, 37, 'sub_total', 'Thành tiền', '22690000.0000', 1),
(983, 37, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1050, 40, 'total', 'Tổng cộng ', '45380000.0000', 9),
(1049, 40, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1048, 40, 'sub_total', 'Thành tiền', '45380000.0000', 1),
(1273, 45, 'sub_total', 'Thành tiền', '24490000.0000', 1),
(1274, 45, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1275, 45, 'total', 'Tổng cộng ', '24490000.0000', 9),
(1284, 46, 'total', 'Tổng cộng ', '4490000.0000', 9),
(1283, 46, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1282, 46, 'sub_total', 'Thành tiền', '4490000.0000', 1),
(1353, 47, 'total', 'Tổng cộng ', '8490000.0000', 9),
(1352, 47, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1351, 47, 'sub_total', 'Thành tiền', '8490000.0000', 1),
(1358, 48, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1357, 48, 'sub_total', 'Thành tiền', '12690000.0000', 1),
(1359, 48, 'total', 'Tổng cộng ', '12690000.0000', 9),
(1368, 49, 'total', 'Tổng cộng ', '12690000.0000', 9),
(1367, 49, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1366, 49, 'sub_total', 'Thành tiền', '12690000.0000', 1),
(1373, 50, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1372, 50, 'sub_total', 'Thành tiền', '26890000.0000', 1),
(1374, 50, 'total', 'Tổng cộng ', '26890000.0000', 9),
(1387, 51, 'sub_total', 'Thành tiền', '15690000.0000', 1),
(1388, 51, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1389, 51, 'total', 'Tổng cộng ', '15690000.0000', 9),
(1398, 52, 'total', 'Tổng cộng ', '11480000.0000', 9),
(1397, 52, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1396, 52, 'sub_total', 'Thành tiền', '11480000.0000', 1),
(1416, 53, 'total', 'Tổng cộng ', '8490000.0000', 9),
(1415, 53, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1414, 53, 'sub_total', 'Thành tiền', '8490000.0000', 1),
(1456, 54, 'sub_total', 'Thành tiền', '8490000.0000', 1),
(1457, 54, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1458, 54, 'total', 'Tổng cộng ', '8490000.0000', 9),
(1452, 55, 'total', 'Tổng cộng ', '8490000.0000', 9),
(1451, 55, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1450, 55, 'sub_total', 'Thành tiền', '8490000.0000', 1),
(1459, 56, 'sub_total', 'Thành tiền', '3000000.0000', 1),
(1460, 56, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1461, 56, 'total', 'Tổng cộng ', '3000000.0000', 9),
(1466, 57, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1465, 57, 'sub_total', 'Thành tiền', '13658000.0000', 1),
(1467, 57, 'total', 'Tổng cộng ', '13658000.0000', 9),
(1480, 58, 'sub_total', 'Thành tiền', '90470000.0000', 1),
(1481, 58, 'shipping', 'Miễn phí vận chuyển', '0.0000', 3),
(1482, 58, 'total', 'Tổng cộng ', '90470000.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `pre_order_voucher`
--

CREATE TABLE `pre_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_page`
--

CREATE TABLE `pre_page` (
  `page_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `raw` text NOT NULL,
  `backup` text NOT NULL,
  `home` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_page`
--

INSERT INTO `pre_page` (`page_id`, `content`, `raw`, `backup`, `home`, `status`, `date_added`, `date_modified`) VALUES
(6, '<div class=\"page-frame\"><div class=\"row\"><div class=\"block\">[module id=27 name=slideshow /]</div></div></div><div class=\"page-frame\"><div class=\"row\"><div class=\"block\">[extrainfo id=1 /]</div></div></div><div class=\"page-frame\"><div class=\"row\"><div class=\"page-container col-sm-12\" style=\"max-width: 1170px; margin: auto; float: none;\"><div class=\"row\"><div class=\"col-sm-12 col-xs-12 page-resize\"><div class=\"frame\"><div class=\"page-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"block\">[module id=36 name=special /]</div></div></div><div class=\"page-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"block\">[module id=44 name=latest_products_brand /]</div></div></div><div class=\"page-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"block\">[module id=45 name=latest_products_category /]</div></div></div><div class=\"page-frame\" style=\"display: block;\"><div class=\"row\"><div class=\"block\">[module id=46 name=product_tab /]</div></div></div></div></div></div></div></div></div>', '<div class=\"col-sm-12 page-frame\" id=\"page-frame-0\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[module id=27 name=slideshow /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=module/slideshow&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;module_id=27\" target=\"_blank\" data-toggle=\"page\" data-id=\"27\" data-type=\"module\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div class=\"col-sm-12 page-frame\" id=\"page-frame-1\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[extrainfo id=1 /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=catalog/extra_info/edit&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;extra_info_id=1\" target=\"_blank\" data-toggle=\"page\" data-id=\"1\" data-type=\"extrainfo\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div id=\"page-frame-2\" class=\"col-sm-12 page-frame\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"page-container col-sm-12\" style=\"max-width: 1170px; margin: auto; float: none;\"><div class=\"row\"><div class=\"col-sm-12 col-xs-12 page-resize ui-resizable ui-resizable-autohide ui-resizable-disabled\"><div class=\"frame\"><div class=\"col-sm-12 page-frame\" style=\"display: block;\" id=\"page-frame-3\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[module id=36 name=special /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=module/special&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;module_id=36\" target=\"_blank\" data-toggle=\"page\" data-id=\"36\" data-type=\"module\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div class=\"col-sm-12 page-frame\" style=\"display: block;\" id=\"page-frame-4\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[module id=44 name=latest_products_brand /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=module/latest_products_brand&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;module_id=44\" target=\"_blank\" data-toggle=\"page\" data-id=\"44\" data-type=\"module\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div class=\"col-sm-12 page-frame\" style=\"display: block;\" id=\"page-frame-5\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[module id=45 name=latest_products_category /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=module/latest_products_category&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;module_id=45\" target=\"_blank\" data-toggle=\"page\" data-id=\"45\" data-type=\"module\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div class=\"col-sm-12 page-frame\" style=\"display: block;\" id=\"page-frame-6\"><div class=\"frame-header\"><div class=\"frame-down\"><i class=\"fa fa-long-arrow-down\"></i></div><div class=\"frame-up\"><i class=\"fa fa-long-arrow-up\"></i></div><div class=\"frame-remove\"><i class=\"fa fa-trash\"></i></div></div><div class=\"row\"><div class=\"shortcode\">[module id=46 name=product_tab /]</div><div class=\"element-mark\"></div><div class=\"element-tool\"><div class=\"element-edit\"><a href=\"index.php?route=module/product_tab&amp;token=yDZkTjX7UMY7YliKxUiQ8z6B3c2DamSZ&amp;module_id=46\" target=\"_blank\" data-toggle=\"page\" data-id=\"46\" data-type=\"module\"><i class=\"fa fa-pencil\"></i></a></div><div class=\"element-remove\"><i class=\"fa fa-minus-circle\"></i></div></div></div></div><div class=\"pre-div\"></div></div><div class=\"ui-resizable-handle ui-resizable-e\" style=\"z-index: 90; display: none;\"></div></div></div></div></div></div>', '{\"page_id\":\"6\",\"content\":\"<div class=\\\"page-frame\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[module id=27 name=slideshow \\/]<\\/div><\\/div><\\/div><div class=\\\"page-frame\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[extrainfo id=1 \\/]<\\/div><\\/div><\\/div><div class=\\\"page-frame\\\"><div class=\\\"row\\\"><div class=\\\"page-container col-sm-12\\\" style=\\\"max-width: 1170px; margin: auto; float: none;\\\"><div class=\\\"row\\\"><div class=\\\"col-sm-12 col-xs-12 page-resize\\\"><div class=\\\"frame\\\"><div class=\\\"page-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[module id=36 name=special \\/]<\\/div><\\/div><\\/div><div class=\\\"page-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[module id=44 name=latest_products_brand \\/]<\\/div><\\/div><\\/div><div class=\\\"page-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[module id=45 name=latest_products_category \\/]<\\/div><\\/div><\\/div><div class=\\\"page-frame\\\" style=\\\"display: block;\\\"><div class=\\\"row\\\"><div class=\\\"block\\\">[module id=46 name=product_tab \\/]<\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div> \",\"raw\":\"<div class=\\\"col-sm-12 page-frame\\\" id=\\\"page-frame-0\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[module id=27 name=slideshow \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=module\\/slideshow&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;module_id=27\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"27\\\" data-type=\\\"module\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-12 page-frame\\\" id=\\\"page-frame-1\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[extrainfo id=1 \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=catalog\\/extra_info\\/edit&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;extra_info_id=1\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"1\\\" data-type=\\\"extrainfo\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div id=\\\"page-frame-2\\\" class=\\\"col-sm-12 page-frame\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"page-container col-sm-12\\\" style=\\\"max-width: 1170px; margin: auto; float: none;\\\"><div class=\\\"row\\\"><div class=\\\"col-sm-12 col-xs-12 page-resize ui-resizable ui-resizable-autohide ui-resizable-disabled\\\"><div class=\\\"frame\\\"><div class=\\\"col-sm-12 page-frame\\\" style=\\\"display: block;\\\" id=\\\"page-frame-3\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[module id=36 name=special \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=module\\/special&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;module_id=36\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"36\\\" data-type=\\\"module\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-12 page-frame\\\" style=\\\"display: block;\\\" id=\\\"page-frame-4\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[module id=44 name=latest_products_brand \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=module\\/latest_products_brand&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;module_id=44\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"44\\\" data-type=\\\"module\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-12 page-frame\\\" style=\\\"display: block;\\\" id=\\\"page-frame-5\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[module id=45 name=latest_products_category \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=module\\/latest_products_category&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;module_id=45\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"45\\\" data-type=\\\"module\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div class=\\\"col-sm-12 page-frame\\\" style=\\\"display: block;\\\" id=\\\"page-frame-6\\\"><div class=\\\"frame-header\\\"><div class=\\\"frame-down\\\"><i class=\\\"fa fa-long-arrow-down\\\"><\\/i><\\/div><div class=\\\"frame-up\\\"><i class=\\\"fa fa-long-arrow-up\\\"><\\/i><\\/div><div class=\\\"frame-remove\\\"><i class=\\\"fa fa-trash\\\"><\\/i><\\/div><\\/div><div class=\\\"row\\\"><div class=\\\"shortcode\\\">[module id=46 name=product_tab \\/]<\\/div><div class=\\\"element-mark\\\"><\\/div><div class=\\\"element-tool\\\"><div class=\\\"element-edit\\\"><a href=\\\"index.php?route=module\\/product_tab&amp;token=av50fvHI2PR802KdVYzTD8LOhxOUKEX3&amp;module_id=46\\\" target=\\\"_blank\\\" data-toggle=\\\"page\\\" data-id=\\\"46\\\" data-type=\\\"module\\\"><i class=\\\"fa fa-pencil\\\"><\\/i><\\/a><\\/div><div class=\\\"element-remove\\\"><i class=\\\"fa fa-minus-circle\\\"><\\/i><\\/div><\\/div><\\/div><\\/div><div class=\\\"pre-div\\\"><\\/div><\\/div><div class=\\\"ui-resizable-handle ui-resizable-e\\\" style=\\\"z-index: 90; display: none;\\\"><\\/div><\\/div><\\/div><\\/div><\\/div><\\/div> \",\"home\":\"1\",\"status\":\"1\",\"date_added\":\"2016-10-05 21:13:37\",\"date_modified\":\"2017-05-21 12:42:16\",\"page_description\":{\"1\":{\"name\":\"Trang ch\\u1ee7\",\"meta_title\":\"Trang ch\\u1ee7\",\"meta_keyword\":\"\",\"meta_description\":\"\"},\"2\":{\"name\":\"Home page\",\"meta_title\":\"Home page\",\"meta_keyword\":\"\",\"meta_description\":\"\"}}}', 0, 0, '2016-10-05 21:13:37', '2017-06-30 08:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `pre_page_description`
--

CREATE TABLE `pre_page_description` (
  `page_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_page_description`
--

INSERT INTO `pre_page_description` (`page_id`, `language_id`, `name`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(6, 1, 'Trang chủ', 'Trang chủ', '', ''),
(6, 2, 'Home page', 'Home page', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_post`
--

CREATE TABLE `pre_post` (
  `post_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_post`
--

INSERT INTO `pre_post` (`post_id`, `image`, `banner`, `date_added`, `date_available`, `status`, `sort_order`, `user_id`, `viewed`) VALUES
(1, 'catalog/blog/blog-thumbnail-l-01.jpg', 'catalog/blog/blog-thumbnail-l-01.jpg', '2016-12-23 13:51:17', '2016-12-23', 1, 0, 1, 52),
(2, 'catalog/blog/blog-thumbnail-l-02.jpg', 'catalog/blog/blog-thumbnail-l-02.jpg', '2019-03-19 10:06:38', '2016-12-23', 1, 0, 1, 63),
(3, 'catalog/blog/blog-thumbnail-l-04.jpg', 'catalog/blog/blog-thumbnail-l-04.jpg', '2019-03-19 09:57:47', '2016-12-23', 1, 0, 1, 111);

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_attribute`
--

CREATE TABLE `pre_post_attribute` (
  `post_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_description`
--

CREATE TABLE `pre_post_description` (
  `post_description_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_post_description`
--

INSERT INTO `pre_post_description` (`post_description_id`, `post_id`, `language_id`, `title`, `meta_keyword`, `description`, `short_description`, `tag`) VALUES
(59, 2, 1, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-02.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', ''),
(60, 2, 2, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-02.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', ''),
(61, 3, 1, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-04.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', ''),
(62, 3, 2, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-04.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', ''),
(63, 1, 1, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-01.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', ''),
(64, 1, 2, 'FIVE TABLE STYLES I’M LOVING NOW', '', '&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/blog/blog-thumbnail-l-01.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span style=&quot;color:#555555; font-family:Raleway,sans-serif; font-size:13px&quot;&gt;&lt;/span&gt;&lt;/p&gt;\r\n', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', '');

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_image`
--

CREATE TABLE `pre_post_image` (
  `post_image_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_image_description`
--

CREATE TABLE `pre_post_image_description` (
  `post_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_related`
--

CREATE TABLE `pre_post_related` (
  `post_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_post_related`
--

INSERT INTO `pre_post_related` (`post_id`, `related_id`) VALUES
(3, 3),
(3, 1),
(2, 3),
(3, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pre_post_to_thread`
--

CREATE TABLE `pre_post_to_thread` (
  `post_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_post_to_thread`
--

INSERT INTO `pre_post_to_thread` (`post_id`, `thread_id`) VALUES
(2, 1),
(3, 1),
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product`
--

CREATE TABLE `pre_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,0) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `viewed` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product`
--

INSERT INTO `pre_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(51, 'EWF1141R9SB', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/ewf1141r9sb-vn-fr-cl-1500x1500.jpg', 0, 1, '24990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 320, '2022-01-16 18:56:30', '2022-01-20 15:21:39'),
(52, 'EWF1141AESA', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-d2c-ewf1141aesafrcl-1500x1500.jpg', 0, 1, '24490000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 59, '2022-01-16 19:20:32', '2022-01-20 15:44:32'),
(53, 'EWW1142Q7WB', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/eww1142q7wb-vn-fr-cl-1500x1500.jpg', 0, 1, '23090000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 58, '2022-01-16 19:30:08', '2022-01-20 15:53:46'),
(54, 'EDH903BEWA', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-d2c-edh903bewafrcl-1500x1500.jpg', 0, 1, '24990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 65, '2022-01-16 19:31:27', '2022-01-18 21:35:17'),
(55, 'E5GS1-55DB', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-d2c-e5gs1-55db-fr-1500x1500.jpg', 0, 1, '1990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 34, '2022-01-16 19:38:18', '2022-01-20 13:26:20'),
(56, 'EBB3442K-A', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-ebb3442k-a-1500x1500-upright-refrigerator.jpg', 0, 1, '14790000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 57, '2022-01-16 19:43:53', '2022-01-20 15:44:11'),
(57, 'EQE6000A-B', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-eqe6000a-b-fr-cl-1500x1500.jpg', 0, 1, '25990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 53, '2022-01-16 19:49:16', '2022-01-18 12:58:06'),
(58, 'LIT60336', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg.jpg', 0, 1, '13500000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 103, '2022-01-16 19:52:15', '2022-01-20 15:45:22'),
(59, 'EOB2100COX', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/eob2100coxfront1500x1500.jpg', 0, 1, '10490000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 80, '2022-01-16 19:56:40', '2022-01-20 15:46:40'),
(60, 'ESF8730ROX', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-d2c-esf8730rox-fr-o-1500x1500.jpg', 0, 1, '44990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 29, '2022-01-16 20:01:09', '2022-01-18 13:34:28'),
(61, 'PA91-606DG', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/pa91-606dg-fr-sep20.jpg', 0, 1, '14990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 33, '2022-01-16 20:05:26', '2022-01-18 21:35:51'),
(62, 'FA31-202GY', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/fa31-202gy0-fr.jpg', 0, 1, '4290000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 31, '2022-01-16 20:10:19', '2022-01-18 14:05:35'),
(63, 'WQ71-2BSWF', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/wq71-2bswf-fr-1500x1500.jpg', 0, 1, '6990000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 38, '2022-01-16 20:14:16', '2022-01-18 21:36:10'),
(64, 'PQ91-3EM', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/tw-pq91-3em-fr-1500x1500.jpg', 0, 1, '7590000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 29, '2022-01-16 20:18:31', '2022-01-18 14:14:23'),
(65, 'EWE451MB-DST2', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote2.jpg.jpg', 0, 1, '4890000', 0, 0, '2022-01-16', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 34, '2022-01-16 20:22:45', '2022-01-20 13:27:27'),
(66, 'EIV644', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg.png', 0, 1, '19000000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 57, '2022-01-20 13:35:36', '2022-01-20 15:27:36'),
(67, 'EHG8321BC', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-ehg8321bc-1500x1500.png', 0, 1, '7190000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 31, '2022-01-20 13:54:57', '2022-01-20 14:40:04'),
(68, 'LFP316S', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg-1.png', 0, 1, '5900000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 13, '2022-01-20 13:58:21', '2022-01-20 14:29:19'),
(69, 'LFT769X', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg-2.png', 0, 1, '12800000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2022-01-20 14:01:02', '2022-01-20 14:28:29'),
(70, 'KFVB19K', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg-3.png', 0, 1, '28900000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 35, '2022-01-20 14:02:27', '2022-01-20 15:49:10'),
(71, 'EMS3288X', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/ems3288x-fr-1500x1500.png', 0, 1, '7990000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2022-01-20 14:04:20', '2022-01-20 14:26:12'),
(72, 'EMM23K18GW', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-emm23k18gw-fr-1500x1500.png', 0, 1, '2190000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 4, '2022-01-20 14:05:59', '2022-01-20 14:25:21'),
(73, 'EMG25D59EB', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/remote.jpg-4.png', 0, 1, '3190000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 46, '2022-01-20 14:08:43', '2022-01-20 15:47:42'),
(74, 'E6AF1-220K', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/vn-e6af1-220k-angr-1500x1500.png', 0, 1, '1990000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 3, '2022-01-20 14:11:12', '2022-01-20 14:23:18'),
(75, 'E6AF1-520K', '', '', '', '', '', '', '', 0, 5, 'catalog/san-pham/vn-e6af1-520k-fr1-1500x1500.png', 0, 1, '3290000', 0, 0, '2022-01-20', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 7, '2022-01-20 14:13:45', '2022-01-20 14:51:16'),
(76, 'MD11650B', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/download-1500x1500autox2-removebg-preview.png', 11, 1, '9990000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 38, '2022-02-24 13:29:32', '2022-03-05 10:50:33'),
(77, 'MD7646B', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD7646B-4.png', 11, 1, '7990000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 16, '2022-02-24 13:55:58', '2022-03-04 13:16:25'),
(78, 'MD8046B', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD8046B-5.png', 11, 1, '7990000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 34, '2022-02-24 14:03:46', '2022-03-05 10:48:04'),
(79, 'MD8650FB', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD8650FB-5.png', 11, 1, '8490000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 19, '2022-02-24 14:08:53', '2022-03-04 13:18:15'),
(80, 'MD8650GB', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD8650GB-5.png', 11, 1, '8490000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 14, '2022-02-24 14:13:55', '2022-03-05 10:54:31'),
(81, 'MD8650T', '', '', '', '', '', '', '', 100, 6, 'catalog/san-pham/Chau-rua-da-Maadela-MD8650T-1-1500x1500autox2-removebg-preview.png', 11, 1, '8950000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 25, '2022-02-24 14:18:55', '2022-03-05 10:31:12'),
(82, 'MD10050B', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD10050B-1.png', 11, 1, '7990000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 18, '2022-02-24 14:24:26', '2022-02-24 15:36:04'),
(83, 'MD6846B', '', '', '', '', '', '', '', 100, 6, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD6846B-1.png', 11, 1, '6990000', 0, 0, '2022-02-24', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 1, 1, 33, '2022-02-24 14:32:05', '2022-03-04 13:11:03');

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_attribute`
--

CREATE TABLE `pre_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_description`
--

CREATE TABLE `pre_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `description2` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_description`
--

INSERT INTO `pre_product_description` (`product_id`, `language_id`, `name`, `description`, `description2`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(52, 1, 'Máy giặt cửa trước 11kg UltimateCare 900', '&lt;ul&gt;\r\n	&lt;li&gt;SensorWash phát hiện vết bẩn và điều chỉnh chu kì giặt phù hợp, loại bỏ tới 80%* cặn chất giặt tẩy.&lt;/li&gt;\r\n	&lt;li&gt;Ultramix giữ áo quần luôn bền màu*&lt;/li&gt;\r\n	&lt;li&gt;LoadSensor đo lượng đồ giặt để tối ưu các cài đặt.&lt;/li&gt;\r\n	&lt;li&gt;Ứng dụng Electrolux Life chăm sóc quần áo chuyên nghiệp.&lt;/li&gt;\r\n	&lt;li&gt;Làm mới áo quần nhờ hơi nước mà không cần giặt.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h3&gt;Phân bổ nước giặt thông minh&lt;/h3&gt;\r\n\r\n&lt;p&gt;Sử dụng lượng chất giặt tẩy quá ít có thể không đảm bảo hiệu quả làm sạch, còn một lượng quá nhiều sẽ sờn rách quần áo. Công nghệ AutoDose tự động phân bổ lượng nước giặt, nước xả một cách chính xác theo khối lượng và độ bẩn của quần áo; giúp giặt sạch sâu, bảo vệ sợi vải*.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Thời gian giặt ngắn làm giảm sờn rách quần áo. Tiết kiệm 20% thời gian giặt theo so sánh giữa hai chu trình của máy giặt OKO cũ với một chu trình của máy giặt AutoDose.&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;em&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/ewf1141r9sb-vn-fr-cl-1500x1500.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Giặt sạch 49 loại vết bẩn*&lt;/h3&gt;\r\n\r\n&lt;p&gt;Giặt sạch nhiều loại vết bẩn cứng đầu dễ dàng mà không cần ngâm giặt trước. Hệ thống cảm biến kép AI thông minh đo độ bẩn &amp;amp; cặn chất giặt trên quần áo để tự động điều chỉnh chu trình giặt xả phù hợp, đảm bảo làm sạch hóa chất và 49 loại vết bẩn cứng đầu như dầu ăn, rượu vang đỏ, bùn đất và sôcôla.*&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Đã được kiểm nghiệm trên 4.5kg quần áo với 5cm² vết bẩn từ thức ăn, hóa chất, bùn đất... với chương trình giặt Đồ Cotton 40°C và vết ố. Kết quả có thể thay đổi tùy vào khối lượng đồ, loại và thời gian dính bẩn,&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Tạm biệt cặn chất giặt tẩy*&lt;/h3&gt;\r\n\r\n&lt;p&gt;Công nghệ UltraMix hòa tan hoàn toàn chất giặt và xả trước khi cho vào lồng giặt giúp giặt sạch sâu, không cặn hóa chất trên quần áo và không cần giặt đi giặt lại nhiều lần*.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Đã được kiểm nghiệm với 3kg hỗn hợp áo phông và áo sơ mi màu với lượng chất giặt tẩy được đề xuất. Chương trình có thể khác nhau tùy thuộc vào tải trọng quần áo, loại chất tẩy và áp lực nước.&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Diệt khuẩn tối ưu bằng hơi nước&lt;/h3&gt;\r\n\r\n&lt;p&gt;Kết thúc chu trình giặt, công nghệ HygienicCare sẽ phun vào lồng giặt hơi nước để loại bỏ đến 99.9% vi khuẩn &amp;amp; tác nhân gây dị ứng.*Công nghệ tạo hơi nước chỉ ở 40°C nên nhẹ nhàng với sợi vải và tiết kiệm năng lượng.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Công nghệ HygienicCare giúp loại bỏ 99.2% tác nhân gây dị ứng như Der f1 (mạt bụi), Fel d1 (có ở mèo), đồng thời giảm đến 99.9% vi khuẩn Staphylococcus aureus, Klebsiella pneumonia khi giặt ở 40°C, chương trình giặt đồ Cotton&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Giặt nhanh tiện lợi và linh hoạt&lt;/h3&gt;\r\n\r\n&lt;p&gt;Chế độ giặt nhanh đáp ứng linh hoạt theo từng nhu cầu và lịch trình của bạn. Chương trình Giặt 15 Phút giặt sạch hiệu quả với lượng nhỏ quần áo hoặc các món đồ riêng lẻ. Chương trình Giặt 39 Phút là lựa chọn lý tưởng khi bạn giặt đồ bẩn mỗi ngày. Nếu bạn có lượng quần áo đầy như thông thường, hãy chọn chương trình Đầy Lồng Giặt 60 Phút.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/ewf1141r9sb-sd-1500x1500.png&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Kết nối wifi với Electrolux Life&lt;/h3&gt;\r\n\r\n&lt;p&gt;Dễ dàng kiểm soát toàn bộ quá trình giặt từ xa khi kết nối với Ứng dụng Electrolux Life. Thông qua ứng dụng, bạn sẽ nhận được các tư vấn giặt tẩy hiệu quả và chuyên nghiệp, lên lịch giặt phù hợp dựa trên dự báo thời tiết. Bạn chỉ cần chạm để điều chỉnh cài đặt, mọi hoạt động của máy đều có thể điều khiển qua ứng dụng. Electrolux Life cũng giúp quản lý tính năng phân bổ nước giặt thông minh AutoDose để bạn không lo hết chất giặt tẩy khi đang ở bên ngoài.&lt;/p&gt;\r\n\r\n&lt;h3&gt;Tính năng&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Cảm biến AI SensorWash tẩy vết bẩn&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Công nghệ UltraMix hòa tan chất giặt&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt hơi nước HygienicCare diệt khuẩn&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt nhanh tiện lợi&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt nhẹ nhàng chứng nhận Woolmark Xanh&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Thêm quần áo khi đang giặt&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Công nghệ AutoDose&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Điều khiển AutoDose bằng Life App&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Động cơ EcoInverter bền bỉ&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Thông số kỹ thuật&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Kích thước&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;600 mm (R)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;659 mm (S)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;850 mm (C)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Khối lượng giặt (kg)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;11&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tải Hướng Dẫn Sử dụng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Hướng dẫn sử dụng sản phẩm&amp;nbsp;(24,88 MB)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng đặc biệt&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Định lượng tự động chất giặt tẩyCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ AutoSenseCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Khóa trẻ emCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ cảm ứng tải trọng LoadSensorCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Cảm biến giặt SensorWashCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ UltraMixCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Kết nối WifiCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Chứng nhận WoolmarkCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Giặt nhanhCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Đa dạng mức nhiệt độCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Làm mới trang phụcCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Giặt yêu thíchCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ giặt hơi nước VapourCareCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900'),
(68, 1, 'Máy hút mùi tích hợp bằng thép dạng kéo 60cm', '&lt;ul&gt;\r\n	&lt;li&gt;Chế độ cài đặt dễ dàng&lt;/li&gt;\r\n	&lt;li&gt;Bộ lọc mùi cho không gian bếp trong lành&lt;/li&gt;\r\n	&lt;li&gt;Đèn chiếu sáng tốt hơn, ít tốn điện hơn&amp;nbsp;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy hút mùi tích hợp bằng thép dạng kéo 60cm', 'Máy hút mùi tích hợp bằng thép dạng kéo 60cm', 'Máy hút mùi tích hợp bằng thép dạng kéo 60cm'),
(54, 1, 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', '&lt;ul&gt;\r\n	&lt;li&gt;DelicateCare giúp tránh co rút và biến dạng.*&lt;/li&gt;\r\n	&lt;li&gt;SensiCare bảo vệ áo quần khỏi sấy khô quá mức.&lt;/li&gt;\r\n	&lt;li&gt;Heat Pump bảo vệ sợi vải, giảm 50% điện năng*.&lt;/li&gt;\r\n	&lt;li&gt;Ứng dụng Electrolux Life hướng dẫn theo yêu cầu.&lt;/li&gt;\r\n	&lt;li&gt;Lồng giặt chuyển động luân phiên, giảm nhăn 32%*.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800'),
(65, 1, 'Máy nước nóng ComfortFlow™ 800', '&lt;ul&gt;\r\n	&lt;li&gt;Cho nhiệt độ nước luôn ổn định gấp 2 lần* với ComfortFlow™&lt;/li&gt;\r\n	&lt;li&gt;Bảo toàn nhiệt độ ổn định với Dynamic Power Control&lt;/li&gt;\r\n	&lt;li&gt;SafeReady® mang lại sự an tâm bằng cách tự động kiểm tra an toàn điện trước mỗi lần sử dụng&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy nước nóng ComfortFlow™ 800', 'Máy nước nóng ComfortFlow™ 800', 'Máy nước nóng ComfortFlow™ 800'),
(55, 1, 'Bàn ủi hơi nước đứng 1300W Refine 500', '&lt;ul&gt;\r\n	&lt;li&gt;1 mức độ hơi nước ủi phẳng mọi loại áo quần.&lt;/li&gt;\r\n	&lt;li&gt;Hai ván ủi nhỏ trợ giúp những vị trí khó ủi.&lt;/li&gt;\r\n	&lt;li&gt;AutoOff tự động tắt bàn ủi khi bạn quên.&lt;/li&gt;\r\n	&lt;li&gt;Bàn chải, giá treo và kẹp cho kết quả ủi tối ưu.&lt;/li&gt;\r\n	&lt;li&gt;Ngăn chứa nước lớn dễ dàng tháo rời và thêm nước.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Bàn ủi hơi nước đứng 1300W Refine 500', 'Bàn ủi hơi nước đứng 1300W Refine 500', 'Bàn ủi hơi nước đứng 1300W Refine 500'),
(56, 1, 'Tủ lạnh Inverter UltimateTaste 300 ngăn đá dưới có ngăn đông mềm 308 lít', '&lt;ul&gt;\r\n	&lt;li&gt;Ngăn đông mềm TasteSeal giữ thực phẩm tươi ngon suốt 7 ngày* không cần rã đông.&lt;/li&gt;\r\n	&lt;li&gt;Ngăn rau TasteLock giúp rau củ luôn tươi trong suốt 7 ngày.&lt;/li&gt;\r\n	&lt;li&gt;Tính năng WaterStream lấy nước từ bên ngoài tiện dụng.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h1&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h1&gt;\r\n\r\n&lt;h2&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h2&gt;\r\n\r\n&lt;h3&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h3&gt;\r\n\r\n&lt;h4&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h4&gt;\r\n\r\n&lt;h5&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h5&gt;\r\n\r\n&lt;h6&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/h6&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&amp;nbsp;text&lt;/p&gt;\r\n', '', 'Tủ lạnh Inverter UltimateTaste 300 ngăn đá dưới có ngăn đông mềm 308 lít', 'Tủ lạnh Inverter UltimateTaste 300 ngăn đá dưới có ngăn đông mềm 308 lít', 'Tủ lạnh Inverter UltimateTaste 300 ngăn đá dưới có ngăn đông mềm 308 lít'),
(57, 1, 'Tủ lạnh Inverter UltimateTaste 700 cửa Pháp 541 lít', '&lt;ul&gt;\r\n	&lt;li&gt;Không gian rộng rãi, thoải mái lưu trữ&lt;/li&gt;\r\n	&lt;li&gt;Rau củ tươi ngon suốt 7 ngày với tính năng TasteLockPlus*&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ EvenTemp giữ độ lạnh luôn ổn định&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Tủ lạnh Inverter UltimateTaste 700 cửa Pháp 541 lít', 'Tủ lạnh Inverter UltimateTaste 700 cửa Pháp 541 lít', 'Tủ lạnh Inverter UltimateTaste 700 cửa Pháp 541 lít'),
(60, 1, 'Máy rửa bát đứng độc lập ComfortLift 60cm cho 13 bộ chén dĩa', '&lt;ul&gt;\r\n	&lt;li&gt;ComfortLift giúp xếp dỡ chén đĩa dễ dàng.&lt;/li&gt;\r\n	&lt;li&gt;SoftGrips và SoftSpikes nâng niu đồ thuỷ tinh.&lt;/li&gt;\r\n	&lt;li&gt;AirDry cho hiệu suất sấy khô hiệu quả hơn 3 lần*.&lt;/li&gt;\r\n	&lt;li&gt;Khay dao kéo có thể tháo rời giúp dễ dàng xếp dỡ.&lt;/li&gt;\r\n	&lt;li&gt;ExtraHygiene loại bỏ 99.99% vi khuẩn*.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy rửa bát đứng độc lập ComfortLift 60cm cho 13 bộ chén dĩa', 'Máy rửa bát đứng độc lập ComfortLift 60cm cho 13 bộ chén dĩa', 'Máy rửa bát đứng độc lập ComfortLift 60cm cho 13 bộ chén dĩa'),
(61, 1, 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2', '&lt;ul&gt;\r\n	&lt;li&gt;Bộ lọc 5 lớp lọc sạch tới 99.99% vi khuẩn*.&lt;/li&gt;\r\n	&lt;li&gt;PureSense đo chất lượng khí và điều chỉnh bộ lọc.&lt;/li&gt;\r\n	&lt;li&gt;Yên tĩnh hoàn hảo, kể cả ở tốc độ lớn nhất.&lt;/li&gt;\r\n	&lt;li&gt;AirSurround lọc khí hiệu quả hơn gấp 4 lần*.&lt;/li&gt;\r\n	&lt;li&gt;Bộ lọc điều chỉnh theo yếu tố nhạy cảm theo mùa.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2', 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2', 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2'),
(62, 1, 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2', '&lt;ul&gt;\r\n	&lt;li&gt;Bộ lọc 4 lớp lọc sạch bụi mịn và khử mùi.&lt;/li&gt;\r\n	&lt;li&gt;Khe thoát khí xoắn ốc lưu thông khí sạch hiệu quả*.&lt;/li&gt;\r\n	&lt;li&gt;Yên tĩnh hoàn hảo, kể cả ở tốc độ lớn nhất.&lt;/li&gt;\r\n	&lt;li&gt;Cảm biến đo chất lượng khí và điều chỉnh bộ lọc.&lt;/li&gt;\r\n	&lt;li&gt;Màn hình cảm ứng UI trực quan và dễ dàng sử dụng.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2', 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2', 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2'),
(63, 1, 'Máy hút bụi không dây sang trọng Well Q7P 21.6V', '&lt;ul&gt;\r\n	&lt;li&gt;Thiết kế 2 trong 1 tiện dụng&lt;/li&gt;\r\n	&lt;li&gt;Tích hợp nhiều đầu hút chuyên dụng&lt;/li&gt;\r\n	&lt;li&gt;Bộ lọc 5 cấp giúp loại bỏ lên đến 99.9% bụi mịn &amp;gt;0.3µm*&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy hút bụi không dây sang trọng Well Q7P 21.6V', 'Máy hút bụi không dây sang trọng Well Q7P 21.6V', 'Máy hút bụi không dây sang trọng Well Q7P 21.6V'),
(64, 1, 'Máy hút bụi không dây Pure Q9 – màu đồng', '&lt;ul&gt;\r\n	&lt;li&gt;Sạc nam châm cho bạn lấy máy và sử dụng dễ dàng.&lt;/li&gt;\r\n	&lt;li&gt;Hút tối đa*, cả khi hộp chứa bụi đã đầy.&lt;/li&gt;\r\n	&lt;li&gt;Tay cầm 2 trong 1 độ ồn thấp, hút bụi êm ái.&lt;/li&gt;\r\n	&lt;li&gt;Hệ thống lọc 5 lớp loại bỏ 99,9% các hạt bụi*.&lt;/li&gt;\r\n	&lt;li&gt;55 phút* cho dọn dẹp nhanh hoặc tổng vệ sinh.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Máy hút bụi không dây Pure Q9 – màu đồng', 'Máy hút bụi không dây Pure Q9 – màu đồng', 'Máy hút bụi không dây Pure Q9 – màu đồng'),
(69, 1, 'Máy hút mùi bằng thép không gỉ dạng ống 90cm', '&lt;ul&gt;\r\n	&lt;li&gt;Tính năng kết nối với bếp từ Hob2Hood®&lt;/li&gt;\r\n	&lt;li&gt;Công suất mạnh mẽ lọc khí hiệu quả&lt;/li&gt;\r\n	&lt;li&gt;Làm sạch không khí trong gian bếp của bạn&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Máy hút mùi bằng thép không gỉ dạng ống 90cm', 'Máy hút mùi bằng thép không gỉ dạng ống 90cm', 'Máy hút mùi bằng thép không gỉ dạng ống 90cm', ''),
(71, 1, 'Lò vi sóng để bàn kết hợp nướng và đối lưu 32L', '&lt;ul&gt;\r\n	&lt;li&gt;CombiGrill kết hợp nướng và nấu bằng vi sóng.&lt;/li&gt;\r\n	&lt;li&gt;Chế độ đối lưu lý tưởng cho nướng thịt và bánh.&lt;/li&gt;\r\n	&lt;li&gt;Chế độ hấp cho việc nấu ăn lành mạnh tại nhà.&lt;/li&gt;\r\n	&lt;li&gt;15 chương trình nấu đa dạng, chuyên nghiệp.&lt;/li&gt;\r\n	&lt;li&gt;Công suất cao 900W làm nóng thực phẩm nhanh hơn.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Lò vi sóng để bàn kết hợp nướng và đối lưu 32L', 'Lò vi sóng để bàn kết hợp nướng và đối lưu 32L', 'Lò vi sóng để bàn kết hợp nướng và đối lưu 32L'),
(67, 1, 'Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu', '&lt;ul&gt;\r\n	&lt;li&gt;Ngọn lửa xanh giúp tiết kiệm năng lượng.&lt;/li&gt;\r\n	&lt;li&gt;Vòng chia lửa lớn cho các món chiên xào.&lt;/li&gt;\r\n	&lt;li&gt;Thiết bị ngắt ga tự động đảm bảo an toàn.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu', 'Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu', 'Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu'),
(72, 1, 'Lò vi sóng để bàn 23L - Trắng', '&lt;ul&gt;\r\n	&lt;li&gt;Đĩa xoay thuỷ tinh rộng để nấu các món lớn.&lt;/li&gt;\r\n	&lt;li&gt;5 mức công suất cho nhu cầu nấu ăn đa dạng.&lt;/li&gt;\r\n	&lt;li&gt;Dung tích lớn với thiết kế viền mỏng bên ngoài.&lt;/li&gt;\r\n	&lt;li&gt;Công suất cao 800W làm nóng thực phẩm nhanh hơn.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Lò vi sóng để bàn 23L - Trắng', 'Lò vi sóng để bàn 23L - Trắng\r\n', 'Lò vi sóng để bàn 23L - Trắng\r\n'),
(74, 1, 'Nồi chiên không dầu 3L Explore 6 E6AF1-220K', '&lt;ul&gt;\r\n	&lt;li&gt;Luồng khí nóng nhanh cho món ngon giòn hoàn hảo.&lt;/li&gt;\r\n	&lt;li&gt;Vệ sinh rổ chiên dễ dàng với máy rửa bát.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Nồi chiên không dầu 3L Explore 6 E6AF1-220K', 'Nồi chiên không dầu 3L Explore 6 E6AF1-220K', 'Nồi chiên không dầu 3L Explore 6 E6AF1-220K'),
(75, 1, 'Nồi chiên không dầu 5L Explore 6 E6AF1-520K', '&lt;ul&gt;\r\n	&lt;li&gt;Luồng khí nóng nhanh cho món ngon giòn hoàn hảo.&lt;/li&gt;\r\n	&lt;li&gt;Điều khiển dễ dàng, đa dạng chương trình nấu.&lt;/li&gt;\r\n	&lt;li&gt;Vệ sinh rổ chiên dễ dàng với máy rửa bát.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '', 'Nồi chiên không dầu 5L Explore 6 E6AF1-520K', 'Nồi chiên không dầu 5L Explore 6 E6AF1-520K', 'Nồi chiên không dầu 5L Explore 6 E6AF1-520K'),
(58, 1, 'Bếp từ âm 3 vùng nấu 60cm', '&lt;ul&gt;\r\n	&lt;li&gt;Công nghệ mới giúp nấu ăn nhanh và ngon hơn&lt;/li&gt;\r\n	&lt;li&gt;Kết nối tự động với máy hút mùi&lt;/li&gt;\r\n	&lt;li&gt;Nấu nướng dễ dàng và an toàn&lt;/li&gt;\r\n	&lt;li&gt;Bếp từ&amp;nbsp;có 3 vùng nấu hoạt động với tổng công suất 7350W mạnh mẽ&lt;/li&gt;\r\n	&lt;li&gt;Hoạt động với công suất bếp sau bên trái 1400/2500W, bếp trước bên trái&amp;nbsp;2300/2700W&amp;nbsp;và&amp;nbsp;bếp bên phải&amp;nbsp;1800/2800/3500/5200W&amp;nbsp;giúp nấu chín 3 món ăn cùng lúc nhanh chóng, tiện lợi.&lt;/li&gt;\r\n	&lt;li&gt;Với tổng công suất 7350W, bếp sử dụng điện nối qua aptomat (CB)&lt;/li&gt;\r\n	&lt;li&gt;Mặt bếp làm bằng kính&amp;nbsp;ceramic Eurokera&amp;nbsp;dày bền, khả năng chịu lực tốt, dễ vệ sinh&lt;/li&gt;\r\n	&lt;li&gt;Nhiệt năng được truyền tới đúng vị trí đặt nồi trong khi các vùng xung quanh luôn nguội và an toàn.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;.&lt;/p&gt;\r\n', '&lt;h4 style=&quot;text-align:justify&quot;&gt;Chức năng Hob²Hoob&amp;nbsp;cho phép kết nối không dây giữa máy hút mùi và bếp từ, tạo không gian nấu ăn thoải mái&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Máy hút mùi có thể nhận diện được nhiệt năng từ bếp và điều chỉnh lực hút phù hợp mà không cần thiết lập hoạt động.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Chức năng Hob²Hoob - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1982/234389/hob2hood.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/tongcongsuat.jpg&quot; style=&quot;width:80%&quot; title=&quot;Chức năng Hob²Hoob - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Bếp từ&amp;nbsp;có 3 vùng nấu hoạt động với tổng công suất 7350W mạnh mẽ&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Hoạt động với công suất bếp sau bên trái 1400/2500W, bếp trước bên trái&amp;nbsp;2300/2700W&amp;nbsp;và&amp;nbsp;bếp bên phải&amp;nbsp;1800/2800/3500/5200W&amp;nbsp;giúp nấu chín 3 món ăn cùng lúc nhanh chóng, tiện lợi.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Với tổng công suất 7350W, bếp sử dụng điện nối qua aptomat (CB).&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Công suất lên đến 7350W - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1982/234389/tongcongsuat.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/tinhnang.jpg&quot; style=&quot;width:80%&quot; title=&quot;Công suất lên đến 7350W - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Bếp từ 3 vùng nấu&amp;nbsp;lắp đặt âm hiện đại, màu đen sang trọng, phù hợp với mọi không gian bếp&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Thiết kê lắp âm hiện đại - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1982/234389/thietke-2.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/thietke-2.jpg&quot; style=&quot;width:80%&quot; title=&quot;Thiết kê lắp âm hiện đại - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Mặt bếp làm bằng kính&amp;nbsp;ceramic Eurokera&amp;nbsp;dày bền, khả năng chịu lực tốt, dễ vệ sinh&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Nhiệt năng được truyền tới đúng vị trí đặt nồi trong khi các vùng xung quanh luôn nguội và an toàn.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Mặt kính Eurokera chịu lực tốt - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1982/234389/matbep.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/noi.jpg&quot; style=&quot;width:80%&quot; title=&quot;Mặt kính Eurokera chịu lực tốt - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Bảng điều khiển cảm ứng&amp;nbsp;nhanh nhạy, dễ thao tác kèm màn hình hiển thị rõ nét&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Bạn có thể nhanh chóng điều chỉnh nhiệt độ bằng trượt cảm ứng DirectTouch. Ngoài ra, mỗi vùng nấu có một bảng điều khiển riêng biệt giúp bạn dễ dàng thay đổi chế độ nấu.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Gia nhiệt nhanh, làm chín thức ăn nhanh chóng, tiết kiệm thời gian nhờ chức năng Booster.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Bảng điều khiển dễ thao tác - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1982/234389/bdk-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/bdk-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Bảng điều khiển dễ thao tác - Bếp từ 3 vùng nấu Electrolux LIT60342&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Bếp từ Electrolux&amp;nbsp;được trang bị nhiều tính năng thông minh giúp tối đa an toàn khi sử dụng&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Chức năng&amp;nbsp;tự ngắt khi bếp nóng quá tải&amp;nbsp;giúp đảm bảo nguồn điện luôn ở mức an toàn, tăng độ bền cho bếp và giữ an toàn cho người sử dụng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Có&amp;nbsp;khóa bảng điều khiển, khi sử dụng sẽ làm vô hiệu hóa toàn bộ bàn phím. Nhờ đó, người dùng có lỡ bấm vào các phím cũng không làm thay đổi các cài đặt trước và gây nguy hiểm.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Tính năng cảnh báo mặt bếp nóng giúp người dùng không tiếp xúc trực tiếp với bếp khi vừa nấu xong, tránh bị nóng, phỏng.&lt;/p&gt;\r\n', '', 'Bếp từ âm 3 vùng nấu 60cm', 'Bếp từ âm 3 vùng nấu 60cm', 'Bếp từ âm 3 vùng nấu 60cm'),
(51, 1, 'Máy giặt cửa trước 11kg UltimateCare 900', '&lt;ul&gt;\r\n	&lt;li&gt;Công nghệ AutoDose tự động phân bổ chính xác lượng nước giặt, xả*&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ Sensorwash với cảm biến AI thông minh loại bỏ đến 49 loại vết bẩn*&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ UltraMix giặt sạch sâu, không cặn giặt tẩy*.&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ giặt hơi nước HygienicCare diệt 99.9% vi khuẩn và chất gây dị ứng*&lt;/li&gt;\r\n	&lt;li&gt;Kết nối Wifi, tư vấn chăm sóc quần áo chuyên nghiệp&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h3&gt;Phân bổ nước giặt thông minh&lt;/h3&gt;\r\n\r\n&lt;p&gt;Sử dụng lượng chất giặt tẩy quá ít có thể không đảm bảo hiệu quả làm sạch, còn một lượng quá nhiều sẽ sờn rách quần áo. Công nghệ AutoDose tự động phân bổ lượng nước giặt, nước xả một cách chính xác theo khối lượng và độ bẩn của quần áo; giúp giặt sạch sâu, bảo vệ sợi vải*.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Thời gian giặt ngắn làm giảm sờn rách quần áo. Tiết kiệm 20% thời gian giặt theo so sánh giữa hai chu trình của máy giặt OKO cũ với một chu trình của máy giặt AutoDose.&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;em&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/ewf1141r9sb-vn-fr-cl-1500x1500.jpg&quot; style=&quot;width:80%&quot; /&gt;&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Giặt sạch 49 loại vết bẩn*&lt;/h3&gt;\r\n\r\n&lt;p&gt;Giặt sạch nhiều loại vết bẩn cứng đầu dễ dàng mà không cần ngâm giặt trước. Hệ thống cảm biến kép AI thông minh đo độ bẩn &amp;amp; cặn chất giặt trên quần áo để tự động điều chỉnh chu trình giặt xả phù hợp, đảm bảo làm sạch hóa chất và 49 loại vết bẩn cứng đầu như dầu ăn, rượu vang đỏ, bùn đất và sôcôla.*&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Đã được kiểm nghiệm trên 4.5kg quần áo với 5cm² vết bẩn từ thức ăn, hóa chất, bùn đất... với chương trình giặt Đồ Cotton 40°C và vết ố. Kết quả có thể thay đổi tùy vào khối lượng đồ, loại và thời gian dính bẩn,&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Tạm biệt cặn chất giặt tẩy*&lt;/h3&gt;\r\n\r\n&lt;p&gt;Công nghệ UltraMix hòa tan hoàn toàn chất giặt và xả trước khi cho vào lồng giặt giúp giặt sạch sâu, không cặn hóa chất trên quần áo và không cần giặt đi giặt lại nhiều lần*.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Đã được kiểm nghiệm với 3kg hỗn hợp áo phông và áo sơ mi màu với lượng chất giặt tẩy được đề xuất. Chương trình có thể khác nhau tùy thuộc vào tải trọng quần áo, loại chất tẩy và áp lực nước.&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Diệt khuẩn tối ưu bằng hơi nước&lt;/h3&gt;\r\n\r\n&lt;p&gt;Kết thúc chu trình giặt, công nghệ HygienicCare sẽ phun vào lồng giặt hơi nước để loại bỏ đến 99.9% vi khuẩn &amp;amp; tác nhân gây dị ứng.*Công nghệ tạo hơi nước chỉ ở 40°C nên nhẹ nhàng với sợi vải và tiết kiệm năng lượng.&lt;br /&gt;\r\n&lt;br /&gt;\r\n&lt;em&gt;*Công nghệ HygienicCare giúp loại bỏ 99.2% tác nhân gây dị ứng như Der f1 (mạt bụi), Fel d1 (có ở mèo), đồng thời giảm đến 99.9% vi khuẩn Staphylococcus aureus, Klebsiella pneumonia khi giặt ở 40°C, chương trình giặt đồ Cotton&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Giặt nhanh tiện lợi và linh hoạt&lt;/h3&gt;\r\n\r\n&lt;p&gt;Chế độ giặt nhanh đáp ứng linh hoạt theo từng nhu cầu và lịch trình của bạn. Chương trình Giặt 15 Phút giặt sạch hiệu quả với lượng nhỏ quần áo hoặc các món đồ riêng lẻ. Chương trình Giặt 39 Phút là lựa chọn lý tưởng khi bạn giặt đồ bẩn mỗi ngày. Nếu bạn có lượng quần áo đầy như thông thường, hãy chọn chương trình Đầy Lồng Giặt 60 Phút.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/ewf1141r9sb-sd-1500x1500.png&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Kết nối wifi với Electrolux Life&lt;/h3&gt;\r\n\r\n&lt;p&gt;Dễ dàng kiểm soát toàn bộ quá trình giặt từ xa khi kết nối với Ứng dụng Electrolux Life. Thông qua ứng dụng, bạn sẽ nhận được các tư vấn giặt tẩy hiệu quả và chuyên nghiệp, lên lịch giặt phù hợp dựa trên dự báo thời tiết. Bạn chỉ cần chạm để điều chỉnh cài đặt, mọi hoạt động của máy đều có thể điều khiển qua ứng dụng. Electrolux Life cũng giúp quản lý tính năng phân bổ nước giặt thông minh AutoDose để bạn không lo hết chất giặt tẩy khi đang ở bên ngoài.&lt;/p&gt;\r\n\r\n&lt;h3&gt;Tính năng&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Cảm biến AI SensorWash tẩy vết bẩn&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Công nghệ UltraMix hòa tan chất giặt&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt hơi nước HygienicCare diệt khuẩn&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt nhanh tiện lợi&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Giặt nhẹ nhàng chứng nhận Woolmark Xanh&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Thêm quần áo khi đang giặt&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Công nghệ AutoDose&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Điều khiển AutoDose bằng Life App&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;a&gt;Động cơ EcoInverter bền bỉ&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;h3&gt;Thông số kỹ thuật&lt;/h3&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Kích thước&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;600 mm (R)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;659 mm (S)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;850 mm (C)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Khối lượng giặt (kg)&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;11&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tải Hướng Dẫn Sử dụng&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Hướng dẫn sử dụng sản phẩm&amp;nbsp;(24,88 MB)&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Tính năng đặc biệt&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Định lượng tự động chất giặt tẩyCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ AutoSenseCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Khóa trẻ emCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ cảm ứng tải trọng LoadSensorCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Cảm biến giặt SensorWashCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ UltraMixCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Kết nối WifiCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Chứng nhận WoolmarkCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Giặt nhanhCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Đa dạng mức nhiệt độCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Làm mới trang phụcCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Giặt yêu thíchCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n	&lt;li&gt;\r\n	&lt;p&gt;Công nghệ giặt hơi nước VapourCareCó&lt;/p&gt;\r\n	&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900'),
(59, 1, 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', '&lt;ul&gt;\r\n	&lt;li&gt;SurroundCook phân phối nhiệt cho thức ăn chín đều.&lt;/li&gt;\r\n	&lt;li&gt;Cửa lò có thể tháo rời và vệ sinh dễ dàng.&lt;/li&gt;\r\n	&lt;li&gt;Thép không gỉ phong cách, chống bám vân tay.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h4 style=&quot;text-align:justify&quot;&gt;Lò nướng Electrolux&amp;nbsp;EOB2100COX&amp;nbsp;thiết kế&amp;nbsp;kiểu âm tủ, màu sắc trang nhã&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Mang đến nét sang trọng cho mọi không gian bếp.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Lò nướng âm Electrolux EOB2100COX&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/2063/105142/lo-nuong-electrolux-eob2100cox-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/lo-nuong-electrolux-eob2100cox-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lò nướng âm Electrolux EOB2100COX&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Dung tích lớn 53 lít, dễ dàng nướng được số lượng lớn thực phẩm cùng lúc&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Thích hợp sử dụng trong gia đình có đông thành viên, nhà hàng, khách sạn… Khoang lò tráng men sáng đẹp,&amp;nbsp;&lt;a href=&quot;https://www.dienmayxanh.com/kinh-nghiem-hay/cach-lam-sach-lo-nuong-voi-giam-trang-va-baking-so-575986&quot; target=&quot;_blank&quot; title=&quot;dễ chùi rửa&quot;&gt;dễ chùi rửa&lt;/a&gt;&amp;nbsp;sau khi sử dụng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Lò nướng âm Electrolux EOB2100COX&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/2063/105142/lo-nuong-electrolux-eob2100cox-2.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/lo-nuong-electrolux-eob2100cox-2.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lò nướng âm Electrolux EOB2100COX&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Đèn trong khoang lò&amp;nbsp;giúp quan sát bên trong tiện lợi khi lò đang vận hành&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Lò nướng âm Electrolux EOB2100COX&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/2063/105142/lo-nuong-electrolux-eob2100cox-3.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/lo-nuong-electrolux-eob2100cox-3.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lò nướng âm Electrolux EOB2100COX&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Quạt đối lưu&amp;nbsp;luân chuyển nhiệt lượng tỏa khắp trong&amp;nbsp;lò nướng âm Electrolux&amp;nbsp;giúp nướng thực phẩm chín đều, ngon&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Lò nướng âm Electrolux EOB2100COX&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/2063/105142/lo-nuong-electrolux-eob2100cox-4.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/lo-nuong-electrolux-eob2100cox-4.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lò nướng âm Electrolux EOB2100COX&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Lò nướng đa năng có bảng điều khiển nút vặn dễ hiểu, thao tác tiện lợi với mọi người dùng&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Được thiết kế gồm 5 chức năng nướng cùng 1 chức năng rã đông. Người dùng lựa chọn tùy theo công thức món ăn mà mình chế biến.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Lò nướng âm Electrolux EOB2100COX 53 lít - Hẹn giờ nấu&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/2063/105142/electrolux-eob2100cox-020921-110204.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/bdk-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lò nướng âm Electrolux EOB2100COX 53 lít - Hẹn giờ nấu&quot; /&gt;&lt;/p&gt;\r\n', '', 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc', 'Lò nướng âm tủ 53L EOB2100COX - Đen ánh bạc'),
(66, 1, 'Bếp từ âm 4 vùng nấu 60cm', '&lt;ul&gt;\r\n	&lt;li&gt;Tính năng kết nối các vùng nấu giúp gia tăng diện tích nấu nướng&lt;/li&gt;\r\n	&lt;li&gt;Diện tích vùng nấu lớn ở cả hai bên bếp&lt;/li&gt;\r\n	&lt;li&gt;Điều khiển chạm linh hoạt, chính xác&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&amp;nbsp;&lt;/strong&gt;là loại bếp điện âm tủ với 4&amp;nbsp; vùng nấu được thiết kế cao cấp từ bộ sưu tập Electrolux màu đen sang trọng. Bếp điện âm được thiết kế 4 vùng nấu nhanh và mạnh mẽ với tối đa công suất 2.3kW. Trong đó mỗi vùng nấu có 3 vòng nhiệt đảm bảo nhiệt nhanh và mạnh.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&lt;/strong&gt;&amp;nbsp;được thiết có chế độ các vùng nấu với chế độ cài đặt thời gian riêng biệt cho từng vùng nấu tạo sự tiện lợi cho việc nấu nướng. Bên cạnh đó, cảm ứng thông báo nhiệt dự cho từng vùng bếp nấu khi sử dụng quá nhiệt độ cho việc nấu ăn. Bếp có chức năng tự động cảnh báo dư nhiệt sau khi nấu cho từng bếp nấu và tự động tắt bếp khi để quên và khóa an toàn cho trẻ em. Bếp được sản xuất tại Trung Quốc theo tiêu chuẩn cao cấp và tiêu chuẩn của thương hiệu bếp điện từ Electrolux&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&lt;/strong&gt;&amp;nbsp;có chức năng khóa trẻ em và tự động ngắt khi quá nhiệt mang đến sự an toàn khi sủ dụng Mặt bếp được chế tác bằng kính Ceracmix K+. Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS là loại bếp điện cao cấp của thương hiệu Electrolux được sản xuất và nhập khẩu nguyên chiếc cao cấp.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&lt;/strong&gt;&amp;nbsp;là sự lựa chọn tuyệt vời cho những ai ưa dùng bếp với tính năng tiện dụng và giá cả phải chăng&amp;nbsp; với thiết kế và mẫu mã hiện đại kết hợp công nghệ bếp điện từ hàng đầu thế giới. Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&amp;nbsp;được áp dụng công nghệ tiên tiến và mới nhất đảm bảo mang đến sự hài lòng cho các công trình tủ bếp cao cấp&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Các đặc tính nổi trội của Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS&lt;/h4&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;4 vùng bếp nấu nhanh và mạnh mẽ (tối đa: 2.3kW).&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;1 vùng bếp nấu có 3 vòng nhiệt.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Cảnh báo nhiệt dư sau khi nấu cho từng vùng bếp nấu.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Tự động tắt bếp khi để quên &amp;amp; khóa an toàn cho trẻ em.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Mặt bếp bằng kính Ceramic (K+).&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Công suất từng vùng bếp nấu: 2.3kW/ 1.8kW/ 1.2kW x 2.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Tổng công suất: 6.5kW.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Nguồn điện: 230V.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Tần số: 50Hz.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Xuất xứ: Trung Quốc.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;Bảo hành 2 năm.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Một số tính năng nổi trội của bếp từ Electrolux&lt;/h4&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Điều chỉnh lượng nhiệt chính xác&lt;/strong&gt;: Với 14 mức điều chỉnh công suất khác nhau giúp bạn dễ dàng kiểm soát nhiệt lượng cho món ăn ngon.&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Chức năng liên kết vùng nấu linh hoạt:&lt;/strong&gt;&amp;nbsp;Liên kết nhiều vùng nấu thích hợp với các dụng cụ nấu lớn hình chữ nhật hay oval&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Chức năng Stop+Go:&lt;/strong&gt;&amp;nbsp;Giúp tạm dừng, chuyển sang chế độ giữ ấm &amp;amp; nhanh chóng trở lại chương trình đang nấu&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Điều chỉnh nhiệt trực tiếp:&lt;/strong&gt;&amp;nbsp;Giúp bạn kiểm soát nhiệt lượng hoàn hảo với cảm ứng chạm và trượt xoay.&lt;br /&gt;\r\n	&lt;strong&gt;Mặt bếp luôn nguội và an toàn:&lt;/strong&gt;&amp;nbsp;Bếp từ chỉ truyền nhiệt trực tiếp lên nồi nấu, giúp mặt bếp luôn nguội và an toàn, bạn không còn phải lo lắng về vô tình bị bỏng hay không khí nóng nực khi nấu ăn&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Infinite Pure:&lt;/strong&gt;&amp;nbsp;Thiết kế tinh tế với mặt kính ceramic đen tuyền và điều khiển hiện thị ẩn. (chỉ có ở 1 số model)&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Chế độ trượt PowerSlide:&lt;/strong&gt;&amp;nbsp;Cho phép bạn thay đổi nhiệt lượng từ lớn đến nhỏ bằng cách di chuyển trượt chảo trên mặt bếp. (chỉ có ở 1 số model)&lt;/li&gt;\r\n	&lt;li style=&quot;text-align: justify;&quot;&gt;&lt;strong&gt;Cảm biến thông minh:&lt;/strong&gt;&amp;nbsp;Cảnh báo bạn khi nấu quá nhiệt, ngăn ngừa nguy cơ cháy thực phẩm.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Bếp điện âm 4 vùng nấu 60cm Electrolux EHET66CS 1&quot; loading=&quot;lazy&quot; sizes=&quot;(max-width: 1425px) 100vw, 1425px&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/Bep-tu-Electrolux.png&quot; srcset=&quot;https://flexhouse.vn/wp-content/uploads/2020/08/Bep-tu-Electrolux.png 1425w, https://flexhouse.vn/wp-content/uploads/2020/08/Bep-tu-Electrolux-300x125.png 300w, https://flexhouse.vn/wp-content/uploads/2020/08/Bep-tu-Electrolux-1024x428.png 1024w, https://flexhouse.vn/wp-content/uploads/2020/08/Bep-tu-Electrolux-768x321.png 768w, https://flexhouse.vn/wp-content/uploads/2020/08/Bep-tu-Electrolux-1200x501.png 1200w&quot; style=&quot;width:80%&quot; /&gt;&lt;/p&gt;\r\n', '', 'Bếp từ âm 4 vùng nấu 60cm', 'Bếp từ âm 4 vùng nấu 60cm', 'Bếp từ âm 4 vùng nấu 60cm'),
(73, 1, 'Lò vi sóng tích hợp nướng 25L', '&lt;ul&gt;\r\n	&lt;li&gt;Món ăn chín giòn, vàng da với chế độ Nướng&lt;/li&gt;\r\n	&lt;li&gt;Vào bếp dễ dàng và chuyên nghiệp&lt;/li&gt;\r\n	&lt;li&gt;Dung tích lớn trong thiết kế nhỏ gọn&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h4 style=&quot;text-align:justify&quot;&gt;Lò vi sóng&amp;nbsp;thiết kế đơn giản, gọn gàng, đẹp mắt, dễ kết hợp trong mọi không gian dùng&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Thiết kế - Lò vi sóng EMG25D59EB 25 lít&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1987/235303/thietke.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/chucnangnau.jpg&quot; style=&quot;width:80%&quot; title=&quot;Thiết kế - Lò vi sóng EMG25D59EB 25 lít&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Dung tích 25 lít&amp;nbsp;dùng thoải mái cho gia đình 2 - 4 người&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;5&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Khoang lò rộng bằng thép phủ sơn chống dính sáng bóng, sang trọng, bền bỉ,&amp;nbsp;dễ làm sạch&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Khoang lò có đèn tiện quan sát quá trình nấu nướng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Khoang lò - Lò vi sóng Electrolux EMG25D59EB 25 lít&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1987/235303/tq.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/congsuat-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Khoang lò - Lò vi sóng Electrolux EMG25D59EB 25 lít&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Lò vi sóng Electrolux&amp;nbsp;đa chức năng: nấu, hâm nóng,&amp;nbsp;rã đông,&amp;nbsp;nướng&amp;nbsp;với bảng điều khiển điện tử hiện đại&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;8 thực đơn nấu tự động giúp trọn vị mọi món ăn từ đông lạnh tới tươi xanh.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Chế độ rã đông thực phẩm cho phép thiết bị cài đặt chính xác công suất và thời gian giúp biến thực phẩm đông lạnh trở lại trạng thái tươi mới.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Chức năng - Lò vi sóng EMG25D59EB 25 lít&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1987/235303/chucnangnau.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/dungtich.jpg&quot; style=&quot;width:80%&quot; title=&quot;Chức năng - Lò vi sóng EMG25D59EB 25 lít&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Công suất nướng 1000W mạnh mẽ và công suất nấu vi sóng 900W với 5 mức công suất&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Công suất - Lò vi sóng EMG25D59EB 25 lít&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1987/235303/congsuat-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/thietke.jpg&quot; style=&quot;width:80%&quot; title=&quot;Công suất - Lò vi sóng EMG25D59EB 25 lít&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Lò kèm đĩa xoay và giá nướng giúp hoàn thành các món nướng đơn giản thơm ngon, đẹp mắt như khi dùng lò nướng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Đĩa xoay thuỷ tinh bên trong khoang lò với đường kính 27 cm cho phép bạn nấu những khẩu phần ăn lớn cho cả gia đình.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Lưu ý khi sử dụng&amp;nbsp;lò vi sóng có nướng:&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Không sử dụng đồ đựng thức ăn bằng kim loại trong lò vi sóng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Khi ở chế độ nướng, không để lò vận hành khi không có thức ăn.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Đặt lò vi sóng ở nơi thoáng mát, không gần các thiết bị điện khác như: tủ lạnh, bếp gas...&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Trước khi vệ sinh khoang lò, phải rút điện ra trước, không dùng các chất tẩy rửa mạnh để lau chùi.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Xem thêm:&amp;nbsp;13 món tuyệt đối không được cho vào lò vi sóng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Lò vi sóng Electrolux EMG25D59EB 25 lít&amp;nbsp;là thiết bị tiện dụng giúp&amp;nbsp;nấu ăn nhanh, an toàn mà vẫn đảm bảo thực đơn đa dạng, thơm ngon cho gia đình.&lt;/p&gt;\r\n', '', 'Lò vi sóng tích hợp nướng 25L', 'Lò vi sóng tích hợp nướng 25L', '');
INSERT INTO `pre_product_description` (`product_id`, `language_id`, `name`, `description`, `description2`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(70, 1, 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', '&lt;ul&gt;\r\n	&lt;li&gt;Tính năng thông minh Hob2Hood® kết nối với bếp từ&lt;/li&gt;\r\n	&lt;li&gt;Công suất hút mạnh mẽ&lt;/li&gt;\r\n	&lt;li&gt;Lọc sạch khí hiệu quả&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h4 style=&quot;text-align:justify&quot;&gt;Thương hiệu Electrolux - Thụy Điển, sản xuất và nhập khẩu nguyên chiếc từ Ý&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Máy hút mùi áp tường Electrolux KFVB19K - Thướng hiệu Electrolux&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/ap-ttuong-electrolux-kfvb19k-290921-021042.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/ap-ttuong-electrolux-kfvb19k-290921-021042.jpg&quot; style=&quot;width:80%&quot; title=&quot;Máy hút mùi áp tường Electrolux KFVB19K - Thướng hiệu Electrolux&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Tích hợp công nghệ Hob2Hood thông minh, hoạt động hiệu quả với bếp từ&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Nhờ vào công nghệ Hob2Hood kết nối được với bếp cùng hãng Electrolux, máy sẽ tự động điều chỉnh chế độ hút mùi phù hợp với chế độ nấu tương ứng của bếp giúp bạn không phải&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;bận tâm điều chỉnh máy.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Công nghệ - Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/congnghe.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/congnghe.jpg&quot; style=&quot;width:80%&quot; title=&quot;Công nghệ - Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Máy hút mùi&amp;nbsp;giúp làm sạch không khí với nút Breeze&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Khi nhấn nút thông gió Breeze, máy sẽ tự động điều chỉnh tốc độ hút xả ở mức thấp nhất và hoạt động một cách cực kì yên lặng trong 60 phút.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Nút thông gió - Máy hút mùi áp tường Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/tudong.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/congsuat-1-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Nút thông gió - Máy hút mùi áp tường Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Máy hút mùi Electrolux&amp;nbsp;KFVB19K có thiết kế lạ mắt kích thước rộng bao trùm toàn bộ bếp nấu, hoạt động hiệu quả&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Thân máy bằng thép không gỉ, mặt máy bằng kính bền bỉ dễ dàng vệ sinh.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Thiết kế - Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/thietke-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/den-2.jpg&quot; style=&quot;width:80%&quot; title=&quot;Thiết kế - Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Máy hút mùi áp tường&amp;nbsp;có công suất hút lớn tới 760 m³/h, 3 tốc độ giúp hút mùi nhanh&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Cho dù nấu các món ăn có tỏi hay cá, động cơ mạnh mẽ của máy hút mùi sẽ giúp lọc sạch mùi hôi trong căn bếp một cách nhanh chóng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Công suất - Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/congsuat-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/emai-2.jpg&quot; style=&quot;width:80%&quot; title=&quot;Công suất - Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Bảng điều khiển cảm ứng chạm IQ touch thông minh, điều chỉnh linh hoạt các chế độ theo nhu cầu sử dụng&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Điều khiển - Máy hút mùi áp tường Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/dieukhien.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/luoiloc-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Điều khiển - Máy hút mùi áp tường Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Công nghệ&amp;nbsp;SilenceTech giúp máy vận hành êm ái với độ ồn tối đa 61 dB tương đương với cuộc nói chuyện bình thường, không làm ảnh hưởng đến sinh hoạt&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Độ ồn - Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/emai-2.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/thietke-1.jpg&quot; style=&quot;width:80%&quot; title=&quot;Độ ồn - Electrolux KFVB19K&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Lưới lọc bằng chất liệu nhôm lọc dầu mỡ, hạn chế những chất này đi vào sâu trong linh kiện, ảnh hưởng đến hiệu quả hút mùi và làm giảm tuổi thọ máy.&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Bộ phận này có thể tháo lắp thuận tiện, vệ sinh máy đơn giản.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;strong&gt;Cách vệ sinh lưới lọc máy hút mùi:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Tuỳ vào tần suất sử dụng máy, bạn vệ sinh lưới lọc 1 - 2 tuần 1 lần. Việc vệ sinh lưới lọc thường xuyên sẽ giúp máy hút mùi hiệu quả, giữ vệ sinh cho không gian bếp, tăng độ bền cho máy.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Bạn pha loãng dung dịch xà phòng với nước ấm và ngâm lưới lọc cho mềm vết bẩn. Đánh rửa kỹ sau đó lau khô lại bằng khăn mềm sạch.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Không dùng nước rửa chén để tẩy rửa, sẽ khiến tấm lưới lọc dễ bị đen.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;- Ngoài ra, có thể sử dụng các hỗn hợp dung&amp;nbsp;dịch tẩy rửa tự nhiên&amp;nbsp;dễ tìm như: giấm/chanh + baking soda/ cocacola,... vừa làm sạch dễ dàng vừa tiết kiệm chi phí.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;https://www.dienmayxanh.com/images/4645/235700/luoiloc-1.jpg&quot; onclick=&quot;return false;&quot;&gt;&lt;img alt=&quot;Lưới lọc - Electrolux KFVB19K&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/luoiloc-1.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/tudong.jpg&quot; style=&quot;width:80%&quot; title=&quot;Lưới lọc - Electrolux KFVB19K&quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Đèn LED&amp;nbsp;có khả năng chiếu sáng tốt giúp cung cấp đủ ánh sáng cho người nội trợ nấu nướng&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;a href=&quot;https://www.dienmayxanh.com/images/4645/235700/den-2.jpg&quot; onclick=&quot;return false;&quot;&gt;&lt;img alt=&quot;Đèn - Electrolux KFVB19K &quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/4645/235700/den-2.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/emai-2.jpg&quot; style=&quot;width:80%&quot; title=&quot;Đèn - Electrolux KFVB19K &quot; /&gt;&lt;/a&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Máy hút mùi áp tường Electrolux KFVB19K&amp;nbsp;với thiết kế hình chữ T ngược độc đáo cùng màu đen sang trọng tích hợp thêm công nghệ Hob2Hood kết nối trực tiếp với bếp có cùng thương hiệu Electrolux nổi tiếng của Thụy Điển mang lại không khí trong lành cho không gian bếp của bạn.&lt;/p&gt;\r\n', 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', ''),
(53, 1, 'Máy giặt sấy 11/7kg UltimateCare 700', '&lt;ul&gt;\r\n	&lt;li&gt;Công nghệ Sensorwash với cảm biến AI thông minh loại bỏ đến 49 loại vết bẩn*&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ UltraMix giặt sạch sâu, không cặn giặt tẩy*.&lt;/li&gt;\r\n	&lt;li&gt;Công nghệ giặt hơi nước HygienicCare diệt 99.9% vi khuẩn và chất gây dị ứng*&lt;/li&gt;\r\n	&lt;li&gt;Nhiều chương trình giặt nhanh 15ph, 39ph, 60ph linh hoạt&lt;/li&gt;\r\n	&lt;li&gt;Kết nối Wifi, tư vấn chăm sóc quần áo chuyên nghiệp&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '&lt;h4 style=&quot;text-align:justify&quot;&gt;Thiết kế hiện đại với bảng điều khiển cảm ứng ngoài&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Máy giặt sấy Electrolux Inverter 11 kg&amp;nbsp;EWW1141AEWA&amp;nbsp;là dòng&amp;nbsp;máy giặt sấy&amp;nbsp;có thiết kế&amp;nbsp;cửa trước, mang sắc trắng đơn giản và trung tính kết hợp cùng bảng điều khiển&amp;nbsp;song ngữ dạng nút và xoay,&amp;nbsp;có màn hình hiển thị không chỉ nâng cao vẻ đẹp hiện đại cho không gian mà nó còn vô cùng tinh tế khi giúp bạn thuận tiện trong việc sử dụng.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Ngoài ra, máy sử dụng&amp;nbsp;công nghệ sấy ngưng tụ&amp;nbsp;sẽ không xả hơi nóng ra ngoài trong quá trình vận hành. Hơn nữa, công nghệ này cũng không đòi hỏi bạn phải lắp đặt thêm ống xả khí nên vô cùng phù hợp với những không gian có diện tích hạn chế.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Thiết kế sang trọng - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-19.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-101420-031403.jpg&quot; style=&quot;width:80%&quot; title=&quot;Thiết kế sang trọng - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Khả năng giặt sấy đa dạng, tiện lợi với 15 chương trình giặt&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA được trang bị nhiều chương trình hiện đại như chương trình giặt làm mới, giúp quần áo của bạn được giặt sạch, hạn chế nếp nhăn, tiết kiệm thời gian là ủi. Bên cạnh đó, sản phẩm còn được trang bị bảng điều khiển cảm ứng cùng với núm xoay tích hợp thêm 14 chương trình giặt khác, đáp ứng đa dạng nhu cầu sử dụng của bạn như: Giặt nhanh 15 phút, xả + vắt, đồ tổng hợp, giặt sấy 60 phút, đồ cotton, giặt tiết kiệm, len.&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA - Chương trình giặt&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-26.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-26.jpg&quot; style=&quot;width:80%&quot; title=&quot;Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA - Chương trình giặt&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Khối lượng giặt&amp;nbsp;11 kg sấy 7 kg phù hợp với gia đình có trên 7 thành viên&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Chiếc&amp;nbsp;máy giặt sấy Electrolux&amp;nbsp;này sẽ là một trợ thủ đắc lực cho việc giặt giũ quần áo của những gia đình nhờ vào khả năng có thể giặt khối lượng quần áo đến&amp;nbsp;&lt;a href=&quot;https://www.dienmayxanh.com/may-giat?g=tren-10-kg-tren-7-nguoi&quot; target=&quot;_blank&quot; title=&quot;11kg&quot;&gt;11kg&lt;/a&gt;, cùng với đó là khối lượng sấy lên đến&amp;nbsp;7 kg&amp;nbsp;phù hợp cho gia đình đông trên 7 người.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Khối lượng giặt 11 kg - Sấy 7 kg - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-101420-031403.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-17.jpg&quot; style=&quot;width:80%&quot; title=&quot;Khối lượng giặt 11 kg - Sấy 7 kg - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Vận hành ổn định, tiết kiệm chi phí điện hàng tháng với công nghệ Inverter&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Là một chiếc&amp;nbsp;máy giặt Inverter, máy giặt&amp;nbsp;Electrolux Inverter 11 kg EWW1141AEWA&amp;nbsp;không chỉ vận hành êm, ổn định mà nó còn đảm bảo khả năng tiết kiệm hiệu quả chi phí điện, nước hàng tháng cho gia đình.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Vận hành ổn định, tiết kiệm chi phí điện hàng tháng với công nghệ Inverter - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-17.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-16.jpg&quot; style=&quot;width:80%&quot; title=&quot;Vận hành ổn định, tiết kiệm chi phí điện hàng tháng với công nghệ Inverter - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;h4 style=&quot;text-align:justify&quot;&gt;Diệt khuẩn, giúp quần áo luôn mềm mại với công nghệ giặt hơi nước&amp;nbsp;Vapour Care&lt;/h4&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Với gia đình có trẻ nhỏ hoặc người thân có làn da dễ bị dị ứng thì với công nghệ giặt hơi nước Vapour Care&amp;nbsp;bạn sẽ hoàn toàn yên tâm. Nhờ công nghệ này, quần áo sẽ được giặt bằng hơi nước ở nhiệt độ cao, góp phần đẩy lùi vi khuẩn và tác nhân gây dị ứng có trên quần áo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;Bên cạnh đó, hơi nước còn giúp cho sợi vải được mềm mại hơn, nâng cao hiệu quả chống nhăn cho quần áo.&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Công nghệ giặt hơi nước Vapour Care - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-16.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-19.jpg&quot; style=&quot;width:80%&quot; title=&quot;Công nghệ giặt hơi nước Vapour Care - Máy giặt sấy Electrolux Inverter 11 kg EWW1141AEWA&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;em&gt;*&amp;nbsp;Wfk - Viện Nghiên cứu ứng dụng thực hiện các bài kiểm tra tính năng của chất tẩy rửa, chất làm sạch và chất khử trùng, kiểm tra thiết bị và điều tra quy trình cũng như giám sát khử trùng và vệ sinh. Viện có nhiều thập kỷ kinh nghiệm và đang làm việc trong các ủy ban quốc gia và quốc tế về phát triển các quy trình thử nghiệm tiêu chuẩn hóa đồng thời phù hợp với thực tiễn như Nhãn năng lượng của thiết bị gia dụng hoặc Nhãn Ecolab của Châu Âu cho bột giặt, nước rửa chén. và các chất tẩy rửa.&lt;/em&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Kết quả chứng nhận thử nghiệm công nghệ giặt hơi nước Vapour Care&quot; data-src=&quot;https://cdn.tgdd.vn/Products/Images/1944/202548/electrolux-eww1141aewa-271121-093949.jpg&quot; src=&quot;https://maadela.com.vn/image/catalog/san-pham/electrolux-eww1141aewa-271121-093949.jpg&quot; style=&quot;width:80%&quot; title=&quot;Kết quả chứng nhận thử nghiệm công nghệ giặt hơi nước Vapour Care&quot; /&gt;&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:justify&quot;&gt;&lt;em&gt;Công nghệ giặt hơi nước Vapour Care trên máy giặt Electrolux được WFK công nhận có thể giúp diệt khuẩn, ngừa dị ứng đến 99,9%.&lt;/em&gt;&lt;/p&gt;\r\n', '', 'Máy giặt sấy 11/7kg UltimateCare 700', 'Máy giặt sấy 11/7kg UltimateCare 700', 'Máy giặt sấy 11/7kg UltimateCare 700'),
(76, 1, 'Chậu rửa đá Maadela MD11650B', '&lt;p&gt;Chậu rửa đá Maadela&amp;nbsp;MD11650B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Maadele MD11650B&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&amp;nbsp;&lt;strong&gt;MD11650B&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu &lt;strong&gt;MD&lt;/strong&gt;&lt;strong&gt;11650B&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 1160x500&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;p style=&quot;text-align:center&quot;&gt;&lt;img alt=&quot;Chậu rửa đá Creave C11650B&quot; data-was-processed=&quot;true&quot; src=&quot;https://maadela.com.vn/image/catalog/24-2-2022/Chau-da-Halowin-HLW11650B.jpg&quot; style=&quot;border-style:solid; border-width:1px; width:80%&quot; /&gt;&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela11650B', 'Chậu rửa đá Madeela MD11650B', 'Chậu rửa đá Maadela MD11650B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh\r\n\r\n', 'Chậu rửa đá Maadela MD11650B'),
(77, 1, 'Chậu rửa đá Maadela MD7646B', '&lt;p&gt;Chậu rửa chén Maadela&amp;nbsp;cao cấp chính hãng, nhập khẩu giá tốt tại Khánh Vy Home&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin &lt;strong&gt;MD7646B&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD7646B&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 76x46&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; data-was-processed=&quot;true&quot; src=&quot;https://khanhvyhome.com.vn/image/catalog/san-pham/chau-rua/hallowin/HLW7646B/Chau-rua-da-Hallowin-HLW7646B.jpg&quot; /&gt;&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD7646B', 'Chậu rửa đá Maadela MD7646B', 'Chậu rửa chén Maadela cao cấp chính hãng, nhập khẩu giá tốt tại Khánh Vy Home', 'Chậu rửa đá Maadela MD7646B'),
(79, 1, 'Chậu rửa đá Maadela MD8650FB', '&lt;p&gt;Chậu rửa đá Maadela MD8650FB là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Hallowin&amp;nbsp;MD8650FB&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&lt;strong&gt;&amp;nbsp;MD8650FB&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD8650FB&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 860x500&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; data-was-processed=&quot;true&quot; src=&quot;https://khanhvyhome.com.vn/image/catalog/san-pham/chau-rua/hallowin/HLW8650FB/Chau-rua-da-Hallowin-HLW8650FB.jpg&quot; /&gt;&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD8650FB', 'Chậu rửa đá Maadela MD8650FB', 'Chậu rửa đá Maadela MD8650FB là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD8650FB'),
(80, 1, 'Chậu rửa đá Maadela MD8650GB', '&lt;p&gt;Chậu rửa đá Maadela MD8650GB là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Maadela MD8650GB&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&amp;nbsp;&lt;strong&gt;MD8650GB&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD8650GB&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 860x500&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; data-was-processed=&quot;true&quot; src=&quot;https://khanhvyhome.com.vn/image/catalog/san-pham/chau-rua/hallowin/HLW8650/Chau-rua-da-Hallowin-HLW8650.jpg&quot; /&gt;&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD8650GB', 'Chậu rửa đá Maadela MD8650GB', 'Chậu rửa đá Maadela MD8650GB là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD8650GB'),
(82, 1, 'Chậu rửa đá Maadela MD10050B', '&lt;p&gt;Chậu rửa đá Maadela MD10050B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Maadela MD10050B&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&amp;nbsp;&lt;strong&gt;MD10050B&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD10050B&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 1000x500&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;img alt=&quot;&quot; data-was-processed=&quot;true&quot; src=&quot;https://khanhvyhome.com.vn/image/catalog/san-pham/chau-rua/hallowin/HLW10050B/Chau-rua-da-Hallowin-HLW10050B.jpg&quot; /&gt;&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD10050B', 'Chậu rửa đá Maadela MD10050B', 'Chậu rửa đá Maadela MD10050B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD10050B'),
(83, 1, 'Chậu rửa đá Maadela MD6846B', '&lt;p&gt;Chậu rửa đá Maadela MD6846B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Maadela MD6846B&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu rửa chén làm từ bột đá&amp;nbsp;granite&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 680x458x220&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước cắt đá: 660x438&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;h4&gt;TỔNG QUAN&lt;/h4&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&amp;nbsp;&lt;strong&gt;MD6846B&amp;nbsp;&lt;/strong&gt;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD6846B&amp;nbsp;&lt;/strong&gt;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD6846B', 'Chậu rửa đá Maadela MD6846B', 'Chậu rửa đá Maadela MD6846B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD6846B'),
(78, 1, 'Chậu rửa đá Maadela MD8046B', '&lt;p&gt;Chậu rửa đá Maadela MD8046B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Chậu rửa đá Maadela MD8046B&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu rửa chén làm từ bột đá&amp;nbsp;granite&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 800x458x220mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước cắt đá: 780x438mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n\r\n&lt;h4&gt;TỔNG QUAN&lt;/h4&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Hallowin&amp;nbsp;&lt;strong&gt;MD8046B&amp;nbsp;&lt;/strong&gt;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD8046B&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD8046B', 'Chậu rửa đá Maadela MD8046B', 'Chậu rửa đá Maadela MD8046B là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD8046B'),
(81, 1, 'Chậu rửa đá Maadela MD8650T', '&lt;p&gt;Chậu rửa đá Maadela MD8650T&amp;nbsp;là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh&lt;/p&gt;\r\n', '&lt;h4&gt;NỔI BẬT&lt;/h4&gt;\r\n\r\n&lt;p&gt;Bề mặt chậu rất đẹp, nhiều mẫu mã đa dạng.&amp;nbsp;Sản phẩm là chậu đá nhân tạo được đúc từ bột đá Granite tự nhiên nên đây là một ưu điểm rất lớn để mọi người lựa chọn chậu rửa chén bằng đá Granite.&lt;/p&gt;\r\n\r\n&lt;p&gt;Độ bền, tuổi thọ của chậu rửa chén bằng đá rất cao, chịu được va đập lớn trong quá trình sử dụng.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu Maadela &lt;strong&gt;MD8650T&lt;/strong&gt;&amp;nbsp;không móp méo, chất lượng tốt, Chịu được vật nặng&lt;/p&gt;\r\n\r\n&lt;p&gt;Chỉ cần vệ sinh hằng ngày bằng việc lau chùi nhẹ nhàng là sản phẩm luôn như mới.&lt;/p&gt;\r\n\r\n&lt;p&gt;Chậu&amp;nbsp;&lt;strong&gt;MD8650T&lt;/strong&gt;&amp;nbsp;chống thấm vĩnh viễn, dễ vệ sinh, chịu nhiệt tốt.&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước chậu: 860 x 500 x 230 mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Kích thước cắt đá: 840 x 480 mm&lt;/p&gt;\r\n\r\n&lt;p&gt;Bảo hành 3 năm&lt;/p&gt;\r\n', 'Chậu rửa đá Maadela MD8650T', 'Chậu rửa đá Maadela MD8650T', 'Chậu rửa đá Maadela MD8650T là một trong những thiết bị vệ sinh không thể thiếu trong mỗi gia đình, tuy nhiên để chọn mua chậu rửa bát loại nào tốt và phù hợp với nhu cầu thì không phải ai trong chúng ta cũng làm được. Liên hệ Khánh', 'Chậu rửa đá Maadela MD8650T');

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_discount`
--

CREATE TABLE `pre_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,0) NOT NULL DEFAULT 0,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_filter`
--

CREATE TABLE `pre_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_filter`
--

INSERT INTO `pre_product_filter` (`product_id`, `filter_id`) VALUES
(51, 3),
(51, 4),
(51, 7),
(51, 10),
(51, 11),
(51, 12),
(52, 3),
(52, 5),
(52, 7),
(52, 10),
(52, 11),
(53, 3),
(53, 6),
(53, 8),
(53, 10),
(53, 11),
(54, 2),
(54, 6),
(54, 7),
(55, 6),
(55, 9),
(55, 13),
(56, 5),
(56, 8),
(56, 16),
(57, 7),
(57, 18),
(57, 19),
(58, 8),
(58, 22),
(58, 24),
(58, 27),
(58, 30),
(59, 9),
(59, 24),
(59, 25),
(59, 37),
(60, 5),
(60, 7),
(60, 33),
(60, 35),
(61, 8),
(61, 19),
(61, 42),
(61, 45),
(62, 5),
(62, 9),
(62, 40),
(62, 44),
(63, 6),
(63, 9),
(64, 9),
(64, 46),
(66, 8),
(66, 23),
(66, 24),
(66, 29),
(66, 30),
(66, 38),
(67, 9),
(67, 22),
(67, 24),
(67, 28),
(67, 30),
(67, 39),
(68, 6),
(68, 9),
(68, 25),
(68, 28),
(68, 39),
(68, 42),
(69, 6),
(69, 8),
(69, 29),
(69, 31),
(69, 42),
(70, 7),
(70, 24),
(70, 25),
(70, 29),
(70, 30),
(71, 5),
(71, 9),
(71, 13),
(71, 28),
(71, 31),
(71, 37),
(72, 6),
(72, 9),
(72, 25),
(72, 29),
(72, 37),
(72, 42),
(73, 4),
(73, 9),
(73, 24),
(73, 29),
(73, 42),
(74, 9),
(74, 14),
(74, 24),
(74, 25),
(74, 29),
(74, 39),
(74, 42),
(75, 4),
(75, 9),
(75, 25),
(75, 31),
(75, 34);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_image`
--

CREATE TABLE `pre_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_image`
--

INSERT INTO `pre_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2965, 59, 'catalog/san-pham/lo-nuong-electrolux-eob2100cox-3.jpg', 4),
(2749, 57, 'catalog/san-pham/vn-eqe6000a-b-1500x1500-lifestyle.png', 5),
(2748, 57, 'catalog/san-pham/vn-eqe6000a-b-fr-o-pr-1500x1500.png', 4),
(2747, 57, 'catalog/san-pham/vn-eqe6000a-b-fr-o-1500x1500.png', 3),
(2951, 56, 'catalog/san-pham/vn-ebb3442k-a-insit-1500x1500.png', 5),
(2746, 57, 'catalog/san-pham/vn-eqe6000a-b-cp-1500x1500.jpg', 2),
(2745, 57, 'catalog/san-pham/vn-eqe6000a-b-angl-cl-1500x1500.png', 1),
(2950, 56, 'catalog/san-pham/vn-ebb3442k-a-cp-1500x1500.png', 4),
(2824, 55, 'catalog/san-pham/e5gs1-55db-acc-1500x1500.jpg', 3),
(2823, 55, 'catalog/san-pham/e5gs1-55db-tank-1500x1500.jpg', 2),
(2949, 56, 'catalog/san-pham/vn-ebb3442k-a-1500x1500-upright-refrigerator-open.png', 3),
(2947, 56, 'catalog/san-pham/vn-ebb3442k-a-angl-1500x1500.jpg', 1),
(2948, 56, 'catalog/san-pham/vn-ebb3442k-a-fr-o-1500x1500.png', 2),
(2822, 55, 'catalog/san-pham/vn-d2c-e5gs1-55db-tnk-1500x1500.png', 1),
(2807, 54, 'catalog/san-pham/vn-d2c-edh903bewacp-1500x1500.png', 3),
(2806, 54, 'catalog/san-pham/vn-d2c-edh903bewadr-1500x1500.png', 2),
(2805, 54, 'catalog/san-pham/vn-d2c-edh903bewaangrcl-1500x1500.png', 1),
(2987, 53, 'catalog/san-pham/eww1142q7wb-vn-bk-1500x1500.jpg', 7),
(2986, 53, 'catalog/san-pham/ewf9042q7wb-institute-1500x1500.jpg', 6),
(2985, 53, 'catalog/san-pham/eww1142q7wb-vn-dr-1500x1500.jpg', 5),
(2984, 53, 'catalog/san-pham/eww1142q7wb-drw-1500x1500.png', 4),
(2983, 53, 'catalog/san-pham/eww1142q7wb-vn-cp-1500x1500.jpg', 3),
(2982, 53, 'catalog/san-pham/eww1142q7wb-vn-angr-1500x1500.jpg', 2),
(2981, 53, 'catalog/san-pham/eww1142q7wb-vn-fr-op-1500x1500.png', 1),
(2955, 52, 'catalog/san-pham/vn-d2c-ewf1141aesadrwango-1500x1500.png', 4),
(2954, 52, 'catalog/san-pham/vn-d2c-ewf1141aesacp-1500x1500.png', 3),
(2937, 51, 'catalog/san-pham/ewf1141r9sb-vn-bk-1500x1500.jpg', 7),
(2936, 51, 'catalog/san-pham/ewf1141r9sb-insitu-1500x1500.jpg', 6),
(2935, 51, 'catalog/san-pham/ewf1141r9sb-vn-dr-1500x1500.jpg', 5),
(2934, 51, 'catalog/san-pham/ewf1141r9sb-vn-cp-1500x1500.png', 4),
(2933, 51, 'catalog/san-pham/ewf1141r9sb-sd-1500x1500.png', 3),
(2932, 51, 'catalog/san-pham/ewf1141r9sb-vn-angr-1500x1500.png', 2),
(2931, 51, 'catalog/san-pham/ewf1141r9sb-vn-fr-op-1500x1500.png', 1),
(2953, 52, 'catalog/san-pham/vn-d2c-ewf1141aesadr-1500x1500.png', 2),
(2952, 52, 'catalog/san-pham/vn-d2c-ewf1141aesaangrcl-1500x1500.png', 1),
(2964, 59, 'catalog/san-pham/lo-nuong-electrolux-eob2100cox-2.jpg', 3),
(2753, 60, 'catalog/san-pham/vn-d2c-esf8730rox-angl-tr-pr-1500x1500.png', 4),
(2754, 60, 'catalog/san-pham/vn-d2c-esf8730rox-angl-br-pr-1500x1500.png', 5),
(2752, 60, 'catalog/san-pham/vn-d2c-esf8730rox-back-1500x1500.png', 3),
(2750, 60, 'catalog/san-pham/vn-d2c-esf8730rox-fr-cl-1500x1500.png', 1),
(2751, 60, 'catalog/san-pham/vn-d2c-esf8730rox-cp-1500x1500.png', 2),
(2816, 61, 'catalog/san-pham/vn-d2c-pa91-606dg-insit-1500x1500-min.jpg', 4),
(2813, 61, 'catalog/san-pham/vn-d2c-pa91-606dg-left-1500x1500.png', 1),
(2814, 61, 'catalog/san-pham/vn-d2c-pa91-606dg-cp-1500x1500.jpg', 2),
(2815, 61, 'catalog/san-pham/vn-d2c-pa91-606dg-insit4-1500x1500-min.jpg', 3),
(2768, 62, 'catalog/san-pham/vn-d2c-fa31-202gy-insit2-1500x1500.jpg', 4),
(2769, 62, 'catalog/san-pham/vn-d2c-fa31-202gy-insit3-1500x1500.jpg', 5),
(2767, 62, 'catalog/san-pham/vn-d2c-fa31-202gy-insit1-1500x1500.jpg', 3),
(2765, 62, 'catalog/san-pham/vn-d2c-fa31-202gy-right-1500x1500.png', 1),
(2766, 62, 'catalog/san-pham/vn-d2c-fa31-202gy-back-1500x1500.png', 2),
(2821, 63, 'catalog/san-pham/wq71-2bswf-insit-tal-1500x1500.jpg', 5),
(2819, 63, 'catalog/san-pham/wq71-2bswf-acc2-1500x1500.png', 3),
(2817, 63, 'catalog/san-pham/wq71-2bswf-angr-1500x1500.png', 1),
(2818, 63, 'catalog/san-pham/wq71-2bswf-acc1-1500x1500.png', 2),
(2780, 64, 'catalog/san-pham/tw-pq91-3em-insit-1500x1500-min.jpg', 5),
(2781, 64, 'catalog/san-pham/tw-pq91-3em-insit2-1500x1500-min.jpg', 6),
(2779, 64, 'catalog/san-pham/tw-pq91-3em-cp-1500x1500-min.jpg', 4),
(2778, 64, 'catalog/san-pham/tw-pq91-3em-acc-1500x1500.png', 3),
(2777, 64, 'catalog/san-pham/tw-pq91-3em-angr-1500x1500.png', 2),
(2834, 65, 'catalog/san-pham/vn-ewe451mb-dst2-shower2-700x700.png', 5),
(2833, 65, 'catalog/san-pham/vn-ewe451mb-dst2-shower-700x700.png', 4),
(2832, 65, 'catalog/san-pham/vn-ewe451mb-dst2-side-700x700.png', 3),
(2831, 65, 'catalog/san-pham/vn-ewe451mb-dst2-bottom-700x700.png', 2),
(2830, 65, 'catalog/san-pham/vn-ewe451mb-dst2-front-700x700.png', 1),
(2776, 64, 'catalog/san-pham/tw-pq91-3em-angl-1500x1500.png', 1),
(2820, 63, 'catalog/san-pham/wq71-2bswf-insit-1500x1500.jpg', 4),
(2866, 67, 'catalog/san-pham/vn-ehg8321bc-br-1500x1500.png', 2),
(2865, 67, 'catalog/san-pham/vn-ehg8321bc-angl-1500x1500.png', 1),
(2858, 71, 'catalog/san-pham/ems3288x-o-1500x1500.png', 2),
(2857, 71, 'catalog/san-pham/ems3288x-cp-1500x1500.png', 1),
(2856, 72, 'catalog/san-pham/vn-emm23k18gw-l-1500x1500.png', 2),
(2855, 72, 'catalog/san-pham/vn-emm23k18gw-inside-1500x1500.png', 1),
(2967, 73, 'catalog/san-pham/vn-emg25d59eb-cavity-700x700-min.png', 1),
(2968, 73, 'catalog/san-pham/vn-emg25d59eb-panel-700x700.png', 2),
(2852, 74, 'catalog/san-pham/vn-e6af1-220k-fr-1500x1500.png', 2),
(2851, 74, 'catalog/san-pham/vn-e6af1-220k-cp-1500x1500.png', 1),
(2870, 75, 'catalog/san-pham/vn-e6af1-520k-angl1-1500x1500.png', 2),
(2869, 75, 'catalog/san-pham/vn-e6af1-520k-cp-1500x1500.png', 1),
(2959, 58, 'catalog/san-pham/noi.jpg', 4),
(2958, 58, 'catalog/san-pham/thietke-2.jpg', 3),
(2957, 58, 'catalog/san-pham/tinhnang.jpg', 2),
(2956, 58, 'catalog/san-pham/tongcongsuat.jpg', 1),
(2963, 59, 'catalog/san-pham/vn-d2c-eob2100cox-cp-1500x1500.png', 2),
(2962, 59, 'catalog/san-pham/vn-d2c-eob2100cox-inside-1500x1500.png', 1),
(2939, 66, 'catalog/san-pham/Bep-tu-Electrolux.png', 1),
(2972, 70, 'catalog/san-pham/den-2.jpg', 4),
(2971, 70, 'catalog/san-pham/congsuat-1-1.jpg', 3),
(2970, 70, 'catalog/san-pham/congnghe.jpg', 2),
(2969, 70, 'catalog/san-pham/ap-ttuong-electrolux-kfvb19k-290921-021042.jpg', 1),
(2960, 58, 'catalog/san-pham/matbep.jpg', 5),
(2961, 58, 'catalog/san-pham/hob2hood.jpg', 6),
(2966, 59, 'catalog/san-pham/lo-nuong-electrolux-eob2100cox-4.jpg', 5),
(2973, 70, 'catalog/san-pham/dieukhien.jpg', 5),
(3041, 81, 'catalog/san-pham/01-chau-rua-da-creave-C8650T-800x800.png', 2),
(3040, 81, 'catalog/san-pham/02-chau-rua-da-creave-C8650T-800x800.png', 1),
(3032, 83, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD6846B-4.jpg', 4),
(3031, 83, 'catalog/2022-3-4/Chau-rua-da-Maadela-MD6846B-3.png', 3),
(3030, 83, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD6846B-2.png', 2),
(3043, 80, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD8650GB-2.jpg', 2),
(3039, 79, 'catalog/24-2-2022/Chau-rua-da-Maadela-MD8650FB-1.jpg', 4),
(3042, 78, 'catalog/san-pham/Chau-rua-da-Maadela-MD8046B-1-1500x1500autox2.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_option`
--

CREATE TABLE `pre_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_option_value`
--

CREATE TABLE `pre_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,0) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_recurring`
--

CREATE TABLE `pre_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_related`
--

CREATE TABLE `pre_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_related`
--

INSERT INTO `pre_product_related` (`product_id`, `related_id`) VALUES
(51, 51),
(51, 52),
(51, 53),
(51, 54),
(52, 51),
(52, 52),
(52, 53),
(52, 54),
(53, 51),
(53, 52),
(53, 53),
(53, 54),
(54, 51),
(54, 52),
(54, 53),
(54, 54),
(55, 56),
(55, 57),
(55, 58),
(55, 59),
(55, 60),
(56, 55),
(56, 56),
(56, 57),
(56, 67),
(56, 68),
(57, 55),
(57, 56),
(57, 67),
(57, 68),
(58, 55),
(58, 66),
(58, 67),
(58, 68),
(58, 70),
(59, 55),
(59, 67),
(59, 68),
(59, 70),
(60, 55),
(60, 66),
(60, 67),
(60, 68),
(60, 70),
(61, 61),
(61, 62),
(62, 61),
(63, 63),
(63, 64),
(64, 63),
(66, 58),
(66, 60),
(66, 67),
(67, 56),
(67, 57),
(67, 58),
(67, 59),
(67, 60),
(67, 66),
(68, 56),
(68, 57),
(68, 58),
(68, 59),
(68, 60),
(70, 58),
(70, 59),
(70, 60);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_reward`
--

CREATE TABLE `pre_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_special`
--

CREATE TABLE `pre_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,0) NOT NULL DEFAULT 0,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_special`
--

INSERT INTO `pre_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(540, 51, 1, 0, '22690000', '0000-00-00', '0000-00-00'),
(551, 53, 1, 0, '19790000', '0000-00-00', '0000-00-00'),
(501, 55, 1, 0, '1819000', '0000-00-00', '0000-00-00'),
(545, 56, 1, 0, '12190000', '0000-00-00', '0000-00-00'),
(489, 57, 1, 0, '24190000', '0000-00-00', '0000-00-00'),
(546, 58, 1, 0, '12690000', '0000-00-00', '0000-00-00'),
(547, 59, 1, 0, '8490000', '0000-00-00', '0000-00-00'),
(491, 60, 1, 0, '40990000', '0000-00-00', '0000-00-00'),
(495, 62, 1, 0, '3890000', '0000-00-00', '0000-00-00'),
(497, 64, 1, 0, '6990000', '0000-00-00', '0000-00-00'),
(503, 65, 1, 0, '4490000', '0000-00-00', '0000-00-00'),
(542, 66, 1, 0, '12690000', '0000-00-00', '0000-00-00'),
(523, 67, 1, 0, '6829000', '0000-00-00', '0000-00-00'),
(518, 68, 1, 0, '5190000', '0000-00-00', '0000-00-00'),
(517, 69, 1, 0, '11619000', '0000-00-00', '0000-00-00'),
(549, 70, 1, 0, '26890000', '0000-00-00', '0000-00-00'),
(515, 72, 1, 0, '2039000', '0000-00-00', '0000-00-00'),
(514, 74, 1, 0, '1869000', '0000-00-00', '0000-00-00'),
(527, 75, 1, 0, '3090000', '0000-00-00', '0000-00-00'),
(548, 73, 1, 0, '3000000', '0000-00-00', '0000-00-00'),
(589, 76, 1, 0, '7990000', '0000-00-00', '0000-00-00'),
(582, 77, 1, 0, '5490000', '0000-00-00', '0000-00-00'),
(588, 78, 1, 0, '5490000', '0000-00-00', '0000-00-00'),
(585, 79, 1, 0, '5990000', '0000-00-00', '0000-00-00'),
(590, 80, 1, 0, '5990000', '0000-00-00', '0000-00-00'),
(587, 81, 1, 0, '6990000', '0000-00-00', '0000-00-00'),
(578, 82, 1, 0, '5990000', '0000-00-00', '0000-00-00'),
(580, 83, 1, 0, '4990000', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_to_category`
--

CREATE TABLE `pre_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_to_category`
--

INSERT INTO `pre_product_to_category` (`product_id`, `category_id`) VALUES
(51, 78),
(51, 100),
(51, 104),
(52, 78),
(52, 100),
(52, 104),
(53, 78),
(53, 100),
(53, 106),
(54, 78),
(54, 100),
(54, 106),
(55, 95),
(55, 100),
(56, 79),
(56, 103),
(56, 107),
(57, 79),
(57, 103),
(57, 108),
(58, 77),
(58, 103),
(59, 81),
(59, 103),
(59, 113),
(60, 97),
(60, 103),
(61, 80),
(61, 102),
(62, 80),
(62, 102),
(63, 83),
(63, 102),
(63, 116),
(64, 83),
(64, 102),
(64, 116),
(65, 99),
(65, 102),
(66, 77),
(67, 77),
(68, 85),
(69, 85),
(70, 85),
(71, 84),
(72, 84),
(73, 84),
(74, 87),
(75, 87),
(76, 119),
(76, 120),
(77, 119),
(77, 120),
(78, 119),
(78, 120),
(79, 119),
(79, 120),
(80, 119),
(80, 120),
(81, 119),
(81, 120),
(82, 119),
(82, 120),
(83, 119),
(83, 120);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_to_download`
--

CREATE TABLE `pre_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_to_layout`
--

CREATE TABLE `pre_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_to_layout`
--

INSERT INTO `pre_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(61, 0, 0),
(53, 0, 0),
(65, 0, 0),
(51, 0, 0),
(60, 0, 0),
(59, 0, 0),
(66, 0, 0),
(58, 0, 0),
(57, 0, 0),
(55, 0, 0),
(62, 0, 0),
(63, 0, 0),
(68, 0, 0),
(54, 0, 0),
(52, 0, 0),
(67, 0, 0),
(56, 0, 0),
(64, 0, 0),
(69, 0, 0),
(70, 0, 0),
(71, 0, 0),
(72, 0, 0),
(73, 0, 0),
(74, 0, 0),
(75, 0, 0),
(76, 0, 0),
(77, 0, 0),
(78, 0, 0),
(79, 0, 0),
(80, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_product_to_store`
--

CREATE TABLE `pre_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_product_to_store`
--

INSERT INTO `pre_product_to_store` (`product_id`, `store_id`) VALUES
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_recurring`
--

CREATE TABLE `pre_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_recurring_description`
--

CREATE TABLE `pre_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_return`
--

CREATE TABLE `pre_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_return_action`
--

CREATE TABLE `pre_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_return_action`
--

INSERT INTO `pre_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Đã hoàn tiền'),
(2, 1, 'Tín dụng đã được phát hành'),
(3, 1, 'Đã gửi thay thế');

-- --------------------------------------------------------

--
-- Table structure for table `pre_return_history`
--

CREATE TABLE `pre_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_return_reason`
--

CREATE TABLE `pre_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_return_reason`
--

INSERT INTO `pre_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Hỏng khi đến nơi'),
(2, 1, 'Đã nhận được hàng sai'),
(3, 1, 'Lỗi đặt hàng'),
(4, 1, 'Bị lỗi, xin vui lòng cung cấp chi tiết'),
(5, 1, 'Khác, xin vui lòng cung cấp chi tiết');

-- --------------------------------------------------------

--
-- Table structure for table `pre_return_status`
--

CREATE TABLE `pre_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_return_status`
--

INSERT INTO `pre_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Đang chờ xử lý'),
(3, 1, 'Hoàn thành'),
(2, 1, 'Đang chờ sản phẩm');

-- --------------------------------------------------------

--
-- Table structure for table `pre_review`
--

CREATE TABLE `pre_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_review`
--

INSERT INTO `pre_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(2, 51, 0, 'Quy Trần 93', 'sau một năm dùng tạm ổn... tuy nhiên nhà sản xuất cần khắc phục lỗi làm sao đi chân đất phơi quần áo từ máy giặt không bị điện giật nhé... với lại thêm một cái cốc chia liều lượng nước giặt và nước xả vải tuỳ theo số cân quần ào trong máy giặt... sau khoảng 2 năm nếu cần vệ sinh máy giặt bằng banking soda thì cần cho khách hàng địa chỉ bán bột banking soda chính hãng uy tín qua tờ hướng dẫn lúc mới mua máy nhé, tìm mãi chỉ thấy hướng dẫn sử dụng mà không thấy cái địa chỉ bán bột banking soda', 3, 1, '2022-01-18 16:49:00', '2022-01-18 20:20:04'),
(3, 51, 0, 'Quy Trần', 'Sản phẩm có màu sắc đẹp, sạch sẽ và sang trọng, cửa mở rộng dễ cho đồ và lấy đồ, các tính năng giặt phù hợp với gia đình như giặt quần áo cotton riêng, tổng hợp riêng, đồ len, đồ dạ, đồ mỏng... đều phù hợp', 5, 1, '2022-01-18 16:50:54', '2022-01-18 20:20:00'),
(4, 51, 0, 'Quy', 'Tôi đã mua và sử dụng loại máy giặt này, mặc dù giá thành cao nhưng lợi ích và cảm nhận được mang lại nhiều hơn giá trị. Gia đình đã dùng nhãn hiệu electrolux rất nhiều và rất tin tưởng.', 4, 1, '2022-01-18 20:32:19', '2022-01-18 20:32:30'),
(5, 51, 0, 'Quy Quy', 'Cảm nhận của mình sau một thời gian dùng em máy giặt này đó là hài lòng tuyệt đối, với khoang chứa đồ lớn tha hồ giặt quần áo cho gia đình có đông thành viên như nhà mình. Và dù giặt nhiều quần áo cùng lúc nhưng vẫn không làm hư nhau áo quần mà còn vắt rất khô. Thời gian giặt cũng khá hợp lý, giúp mình tiết kiệm được khá thời gian. Máy giặt giúp mình chăm sóc gia đình nhỏ của mình thêm trọn vẹn hơn, máy vận hành khá êm, không gây ồn, tiết kiệm điện năng nữa chứ. Rất đáng với số tiền đã bỏ ra', 5, 1, '2022-01-18 20:33:34', '0000-00-00 00:00:00'),
(6, 51, 0, 'Quy 1', 'Máy giặt êm, nếu nước mạnh thì giặt rất nhanh, khoảng 30 phút. Nhiều chức năng đặc biệt là sấy đồ khá tốt đối với những căn hộ chung cư.', 5, 1, '2022-01-18 20:54:24', '0000-00-00 00:00:00'),
(7, 51, 0, 'Quy 2', 'Kiểu dáng đẹp, màu sắc sang trọng', 4, 1, '2022-01-18 20:54:51', '0000-00-00 00:00:00'),
(9, 67, 0, 'test test', 'Sản phẩm tôi thấy rất tuyệt vời', 4, 1, '2022-01-20 14:40:35', '2022-01-20 14:40:49'),
(10, 58, 0, 'wao', 'nice 	Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu	Bếp ga âm 80cm UltimateTaste 300 với 3 vùng nấu', 5, 1, '2022-01-20 14:41:19', '2022-01-20 14:41:27'),
(11, 59, 0, 'wao', '5 sao', 5, 1, '2022-01-20 14:54:38', '0000-00-00 00:00:00'),
(12, 66, 0, 'Bếp từ âm 4 vùng nấu 60cm', 'Bếp từ âm 4 vùng nấu 60cm', 5, 1, '2022-01-20 14:54:52', '0000-00-00 00:00:00'),
(13, 73, 0, 'Lò vi sóng tích hợp nướng 25L', 'Lò vi sóng tích hợp nướng 25L', 5, 1, '2022-01-20 14:55:26', '0000-00-00 00:00:00'),
(14, 70, 0, 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', 'Máy hút mùi bằng kính và thép cao cấp dạng áp tường 90cm', 5, 1, '2022-01-20 14:55:35', '0000-00-00 00:00:00'),
(15, 51, 0, 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900', 5, 1, '2022-01-20 14:55:56', '0000-00-00 00:00:00'),
(16, 52, 0, 'Máy giặt cửa trước 11kg UltimateCare 900', 'Máy giặt cửa trước 11kg UltimateCare 900', 5, 1, '2022-01-20 14:56:04', '0000-00-00 00:00:00'),
(17, 53, 0, 'Máy giặt sấy 11/7kg UltimateCare 700', 'Máy giặt sấy 11/7kg UltimateCare 700', 5, 1, '2022-01-20 14:56:18', '0000-00-00 00:00:00'),
(18, 54, 0, 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', 'Máy sấy bơm nhiệt Heat Pump 9kg UltimateCare 800', 5, 1, '2022-01-20 14:56:50', '0000-00-00 00:00:00'),
(19, 55, 0, 'Bàn ủi hơi nước đứng 1300W Refine 500', 'Bàn ủi hơi nước đứng 1300W Refine 500', 5, 1, '2022-01-20 14:57:10', '0000-00-00 00:00:00'),
(20, 61, 0, 'dũng', 'Máy lọc không khí 5 bước lọc Pure A9 cho phòng có diện tích lên đến 88m2', 5, 1, '2022-01-20 14:57:22', '0000-00-00 00:00:00'),
(21, 62, 0, 'mai sĩ', 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2', 5, 1, '2022-01-20 14:57:43', '0000-00-00 00:00:00'),
(22, 62, 0, 'tiến', 'Máy lọc không khí 4 bước lọc Flow A3 cho phòng có diện tích lên đến 26m2', 5, 1, '2022-01-20 14:57:54', '0000-00-00 00:00:00'),
(23, 63, 0, 'hoàng', 'Máy hút bụi không dây sang trọng Well Q7P 21.6V', 5, 1, '2022-01-20 14:58:15', '0000-00-00 00:00:00'),
(24, 64, 0, 'truck', 'Máy hút bụi không dây Pure Q9 – màu đồng', 5, 1, '2022-01-20 14:58:27', '0000-00-00 00:00:00'),
(25, 65, 0, 'trường ', 'Máy nước nóng ComfortFlow™ 800', 5, 1, '2022-01-20 14:58:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_reviewpost`
--

CREATE TABLE `pre_reviewpost` (
  `reviewpost_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_reviewpost`
--

INSERT INTO `pre_reviewpost` (`reviewpost_id`, `post_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 'Quy Trần 93', 'Lorem ipsum dolor sit ametse, consectetuer adipiscing elit, consequatsed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim add isminim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequatnisl ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', 4, 1, '2018-05-15 20:46:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_setting`
--

CREATE TABLE `pre_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_setting`
--

INSERT INTO `pre_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(38863, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(38862, 0, 'cod', 'cod_order_status_id', '1', 0),
(38861, 0, 'cod', 'cod_total', '0', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(38885, 0, 'flat', 'flat_sort_order', '1', 0),
(38884, 0, 'flat', 'flat_status', '1', 0),
(38883, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(38882, 0, 'flat', 'flat_tax_class_id', '0', 0),
(38881, 0, 'flat', 'flat_cost', '50000', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(38865, 0, 'cod', 'cod_sort_order', '1', 0),
(38864, 0, 'cod', 'cod_status', '1', 0),
(39037, 0, 'category', 'category_column', '1', 0),
(35347, 0, 'google_sitemap', 'google_sitemap_status', '1', 0),
(35342, 0, 'postmostviewd', 'postmostviewd_status', '1', 0),
(35339, 0, 'post', 'post_status', '1', 0),
(28568, 0, 'tmdqc', 'tmdqc_danger_button_border', '', 0),
(28569, 0, 'tmdqc', 'tmdqc_input_color', '', 0),
(28570, 0, 'tmdqc', 'tmdqc_input_background', '', 0),
(28571, 0, 'tmdqc', 'tmdqc_input_border', '', 0),
(28572, 0, 'tmdqc', 'tmdqc_label_color', '', 0),
(28573, 0, 'tmdqc', 'tmdqc_title', '{\"heading_title\":{\"1\":\"\",\"2\":\"\"},\"cart_title\":{\"1\":\"\",\"2\":\"\"},\"chekout_option_title\":{\"1\":\"\",\"2\":\"\"},\"custmer_title\":{\"1\":\"\",\"2\":\"\"},\"login_title\":{\"1\":\"\",\"2\":\"\"},\"register_title\":{\"1\":\"\",\"2\":\"\"},\"guest_title\":{\"1\":\"\",\"2\":\"\"},\"personal_detail_title\":{\"1\":\"\",\"2\":\"\"},\"afterlogincustomer\":{\"1\":\"\",\"2\":\"\"},\"selectaddress\":{\"1\":\"\",\"2\":\"\"},\"delivery_details_title\":{\"1\":\"\",\"2\":\"\"},\"delivery_method_title\":{\"1\":\"\",\"2\":\"\"},\"payment_method_title\":{\"1\":\"\",\"2\":\"\"},\"login_button_title\":{\"1\":\"\",\"2\":\"\"},\"continue_shopping_title\":{\"1\":\"\",\"2\":\"\"},\"order_title\":{\"1\":\"\",\"2\":\"\"}}', 1),
(28567, 0, 'tmdqc', 'tmdqc_danger_button_background_hover', '', 0),
(28566, 0, 'tmdqc', 'tmdqc_danger_button_background', '', 0),
(28565, 0, 'tmdqc', 'tmdqc_danger_button_color', '', 0),
(28564, 0, 'tmdqc', 'tmdqc_primary_button_border', '', 0),
(28563, 0, 'tmdqc', 'tmdqc_primary_button_background_hover', '', 0),
(28562, 0, 'tmdqc', 'tmdqc_primary_button_background', '', 0),
(28543, 0, 'tmdqc', 'tmdqc_flat', '{\"1\":{\"image\":\"\",\"label\":\"&lt;font color=\"},\"2\":{\"image\":\"\",\"label\":\"&lt;font color=\"}}', 1),
(28561, 0, 'tmdqc', 'tmdqc_primary_button_color', '', 0),
(28560, 0, 'tmdqc', 'tmdqc_block_heading_color', '', 0),
(28559, 0, 'tmdqc', 'tmdqc_cart_table_border', '', 0),
(28558, 0, 'tmdqc', 'tmdqc_cart_table_background', '', 0),
(28557, 0, 'tmdqc', 'tmdqc_cart_table_color', '', 0),
(28555, 0, 'tmdqc', 'tmdqc_cart_heading_color', '', 0),
(28556, 0, 'tmdqc', 'tmdqc_cart_heading_background', '', 0),
(28544, 0, 'tmdqc', 'tmdqc_payment_label', '1', 0),
(28545, 0, 'tmdqc', 'tmdqc_payment_comment', '1', 0),
(28546, 0, 'tmdqc', 'tmdqc_cod', '{\"1\":{\"image\":\"\",\"label\":\"&lt;font color=\"},\"2\":{\"image\":\"\",\"label\":\"&lt;font color=\"}}', 1),
(28547, 0, 'tmdqc', 'tmdqc_free_checkout', '{\"1\":{\"image\":\"\",\"label\":\"&lt;font color=\"},\"2\":{\"image\":\"\",\"label\":\"&lt;font color=\"}}', 1),
(28548, 0, 'tmdqc', 'tmdqc_trackingcode', '!-- Google Code for PPC Success Conversion Page --&gt;\r\n&lt;script type=&quot;text/javascript&quot;&gt;\r\n/* &lt;![CDATA[ */\r\nvar google_conversion_id = 1041599530;\r\nvar google_conversion_language = &quot;en&quot;;\r\nvar google_conversion_format = &quot;3&quot;;\r\nvar google_conversion_color = &quot;ffffff&quot;;\r\nvar google_conversion_label = &quot;0cutCM-WrVcQqpjW8AM&quot;;\r\nvar google_conversion_value = {ordertotal};\r\nvar google_conversion_currency = &quot;{ccode}&quot;;\r\nvar google_remarketing_only = false;\r\n/* ]]&gt; */\r\n&lt;/script&gt;\r\n&lt;script type=&quot;text/javascript&quot; src=&quot;//www.googleadservices.com/pagead/conversion.js&quot;&gt;\r\n&lt;/script&gt;\r\n&lt;noscript&gt;\r\n&lt;div style=&quot;display:inline;&quot;&gt;\r\n&lt;img height=&quot;1&quot; width=&quot;1&quot; style=&quot;border-style:none;&quot; alt=&quot;&quot; src=&quot;//www.googleadservices.com/pagead/conversion/1041599530/?value={ordertotal}&amp;amp;currency_code={ccode}&amp;amp;label=0cutCM-WrVcQqpjW8AM&amp;amp;guid=ON&amp;amp;script=0&quot;/&gt;\r\n&lt;/div&gt;\r\n&lt;/noscript&gt;', 0),
(28553, 0, 'tmdqc', 'tmdqc_sub_content_background', '', 0),
(28554, 0, 'tmdqc', 'tmdqc_sub_content_border', '', 0),
(28551, 0, 'tmdqc', 'tmdqc_block_heading_background', '', 0),
(28552, 0, 'tmdqc', 'tmdqc_block_heading_border', '', 0),
(28549, 0, 'tmdqc', 'tmdqc_content_background', '', 0),
(28550, 0, 'tmdqc', 'tmdqc_content_heading_color', '', 0),
(28542, 0, 'tmdqc', 'tmdqc_shipping_comment', '1', 0),
(28541, 0, 'tmdqc', 'tmdqc_shipping_label', '1', 0),
(28540, 0, 'tmdqc', 'tmdqc_deliveryaddress_state', '{\"label\":{\"1\":\"Region \\/ State\",\"2\":\"Region \\/ State\"},\"sort_order\":\"0\"}', 1),
(28538, 0, 'tmdqc', 'tmdqc_deliveryaddress_postal_code', '{\"label\":{\"1\":\"Post Code\",\"2\":\"Post Code\"},\"sort_order\":\"0\"}', 1),
(28539, 0, 'tmdqc', 'tmdqc_deliveryaddress_country', '{\"label\":{\"1\":\"Country\",\"2\":\"Country\"},\"sort_order\":\"0\"}', 1),
(28537, 0, 'tmdqc', 'tmdqc_deliveryaddress_city', '{\"label\":{\"1\":\"City\",\"2\":\"City\"},\"sort_order\":\"0\"}', 1),
(28536, 0, 'tmdqc', 'tmdqc_deliveryaddress_address2', '{\"label\":{\"1\":\"Address 2\",\"2\":\"Address 2\"},\"sort_order\":\"0\"}', 1),
(28535, 0, 'tmdqc', 'tmdqc_deliveryaddress_address1', '{\"label\":{\"1\":\"Address 1\",\"2\":\"Address 1\"},\"sort_order\":\"0\"}', 1),
(28534, 0, 'tmdqc', 'tmdqc_deliveryaddress_company', '{\"label\":{\"1\":\"Company\",\"2\":\"Company\"},\"sort_order\":\"0\"}', 1),
(28533, 0, 'tmdqc', 'tmdqc_deliveryaddress_lastname', '{\"label\":{\"1\":\"Last Name\",\"2\":\"Last Name\"},\"sort_order\":\"0\"}', 1),
(28532, 0, 'tmdqc', 'tmdqc_deliveryaddress_firstname', '{\"label\":{\"1\":\"First Name\",\"2\":\"First Name\"},\"sort_order\":\"0\"}', 1),
(28529, 0, 'tmdqc', 'tmdqc_billaddress_country', '{\"label\":{\"1\":\"Country\",\"2\":\"Country\"},\"sort_order\":\"0\"}', 1),
(28530, 0, 'tmdqc', 'tmdqc_billaddress_state', '{\"label\":{\"1\":\"Region \\/ State\",\"2\":\"Region \\/ State\"},\"sort_order\":\"0\"}', 1),
(28531, 0, 'tmdqc', 'tmdqc_deliveryaddress_status', '1', 0),
(28528, 0, 'tmdqc', 'tmdqc_billaddress_postal_code', '{\"label\":{\"1\":\"Post Code\",\"2\":\"Post Code\"},\"sort_order\":\"0\"}', 1),
(28527, 0, 'tmdqc', 'tmdqc_billaddress_city', '{\"label\":{\"1\":\"City\",\"2\":\"City\"},\"sort_order\":\"0\"}', 1),
(28526, 0, 'tmdqc', 'tmdqc_billaddress_address2', '{\"label\":{\"1\":\"Address 2\",\"2\":\"Address 2\"},\"sort_order\":\"0\"}', 1),
(28525, 0, 'tmdqc', 'tmdqc_billaddress_address1', '{\"label\":{\"1\":\"Address 1\",\"2\":\"Address 1\"},\"sort_order\":\"0\"}', 1),
(28520, 0, 'tmdqc', 'tmdqc_guest_country', '{\"label\":{\"1\":\"Country\",\"2\":\"Country\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28521, 0, 'tmdqc', 'tmdqc_guest_state', '{\"label\":{\"1\":\"Region \\/ State\",\"2\":\"Region \\/ State\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28522, 0, 'tmdqc', 'tmdqc_billaddress_firstname', '{\"label\":{\"1\":\"First Name\",\"2\":\"First Name\"},\"sort_order\":\"0\"}', 1),
(28523, 0, 'tmdqc', 'tmdqc_billaddress_lastname', '{\"label\":{\"1\":\"Last Name\",\"2\":\"Last Name\"},\"sort_order\":\"0\"}', 1),
(28524, 0, 'tmdqc', 'tmdqc_billaddress_company', '{\"label\":{\"1\":\"Company\",\"2\":\"Company\"},\"sort_order\":\"0\"}', 1),
(28519, 0, 'tmdqc', 'tmdqc_guest_postal_code', '{\"label\":{\"1\":\"Post Code\",\"2\":\"Post Code\"},\"sort_order\":\"0\"}', 1),
(28517, 0, 'tmdqc', 'tmdqc_guest_address2', '{\"label\":{\"1\":\"Address 2\",\"2\":\"Address 2\"},\"sort_order\":\"0\"}', 1),
(28518, 0, 'tmdqc', 'tmdqc_guest_city', '{\"label\":{\"1\":\"City\",\"2\":\"City\"},\"sort_order\":\"0\"}', 1),
(28515, 0, 'tmdqc', 'tmdqc_guest_company', '{\"label\":{\"1\":\"Company\",\"2\":\"Company\"},\"sort_order\":\"0\"}', 1),
(28516, 0, 'tmdqc', 'tmdqc_guest_address1', '{\"label\":{\"1\":\"Address 1\",\"2\":\"Address 1\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28514, 0, 'tmdqc', 'tmdqc_guest_fax', '{\"label\":{\"1\":\"Fax\",\"2\":\"Fax\"},\"sort_order\":\"0\"}', 1),
(28512, 0, 'tmdqc', 'tmdqc_guest_email', '{\"label\":{\"1\":\"E-Mail\",\"2\":\"E-Mail\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28513, 0, 'tmdqc', 'tmdqc_guest_telephone', '{\"label\":{\"1\":\"Telephone\",\"2\":\"Telephone\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28511, 0, 'tmdqc', 'tmdqc_guest_lastname', '{\"label\":{\"1\":\"Last Name\",\"2\":\"Last Name\"},\"sort_order\":\"0\"}', 1),
(28510, 0, 'tmdqc', 'tmdqc_guest_firstname', '{\"label\":{\"1\":\"First Name\",\"2\":\"First Name\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28509, 0, 'tmdqc', 'tmdqc_guest_status', '1', 0),
(28507, 0, 'tmdqc', 'tmdqc_register_password', '{\"label\":{\"1\":\"Password\",\"2\":\"Password\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28508, 0, 'tmdqc', 'tmdqc_register_cpassword', '{\"label\":{\"1\":\"Confirm Password\",\"2\":\"Confirm Password\"},\"sort_order\":\"0\"}', 1),
(28501, 0, 'tmdqc', 'tmdqc_register_address2', '{\"label\":{\"1\":\"Address 2\",\"2\":\"Address 2\"},\"sort_order\":\"0\"}', 1),
(28502, 0, 'tmdqc', 'tmdqc_register_city', '{\"label\":{\"1\":\"City\",\"2\":\"City\"},\"sort_order\":\"0\"}', 1),
(28503, 0, 'tmdqc', 'tmdqc_register_postal_code', '{\"label\":{\"1\":\"Post Code\",\"2\":\"Post Code\"},\"sort_order\":\"0\"}', 1),
(28504, 0, 'tmdqc', 'tmdqc_register_country', '{\"label\":{\"1\":\"Country\",\"2\":\"Country\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28505, 0, 'tmdqc', 'tmdqc_register_state', '{\"label\":{\"1\":\"Region \\/ State\",\"2\":\"Region \\/ State\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28506, 0, 'tmdqc', 'tmdqc_register_newsletter', '{\"label\":{\"1\":\"I wish to subscribe to the Your Store newsletter\",\"2\":\"I wish to subscribe to the Your Store newsletter\"},\"sort_order\":\"0\"}', 1),
(28499, 0, 'tmdqc', 'tmdqc_register_company', '{\"label\":{\"1\":\"Company\",\"2\":\"Company\"},\"sort_order\":\"0\"}', 1),
(28500, 0, 'tmdqc', 'tmdqc_register_address1', '{\"label\":{\"1\":\"Address 1\",\"2\":\"Address 1\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28498, 0, 'tmdqc', 'tmdqc_register_fax', '{\"label\":{\"1\":\"Fax\",\"2\":\"Fax\"},\"sort_order\":\"0\"}', 1),
(28493, 0, 'tmdqc', 'tmdqc_cart_total_status', '1', 0),
(28494, 0, 'tmdqc', 'tmdqc_register_firstname', '{\"label\":{\"1\":\"First Name\",\"2\":\"First Name\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28495, 0, 'tmdqc', 'tmdqc_register_lastname', '{\"label\":{\"1\":\"Last Name\",\"2\":\"Last Name\"},\"sort_order\":\"0\"}', 1),
(28496, 0, 'tmdqc', 'tmdqc_register_email', '{\"label\":{\"1\":\"E-Mail\",\"2\":\"E-Mail\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28497, 0, 'tmdqc', 'tmdqc_register_telephone', '{\"label\":{\"1\":\"Telephone\",\"2\":\"Telephone\"},\"status\":\"1\",\"sort_order\":\"0\"}', 1),
(28492, 0, 'tmdqc', 'tmdqc_cart_unitprice_status', '1', 0),
(28491, 0, 'tmdqc', 'tmdqc_cart_qty_status', '1', 0),
(28490, 0, 'tmdqc', 'tmdqc_cart_name_status', '1', 0),
(28489, 0, 'tmdqc', 'tmdqc_cart_image_status', '1', 0),
(28488, 0, 'tmdqc', 'tmdqc_customer_group_id', '1', 0),
(28487, 0, 'tmdqc', 'tmdqc_checkout_id', '0', 0),
(28486, 0, 'tmdqc', 'tmdqc_account_id', '0', 0),
(28485, 0, 'tmdqc', 'tmdqc_account_option', 'guest', 0),
(28484, 0, 'tmdqc', 'tmdqc_zone_id', '3780', 0),
(28483, 0, 'tmdqc', 'tmdqc_country_id', '230', 0),
(28482, 0, 'tmdqc', 'tmdqc_status', '1', 0),
(28481, 0, 'tmdqc', 'tmdqc_layout_description', '[main]\r\n    [col-12]  {cart} [/col-12]\r\n [/main]\r\n[main]\r\n   [col-6] {account}[/col-6] \r\n   [col-6]   {delivery_detail} [/col-6]\r\n[/main]\r\n[main]\r\n   [col-6]  {shipping_method} [/col-6]\r\n   [col-6]  {payment_method} [/col-6] \r\n [/main]\r\n[main]\r\n  [col-12]  {confirmation} [/col-12]\r\n[/main]', 0),
(38855, 0, 'bank_transfer', 'bank_transfer_bank2', 'Account number: ...\r\nAccount name: ...\r\nBank: ...\r\nBranch: ...', 0),
(29441, 0, 'visitor_counter', 'visitor_counter_main_counter', '0', 0),
(29442, 0, 'visitor_counter', 'visitor_counter_status', '1', 0),
(38895, 0, 'd_quickcheckout', 'd_quickcheckout_debug_file', 'd_quickcheckout.log', 0),
(33828, 0, 'advanced_newsletter', 'advanced_newsletter_send_for', '[\"4\"]', 1),
(33827, 0, 'advanced_newsletter', 'advanced_newsletter_status', '1', 0),
(33829, 0, 'advanced_newsletter', 'advanced_newsletter_display_as', 'normal', 0),
(38285, 0, 'brainyfilter', 'brainyfilter_layout_50', '{\"module_id\":\"50\",\"current_adm_tab\":\"responsive\",\"layout_id\":\"1\",\"layout_position\":\"content_top\",\"layout_sort_order\":\"1\",\"layout_enabled\":\"1\",\"behaviour\":{\"containerSelector\":\"#content .row:nth-last-of-type(2)\",\"paginatorSelector\":\"#content .row:nth-last-of-type(1)\",\"sections\":[],\"filter_name\":{\"1\":\"Brainy Filter\",\"2\":\"Brainy Filter\"},\"sort_order\":{\"search\":0,\"price\":1,\"category\":2,\"stock_status\":3,\"manufacturer\":4,\"attribute\":5,\"option\":6,\"filter\":7,\"rating\":8}},\"submission\":{\"submit_delay_time\":\"1000\",\"submit_type\":\"button\",\"submit_button_type\":\"float\",\"hide_panel\":\"1\"},\"style\":{\"responsive\":{\"enabled\":\"0\",\"collapsed\":\"1\",\"max_width\":\"300\",\"max_screen_width\":\"768\",\"position\":\"left\",\"offset\":\"80\"},\"block_header_background\":{\"val\":\"rgb(247, 247, 247)\",\"default\":\"0\"},\"block_header_text\":{\"val\":\"rgb(0, 0, 0)\",\"default\":\"0\"},\"product_quantity_background\":{\"val\":\"rgb(244, 98, 52)\",\"default\":\"0\"},\"product_quantity_text\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"price_slider_background\":{\"val\":\"rgb(238, 238, 238)\",\"default\":\"0\"},\"price_slider_area_background\":{\"val\":\"rgb(246, 168, 40)\",\"default\":\"0\"},\"price_slider_border\":{\"val\":\"rgb(221, 221, 221)\",\"default\":\"0\"},\"price_slider_handle_background\":{\"val\":\"rgb(246, 246, 246)\",\"default\":\"0\"},\"price_slider_handle_border\":{\"val\":\"rgb(204, 204, 204)\",\"default\":\"0\"},\"group_block_header_background\":{\"val\":\"rgb(206, 203, 203)\",\"default\":\"0\"},\"group_block_header_text\":{\"val\":\"rgb(0, 0, 0)\",\"default\":\"0\"},\"resp_show_btn_color\":{\"val\":\"rgb(25, 163, 223)\",\"default\":\"0\"},\"resp_reset_btn_color\":{\"val\":\"rgb(245, 56, 56)\",\"default\":\"0\"}}}', 1),
(38284, 0, 'brainyfilter', 'brainyfilter_layout_basic', '{\"behaviour\":{\"containerSelector\":\"#content .row:nth-last-of-type(2)\",\"paginatorSelector\":\"#content .row:nth-last-of-type(1)\",\"attribute_groups\":1,\"product_count\":1,\"hide_empty\":0,\"limit_height\":{\"enabled\":0,\"height\":144},\"limit_items\":{\"enabled\":0,\"number_to_show\":4,\"number_to_hide\":2},\"sections\":{\"search\":{\"enabled\":0,\"collapsed\":0},\"price\":{\"enabled\":1,\"collapsed\":0,\"control\":\"slider\"},\"category\":{\"enabled\":1,\"collapsed\":0,\"control\":\"checkbox\"},\"stock_status\":{\"enabled\":1,\"collapsed\":0},\"manufacturer\":{\"enabled\":1,\"collapsed\":0,\"control\":\"checkbox\"},\"attribute\":{\"enabled\":1,\"collapsed\":0},\"option\":{\"enabled\":0,\"collapsed\":0},\"filter\":{\"enabled\":0,\"collapsed\":0},\"rating\":{\"enabled\":0,\"collapsed\":0}},\"sort_order\":{\"enabled\":0,\"search\":0,\"price\":1,\"category\":2,\"stock_status\":3,\"manufacturer\":4,\"attribute\":5,\"option\":6,\"filter\":7,\"rating\":8}},\"submission\":{\"submit_type\":\"button\",\"submit_button_type\":\"float\",\"submit_delay_time\":1000,\"hide_panel\":1},\"global\":{\"instock_status_id\":7,\"subcategories_fix\":0,\"multiple_attributes\":0,\"attribute_separator\":\",\",\"cron_secret_key\":\"\",\"hide_out_of_stock\":0,\"postponed_count\":1},\"style\":{\"block_header_background\":{\"val\":\"#f7f7f7\"},\"block_header_text\":{\"val\":\"#000000\"},\"product_quantity_background\":{\"val\":\"#F46234\"},\"product_quantity_text\":{\"val\":\"#ffffff\"},\"price_slider_background\":{\"val\":\"#eeeeee\"},\"price_slider_area_background\":{\"val\":\"#f6a828\"},\"price_slider_border\":{\"val\":\"#dddddd\"},\"price_slider_handle_background\":{\"val\":\"#f6f6f6\"},\"price_slider_handle_border\":{\"val\":\"#cccccc\"},\"group_block_header_background\":{\"val\":\"#CECBCB\"},\"group_block_header_text\":{\"val\":\"#000000\"},\"resp_show_btn_color\":{\"val\":\"#19A3DF\"},\"resp_reset_btn_color\":{\"val\":\"#F53838\"},\"responsive\":{\"enabled\":0,\"collapsed\":1,\"max_screen_width\":768,\"max_width\":300,\"position\":\"left\",\"offset\":80}},\"attributes_default\":{\"enable_all\":1,\"control\":\"checkbox\"},\"options_default\":{\"enable_all\":1,\"control\":\"checkbox\",\"mode\":\"label\"},\"filters_default\":{\"enable_all\":1,\"control\":\"checkbox\"},\"attributes\":[],\"options\":[],\"filters\":[],\"current_adm_tab\":\"embedding\",\"module_id\":\"basic\"}', 1),
(38282, 0, 'brainyfilter', 'brainyfilter_layout_42', '{\"module_id\":\"42\",\"current_adm_tab\":\"style\",\"layout_id\":\"15\",\"layout_position\":\"column_left\",\"layout_sort_order\":\"0\",\"layout_enabled\":\"1\",\"behaviour\":{\"sections\":[],\"limit_height\":{\"enabled\":\"0\",\"height\":\"144\"},\"filter_name\":{\"1\":\"T\\u00ecm ki\\u1ebfm\",\"2\":\"Searching\"},\"sort_order\":{\"search\":0,\"price\":1,\"category\":2,\"stock_status\":3,\"manufacturer\":4,\"attribute\":5,\"option\":6,\"filter\":7,\"rating\":8}},\"submission\":{\"submit_delay_time\":\"1000\",\"submit_button_type\":\"float\",\"hide_panel\":\"1\"},\"style\":{\"block_header_background\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"block_header_text\":{\"val\":\"rgb(85, 85, 85)\",\"default\":\"0\"},\"product_quantity_background\":{\"val\":\"rgb(156, 91, 87)\",\"default\":\"0\"},\"product_quantity_text\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"price_slider_background\":{\"val\":\"rgb(238, 238, 238)\",\"default\":\"0\"},\"price_slider_area_background\":{\"val\":\"rgb(119, 119, 119)\",\"default\":\"0\"},\"price_slider_border\":{\"val\":\"rgb(221, 221, 221)\",\"default\":\"0\"},\"price_slider_handle_background\":{\"val\":\"rgb(156, 91, 87)\",\"default\":\"0\"},\"price_slider_handle_border\":{\"val\":\"rgb(156, 91, 87)\",\"default\":\"0\"},\"group_block_header_background\":{\"val\":\"rgb(156, 91, 87)\",\"default\":\"0\"},\"group_block_header_text\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"resp_show_btn_color\":{\"val\":\"rgb(156, 91, 87)\",\"default\":\"0\"},\"resp_reset_btn_color\":{\"val\":\"rgb(245, 56, 56)\",\"default\":\"0\"}}}', 1),
(38283, 0, 'brainyfilter', 'brainyfilter_layout_43', '{\"module_id\":\"43\",\"current_adm_tab\":\"responsive\",\"layout_id\":\"3\",\"layout_position\":\"column_left\",\"layout_sort_order\":\"0\",\"layout_enabled\":\"1\",\"behaviour\":{\"containerSelector\":\"#content ul.product-list-container\",\"paginatorSelector\":\"#content .row_pagination\",\"sections\":{\"search\":{\"enabled\":\"0\",\"collapsed\":\"0\"},\"price\":{\"enabled\":\"0\",\"collapsed\":\"0\",\"control\":\"slider_lbl\"},\"category\":{\"enabled\":\"1\",\"collapsed\":\"0\",\"control\":\"checkbox\"},\"stock_status\":{\"enabled\":\"0\",\"collapsed\":\"0\"},\"manufacturer\":{\"enabled\":\"0\",\"collapsed\":\"0\",\"control\":\"checkbox\"},\"attribute\":{\"enabled\":\"0\",\"collapsed\":\"0\"},\"option\":{\"enabled\":\"0\",\"collapsed\":\"0\"},\"filter\":{\"enabled\":\"1\",\"collapsed\":\"0\"},\"rating\":{\"enabled\":\"0\",\"collapsed\":\"0\"}},\"product_count\":\"0\",\"filter_name\":{\"1\":\"B\\u1ed9 l\\u1ecdc\",\"2\":\"Filter\"},\"sort_order\":{\"search\":0,\"price\":1,\"category\":2,\"stock_status\":3,\"manufacturer\":4,\"attribute\":5,\"option\":6,\"filter\":7,\"rating\":8}},\"submission\":{\"submit_type\":\"auto\",\"submit_delay_time\":\"500\",\"submit_button_type\":\"float\",\"hide_panel\":\"1\"},\"style\":{\"responsive\":{\"enabled\":\"1\",\"collapsed\":\"0\",\"max_width\":\"300\",\"max_screen_width\":\"768\",\"position\":\"left\",\"offset\":\"80\"},\"block_header_background\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"block_header_text\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"product_quantity_background\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"product_quantity_text\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"price_slider_background\":{\"val\":\"rgb(238, 238, 238)\",\"default\":\"0\"},\"price_slider_area_background\":{\"val\":\"rgb(119, 119, 119)\",\"default\":\"0\"},\"price_slider_border\":{\"val\":\"rgb(238, 238, 238)\",\"default\":\"0\"},\"price_slider_handle_background\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"price_slider_handle_border\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"group_block_header_background\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"group_block_header_text\":{\"val\":\"rgb(255, 255, 255)\",\"default\":\"0\"},\"resp_show_btn_color\":{\"val\":\"rgb(237, 50, 55)\",\"default\":\"0\"},\"resp_reset_btn_color\":{\"val\":\"rgb(245, 56, 56)\",\"default\":\"0\"}}}', 1),
(38891, 0, 'd_quickcheckout', 'd_quickcheckout_status', '1', 0),
(38892, 0, 'd_quickcheckout', 'd_quickcheckout_trigger', '#button-confirm, .button, .btn, .button_oc, input[type=submit]', 0),
(38893, 0, 'd_quickcheckout', 'd_quickcheckout_debug', '0', 0),
(38894, 0, 'd_quickcheckout', 'd_quickcheckout_setting', '{\"name\":\"10\\/16\\/2016 04:03:13 pm\",\"general\":{\"clear_session\":\"0\",\"login_refresh\":\"0\",\"analytics_event\":\"0\",\"compress\":\"1\",\"config\":\"d_quickcheckout\",\"min_order\":{\"value\":\"0\",\"text\":{\"1\":\"Gi\\u00e1 tr\\u1ecb \\u0111\\u1eb7t h\\u00e0ng thi\\u1ec3u l\\u00e0 %s\",\"2\":\"You must have a sum more then %s to make an order \"}},\"min_quantity\":{\"value\":\"0\",\"text\":{\"1\":\"S\\u1ed1 l\\u01b0\\u1ee3ng t\\u1ed1i thi\\u1ec3u l\\u00e0 %s\",\"2\":\"You must have a quantity more then %s to make an order \"}}},\"step\":{\"login\":{\"default_option\":\"guest\",\"option\":{\"login\":{\"display\":\"0\",\"title\":{\"1\":\"\\u0110\\u0103ng nh\\u1eadp\",\"2\":\"Log in\"}},\"register\":{\"display\":\"0\",\"title\":{\"1\":\"\\u0110\\u0103ng k\\u00fd\",\"2\":\"Registration\"}},\"guest\":{\"display\":\"0\",\"title\":{\"1\":\"Kh\\u00e1ch\",\"2\":\"Guest\"}}},\"icon\":\"fa fa-user\",\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"0\"},\"payment_address\":{\"fields\":{\"firstname\":{\"sort_order\":\"0\",\"value\":\"\",\"mask\":\"\"},\"lastname\":{\"sort_order\":\"1\",\"value\":\"\",\"mask\":\"\"},\"email\":{\"sort_order\":\"2\",\"value\":\"\",\"mask\":\"\"},\"email_confirm\":{\"sort_order\":\"3\",\"value\":\"\",\"mask\":\"\"},\"telephone\":{\"sort_order\":\"4\",\"value\":\"\",\"mask\":\"\"},\"fax\":{\"sort_order\":\"5\",\"value\":\"\",\"mask\":\"\"},\"password\":{\"sort_order\":\"6\"},\"confirm\":{\"sort_order\":\"7\"},\"heading\":{\"sort_order\":\"8\"},\"company\":{\"sort_order\":\"9\",\"value\":\"\",\"mask\":\"\"},\"customer_group_id\":{\"sort_order\":\"10\"},\"address_1\":{\"sort_order\":\"11\",\"value\":\"\",\"mask\":\"\"},\"address_2\":{\"sort_order\":\"12\",\"value\":\"\",\"mask\":\"\"},\"city\":{\"sort_order\":\"13\",\"value\":\"\",\"mask\":\"\"},\"postcode\":{\"sort_order\":\"14\",\"value\":\"\",\"mask\":\"\"},\"country_id\":{\"sort_order\":\"15\",\"value\":\"286\"},\"zone_id\":{\"sort_order\":\"16\",\"value\":\"\"},\"newsletter\":{\"sort_order\":\"17\",\"value\":\"0\"},\"shipping_address\":{\"sort_order\":\"18\",\"value\":\"1\"},\"agree\":{\"sort_order\":\"19\",\"value\":\"1\"}},\"icon\":\"fa fa-book\",\"title\":{\"1\":\"Th\\u00f4ng tin kh\\u00e1ch h\\u00e0ng\",\"2\":\"Customer information\"},\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"1\"},\"shipping_address\":{\"fields\":{\"firstname\":{\"sort_order\":\"1\",\"value\":\"\",\"mask\":\"\"},\"lastname\":{\"sort_order\":\"2\",\"value\":\"\",\"mask\":\"\"},\"company\":{\"sort_order\":\"3\",\"value\":\"\",\"mask\":\"\"},\"address_1\":{\"sort_order\":\"4\",\"value\":\"\",\"mask\":\"\"},\"address_2\":{\"sort_order\":\"5\",\"value\":\"\",\"mask\":\"\"},\"city\":{\"sort_order\":\"6\",\"value\":\"\",\"mask\":\"\"},\"postcode\":{\"sort_order\":\"7\",\"value\":\"\",\"mask\":\"\"},\"country_id\":{\"sort_order\":\"8\",\"value\":\"\"},\"zone_id\":{\"sort_order\":\"9\",\"value\":\"\"}},\"icon\":\"fa fa-book\",\"title\":{\"1\":\"\\u0110\\u1ecba ch\\u1ec9 giao h\\u00e0ng\",\"2\":\"Shipping Address\"},\"description\":{\"1\":\"\",\"2\":\"\"},\"column\":\"1\",\"row\":\"2\"},\"shipping_method\":{\"display\":\"1\",\"display_options\":\"1\",\"display_title\":\"1\",\"input_style\":\"radio\",\"default_option\":\"flat\",\"icon\":\"fa fa-truck\",\"title\":{\"1\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n\",\"2\":\"Shipping method\"},\"description\":{\"1\":\"Vui l\\u00f2ng ch\\u1ecdn ph\\u01b0\\u01a1ng th\\u1ee9c v\\u1eadn chuy\\u1ec3n \\u0111\\u1ec3 s\\u1eed d\\u1ee5ng theo \\u0111\\u01a1n h\\u00e0ng n\\u00e0y.\",\"2\":\"Please select the preferred shipping method to use on this order.\"},\"column\":\"2\",\"row\":\"0\"},\"payment_method\":{\"display\":\"1\",\"display_options\":\"1\",\"display_images\":\"1\",\"input_style\":\"radio\",\"default_option\":\"free_checkout\",\"icon\":\"fa fa-credit-card\",\"title\":{\"1\":\"Ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n\",\"2\":\"Payment method\"},\"description\":{\"1\":\"Vui l\\u00f2ng ch\\u1ecdn ph\\u01b0\\u01a1ng th\\u1ee9c thanh to\\u00e1n \\u0111\\u1ec3 s\\u1eed d\\u1ee5ng cho \\u0111\\u01a1n \\u0111\\u1eb7t h\\u00e0ng n\\u00e0y.\",\"2\":\"Please select the preferred payment method to use on this order.\"},\"column\":\"3\",\"row\":\"0\"},\"payment\":{\"default_payment_popup\":\"0\",\"payment_popups\":{\"amazon_login_pay\":\"0\",\"authorizenet_aim\":\"0\",\"authorizenet_sim\":\"0\",\"bank_transfer\":\"0\",\"bluepay_hosted\":\"0\",\"bluepay_redirect\":\"0\",\"cheque\":\"0\",\"cod\":\"0\",\"firstdata\":\"0\",\"firstdata_remote\":\"0\",\"free_checkout\":\"0\",\"g2apay\":\"0\",\"globalpay\":\"0\",\"globalpay_remote\":\"0\",\"klarna_account\":\"0\",\"klarna_invoice\":\"0\",\"liqpay\":\"0\",\"nochex\":\"0\",\"paymate\":\"0\",\"paypoint\":\"0\",\"payza\":\"0\",\"perpetual_payments\":\"0\",\"pp_express\":\"0\",\"pp_payflow\":\"0\",\"pp_payflow_iframe\":\"0\",\"pp_pro\":\"0\",\"pp_pro_iframe\":\"0\",\"pp_standard\":\"0\",\"realex\":\"0\",\"realex_remote\":\"0\",\"sagepay_direct\":\"0\",\"sagepay_server\":\"0\",\"sagepay_us\":\"0\",\"securetrading_pp\":\"0\",\"securetrading_ws\":\"0\",\"skrill\":\"0\",\"twocheckout\":\"0\",\"web_payment_software\":\"0\",\"worldpay\":\"0\"},\"column\":\"4\",\"row\":\"1\"},\"cart\":{\"icon\":\"fa fa-shopping-cart\",\"title\":{\"1\":\"Gi\\u1ecf h\\u00e0ng\",\"2\":\"Shopping cart\"},\"description\":{\"1\":\"Th\\u00f4ng tin s\\u1ea3n ph\\u1ea9m trong gi\\u1ecf h\\u00e0ng\",\"2\":\"Product information in the cart\"},\"column\":\"4\",\"row\":\"0\"},\"confirm\":{\"fields\":{\"comment\":{\"sort_order\":\"0\"},\"agree\":{\"sort_order\":\"1\",\"value\":\"0\"}},\"column\":\"4\",\"row\":\"3\"}},\"design\":{\"login_style\":\"popup\",\"theme\":\"default\",\"block_style\":\"row\",\"placeholder\":\"1\",\"breadcrumb\":\"1\",\"address_style\":\"radio\",\"cart_image_size\":{\"width\":\"80\",\"height\":\"80\"},\"max_width\":\"\",\"bootstrap\":\"0\",\"only_quickcheckout\":\"0\",\"column_width\":{\"1\":\"4\",\"2\":\"4\",\"3\":\"4\",\"4\":\"8\"},\"custom_style\":\"\"},\"account\":{\"guest\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"email\":{\"display\":\"1\",\"require\":\"1\"},\"email_confirm\":{\"display\":\"0\",\"require\":\"0\"},\"telephone\":{\"display\":\"1\",\"require\":\"1\"},\"fax\":{\"display\":\"0\",\"require\":\"0\"},\"heading\":{\"display\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"customer_group_id\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"shipping_address\":{\"display\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}},\"register\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"email\":{\"display\":\"1\",\"require\":\"1\"},\"email_confirm\":{\"display\":\"0\",\"require\":\"0\"},\"telephone\":{\"display\":\"1\",\"require\":\"1\"},\"fax\":{\"display\":\"0\",\"require\":\"0\"},\"password\":{\"display\":\"1\"},\"confirm\":{\"display\":\"1\"},\"heading\":{\"display\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"customer_group_id\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"newsletter\":{\"display\":\"0\"},\"shipping_address\":{\"display\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}},\"logged\":{\"payment_address\":{\"display\":\"1\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"},\"shipping_address\":{\"display\":\"0\"}}},\"shipping_address\":{\"display\":\"1\",\"require\":\"0\",\"fields\":{\"firstname\":{\"display\":\"1\",\"require\":\"1\"},\"lastname\":{\"display\":\"0\",\"require\":\"0\"},\"company\":{\"display\":\"0\",\"require\":\"0\"},\"address_1\":{\"display\":\"1\",\"require\":\"1\"},\"address_2\":{\"display\":\"0\",\"require\":\"0\"},\"city\":{\"display\":\"0\",\"require\":\"0\"},\"postcode\":{\"display\":\"0\",\"require\":\"0\"},\"country_id\":{\"display\":\"1\",\"require\":\"1\"},\"zone_id\":{\"display\":\"1\",\"require\":\"1\"}}},\"cart\":{\"display\":\"1\",\"columns\":{\"image\":\"1\",\"name\":\"1\",\"model\":\"0\",\"quantity\":\"1\",\"price\":\"1\",\"total\":\"1\"},\"option\":{\"coupon\":{\"display\":\"1\"},\"voucher\":{\"display\":\"1\"},\"reward\":{\"display\":\"1\"}}},\"confirm\":{\"fields\":{\"comment\":{\"display\":\"1\",\"require\":\"0\"},\"agree\":{\"display\":\"0\",\"require\":\"0\"}}}}}}', 1),
(38890, 0, 'd_quickcheckout', 'd_quickcheckout_setting_cycle', '{\"1\":\"1\"}', 1),
(38854, 0, 'bank_transfer', 'bank_transfer_bank1', 'Số tài khoản: ...\r\nTên chủ tài khoản: ...\r\nNgân hàng: ...\r\nChi nhánh: ...', 0),
(38889, 0, 'free', 'free_sort_order', '0', 0),
(38888, 0, 'free', 'free_status', '1', 0),
(38887, 0, 'free', 'free_geo_zone_id', '0', 0),
(38886, 0, 'free', 'free_total', '500000', 0),
(36049, 0, 'ckeditorfull', 'ckeditorfull_apikey', 'AIzaSyCnO86yLOBC_K2O49B_ki-U_7ZGJYt0XLQ', 0),
(36048, 0, 'ckeditorfull', 'ckeditorfull_height', '500', 0),
(36047, 0, 'ckeditorfull', 'ckeditorfull_skin', 'moono-lisa', 0),
(36050, 0, 'ckeditorfull', 'ckeditorfull_acf', 'false', 0),
(36609, 0, 'pim', 'pim_width', '800', 0),
(36608, 0, 'pim', 'pim_language', 'vi', 0),
(36607, 0, 'pim', 'pim_uploadMaxType', 'M', 0),
(36606, 0, 'pim', 'pim_uploadMaxSize', '999', 0),
(36605, 0, 'pim', 'pim_uploadOverwrite', '0', 0),
(36604, 0, 'pim', 'pim_copyOverwrite', '0', 0),
(36603, 0, 'pim', 'pim_deletedef', '0', 0),
(36602, 0, 'pim', 'pim_miu', '0', 0),
(36601, 0, 'pim', 'pim_status', '0', 0),
(40238, 0, 'config', 'config_building', '0', 0),
(40239, 0, 'config', 'config_seo_url', '1', 0),
(40240, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(36610, 0, 'pim', 'pim_height', '400', 0),
(40253, 0, 'config', 'config_error_filename', 'php-error.log', 0),
(40252, 0, 'config', 'config_error_log', '1', 0),
(40251, 0, 'config', 'config_error_display', '1', 0),
(39036, 0, 'category', 'category_category', '[\"78\",\"82\",\"79\",\"77\",\"97\",\"83\",\"84\"]', 1),
(40250, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(40241, 0, 'config', 'config_compression', '0', 0),
(40242, 0, 'config', 'config_first_time', '1', 0),
(40243, 0, 'config', 'config_license', '', 0),
(40244, 0, 'config', 'config_secure', '1', 0),
(40245, 0, 'config', 'config_password', '1', 0),
(40246, 0, 'config', 'config_shared', '0', 0),
(40247, 0, 'config', 'config_encryption', 'piNuS1gNH0Qa2WB3buX75oMrRXXsaysV', 0),
(40248, 0, 'config', 'config_file_max_size', '300000', 0),
(40249, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(40237, 0, 'config', 'config_maintenance', '0', 0),
(40236, 0, 'config', 'config_mail_alert', '', 0),
(40235, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(40234, 0, 'config', 'config_mail_smtp_port', '25', 0),
(40233, 0, 'config', 'config_mail_smtp_password', '9NSWpXcx8DvAt5f', 0),
(40232, 0, 'config', 'config_mail_smtp_username', 'web@mg.cloudposs.com', 0),
(40231, 0, 'config', 'config_mail_smtp_hostname', 'smtp.mailgun.org', 0),
(40230, 0, 'config', 'config_mail_parameter', '', 0),
(40229, 0, 'config', 'config_mail_protocol', 'smtp', 0),
(40228, 0, 'config', 'config_ftp_status', '0', 0),
(40227, 0, 'config', 'config_ftp_root', '', 0),
(40226, 0, 'config', 'config_ftp_password', '', 0),
(40225, 0, 'config', 'config_ftp_username', '', 0),
(40224, 0, 'config', 'config_ftp_port', '21', 0),
(40223, 0, 'config', 'config_ftp_hostname', 'test.website500k.com', 0),
(40222, 0, 'config', 'config_community_rss', '', 0),
(40221, 0, 'config', 'config_community_zingme', '', 0),
(40220, 0, 'config', 'config_community_tumblr', '', 0),
(40219, 0, 'config', 'config_community_instagram', '#', 0),
(40218, 0, 'config', 'config_community_pinterest', '#', 0),
(40217, 0, 'config', 'config_community_twitter', '#', 0),
(40216, 0, 'config', 'config_community_youtube', '#', 0),
(40215, 0, 'config', 'config_community_google', '', 0),
(40214, 0, 'config', 'config_community_facebook', '#', 0),
(40213, 0, 'config', 'config_community_page', '', 0),
(40212, 0, 'config', 'config_image_location_height', '50', 0),
(40211, 0, 'config', 'config_image_location_width', '268', 0),
(40210, 0, 'config', 'config_image_cart_height', '47', 0),
(40209, 0, 'config', 'config_image_cart_width', '47', 0),
(40208, 0, 'config', 'config_image_wishlist_height', '47', 0),
(40207, 0, 'config', 'config_image_wishlist_width', '47', 0),
(40206, 0, 'config', 'config_image_compare_height', '90', 0),
(40205, 0, 'config', 'config_image_compare_width', '90', 0),
(40204, 0, 'config', 'config_image_related_height', '228', 0),
(40203, 0, 'config', 'config_image_related_width', '228', 0),
(40202, 0, 'config', 'config_image_additional_height', '150', 0),
(40201, 0, 'config', 'config_image_additional_width', '150', 0),
(40200, 0, 'config', 'config_image_product_height', '228', 0),
(40198, 0, 'config', 'config_image_popup_height', '1500', 0),
(40199, 0, 'config', 'config_image_product_width', '228', 0),
(40197, 0, 'config', 'config_image_popup_width', '1500', 0),
(40196, 0, 'config', 'config_image_thumb_height', '1500', 0),
(40195, 0, 'config', 'config_image_thumb_width', '1500', 0),
(40194, 0, 'config', 'config_image_category_height', '570', 0),
(40193, 0, 'config', 'config_image_category_width', '570', 0),
(40192, 0, 'config', 'config_logo_share_fb', 'catalog/logo-maadela-fb.png', 0),
(40190, 0, 'config', 'config_category', 'catalog/banner/category-default3-1900x350.jpg', 0),
(40191, 0, 'config', 'config_category_mobile', 'catalog/banner/category-default3-750x730.jpg', 0),
(40189, 0, 'config', 'config_watermark', 'catalog/watermark.png', 0),
(40188, 0, 'config', 'config_icon', 'catalog/favicon.png', 0),
(40187, 0, 'config', 'config_logo', 'catalog/images-1.png', 0),
(40185, 0, 'config', 'config_captcha', '', 0),
(40186, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(40184, 0, 'config', 'config_return_status_id', '2', 0),
(40183, 0, 'config', 'config_return_id', '0', 0),
(40182, 0, 'config', 'config_affiliate_mail', '0', 0),
(40181, 0, 'config', 'config_affiliate_id', '0', 0),
(40180, 0, 'config', 'config_affiliate_commission', '5', 0),
(38856, 0, 'bank_transfer', 'bank_transfer_total', '0', 0),
(38857, 0, 'bank_transfer', 'bank_transfer_order_status_id', '1', 0),
(38858, 0, 'bank_transfer', 'bank_transfer_geo_zone_id', '0', 0),
(38859, 0, 'bank_transfer', 'bank_transfer_status', '1', 0),
(38860, 0, 'bank_transfer', 'bank_transfer_sort_order', '2', 0),
(39035, 0, 'category', 'category', '', 0),
(39038, 0, 'category', 'category_status', '1', 0),
(40177, 0, 'config', 'config_stock_checkout', '0', 0),
(40179, 0, 'config', 'config_affiliate_auto', '0', 0),
(40178, 0, 'config', 'config_affiliate_approval', '0', 0),
(40176, 0, 'config', 'config_stock_warning', '0', 0),
(40175, 0, 'config', 'config_stock_display', '0', 0),
(40174, 0, 'config', 'config_api_id', '2', 0),
(40173, 0, 'config', 'config_order_mail', '1', 0),
(40172, 0, 'config', 'config_fraud_status_id', '20', 0),
(40171, 0, 'config', 'config_complete_status', '[\"5\"]', 1),
(40170, 0, 'config', 'config_processing_status', '[\"2\"]', 1),
(40169, 0, 'config', 'config_order_status_id', '1', 0),
(40168, 0, 'config', 'config_checkout_id', '0', 0),
(40167, 0, 'config', 'config_checkout_guest', '1', 0),
(40166, 0, 'config', 'config_cart_weight', '1', 0),
(40164, 0, 'config', 'config_account_mail', '0', 0),
(40165, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(40162, 0, 'config', 'config_login_attempts', '5', 0),
(40163, 0, 'config', 'config_account_id', '5', 0),
(40161, 0, 'config', 'config_customer_price', '0', 0),
(40160, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(40158, 0, 'config', 'config_customer_online', '0', 0),
(40159, 0, 'config', 'config_customer_group_id', '1', 0),
(40139, 0, 'config', 'config_zone_id', '', 0),
(40140, 0, 'config', 'config_language', 'vi', 0),
(40141, 0, 'config', 'config_admin_language', 'vi', 0),
(40142, 0, 'config', 'config_currency', 'VND', 0),
(40143, 0, 'config', 'config_currency_auto', '1', 0),
(40144, 0, 'config', 'config_length_class_id', '1', 0),
(40145, 0, 'config', 'config_weight_class_id', '1', 0),
(40146, 0, 'config', 'config_product_count', '1', 0),
(40147, 0, 'config', 'config_product_limit', '12', 0),
(40148, 0, 'config', 'config_product_description_length', '25', 0),
(40149, 0, 'config', 'config_limit_admin', '50', 0),
(40150, 0, 'config', 'config_review_status', '1', 0),
(40151, 0, 'config', 'config_review_guest', '1', 0),
(40152, 0, 'config', 'config_review_mail', '0', 0),
(40153, 0, 'config', 'config_voucher_min', '1', 0),
(40154, 0, 'config', 'config_voucher_max', '1000', 0),
(40155, 0, 'config', 'config_tax', '1', 0),
(40156, 0, 'config', 'config_tax_default', 'shipping', 0),
(40157, 0, 'config', 'config_tax_customer', 'shipping', 0),
(40138, 0, 'config', 'config_country_id', '258', 0),
(40137, 0, 'config', 'config_comment', '', 0),
(40136, 0, 'config', 'config_embed_code', '', 0),
(40135, 0, 'config', 'config_map_embed_code', '', 0),
(40134, 0, 'config', 'config_open', '', 0),
(40133, 0, 'config', 'config_image', '', 0),
(40130, 0, 'config', 'config_fax', '{\"1\":\"\"}', 1),
(40131, 0, 'config', 'config_welcome', '{\"1\":\"Ch\\u00e0o m\\u1eebng \\u0111\\u1ebfn v\\u1edbi c\\u1eeda h\\u00e0ng c\\u1ee7a ch\\u00fang t\\u00f4i!\"}', 1),
(40132, 0, 'config', 'config_about_us', '{\"1\":\"\\u0110\\u1ecba ch\\u1ec9: \\r\\n\\u0110i\\u1ec7n tho\\u1ea1i: \"}', 1),
(40126, 0, 'config', 'config_address', '{\"1\":\"Address\"}', 1),
(40127, 0, 'config', 'config_geocode', '{\"1\":\"\"}', 1),
(40128, 0, 'config', 'config_email', '{\"1\":\"email@localhost\"}', 1),
(40129, 0, 'config', 'config_telephone', '{\"1\":\"0123456789\"}', 1),
(40125, 0, 'config', 'config_owner', '{\"1\":\"ABC\"}', 1),
(40124, 0, 'config', 'config_name', '{\"1\":\"ABC\"}', 1),
(40123, 0, 'config', 'config_layout_id', '4', 0),
(40122, 0, 'config', 'config_template', 'default', 0),
(40121, 0, 'config', 'config_meta_keyword', '', 0),
(40120, 0, 'config', 'config_meta_description', 'Maadela', 0),
(40119, 0, 'config', 'config_meta_title', 'ABC', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_settingpost`
--

CREATE TABLE `pre_settingpost` (
  `settingpost_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_settingpost`
--

INSERT INTO `pre_settingpost` (`settingpost_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(319, 0, 'item_module_post', 'item_module_post', '5', 0),
(320, 0, 'item_perpage_admin', 'item_perpage_admin', '15', 0),
(321, 0, 'description_limit', 'description_limit', '25', 0),
(322, 0, 'image_thumb_width', 'image_thumb_width', '500', 0),
(323, 0, 'image_thumb_height', 'image_thumb_height', '333', 0),
(324, 0, 'image_thread_width', 'image_thread_width', '500', 0),
(325, 0, 'image_thread_height', 'image_thread_height', '333', 0),
(326, 0, 'image_banner_width', 'image_banner_width', '1170', 0),
(327, 0, 'image_banner_height', 'image_banner_height', '780', 0),
(328, 0, 'image_gallery_width', 'image_gallery_width', '400', 0),
(329, 0, 'image_gallery_height', 'image_gallery_height', '300', 0),
(330, 0, 'image_popup_width', 'image_popup_width', '1280', 0),
(331, 0, 'image_popup_height', 'image_popup_height', '1024', 0),
(332, 0, 'allow_reviews', 'allow_reviews', '1', 0),
(333, 0, 'allow_guest_reviews', 'allow_guest_reviews', '1', 0),
(334, 0, 'view_instantly', 'view_instantly', '1', 0),
(335, 0, 'item_view_relate', 'item_view_relate', '10', 0),
(336, 0, 'view_relate', 'view_relate', '1', 0),
(337, 0, 'item_perpage_thread', 'item_perpage_thread', '9', 0),
(338, 0, 'thread_post_count', 'thread_post_count', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_stock_status`
--

CREATE TABLE `pre_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_stock_status`
--

INSERT INTO `pre_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'Còn hàng'),
(8, 1, 'Đặt hàng trước'),
(5, 1, 'Hết hàng'),
(6, 1, '2-3 Ngày');

-- --------------------------------------------------------

--
-- Table structure for table `pre_store`
--

CREATE TABLE `pre_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_tax_class`
--

CREATE TABLE `pre_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tax_class`
--

INSERT INTO `pre_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(11, 'VAT 10% (VN)', 'VAT 10% Việt Nam', '2018-06-07 13:38:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tax_rate`
--

CREATE TABLE `pre_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tax_rate`
--

INSERT INTO `pre_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(88, 5, 'VAT 10% (VN)', '10.0000', 'P', '2018-06-07 13:37:37', '2018-06-07 13:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tax_rate_to_customer_group`
--

CREATE TABLE `pre_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tax_rate_to_customer_group`
--

INSERT INTO `pre_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(88, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_tax_rule`
--

CREATE TABLE `pre_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tax_rule`
--

INSERT INTO `pre_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(129, 11, 88, 'payment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblform`
--

CREATE TABLE `pre_tblform` (
  `formId` int(11) NOT NULL,
  `hideTitle` int(11) NOT NULL,
  `sendAdminEmail` tinyint(1) NOT NULL,
  `adminEmail` varchar(240) NOT NULL,
  `formCreationDate` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `sendUserEmail` tinyint(1) NOT NULL,
  `userEmail` varchar(100) NOT NULL,
  `successType` varchar(50) NOT NULL,
  `successURL` varchar(240) NOT NULL,
  `formHeading` text NOT NULL,
  `keyword` varchar(250) NOT NULL,
  `theme` varchar(100) NOT NULL,
  `formModule` tinyint(1) NOT NULL,
  `sendEmailAttachment` tinyint(1) NOT NULL,
  `emailAttachmentType` varchar(50) NOT NULL,
  `emailAttachmentUser` varchar(50) NOT NULL,
  `storeId` varchar(250) NOT NULL,
  `custom` text NOT NULL,
  `script` text NOT NULL,
  `style` text NOT NULL,
  `customerOnly` tinyint(1) NOT NULL,
  `dateFormat` varchar(50) NOT NULL,
  `emailAttachmentName` varchar(200) DEFAULT NULL,
  `jsvalid` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tblform`
--

INSERT INTO `pre_tblform` (`formId`, `hideTitle`, `sendAdminEmail`, `adminEmail`, `formCreationDate`, `status`, `sendUserEmail`, `userEmail`, `successType`, `successURL`, `formHeading`, `keyword`, `theme`, `formModule`, `sendEmailAttachment`, `emailAttachmentType`, `emailAttachmentUser`, `storeId`, `custom`, `script`, `style`, `customerOnly`, `dateFormat`, `emailAttachmentName`, `jsvalid`) VALUES
(4, 0, 1, 'longquyawd@gmail.com', '2019-03-13 09:19:16', 1, 0, '', 'self', '', 'a:4:{s:2:\"c2\";s:9:\"Họ Tên\";s:3:\"c10\";s:10:\"ATT FILE 1\";s:3:\"c14\";s:10:\"ATT FILE 2\";s:3:\"c18\";s:10:\"ATT FILE 3\";}', 'att-file', 'classic', 1, 0, 'csv', 'user', 'a:1:{i:0;s:1:\"0\";}', '', '', '', 0, 'dd/mm/yyyy', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblformdesc`
--

CREATE TABLE `pre_tblformdesc` (
  `formDescId` bigint(8) NOT NULL,
  `formId` bigint(8) DEFAULT NULL,
  `languageId` int(5) NOT NULL,
  `formName` varchar(200) NOT NULL,
  `formDescription` text NOT NULL,
  `adminEmailContent` text NOT NULL,
  `userEmailContent` text NOT NULL,
  `adminEmailSubject` text NOT NULL,
  `userEmailSubject` text NOT NULL,
  `successMsg` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tblformdesc`
--

INSERT INTO `pre_tblformdesc` (`formDescId`, `formId`, `languageId`, `formName`, `formDescription`, `adminEmailContent`, `userEmailContent`, `adminEmailSubject`, `userEmailSubject`, `successMsg`) VALUES
(1, 1, 1, 'Contact Us', 'Your questions and comments are important to us.  Please fill up following form and send to us, We will back to you soon.', '&lt;p&gt;Hello&lt;/p&gt;&lt;p&gt;Someone has submitted an equerry. Here are info:&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c2.label} -&amp;nbsp;{c2.value}&lt;/p&gt;&lt;p&gt;{c6.label} -&amp;nbsp;{c6.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c14.label} -&amp;nbsp;{c14.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', '&lt;p&gt;Hello&amp;nbsp;{c2.value},&lt;/p&gt;&lt;p&gt;Thank you for contacting.&lt;/p&gt;&lt;p&gt;{c2.label} -&amp;nbsp;{c2.value}&lt;/p&gt;&lt;p&gt;{c6.label} -&amp;nbsp;{c6.value}&lt;br&gt;&lt;/p&gt;&lt;p&gt;{c14.label} -&amp;nbsp;{c14.value}&lt;br&gt;&lt;/p&gt;&lt;div&gt;&lt;br&gt;&lt;/div&gt;&lt;div&gt;Regards&lt;/div&gt;&lt;div&gt;{formName}&lt;br&gt;&lt;/div&gt;', 'Contact US', 'Thank you for contacting', '&lt;p&gt;Thank you &amp;nbsp;for contacting to us. We have received your equerry. &amp;nbsp;We will back to you soon.&lt;br&gt;&lt;/p&gt;'),
(3, 2, 1, 'test', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(4, 3, 1, 'test Copy', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;'),
(14, 4, 2, 'ATT FILE', '', '&lt;p&gt;{c2.label}:&amp;nbsp;{c2.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c10.label}:&amp;nbsp;{c10.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c14.label}:&amp;nbsp;{c14.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c18.label}:&amp;nbsp;{c18.value}&lt;/p&gt;\r\n', '', '{c2.value} - Source', '', '&lt;p&gt;Success!&lt;/p&gt;\r\n'),
(13, 4, 1, 'ATT FILE', '', '&lt;p&gt;{c2.label}:&amp;nbsp;{c2.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c10.label}:&amp;nbsp;{c10.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c14.label}:&amp;nbsp;{c14.value}&lt;/p&gt;\r\n\r\n&lt;p&gt;{c18.label}:&amp;nbsp;{c18.value}&lt;/p&gt;\r\n', '', '{c2.value} - Source', '', '&lt;p&gt;Thành công!&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblformfield`
--

CREATE TABLE `pre_tblformfield` (
  `fieldId` bigint(8) NOT NULL,
  `formId` int(8) NOT NULL,
  `label` varchar(100) NOT NULL,
  `hideLabel` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `fieldType` varchar(100) DEFAULT NULL,
  `required` int(11) NOT NULL,
  `fieldParam` text NOT NULL,
  `sortOrder` int(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tblformfield`
--

INSERT INTO `pre_tblformfield` (`fieldId`, `formId`, `label`, `hideLabel`, `name`, `fieldType`, `required`, `fieldParam`, `sortOrder`) VALUES
(15, 4, 'ATT FILE 3', 0, 'c18', 'file', 0, 'a:1:{s:5:\"error\";s:28:\"ATT FILE 3 không hợp lệ\";}', 4),
(14, 4, 'ATT FILE 2', 0, 'c14', 'file', 0, 'a:2:{s:11:\"description\";s:0:\"\";s:5:\"error\";s:28:\"ATT FILE 2 không hợp lệ\";}', 3),
(13, 4, 'ATT FILE 1', 0, 'c10', 'file', 1, 'a:2:{s:11:\"description\";s:0:\"\";s:5:\"error\";s:28:\"ATT FILE 1 Không hợp lệ\";}', 2),
(11, 4, 'Họ Tên', 1, 'c2', 'text', 1, 'a:4:{s:11:\"placeholder\";b:1;s:4:\"size\";s:5:\"large\";s:11:\"description\";s:9:\"Họ Tên\";s:5:\"error\";s:27:\"Họ tên không hợp lệ\";}', 0),
(16, 4, 'Captcha', 0, 'c22', 'captcha', 1, 'a:0:{}', 5),
(18, 4, 'Submit', 1, 'c23', 'submit', 0, 'a:0:{}', 6),
(19, 4, 'Untitled', 0, 'c20', 'date', 1, 'a:0:{}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblformlang`
--

CREATE TABLE `pre_tblformlang` (
  `formLangId` int(10) NOT NULL,
  `formId` int(8) NOT NULL,
  `languageId` int(5) NOT NULL,
  `data` longtext NOT NULL,
  `options` longtext NOT NULL,
  `guidelines` longtext NOT NULL,
  `errors` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pre_tblformlang`
--

INSERT INTO `pre_tblformlang` (`formLangId`, `formId`, `languageId`, `data`, `options`, `guidelines`, `errors`) VALUES
(8, 4, 1, 'YTo2OntzOjI6ImMyIjtzOjk6Ikjhu40gVMOqbiI7czozOiJjMTAiO3M6MTA6IkFUVCBGSUxFIDEiO3M6MzoiYzE0IjtzOjEwOiJBVFQgRklMRSAyIjtzOjM6ImMxOCI7czoxMDoiQVRUIEZJTEUgMyI7czozOiJjMjIiO3M6NzoiQ2FwdGNoYSI7czozOiJjMjMiO3M6NjoiU3VibWl0Ijt9', 'YTowOnt9', 'YToxOntzOjI6ImMyIjtzOjk6Ikjhu40gVMOqbiI7fQ==', 'YTo0OntzOjI6ImMyIjtzOjI3OiJI4buNIHTDqm4ga2jDtG5nIGjhu6NwIGzhu4ciO3M6MzoiYzEwIjtzOjI4OiJBVFQgRklMRSAxIEtow7RuZyBo4bujcCBs4buHIjtzOjM6ImMxNCI7czoyODoiQVRUIEZJTEUgMiBraMO0bmcgaOG7o3AgbOG7hyI7czozOiJjMTgiO3M6Mjg6IkFUVCBGSUxFIDMga2jDtG5nIGjhu6NwIGzhu4ciO30='),
(9, 4, 2, 'YTo2OntzOjI6ImMyIjtzOjk6Ikjhu40gVMOqbiI7czozOiJjMTAiO3M6MTA6IkFUVCBGSUxFIDEiO3M6MzoiYzE0IjtzOjEwOiJBVFQgRklMRSAyIjtzOjM6ImMxOCI7czoxMDoiQVRUIEZJTEUgMyI7czozOiJjMjIiO3M6NzoiQ2FwdGNoYSI7czozOiJjMjMiO3M6NjoiU3VibWl0Ijt9', 'YTowOnt9', 'YToxOntzOjI6ImMyIjtzOjk6Ikjhu40gVMOqbiI7fQ==', 'YTo0OntzOjI6ImMyIjtzOjI3OiJI4buNIHTDqm4ga2jDtG5nIGjhu6NwIGzhu4ciO3M6MzoiYzEwIjtzOjI4OiJBVFQgRklMRSAxIEtow7RuZyBo4bujcCBs4buHIjtzOjM6ImMxNCI7czoyODoiQVRUIEZJTEUgMiBraMO0bmcgaOG7o3AgbOG7hyI7czozOiJjMTgiO3M6Mjg6IkFUVCBGSUxFIDMga2jDtG5nIGjhu6NwIGzhu4ciO30=');

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblformrecord`
--

CREATE TABLE `pre_tblformrecord` (
  `recordId` bigint(8) NOT NULL,
  `formId` bigint(8) DEFAULT NULL,
  `userIP` varchar(100) NOT NULL,
  `userAgent` varchar(240) NOT NULL,
  `submitDate` datetime DEFAULT NULL,
  `storeId` int(10) NOT NULL,
  `userId` int(8) NOT NULL,
  `orderId` int(8) NOT NULL,
  `searchKey` text NOT NULL,
  `productId` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tblformrecord`
--

INSERT INTO `pre_tblformrecord` (`recordId`, `formId`, `userIP`, `userAgent`, `submitDate`, `storeId`, `userId`, `orderId`, `searchKey`, `productId`) VALUES
(1, 4, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/68.4.194 Chrome/62.4.3202.194 Safari/537.36', '2018-05-06 14:54:01', 0, 0, 9, '06/05/2018 ::1 Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/68.4.194 Chrome/62.4.3202.194 Safari/537.36 Quy Trần <a target=\"blank\" href=\"http://localhost/source/image/xform/1525611241_c10_4.jpg\"><img src=\"http://localhost/source/image/xform/1525611241_c10_4.jpg\" width=\"150\" /></a> <a target=\"blank\" href=\"http://localhost/source/image/xform/1525611241_c14_4.jpg\"><img src=\"http://localhost/source/image/xform/1525611241_c14_4.jpg\" width=\"150\" /></a> <a target=\"blank\" href=\"http://localhost/source/image/xform/1525611241_c18_4.jpg\"><img src=\"http://localhost/source/image/xform/1525611241_c18_4.jpg\" width=\"150\" /></a>', 0),
(2, 4, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/68.4.194 Chrome/62.4.3202.194 Safari/537.36', '2018-05-06 14:55:21', 0, 0, 9, '06/05/2018 ::1 Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/68.4.194 Chrome/62.4.3202.194 Safari/537.36 Quy Trần 93 <a target=\"blank\" href=\"http://localhost/source/image/xform/1525611321_c10_4.jpg\"><img src=\"http://localhost/source/image/xform/1525611321_c10_4.jpg\" width=\"150\" /></a> <a target=\"blank\" href=\"http://localhost/source/index.php?route=xform/xform/dl&f=1525611321_c14_4.doc\">Uploaded File</a> <a target=\"blank\" href=\"http://localhost/source/index.php?route=xform/xform/dl&f=1525611321_c18_4.xlsx\">Uploaded File</a>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_tblformrecorddata`
--

CREATE TABLE `pre_tblformrecorddata` (
  `recordDataId` bigint(10) NOT NULL,
  `recordId` bigint(10) NOT NULL,
  `formId` bigint(8) NOT NULL,
  `fieldType` varchar(100) NOT NULL,
  `fieldName` varchar(8) NOT NULL,
  `fieldLabel` varchar(100) NOT NULL,
  `fieldValue` text NOT NULL,
  `isSerialize` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_tblformrecorddata`
--

INSERT INTO `pre_tblformrecorddata` (`recordDataId`, `recordId`, `formId`, `fieldType`, `fieldName`, `fieldLabel`, `fieldValue`, `isSerialize`) VALUES
(1, 1, 4, 'text', 'c2', 'Họ Tên', 'Quy Trần', 0),
(2, 1, 4, 'file', 'c10', 'ATT FILE 1', '1525611241_c10_4.jpg', 0),
(3, 1, 4, 'file', 'c14', 'ATT FILE 2', '1525611241_c14_4.jpg', 0),
(4, 1, 4, 'file', 'c18', 'ATT FILE 3', '1525611241_c18_4.jpg', 0),
(5, 2, 4, 'text', 'c2', 'Họ Tên', 'Quy Trần 93', 0),
(6, 2, 4, 'file', 'c10', 'ATT FILE 1', '1525611321_c10_4.jpg', 0),
(7, 2, 4, 'file', 'c14', 'ATT FILE 2', '1525611321_c14_4.doc', 0),
(8, 2, 4, 'file', 'c18', 'ATT FILE 3', '1525611321_c18_4.xlsx', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread`
--

CREATE TABLE `pre_thread` (
  `thread_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `child` tinyint(1) NOT NULL,
  `format` varchar(16) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_thread`
--

INSERT INTO `pre_thread` (`thread_id`, `image`, `parent_id`, `child`, `format`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 'standard', 1, 1, '2016-12-23 13:50:20', '2022-01-13 16:09:00'),
(5, '', 0, 0, 'standard', 2, 1, '2022-01-13 16:08:53', '2022-01-13 16:08:53'),
(6, '', 0, 0, 'standard', 3, 1, '2022-01-13 16:09:27', '2022-01-13 16:09:27'),
(7, '', 0, 0, 'standard', 4, 1, '2022-01-13 16:10:06', '2022-01-13 16:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread_description`
--

CREATE TABLE `pre_thread_description` (
  `thread_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_thread_description`
--

INSERT INTO `pre_thread_description` (`thread_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'Tin tức', '', 'Tin tức', '', ''),
(1, 2, 'News', '', 'News', '', ''),
(5, 1, 'Khuyến mãi', '', 'Khuyến mãi', 'Khuyến mãi', 'Khuyến mãi'),
(5, 2, 'Promotions', '', 'Promotions', 'Promotions', 'Promotions'),
(6, 1, 'Ecatalog', '', 'Ecatalog', 'Ecatalog', 'Ecatalog'),
(6, 2, 'Ecatalog', '', 'Ecatalog', 'Ecatalog', 'Ecatalog'),
(7, 1, 'Hỗ trợ bảo hành', '', 'Hỗ trợ bảo hành', 'Hỗ trợ bảo hành', 'Hỗ trợ bảo hành'),
(7, 2, 'Product warranty', '', 'Product warranty', 'Product warranty', 'Product warranty');

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread_filter`
--

CREATE TABLE `pre_thread_filter` (
  `thread_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread_path`
--

CREATE TABLE `pre_thread_path` (
  `thread_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_thread_path`
--

INSERT INTO `pre_thread_path` (`thread_id`, `path_id`, `level`) VALUES
(1, 1, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread_to_layout`
--

CREATE TABLE `pre_thread_to_layout` (
  `thread_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_thread_to_layout`
--

INSERT INTO `pre_thread_to_layout` (`thread_id`, `store_id`, `layout_id`) VALUES
(1, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_thread_to_store`
--

CREATE TABLE `pre_thread_to_store` (
  `thread_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_thread_to_store`
--

INSERT INTO `pre_thread_to_store` (`thread_id`, `store_id`) VALUES
(1, 0),
(5, 0),
(6, 0),
(7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pre_upload`
--

CREATE TABLE `pre_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_upload`
--

INSERT INTO `pre_upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'logomain2.png', 'logomain2.png.so0k9t4xr7yqXTv0YkWcA7XHpBgmaZql', '4d02479564f5d7a6ab6fd2d79b7df53303b90777', '2016-10-15 14:15:52'),
(2, 'consumer2.jpg', 'consumer2.jpg.AAVq69893pPgTiDXR9rt8obSrLNtB8Nb', 'b5e6e209d7237fb41444fc5923ffeabc102b1637', '2018-06-07 13:39:46'),
(3, 'deep1.jpg', 'deep1.jpg.FYhTK9AGuSsf3n4pue0pufLBkXTpkdjD', 'b5b152f08fec888ba53087f1d24448092ad33b77', '2018-06-07 13:42:25'),
(4, 'deep1.jpg', 'deep1.jpg.50Z57nfWheYt9N0nIEz64w8k3oQn0gQD', 'd60d535de50a8d85faee9d8496b46c72b54c9a11', '2018-06-07 13:44:31');

-- --------------------------------------------------------

--
-- Table structure for table `pre_url_alias`
--

CREATE TABLE `pre_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_url_alias`
--

INSERT INTO `pre_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(1340, 'category_id=98', 'may-nuoc-nong-gian-tiep'),
(1401, 'product_id=58', 'bep-tu-am-3-vung-nau-60cm-LIT60336'),
(1137, 'information_id=4', 'gioi-thieu'),
(1328, 'category_id=81', 'lo-nuong'),
(1219, 'category_id=84', 'lo-vi-song'),
(1220, 'category_id=85', 'may-hut-mui'),
(1221, 'category_id=86', 'thiet-bi-nau-dung-doc-lap'),
(1222, 'category_id=87', 'nòi-chien-khong-dàu'),
(1223, 'category_id=88', 'noi-com-dien'),
(1224, 'category_id=89', 'bep-nuong--may-nuong-banh-mi'),
(1225, 'category_id=90', 'may-danh-trung'),
(1226, 'category_id=91', 'binh-dun-nuoc'),
(1227, 'category_id=92', 'may-xay-sinh-to--amp--may-ep-trai-cay'),
(1297, 'category_id=78', 'may-giat-va-may-giat-say'),
(1313, 'category_id=79', 'tu-lanh'),
(1330, 'category_id=80', 'may-loc-khong-khi'),
(1231, 'category_id=96', 'ban-ui--ban-la'),
(1230, 'category_id=95', 'ban-ui-hoi-nuoc-dung'),
(1229, 'category_id=94', 'máy-hút-ảm'),
(1232, 'category_id=97', 'may-rua-bat'),
(1402, 'product_id=59', 'lo-nuóng-am-tu-53l-eob2100cox---den-anh-bac'),
(1406, 'product_id=53', 'may-giat-say-11-7kg-ultimatecare-700-EWW1142Q7WB'),
(1345, 'product_id=54', 'may-say-bom-nhiet-heat-pump-9kg-ultimatecare-800-EDH903BEWA'),
(1349, 'product_id=55', 'ban-ui-hoi-nuoc-dung-1300w-refine-500-E5GS1-55DB'),
(1399, 'product_id=56', 'tu-lanh-inverter-ultimatetaste-300-ngan-da-duoi-co-ngan-dong-mem-308-lit-EBB3442K-A'),
(1320, 'product_id=57', 'tu-lanh-inverter-ultimatetaste-700-cua-phap-541-lit-EQE6000A-B'),
(1400, 'product_id=52', 'may-giat-cua-truoc-11kg-ultimatecare-900-EWF1141AESA'),
(1394, 'product_id=51', 'may-giat-cua-truoc-11kg-ultimatecare-900-EWF1141R9SB'),
(1138, 'information_id=6', 'thong-tin-giao-hang'),
(1286, 'information_id=5', 'cac-dieu-khoan-su-dung-trang-web'),
(849, 'form_id=1', 'Contact_Us'),
(854, 'form_id=2', 'test9055'),
(852, 'form_id=1', 'Contact_Us'),
(855, 'form_id=3', ''),
(1135, 'page_id=6', 'trang-chu-6'),
(1238, 'thread_id=6', 'ecatalog'),
(1236, 'thread_id=5', 'khuyen-mai'),
(1237, 'thread_id=1', 'tin-tuc'),
(1287, 'information_id=3', 'chinh-sach-bao-mat-thong-tin'),
(1239, 'thread_id=7', 'ho-tro-bao-hanh'),
(1154, 'form_id=4', 'att-file'),
(1228, 'category_id=93', 'cay-nuóc-nóng-lạnh'),
(1357, 'category_id=77', 'bep'),
(1217, 'category_id=82', 'may-say-quan-ao'),
(1339, 'category_id=83', 'may-hut-bui'),
(1341, 'category_id=99', 'may-nuoc-nong-truc-tiep'),
(1240, 'category_id=100', 'cham-soc-trang-phuc'),
(1241, 'category_id=101', 'giai-phap-khong-khi'),
(1242, 'category_id=102', 'cham-soc-nha-cua'),
(1243, 'category_id=103', 'nha-bep'),
(1322, 'product_id=60', 'may-rua-bat-dung-doc-lap-comfortlift-60cm-cho-13-bo-chen-dia-ESF8730ROX'),
(1347, 'product_id=61', 'may-loc-khong-khi-5-buoc-loc-pure-a9-cho-phong-co-dien-tich-len-den-88m2-PA91-606DG'),
(1331, 'product_id=62', 'may-loc-khong-khi-4-buoc-loc-flow-a3-cho-phong-co-dien-tich-len-den-26m2-FA31-202GY'),
(1348, 'product_id=63', 'may-hut-bui-khong-day-sang-trong-well-q7p-21-6v-WQ71-2BSWF'),
(1337, 'product_id=64', 'máy-hút-bụi-khong-day-pure-q9-–-màu-dòng'),
(1351, 'product_id=65', 'may-nuoc-nong-comfortflow™-800-EWE451MB-DST2'),
(1284, 'information_id=7', 'huong-dan-su-dung-cookie'),
(1288, 'information_id=8', 'bao-ve-moi-truong'),
(1289, 'information_id=9', 'muc-tieu-nghe-nghiep'),
(1290, 'information_id=10', 'du-an-nang-tam-cuoc-song'),
(1294, 'category_id=104', 'may-giat-cua-truoc'),
(1295, 'category_id=105', 'may-giat-cua-tren'),
(1296, 'category_id=106', 'may-giat-say'),
(1309, 'category_id=107', 'tu-lanh-ngan-da-duoi'),
(1310, 'category_id=108', 'tu-lanh-cua-phap'),
(1314, 'category_id=109', 'tu-lanh-3-canh'),
(1315, 'category_id=110', 'tu-lanh-mini'),
(1316, 'category_id=111', 'tu-lanh-side-by-side'),
(1317, 'category_id=112', 'tu-lanh-ngan-da-tren'),
(1325, 'category_id=113', 'lo-nuong-am-tu'),
(1326, 'category_id=114', 'lo-nuong-dien-de-ban'),
(1333, 'category_id=115', 'dang-hop'),
(1334, 'category_id=116', 'khong-day'),
(1335, 'category_id=117', 'may-hut-bui-cam-tay'),
(1336, 'category_id=118', 'ro-bot'),
(1396, 'product_id=66', 'bep-tu-am-4-vung-nau-60cm'),
(1377, 'product_id=67', 'bep-ga-am-80cm-ultimatetaste-300-voi-3-vung-nau'),
(1372, 'product_id=68', 'may-hut-mui-tich-hop-bang-thep-dang-keo-60cm'),
(1371, 'product_id=69', 'may-hut-mui-bàng-thép-khong-gỉ-dạng-óng-90cm'),
(1404, 'product_id=70', 'may-hut-mui-bang-kinh-va-thep-cao-cap-dang-ap-tuong-90cm'),
(1369, 'product_id=71', 'lo-vi-song-de-ban-két-họp-nuóng-và-dói-luu-32l'),
(1368, 'product_id=72', 'lo-vi-song-dẻ-bàn-23l---trang'),
(1403, 'product_id=73', 'lo-vi-song-tich-hop-nuong-25l'),
(1366, 'product_id=74', 'noi-chien-khong-dau-3l-explore-6-e6af1-220k'),
(1381, 'product_id=75', 'noi-chien-khong-dau-5l-explore-6-e6af1-520k'),
(1407, 'category_id=119', 'chau-rua-chen'),
(1408, 'category_id=120', 'chau-rua-chen-da'),
(1447, 'product_id=76', 'chau-rua-da-creave-c11650b'),
(1410, 'manufacturer_id=11', ''),
(1440, 'product_id=77', 'chau-rua-da-maadela-md7646b'),
(1446, 'product_id=78', 'chau-rua-da-maadela-md8046b'),
(1443, 'product_id=79', 'chau-rua-da-maadela-md8650fb'),
(1448, 'product_id=80', 'chau-rua-da-maadela-md8650gb'),
(1445, 'product_id=81', 'chau-rua-da-maadela-md8650t'),
(1436, 'product_id=82', 'chau-rua-da-maadela-md10050b'),
(1438, 'product_id=83', 'chau-rua-da-maadela-md6846b');

-- --------------------------------------------------------

--
-- Table structure for table `pre_user`
--

CREATE TABLE `pre_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `root` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `last_activity` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  `postpermission` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_user`
--

INSERT INTO `pre_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `root`, `status`, `last_activity`, `date_added`, `postpermission`) VALUES
(1, 1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '5ZUKzsqiI', 'Hệ', 'Thống', 'central@website500k.net', 'catalog/avatar.png', '42f9e31ab325290373ca37068bcb1c729566ef61', '::1', 1, 1, '2017-06-09 01:16:15', '2016-07-15 13:43:53', 3),
(6, 1, 'maadela', 'f6f8ff3ed11703ff3817c529a062c174', '', '', '', '', '', '', '123.26.22.112', 0, 1, '2021-12-09 09:49:39', '2021-12-09 09:49:39', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pre_user_group`
--

CREATE TABLE `pre_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_user_group`
--

INSERT INTO `pre_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"analytics\\/google_analytics\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/downloadpost\",\"catalog\\/extra_info\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/menu\",\"catalog\\/option\",\"catalog\\/post\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/reviewpost\",\"catalog\\/thread\",\"common\\/column_left\",\"common\\/controlpanel\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/navigation\",\"common\\/profile\",\"common\\/sass\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/block\",\"design\\/layout\",\"design\\/megamenu\",\"design\\/menu\",\"design\\/navigation\",\"design\\/page\",\"design\\/page_config\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/lang_editor\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/carousel\",\"module\\/category\",\"module\\/ebay_listing\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/menu\",\"module\\/plgselectthread\",\"module\\/post\",\"module\\/postmostviewd\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"module\\/tmdqc\",\"module\\/visitor_counter\",\"module\\/visualbuilder\",\"module\\/xform\",\"module\\/zmanager\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/post_viewed\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/item\",\"setting\\/setting\",\"setting\\/settingpost\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/export_import\",\"tool\\/folder_protect\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/mangeuser\",\"user\\/user\",\"user\\/user_permission\",\"module\\/d_quickcheckout\",\"shipping\\/free\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/postmostviewd\",\"module\\/product_tab\",\"module\\/hok_banner\",\"module\\/latest\",\"module\\/bestseller\",\"module\\/banner_grid\",\"module\\/advanced_newsletter\",\"module\\/advanced_newsletter\",\"module\\/advanced_newsletter\",\"module\\/brainyfilter\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/latest_products_brand\",\"module\\/latest_products_category\",\"module\\/product_tab\",\"module\\/postmostviewd\",\"module\\/plgselectthread\",\"feed\\/google_sitemap\",\"module\\/productcategory\",\"shipping\\/weight\",\"module\\/ckeditorfull\",\"module\\/pim\",\"module\\/postselected\",\"module\\/html\",\"payment\\/web_payment_software\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/twocheckout\",\"payment\\/twocheckout\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/vtwocheckout\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout1\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout2\",\"payment\\/vtcpay\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vtcpay\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"shipping\\/free\",\"payment\\/bank_transfer\"],\"modify\":[\"analytics\\/google_analytics\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/downloadpost\",\"catalog\\/extra_info\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/menu\",\"catalog\\/option\",\"catalog\\/post\",\"catalog\\/product\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/reviewpost\",\"catalog\\/thread\",\"common\\/column_left\",\"common\\/controlpanel\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/navigation\",\"common\\/profile\",\"common\\/sass\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/block\",\"design\\/layout\",\"design\\/megamenu\",\"design\\/menu\",\"design\\/navigation\",\"design\\/page\",\"design\\/page_config\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/lang_editor\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/carousel\",\"module\\/category\",\"module\\/ebay_listing\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/menu\",\"module\\/plgselectthread\",\"module\\/post\",\"module\\/postmostviewd\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"module\\/tmdqc\",\"module\\/visitor_counter\",\"module\\/visualbuilder\",\"module\\/xform\",\"module\\/zmanager\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/post_viewed\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/item\",\"setting\\/setting\",\"setting\\/settingpost\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/export_import\",\"tool\\/folder_protect\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/mangeuser\",\"user\\/user\",\"user\\/user_permission\",\"module\\/d_quickcheckout\",\"shipping\\/free\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/postmostviewd\",\"module\\/product_tab\",\"module\\/hok_banner\",\"module\\/latest\",\"module\\/bestseller\",\"module\\/banner_grid\",\"module\\/advanced_newsletter\",\"module\\/advanced_newsletter\",\"module\\/advanced_newsletter\",\"module\\/brainyfilter\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/post\",\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\",\"module\\/latest_products_brand\",\"module\\/latest_products_category\",\"module\\/product_tab\",\"module\\/postmostviewd\",\"module\\/plgselectthread\",\"feed\\/google_sitemap\",\"module\\/productcategory\",\"shipping\\/weight\",\"module\\/ckeditorfull\",\"module\\/pim\",\"module\\/postselected\",\"module\\/html\",\"payment\\/web_payment_software\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/twocheckout\",\"payment\\/twocheckout\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/vtwocheckout\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout1\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/twocheckout2\",\"payment\\/vtcpay\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vtcpay\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"payment\\/vnpay_payment\",\"shipping\\/free\",\"payment\\/bank_transfer\"]}'),
(10, 'Demonstration', ''),
(14, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}'),
(15, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}'),
(16, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}'),
(17, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}'),
(18, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}'),
(20, 'Post Group', '{\"access\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"],\"modify\":[\"catalog\\/post\",\"catalog\\/downloadpost\",\"catalog\\/thread\",\"common\\/filemanager\",\"catalog\\/reviewpost\",\"report\\/post_viewed\",\"user\\/mangeuser\",\"setting\\/settingpost\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `pre_user_to_thread`
--

CREATE TABLE `pre_user_to_thread` (
  `user_id` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_visitor_counter`
--

CREATE TABLE `pre_visitor_counter` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `dt` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_visitor_counter`
--

INSERT INTO `pre_visitor_counter` (`ip`, `dt`, `hits`, `online`) VALUES
('127.0.0.1', '2016-10-11', 2, '1476171883');

-- --------------------------------------------------------

--
-- Table structure for table `pre_voucher`
--

CREATE TABLE `pre_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_voucher_history`
--

CREATE TABLE `pre_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pre_voucher_theme`
--

CREATE TABLE `pre_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_voucher_theme`
--

INSERT INTO `pre_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pre_voucher_theme_description`
--

CREATE TABLE `pre_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_voucher_theme_description`
--

INSERT INTO `pre_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Giáng sinh'),
(7, 1, 'Sinh nhật'),
(8, 1, 'Chung');

-- --------------------------------------------------------

--
-- Table structure for table `pre_weight_class`
--

CREATE TABLE `pre_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_weight_class`
--

INSERT INTO `pre_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `pre_weight_class_description`
--

CREATE TABLE `pre_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_weight_class_description`
--

INSERT INTO `pre_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilôgam', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pao', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `pre_zone`
--

CREATE TABLE `pre_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_zone`
--

INSERT INTO `pre_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(4916, 277, 'Huyện Tháp Mười', '', 1),
(4915, 277, 'Huyện Thanh Bình', '', 1),
(4914, 277, 'Huyện Tân Hồng', '', 1),
(4913, 277, 'Huyện Tam Nông', '', 1),
(4912, 277, 'Huyện Lấp Vò', '', 1),
(4911, 277, 'Huyện Lai Vung', '', 1),
(4910, 277, 'Huyện Hồng Ngự', '', 1),
(4909, 277, 'Huyện Châu Thành', '', 1),
(4908, 277, 'Huyện Cao Lãnh', '', 1),
(4907, 277, 'Thị Xã Hồng Ngự', '', 1),
(4906, 277, 'Thành Phố Sa Đéc', '', 1),
(4905, 277, 'Thành Phố Cao Lãnh', '', 1),
(4904, 276, 'Huyện Định Quán', '', 1),
(4903, 276, 'Huyện Tân Phú', '', 1),
(4902, 276, 'Huyện Xuân Lộc', '', 1),
(4901, 276, 'Huyện Cẩm Mỹ', '', 1),
(4900, 276, 'Huyện Vĩnh Cửu', '', 1),
(4899, 276, 'Huyện Thống Nhất', '', 1),
(4898, 276, 'Huyện Trảng Bom', '', 1),
(4897, 276, 'Huyện Nhơn Trạch', '', 1),
(4896, 276, 'Huyện Long Thành', '', 1),
(4895, 276, 'Thị Xã Long Khánh', '', 1),
(4894, 276, 'Thành Phố Biên Hòa', '', 1),
(4893, 275, 'Huyện Nậm Pồ', '', 1),
(4892, 275, 'Huyện Tuần Giáo', '', 1),
(4891, 275, 'Huyện Tủa Chùa', '', 1),
(4890, 275, 'Huyện Mường Nhé', '', 1),
(4889, 275, 'Huyện Mường Ảng', '', 1),
(4888, 275, 'Huyện Điện Biên Đông', '', 1),
(4887, 275, 'Huyện Điện Biên', '', 1),
(4886, 275, 'Thị Xã Mường Lay', '', 1),
(4885, 275, 'Thành Phố Điện Biên Phủ', '', 1),
(4884, 274, 'Huyện Tuy Đức', '', 1),
(4883, 274, 'Huyện Krông Nô', '', 1),
(4882, 274, 'Huyện Đắk Song', '', 1),
(4881, 274, 'Huyện Đắk R\'lấp', '', 1),
(4880, 274, 'Huyện Đắk Mil', '', 1),
(4879, 274, 'Huyện Đắk Glong', '', 1),
(4878, 274, 'Huyện Cư Jút', '', 1),
(4877, 274, 'Thị Xã Gia Nghĩa', '', 1),
(4876, 273, 'Huyện Buôn Đôn', '', 1),
(4875, 273, 'Huyện Cư Kuin', '', 1),
(4874, 273, 'Huyện Cư M\'gar', '', 1),
(4873, 273, 'Huyện Ea H\'leo', '', 1),
(4872, 273, 'Huyện Ea Kar', '', 1),
(4871, 273, 'Huyện Lắk', '', 1),
(4870, 273, 'Huyện M\'Drăk', '', 1),
(4869, 273, 'Huyện Krông Ana', '', 1),
(4868, 273, 'Huyện Krông Năng', '', 1),
(4867, 273, 'Huyện Krông Pak', '', 1),
(4866, 273, 'Huyện Krông Buk', '', 1),
(4865, 273, 'Huyện Krông Bông', '', 1),
(4864, 273, 'Huyện Ea Súp', '', 1),
(4863, 273, 'Thị Xã Buôn Hồ', '', 1),
(4862, 273, 'Thành Phố Buôn Ma Thuột', '', 1),
(4861, 272, 'Huyện Hoàng Sa', '', 1),
(4860, 272, 'Huyện Hòa Vang', '', 1),
(4859, 272, 'Quận Cẩm Lệ', '', 1),
(4858, 272, 'Quận Liên Chiểu', '', 1),
(4857, 272, 'Quận Ngũ Hành Sơn', '', 1),
(4856, 272, 'Quận Sơn Trà', '', 1),
(4855, 272, 'Quận Thanh Khê', '', 1),
(4854, 272, 'Quận Hải Châu', '', 1),
(4853, 322, 'Huyện Yên Bình', '', 1),
(4852, 322, 'Huyện Văn Yên', '', 1),
(4851, 322, 'Huyện Văn Chấn', '', 1),
(4850, 322, 'Huyện Trấn Yên', '', 1),
(4849, 322, 'Huyện Trạm Tấu', '', 1),
(4848, 322, 'Huyện Mù Cang Chải', '', 1),
(4847, 322, 'Huyện Lục Yên', '', 1),
(4846, 322, 'Thị Xã Nghĩa Lộ', '', 1),
(4845, 322, 'Thành Phố Yên Bái', '', 1),
(4844, 321, 'Huyện Yên Lạc', '', 1),
(4843, 321, 'Huyện Vĩnh Tường', '', 1),
(4842, 321, 'Huyện Tam Đảo', '', 1),
(4841, 321, 'Huyện Tam Dương', '', 1),
(4840, 321, 'Huyện Sông Lô', '', 1),
(4839, 321, 'Huyện Lập Thạch', '', 1),
(4838, 321, 'Huyện Bình Xuyên', '', 1),
(4837, 321, 'Thị Xã Phúc Yên', '', 1),
(4836, 321, 'Thành Phố Vĩnh Yên', '', 1),
(4835, 321, 'Huyện Vũng Liêm', '', 1),
(4834, 320, 'Huyện Trà Ôn', '', 1),
(4833, 320, 'Huyện Tam Bình', '', 1),
(4832, 320, 'Huyện Mang Thít', '', 1),
(4831, 320, 'Huyện Long Hồ', '', 1),
(4830, 320, 'Huyện Bình Tân', '', 1),
(4829, 320, 'Thị Xã Bình Minh', '', 1),
(4828, 320, 'Thành Phố Vĩnh Long', '', 1),
(4827, 319, 'Huyện Yên Sơn', '', 1),
(4826, 319, 'Huyện Sơn Dương', '', 1),
(4825, 319, 'Huyện Na Hang', '', 1),
(4824, 319, 'Huyện Lâm Bình', '', 1),
(4823, 319, 'Huyện Hàm Yên', '', 1),
(4822, 319, 'Huyện Chiêm Hóa', '', 1),
(4821, 319, 'Thành Phố Tuyên Quang', '', 1),
(4820, 318, 'Huyện Duyên Hải', '', 1),
(4819, 318, 'Huyện Trà Cú', '', 1),
(4818, 318, 'Huyện Cầu Ngang', '', 1),
(4817, 318, 'Huyện Châu Thành', '', 1),
(4816, 318, 'Huyện Tiểu Cần', '', 1),
(4815, 318, 'Huyện Cầu Kè', '', 1),
(4814, 318, 'Huyện Càng Long', '', 1),
(4813, 318, 'Thị Xã Duyên Hải', '', 1),
(4812, 318, 'Thành Phố Trà Vinh', '', 1),
(4811, 317, 'Huyện Tân Phú Đông', '', 1),
(4810, 317, 'Huyện Cai Lậy', '', 1),
(4809, 317, 'Huyện Tân Phước', '', 1),
(4808, 317, 'Huyện Châu Thành', '', 1),
(4807, 317, 'Huyện Chợ Gạo', '', 1),
(4806, 317, 'Huyện Gò Công Tây', '', 1),
(4805, 317, 'Huyện Gò Công Đông', '', 1),
(4804, 317, 'Huyện Cái Bè', '', 1),
(4803, 317, 'Thị Xã Cai Lậy', '', 1),
(4802, 317, 'Thị Xã Gò Công', '', 1),
(4801, 317, 'Thành Phố Mỹ Tho', '', 1),
(4800, 316, 'Thị Xã Hương Trà', '', 1),
(4799, 316, 'Thị Xã Hương Thủy', '', 1),
(4798, 316, 'Huyện Phú Lộc', '', 1),
(4797, 316, 'Huyện Phong Điền', '', 1),
(4796, 316, 'Huyện Nam Đông', '', 1),
(4795, 316, 'Huyện A Lưới', '', 1),
(4794, 316, 'Huyện Quảng Điền', '', 1),
(4793, 316, 'Huyện Phú Vang', '', 1),
(4792, 316, 'Thành Phố Huế', '', 1),
(4791, 315, 'Huyện Yên Định', '', 1),
(4790, 315, 'Huyện Vĩnh Lộc', '', 1),
(4789, 315, 'Huyện Triệu Sơn', '', 1),
(4788, 315, 'Huyện Tĩnh Gia', '', 1),
(4787, 315, 'Huyện Thường Xuân', '', 1),
(4786, 315, 'Huyện Thọ Xuân', '', 1),
(4785, 315, 'Huyện Thiệu Hóa', '', 1),
(4784, 315, 'Huyện Thạch Thành', '', 1),
(4783, 315, 'Huyện Quảng Xương', '', 1),
(4782, 315, 'Huyện Quan Sơn', '', 1),
(4781, 315, 'Huyện Quan Hóa', '', 1),
(4780, 315, 'Huyện Nông Cống', '', 1),
(4779, 315, 'Huyện Như Xuân', '', 1),
(4778, 315, 'Huyện Như Thanh', '', 1),
(4777, 315, 'Huyện Ngọc Lặc', '', 1),
(4776, 315, 'Huyện Nga Sơn', '', 1),
(4775, 315, 'Huyện Mường Lát', '', 1),
(4774, 315, 'Huyện Lang Chánh', '', 1),
(4773, 315, 'Huyện Hoằng Hóa', '', 1),
(4772, 315, 'Huyện Hậu Lộc', '', 1),
(4771, 315, 'Huyện Hà Trung', '', 1),
(4770, 315, 'Huyện Đông Sơn', '', 1),
(4769, 315, 'Huyện Cẩm Thủy', '', 1),
(4768, 315, 'Huyện Bá Thước', '', 1),
(4767, 315, 'Thị Xã Sầm Sơn', '', 1),
(4766, 315, 'Thị Xã Bỉm Sơn', '', 1),
(4765, 315, 'Thành Phố Thanh Hóa', '', 1),
(4764, 314, 'Huyện Võ Nhai', '', 1),
(4763, 314, 'Huyện Phú Lương', '', 1),
(4762, 314, 'Huyện Phú Bình', '', 1),
(4761, 314, 'Huyện Đồng Hỷ', '', 1),
(4760, 314, 'Huyện Định Hóa', '', 1),
(4759, 314, 'Huyện Đại Từ', '', 1),
(4758, 314, 'Thị Xã Phổ Yên', '', 1),
(4757, 314, 'Thành Phố Sông Công', '', 1),
(4756, 314, 'Thành Phố Thái Nguyên', '', 1),
(4755, 313, 'Huyện Vũ Thư', '', 1),
(4754, 313, 'Huyện Tiền Hải', '', 1),
(4753, 313, 'Huyện Thái Thụy', '', 1),
(4752, 313, 'Huyện Quỳnh Phụ', '', 1),
(4751, 313, 'Huyện Kiến Xương	', '', 1),
(4750, 313, 'Huyện Hưng Hà', '', 1),
(4749, 313, 'Huyện Đông Hưng', '', 1),
(4748, 313, 'Thành Phố Thái Bình', '', 1),
(4747, 312, 'Huyện Trảng Bàng', '', 1),
(4746, 312, 'Huyện Gò Dầu', '', 1),
(4745, 312, 'Huyện Bến Cầu', '', 1),
(4744, 312, 'Huyện Hòa Thành', '', 1),
(4743, 312, 'Huyện Châu Thành', '', 1),
(4742, 312, 'Huyện Dương Minh Châu', '', 1),
(4741, 312, 'Huyện Tân Châu', '', 1),
(4740, 312, 'Huyện Tân Biên', '', 1),
(4739, 312, 'Thành Phố Tây Ninh', '', 1),
(4738, 311, 'Huyện Chiềng Áng', '', 1),
(4737, 311, 'Huyện Vân Hồ', '', 1),
(4736, 311, 'Huyện Sốp Cộp', '', 1),
(4735, 311, 'Huyện Mộc Châu', '', 1),
(4734, 311, 'Huyện Yên Châu', '', 1),
(4733, 311, 'Huyện Sông Mã', '', 1),
(4732, 311, 'Huyện Mai Sơn', '', 1),
(4731, 311, 'Huyện Bắc Yên', '', 1),
(4730, 311, 'Huyện Phù Yên', '', 1),
(4729, 311, 'Huyện Thuận Châu', '', 1),
(4728, 311, 'Huyện Mường La', '', 1),
(4727, 311, 'Huyện Quỳnh Nhai', '', 1),
(4726, 311, 'Thành Phố Sơn La', '', 1),
(4725, 310, 'Huyện Cù Lao Dung', '', 1),
(4724, 310, 'Huyện Châu Thành', '', 1),
(4723, 310, 'Huyện Thạnh Trị', '', 1),
(4722, 310, 'Huyện Trần Đề', '', 1),
(4721, 310, 'Huyện Mỹ Xuyên', '', 1),
(4720, 310, 'Huyện Mỹ Tú', '', 1),
(4719, 310, 'Huyện Kế Sách', '', 1),
(4718, 310, 'Huyện Long Phú', '', 1),
(4717, 310, 'Thị Xã Ngã Năm', '', 1),
(4716, 310, 'Thị Xã Vĩnh Châu', '', 1),
(4715, 310, 'Thành Phố Sóc Trăng', '', 1),
(4714, 309, 'Huyện Vĩnh Linh', '', 1),
(4713, 309, 'Huyện Triệu Phong', '', 1),
(4712, 309, 'Huyện Hướng Hóa', '', 1),
(4711, 309, 'Huyện Hải Lăng', '', 1),
(4710, 309, 'Huyện Gio Linh', '', 1),
(4709, 309, 'Huyện Đa Krông', '', 1),
(4708, 309, 'Huyện Cồn Cỏ', '', 1),
(4707, 309, 'Huyện Cam Lộ', '', 1),
(4706, 309, 'Thị Xã Quảng Trị', '', 1),
(4705, 309, 'Thành Phố Đông Hà', '', 1),
(4704, 307, 'Huyện Ba Chẽ', '', 1),
(4703, 307, 'Huyện Bình Liêu', '', 1),
(4702, 307, 'Huyện Hải Hà', '', 1),
(4701, 307, 'Huyện Tiên Yên', '', 1),
(4700, 307, 'Huyện Cô Tô', '', 1),
(4699, 307, 'Huyện Đầm Hà', '', 1),
(4698, 307, 'Huyện Hoành Bồ', '', 1),
(4697, 307, 'Huyện Vân Đồn', '', 1),
(4696, 307, 'Thị Xã Đông Triều', '', 1),
(4695, 307, 'Thị Xã Quảng Yên', '', 1),
(4694, 307, 'Thành Phố Cẩm Phả', '', 1),
(4693, 307, 'Thành Phố Uông Bí', '', 1),
(4692, 307, 'Thành Phố Móng Cái', '', 1),
(4691, 307, 'Thành Phố Hạ Long', '', 1),
(4690, 306, 'Huyện Nghĩa Hành', '', 1),
(4689, 306, 'Huyện Sơn Hà', '', 1),
(4688, 306, 'Huyện Sơn Tây', '', 1),
(4687, 306, 'Huyện Sơn Tịnh', '', 1),
(4686, 306, 'Huyện Tây Trà', '', 1),
(4685, 306, 'Huyện Trà Bồng', '', 1),
(4684, 306, 'Huyện Tư Nghĩa', '', 1),
(4683, 306, 'Huyện Lý Sơn', '', 1),
(4682, 306, 'Huyện Mộ Đức', '', 1),
(4681, 306, 'Huyện Minh Long', '', 1),
(4680, 306, 'Huyện Đức Phổ', '', 1),
(4679, 306, 'Huyện Bình Sơn', '', 1),
(4678, 306, 'Huyện Ba Tơ', '', 1),
(4677, 306, 'Thành Phố Quảng Ngãi', '', 1),
(4676, 305, 'Huyện Quế Sơn', '', 1),
(4675, 305, 'Huyện Duy Xuyên', '', 1),
(4674, 305, 'Huyện Tây Giang', '', 1),
(4673, 305, 'Huyện Phú Ninh', '', 1),
(4672, 305, 'Huyện Đại Lộc', '', 1),
(4671, 305, 'Huyện Nam Giang', '', 1),
(4670, 305, 'Huyện Đông Giang', '', 1),
(4669, 305, 'Huyện Nông Sơn', '', 1),
(4668, 305, 'Huyện Hiệp Đức', '', 1),
(4667, 305, 'Huyện Tiên Phước', '', 1),
(4666, 305, 'Huyện Phước Sơn', '', 1),
(4665, 305, 'Huyện Núi Thành', '', 1),
(4664, 305, 'Huyện Nam Trà My', '', 1),
(4663, 305, 'Huyện Bắc Trà My', '', 1),
(4662, 305, 'Huyện Thăng Bình', '', 1),
(4661, 305, 'Thị Xã Điện Bàn', '', 1),
(4660, 305, 'Thành Phố Hội An', '', 1),
(4659, 305, 'Thành Phố Tam Kỳ', '', 1),
(4658, 303, 'Huyện Lệ Thủy', '', 1),
(4657, 303, 'Huyện Quảng Ninh', '', 1),
(4656, 303, 'Huyện Bố Trạch', '', 1),
(4655, 303, 'Huyện Tuyên Hóa', '', 1),
(4654, 303, 'Huyện Tuyên Hóa', '', 1),
(4653, 303, 'Huyện Minh Hóa', '', 1),
(4652, 303, 'Thị Xã Ba Đồn', '', 1),
(4651, 303, 'Thành Phố Đồng Hới', '', 1),
(4650, 302, 'Huyện Tây Hòa', '', 1),
(4649, 302, 'Huyện Tuy An', '', 1),
(4648, 302, 'Huyện Sông Hinh', '', 1),
(4647, 302, 'Huyện Sơn Hòa', '', 1),
(4646, 302, 'Huyện Phú Hòa', '', 1),
(4645, 302, 'Huyện Đồng Xuân', '', 1),
(4644, 302, 'Huyện Đông Hòa', '', 1),
(4643, 302, 'Thị Xã Sông Cầu', '', 1),
(4642, 302, 'Thành Phố Tuy Hòa', '', 1),
(4641, 301, 'Huyện Yên Lập', '', 1),
(4640, 301, 'Huyện Thanh Thủy', '', 1),
(4639, 301, 'Huyện Thanh Sơn', '', 1),
(4638, 301, 'Huyện Thanh Ba', '', 1),
(4637, 301, 'Huyện Tân Sơn', '', 1),
(4636, 301, 'Huyện Tam Nông', '', 1),
(4635, 301, 'Huyện Phù Ninh', '', 1),
(4634, 301, 'Huyện Lâm Thao', '', 1),
(4633, 301, 'Huyện Hạ Hòa', '', 1),
(4632, 301, 'Huyện Đoan Hùng', '', 1),
(4631, 301, 'Huyện Cẩm Khê', '', 1),
(4630, 301, 'Thị Xã Phú Thọ', '', 1),
(4629, 301, 'Thành Phố Việt Trì', '', 1),
(4628, 300, 'Huyện Thuận Nam', '', 1),
(4627, 300, 'Huyện Thuận Bắc', '', 1),
(4626, 300, 'Huyện Ninh Sơn', '', 1),
(4625, 300, 'Huyện Ninh Phước', '', 1),
(4624, 300, 'Huyện Ninh Hải', '', 1),
(4623, 300, 'Huyện Bác Ái', '', 1),
(4622, 300, 'Thành Phố Phan Rang - Tháp Chàm', '', 1),
(4621, 299, 'Huyện Yên Mô', '', 1),
(4620, 299, 'Huyện Yên Khánh', '', 1),
(4619, 299, 'Huyện Nho Quan', '', 1),
(4618, 299, 'Huyện Kim Sơn', '', 1),
(4617, 299, 'Huyện Hoa Lư', '', 1),
(4616, 299, 'Huyện Gia Viễn', '', 1),
(4615, 299, 'Thành Phố Tam Điệp', '', 1),
(4614, 299, 'Thành Phố Ninh Bình', '', 1),
(4613, 298, 'Huyện Yên Thành', '', 1),
(4612, 298, 'Huyện Tương Dương', '', 1),
(4611, 298, 'Huyện Thanh Chương', '', 1),
(4610, 298, 'Huyện Tân Kỳ', '', 1),
(4609, 298, 'Huyện Quỳnh Lưu', '', 1),
(4608, 298, 'Huyện Quỳ Hợp', '', 1),
(4607, 298, 'Huyện Quế Phong', '', 1),
(4606, 298, 'Huyện Nghĩa Đàn', '', 1),
(4605, 298, 'Huyện Nghi Lộc', '', 1),
(4604, 298, 'Huyện Nam Đàn', '', 1),
(4603, 298, 'Huyện Kỳ Sơn', '', 1),
(4602, 298, 'Huyện Quỳ Châu', '', 1),
(4601, 298, 'Huyện Hưng Nguyên', '', 1),
(4600, 298, 'Huyện Đô Lương', '', 1),
(4599, 298, 'Huyện Diễn Châu', '', 1),
(4598, 298, 'Huyện Con Cuông', '', 1),
(4597, 298, 'Huyện Anh Sơn', '', 1),
(4596, 298, 'Thị Xã Thái Hòa', '', 1),
(4595, 298, 'Thị Xã Hoàng Mai', '', 1),
(4594, 298, 'Thị Xã Cửa Lò', '', 1),
(4593, 298, 'Thành Phố Vinh', '', 1),
(4592, 297, 'Huyện Ý Yên', '', 1),
(4591, 297, 'Huyện Xuân Trường', '', 1),
(4590, 297, 'Huyện Vụ Bản', '', 1),
(4589, 297, 'Huyện Trực Ninh', '', 1),
(4588, 297, 'Huyện Nghĩa Hưng', '', 1),
(4587, 297, 'Huyện Nam Trực', '', 1),
(4586, 297, 'Huyện Mỹ Lộc', '', 1),
(4585, 297, 'Huyện Hải Hậu', '', 1),
(4584, 297, 'Huyện Giao Thủy', '', 1),
(4583, 297, 'Thành Phố Nam Định', '', 1),
(4582, 296, 'Huyện Châu Thành', '', 1),
(4581, 296, 'Huyện Cần Giuộc', '', 1),
(4580, 296, 'Huyện Cần Đước', '', 1),
(4579, 296, 'Huyện Bến Lức', '', 1),
(4578, 296, 'Thị Xã Kiến Tường', '', 1),
(4577, 296, 'Thành Phố Tân An', '', 1),
(4576, 293, 'Huyện Văn Bàn', '', 1),
(4575, 293, 'Huyện Si Ma Cai', '', 1),
(4574, 293, 'Huyện Sa Pa', '', 1),
(4573, 293, 'Huyện Mường Khương', '', 1),
(4572, 293, 'Huyện Bắc Hà', '', 1),
(4571, 293, 'Huyện Bát Xát', '', 1),
(4570, 293, 'Huyện Bảo Yên', '', 1),
(4569, 293, 'Huyện Bảo Thắng', '', 1),
(4568, 293, 'Thành Phố Lào Cai', '', 1),
(4567, 294, 'Huyện Văn Quan', '', 1),
(4566, 294, 'Huyện Văn Lãng', '', 1),
(4565, 294, 'Huyện Tràng Định', '', 1),
(4564, 294, 'Huyện Lộc Bình', '', 1),
(4563, 294, 'Huyện Hữu Lũng', '', 1),
(4562, 294, 'Huyện Đình Lập', '', 1),
(4561, 294, 'Huyện Chi Lăng', '', 1),
(4560, 294, 'Huyện Cao Lộc', '', 1),
(4559, 294, 'Huyện Bình Gia', '', 1),
(4558, 294, 'Huyện Bắc Sơn', '', 1),
(4557, 294, 'Thành Phố Lạng Sơn', '', 1),
(4556, 295, 'Huyện Đức Trọng', '', 1),
(4555, 295, 'Huyện Lâm Hà', '', 1),
(4554, 295, 'Huyện Lạc Dương', '', 1),
(4553, 295, 'Huyện Đơn Dương', '', 1),
(4552, 295, 'Huyện Đạ Tẻh', '', 1),
(4551, 295, 'Huyện Đạ Huoai', '', 1),
(4550, 295, 'Huyện Đam Rông', '', 1),
(4549, 295, 'Huyện Di Linh', '', 1),
(4548, 295, 'Huyện Cát Tiên', '', 1),
(4547, 295, 'Huyện Bảo Lâm', '', 1),
(4546, 295, 'Thành Phố Bảo Lộc', '', 1),
(4545, 295, 'Thành Phố Đà Lạt', '', 1),
(4544, 292, 'Huyện Nậm Nhùn', '', 1),
(4543, 292, 'Huyện Tân Uyên', '', 1),
(4542, 292, 'Huyện Than Uyên', '', 1),
(4541, 292, 'Huyện Tam Đường', '', 1),
(4540, 292, 'Huyện Sìn Hồ', '', 1),
(4539, 292, 'Huyện Phong Thổ', '', 1),
(4538, 292, 'Huyện Mường Tè', '', 1),
(4537, 292, 'Thành Phố Lai Châu', '', 1),
(4536, 291, 'Huyện Tu Mơ Rông', '', 1),
(4535, 291, 'Huyện Sa Thầy', '', 1),
(4534, 291, 'Huyện Ngọc Hồi', '', 1),
(4533, 291, 'Huyện Kon Rẫy', '', 1),
(4532, 291, 'Huyện Kon Plông', '', 1),
(4531, 291, 'Huyện Ia H\'Drai', '', 1),
(4530, 291, 'Huyện Đắk Tô', '', 1),
(4529, 291, 'Huyện Đắk Hà', '', 1),
(4528, 291, 'Huyện Đắk Glei', '', 1),
(4527, 291, 'Thành Phố Kon Tum', '', 1),
(4526, 290, 'Huyện Giang Thành', '', 1),
(4525, 290, 'Huyện Giồng Riềng', '', 1),
(4524, 290, 'Huyện Châu Thành', '', 1),
(4523, 290, 'Huyện An Minh', '', 1),
(4522, 290, 'Huyện An Biên', '', 1),
(4521, 290, 'Thị Xã Hà Tiên', '', 1),
(4520, 290, 'Thành Phố Rạch Giá', '', 1),
(4519, 289, 'Huyện đảo Trường Sa', '', 1),
(4518, 289, 'Huyện Cam Lâm', '', 1),
(4517, 289, 'Huyện Khánh Sơn', '', 1),
(4516, 289, 'Huyện Khánh Vĩnh', '', 1),
(4515, 289, 'Huyện Duyên Khánh', '', 1),
(4514, 289, 'Huyện Vạn Ninh', '', 1),
(4513, 289, 'Thị Xã Ninh Hòa', '', 1),
(4512, 289, 'Thành Phố Cam Ranh', '', 1),
(4511, 289, 'Thành Phố Nha Trang', '', 1),
(4510, 288, 'Huyện Phù Cừ', '', 1),
(4509, 288, 'Huyện Tiên Lữ', '', 1),
(4508, 288, 'Huyện Kim Động', '', 1),
(4507, 288, 'Huyện Khoái Châu', '', 1),
(4506, 288, 'Huyện Ân Thi', '', 1),
(4505, 288, 'Huyện Mỹ Hào', '', 1),
(4504, 288, 'Huyện Yên Mỹ', '', 1),
(4503, 288, 'Huyện Văn Giang', '', 1),
(4502, 288, 'Huyện Văn Lâm', '', 1),
(4501, 288, 'Thành phố Hưng Yên', '', 1),
(4500, 323, 'Huyện Yên Thủy', '', 1),
(4499, 323, 'Huyện Tân Lạc', '', 1),
(4498, 323, 'Huyện Mai Châu', '', 1),
(4497, 323, 'Huyện Lạc Thủy', '', 1),
(4496, 323, 'Huyện Lạc Sơn', '', 1),
(4495, 323, 'Huyện Kỳ Sơn', '', 1),
(4494, 323, 'Huyện Kim Bôi', '', 1),
(4493, 323, 'Huyện Đà Bắc', '', 1),
(4492, 323, 'Huyện Cao Phong', '', 1),
(4491, 323, 'Huyện Lương Sơn', '', 1),
(4490, 323, 'Thành phố Hòa Bình', '', 1),
(4489, 286, 'Huyện Nhà Bè', '', 1),
(4488, 286, 'Huyện Hóc Môn', '', 1),
(4487, 286, 'Huyện Củ Chi', '', 1),
(4486, 286, 'Huyện Cần Giờ', '', 1),
(4485, 286, 'Huyện Bình Chánh', '', 1),
(4484, 286, 'Quận Bình Tân', '', 1),
(4483, 286, 'Quận Bình Thạnh', '', 1),
(4482, 286, 'Quận Gò Vấp', '', 1),
(4481, 286, 'Quận Phú Nhuận', '', 1),
(4480, 286, 'Quận Tân Bình', '', 1),
(4479, 286, 'Quận Tân Phú', '', 1),
(4478, 286, 'Quận Thủ Đức', '', 1),
(4477, 286, 'Quận 12', '', 1),
(4476, 286, 'Quận 11', '', 1),
(4475, 286, 'Quận 10', '', 1),
(4474, 286, 'Quận 9', '', 1),
(4473, 286, 'Quận 8', '', 1),
(4472, 286, 'Quận 7', '', 1),
(4471, 286, 'Quận 6', '', 1),
(4470, 286, 'Quận 5', '', 1),
(4469, 286, 'Quận 4', '', 1),
(4468, 286, 'Quận 3', '', 1),
(4467, 286, 'Quận 2', '', 1),
(4466, 286, 'Quận 1', '', 1),
(4465, 287, 'Huyện Vị Thũy', '', 1),
(4464, 287, 'Huyện Phụng Hiệp', '', 1),
(4463, 287, 'Huyện Long Mỹ', '', 1),
(4462, 287, 'Huyện Châu Thành A', '', 1),
(4461, 287, 'Huyện Châu Thành', '', 1),
(4460, 287, 'Thị Xã Ngã Bảy', '', 1),
(4459, 287, 'Thị Xã Long Mỹ', '', 1),
(4458, 287, 'Thành Phố Vị Thanh', '', 1),
(4457, 285, 'Huyện Thủy Nguyên', '', 1),
(4456, 285, 'Huyện Vĩnh Bảo', '', 1),
(4455, 285, 'Huyện Tiên Lãng', '', 1),
(4454, 285, 'Huyện Kiến Thụy', '', 1),
(4453, 285, 'Huyện Đảo Cát Hải', '', 1),
(4452, 285, 'Huyện Đảo Bạch Long Vĩ', '', 1),
(4451, 285, 'Huyện An Lão', '', 1),
(4450, 285, 'Huyện An Dương', '', 1),
(4449, 285, 'Quận Lê Chân', '', 1),
(4448, 285, 'Quận Ngô Quyền', '', 1),
(4447, 285, 'Quận Hồng Bàng', '', 1),
(4446, 285, 'Quận Kiến An', '', 1),
(4445, 285, 'Quận Hải An', '', 1),
(4444, 285, 'Quận Đồ Sơn', '', 1),
(4443, 285, 'Quận Dương Kinh', '', 1),
(4442, 284, 'Huyện Thanh Miện', '', 1),
(4441, 284, 'Huyện Ninh Giang', '', 1),
(4440, 284, 'Huyện Tứ Kỳ', '', 1),
(4439, 284, 'Huyện Gia Lộc', '', 1),
(4438, 284, 'Huyện Bình Giang', '', 1),
(4437, 284, 'Huyện Cẩm Giàng', '', 1),
(4436, 284, 'Huyện Thanh Hà', '', 1),
(4435, 284, 'Huyện Kim Thành', '', 1),
(4434, 284, 'Huyện Kinh Môn', '', 1),
(4433, 284, 'Huyện Nam Sách', '', 1),
(4432, 284, 'Thị Xã Chí Linh', '', 1),
(4431, 284, 'Thành Phố Hải Dương', '', 1),
(4430, 283, 'Huyện Lộc Hà', '', 1),
(4429, 283, 'Huyện Vũ Quang', '', 1),
(4428, 283, 'Huyện Thạch Hà', '', 1),
(4427, 283, 'Huyện Nghi Xuân', '', 1),
(4426, 283, 'Huyện Kỳ Anh', '', 1),
(4425, 283, 'Huyện Hương Sơn', '', 1),
(4424, 283, 'Huyện Hương Khê', '', 1),
(4423, 283, 'Huyện Đức Thọ', '', 1),
(4422, 283, 'Huyện Can Lộc', '', 1),
(4421, 283, 'Huyện Cẩm Xuyên', '', 1),
(4420, 283, 'Thị Xã Kỳ Anh', '', 1),
(4419, 283, 'Thị Xã Hồng Lĩnh', '', 1),
(4418, 283, 'Thành Phố Hà Tĩnh', '', 1),
(4417, 281, 'Huyện Ứng Hòa', '', 1),
(4416, 281, 'Huyện Thường Tín', '', 1),
(4415, 281, 'Huyện Thanh Trì', '', 1),
(4414, 281, 'Huyện Thanh Oai', '', 1),
(4413, 281, 'Huyện Thạch Thất', '', 1),
(4412, 281, 'Huyện Sóc Sơn', '', 1),
(4411, 281, 'Huyện Quốc Oai', '', 1),
(4410, 281, 'Huyện Phúc Thọ', '', 1),
(4409, 281, 'Huyện Phú Xuyên	', '', 1),
(4408, 281, 'Huyện Mỹ Đức', '', 1),
(4407, 281, 'Huyện Mê Linh', '', 1),
(4406, 281, 'Huyện Hoài Đức', '', 1),
(4405, 281, 'Huyện Gia Lâm', '', 1),
(4404, 281, 'Huyện Đông Anh', '', 1),
(4403, 281, 'Huyện Đan Phượng', '', 1),
(4402, 281, 'Huyện Chương Mỹ', '', 1),
(4401, 281, 'Huyện Ba Vì', '', 1),
(4400, 281, 'Thị xã Sơn Tây', '', 1),
(4399, 281, 'Quận Nam Từ Liêm', '', 1),
(4398, 281, 'Quận Bắc Từ Liêm', '', 1),
(4397, 281, 'Quận Hà Đông', '', 1),
(4396, 281, 'Quận Thanh Xuân', '', 1),
(4395, 281, 'Quận Hoàng Mai', '', 1),
(4394, 281, 'Quận Hai Bà Trưng', '', 1),
(4393, 281, 'Quận Đống Đa', '', 1),
(4392, 281, 'Quận Cầu Giấy', '', 1),
(4391, 281, 'Quận Long Biên', '', 1),
(4390, 281, 'Quận Tây Hồ', '', 1),
(4389, 281, 'Quận Hoàn Kiếm', '', 1),
(4388, 281, 'Quận Ba Đình', '', 1),
(4387, 280, 'Huyện Bình Lục', '', 1),
(4386, 280, 'Huyện Thanh Liêm', '', 1),
(4385, 280, 'Huyện Lý Nhân', '', 1),
(4384, 280, 'Huyện Kim Bảng', '', 1),
(4383, 280, 'Huyện Duy Tiên', '', 1),
(4382, 280, 'Thành Phố Phủ Lý', '', 1),
(4381, 279, 'Huyện Yên Minh', '', 1),
(4380, 279, 'Huyện Xín Mần', '', 1),
(4379, 279, 'Huyện Vị Xuyên', '', 1),
(4378, 279, 'Huyện Quang Bình', '', 1),
(4377, 279, 'Huyện Quản Bạ', '', 1),
(4376, 279, 'Huyện Mèo Vạc', '', 1),
(4375, 279, 'Huyện Hoàng Su Phì', '', 1),
(4374, 279, 'Huyện Đồng Văn', '', 1),
(4373, 279, 'Huyện Bắc Quang', '', 1),
(4372, 279, 'Huyện Bắc Mê', '', 1),
(4371, 278, 'Huyện Đắk Đoa', '', 1),
(4370, 278, 'Huyện Chư Sê', '', 1),
(4369, 278, 'Huyện Chư Prông', '', 1),
(4368, 278, 'Huyện Chư Păh', '', 1),
(4367, 278, 'Thị Xã Ayun Pa', '', 1),
(4366, 278, 'Thị Xã An Khê', '', 1),
(4365, 278, 'Thành Phố Pleiku', '', 1),
(4364, 270, 'Huyện Trùng Khánh', '', 1),
(4363, 270, 'Huyện Trà Lĩnh', '', 1),
(4362, 270, 'Huyện Thông Nông', '', 1),
(4361, 270, 'Huyện Thạch An', '', 1),
(4360, 270, 'Huyện Quảng Uyên', '', 1),
(4359, 270, 'Huyện Phục Hòa', '', 1),
(4358, 270, 'Huyện Nguyên Bình', '', 1),
(4357, 270, 'Huyện Hòa An', '', 1),
(4356, 270, 'Huyện Hà Quảng', '', 1),
(4355, 271, 'Huyện Hạ Lang', '', 1),
(4354, 270, 'Huyện Bảo Lâm', '', 1),
(4353, 270, 'Huyện Bảo Lạc', '', 1),
(4352, 270, 'Thành Phố Cao Bằng', '', 1),
(4351, 271, 'Huyện Vĩnh Thạnh', '', 1),
(4350, 271, 'Huyện Thới Lai', '', 1),
(4349, 271, 'Huyện Cờ Đỏ', '', 1),
(4348, 271, 'Huyện Phong Điền', '', 1),
(4347, 271, 'Quận Thốt Nốt', '', 1),
(4346, 271, 'Quận Ô Môn', '', 1),
(4345, 271, 'Quận Cái Răng', '', 1),
(4344, 271, 'Quận Bình Thủy', '', 1),
(4343, 271, 'Quận Ninh Kiều', '', 1),
(4342, 269, 'Huyện Phú Tân', '', 1),
(4341, 269, 'Huyện Năm Căn', '', 1),
(4340, 269, 'Huyện Thới Bình', '', 1),
(4339, 269, 'Huyện U Minh', '', 1),
(4338, 269, 'Huyện Trần Văn Thời', '', 1),
(4337, 269, 'Huyện Cái Nước', '', 1),
(4336, 269, 'Huyện Ngọc Hiển', '', 1),
(4335, 269, 'Huyện Đầm Dơi', '', 1),
(4334, 269, 'Thành Phố Cà Mau', '', 1),
(4333, 266, 'Huyện Vĩnh Thạnh', '', 1),
(4332, 266, 'Huyện Vân Canh', '', 1),
(4331, 266, 'Huyện Tây Sơn', '', 1),
(4330, 266, 'Huyện Tuy Phước', '', 1),
(4329, 266, 'Huyện Phù Mỹ', '', 1),
(4328, 266, 'Huyện Phù Cát', '', 1),
(4327, 266, 'Huyện Hoài Ân', '', 1),
(4326, 266, 'Huyện An Lão', '', 1),
(4325, 266, 'Huyện Hoài Nhơn', '', 1),
(4324, 266, 'Thị Xã An Nhơn', '', 1),
(4323, 266, 'Thành Phố Quy Nhơn', '', 1),
(4322, 268, 'Huyện Phú Quý', '', 1),
(4321, 268, 'Huyện Đức Linh', '', 1),
(4320, 268, 'Huyện Hàm Tân', '', 1),
(4319, 268, 'Huyện Tánh Linh', '', 1),
(4318, 268, 'Huyện Hàm Thuận Nam', '', 1),
(4317, 268, 'Huyện Hàm Thuận Bắc', '', 1),
(4316, 268, 'Huyện Bắc Bình', '', 1),
(4315, 268, 'Huyện Tuy Phong', '', 1),
(4314, 268, 'Thị Xã La Gi', '', 1),
(4313, 268, 'Thành Phố Phan Thiết', '', 1),
(4312, 267, 'Huyện Phú Riềng', '', 1),
(4311, 267, 'Huyện Lộc Ninh', '', 1),
(4310, 267, 'Huyện Hớn Quản', '', 1),
(4309, 267, 'Huyện Đồng Phú', '', 1),
(4308, 267, 'Huyện Chơn Thành', '', 1),
(4307, 267, 'Huyện Bù Gia Mập', '', 1),
(4306, 267, 'Huyện Bù Đốp', '', 1),
(4305, 267, 'Huyện Bù Đăng', '', 1),
(4304, 267, 'Thị Xã Phước Long', '', 1),
(4303, 267, 'Thị Xã Bình Long', '', 1),
(4302, 267, 'Thị Xã Đồng Xoài', '', 1),
(4301, 265, 'Huyện Bàu Bàng', '', 1),
(4300, 265, 'Huyện Bắc Tân Uyên', '', 1),
(4299, 265, 'Huyện Phú Giao', '', 1),
(4298, 265, 'Huyện Dầu Tiếng', '', 1),
(4297, 265, 'Thị Xã Bến Cát', '', 1),
(4296, 265, 'Thị Xã Tân Uyên', '', 1),
(4295, 265, 'Thị Xã Dĩ An', '', 1),
(4294, 265, 'Thị Xã Thuận An', '', 1),
(4293, 265, 'Thành Phố Thủ Dầu Một', '', 1),
(4292, 264, 'Huyện Thạnh Phú', '', 1),
(4291, 264, 'Huyện Mỏ Cày Nam', '', 1),
(4290, 264, 'Huyện Mỏ Cày Bắc', '', 1),
(4289, 264, 'Huyện Giồng Trôm', '', 1),
(4288, 264, 'Huyện Chợ Lách', '', 1),
(4287, 264, 'Huyện Châu Thành', '', 1),
(4286, 264, 'Huyện Bình Đại', '', 1),
(4285, 264, 'Huyện Ba Tri', '', 1),
(4284, 264, 'Thành Phố Bến Tre', '', 1),
(4283, 263, 'Huyện Yên Phong', '', 1),
(4282, 263, 'Huyện Tiên Du', '', 1),
(4281, 263, 'Huyện Thuận Thành', '', 1),
(4280, 263, 'Huyện Quế Võ', '', 1),
(4279, 263, 'Huyện Lương Tài', '', 1),
(4278, 263, 'Huyện Gia Bình', '', 1),
(4277, 263, 'Thị Xã Từ Sơn', '', 1),
(4276, 263, 'Thành Phố Bắc Ninh', '', 1),
(4275, 260, 'Huyện Đông Hải', '', 1),
(4274, 260, 'Huyện Vĩnh Lợi', '', 1),
(4273, 260, 'Huyện Phước Long', '', 1),
(4272, 260, 'Huyện Hòa Bình', '', 1),
(4271, 260, 'Huyện Hồng Dân', '', 1),
(4270, 260, 'Thị Xã Giá Rai', '', 1),
(4269, 260, 'Thành Phố Bạc Liêu', '', 1),
(4268, 261, 'Huyện Pác Nặm', '', 1),
(4267, 261, 'Huyện Ngân Sơn', '', 1),
(4266, 261, 'Huyện Ngân Sơn', '', 1),
(4265, 261, 'Huyện Na Rì', '', 1),
(4264, 261, 'Huyện Chợ Mới', '', 1),
(4263, 261, 'Huyện Chợ Đôn', '', 1),
(4262, 261, 'Huyện Bạch Thông', '', 1),
(4261, 261, 'Huyện Ba Bể', '', 1),
(4260, 261, 'Thành Phố Bắc Kạn', '', 1),
(4259, 262, 'Huyện Yên Dũng', '', 1),
(4258, 262, 'Huyện Việt Yên', '', 1),
(4257, 262, 'Huyện Lục Nam', '', 1),
(4256, 262, 'Huyện Sơn Động', '', 1),
(4255, 262, 'Huyện Lạng Giang', '', 1),
(4254, 262, 'Huyện Hiệp Hòa', '', 1),
(4253, 262, 'Huyện Lục Ngạn', '', 1),
(4252, 262, 'Huyện Tân Yên', '', 1),
(4251, 262, 'Huyện Yên Thế', '', 1),
(4250, 262, 'Thành Phố Bắc Giang', '', 1),
(4249, 259, 'Huyện Côn Đảo', '', 1),
(4248, 259, 'Huyện Tân Thành', '', 1),
(4247, 259, 'Huyện Châu Đức', '', 1),
(4246, 259, 'Huyện Long Điền', '', 1),
(4245, 259, 'Thị Xã Đất Đỏ', '', 1),
(4244, 259, 'Huyện Xuyên Mộc', '', 1),
(4243, 259, 'Thành Phố Vũng Tàu', '', 1),
(4242, 259, 'Thành Phố Bà Rịa', '', 1),
(4241, 258, 'Huyện Tri Tôn', '', 1),
(4240, 258, 'Huyện Tịnh Biên', '', 1),
(4239, 258, 'Huyện Thoại Sơn', '', 1),
(4238, 258, 'Huyện Phú Tân', '', 1),
(4237, 258, 'Huyện Chợ Mới', '', 1),
(4236, 258, 'Huyện Châu Thành', '', 1),
(4235, 258, 'Huyện Châu Phú', '', 1),
(4234, 258, 'Huyện An Phú', '', 1),
(4233, 258, 'Thị Xã Tân Châu', '', 1),
(4232, 258, 'Thành Phố Châu Đốc', '', 1),
(4231, 258, 'Thành Phố Long Xuyên', '', 1),
(4917, 290, 'Huyện Kiên Lương', '', 1),
(4918, 290, 'Huyện Hòn Đất', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pre_zone_to_geo_zone`
--

CREATE TABLE `pre_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pre_zone_to_geo_zone`
--

INSERT INTO `pre_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(110, 230, 0, 5, '2018-06-07 13:37:15', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pre_address`
--
ALTER TABLE `pre_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `pre_affiliate`
--
ALTER TABLE `pre_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Indexes for table `pre_affiliate_activity`
--
ALTER TABLE `pre_affiliate_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `pre_affiliate_login`
--
ALTER TABLE `pre_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `pre_affiliate_transaction`
--
ALTER TABLE `pre_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Indexes for table `pre_api`
--
ALTER TABLE `pre_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Indexes for table `pre_api_ip`
--
ALTER TABLE `pre_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Indexes for table `pre_api_session`
--
ALTER TABLE `pre_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Indexes for table `pre_attribute`
--
ALTER TABLE `pre_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `pre_attribute_description`
--
ALTER TABLE `pre_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Indexes for table `pre_attribute_group`
--
ALTER TABLE `pre_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Indexes for table `pre_attribute_group_description`
--
ALTER TABLE `pre_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Indexes for table `pre_banner`
--
ALTER TABLE `pre_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `pre_banner_image`
--
ALTER TABLE `pre_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `pre_banner_image_description`
--
ALTER TABLE `pre_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- Indexes for table `pre_bf_attribute_value`
--
ALTER TABLE `pre_bf_attribute_value`
  ADD PRIMARY KEY (`attribute_value_id`),
  ADD UNIQUE KEY `attribute_id` (`attribute_id`,`language_id`,`value`),
  ADD KEY `sort_order` (`sort_order`);

--
-- Indexes for table `pre_bf_filter`
--
ALTER TABLE `pre_bf_filter`
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_bf_product_attribute_value`
--
ALTER TABLE `pre_bf_product_attribute_value`
  ADD PRIMARY KEY (`product_id`,`attribute_value_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_bf_tax_rate`
--
ALTER TABLE `pre_bf_tax_rate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_group_id` (`customer_group_id`,`country_id`,`zone_id`),
  ADD KEY `tax_class_id` (`tax_class_id`);

--
-- Indexes for table `pre_block`
--
ALTER TABLE `pre_block`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `pre_cart`
--
ALTER TABLE `pre_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Indexes for table `pre_category`
--
ALTER TABLE `pre_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `pre_category_description`
--
ALTER TABLE `pre_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `pre_category_filter`
--
ALTER TABLE `pre_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Indexes for table `pre_category_path`
--
ALTER TABLE `pre_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Indexes for table `pre_category_to_layout`
--
ALTER TABLE `pre_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `pre_category_to_store`
--
ALTER TABLE `pre_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Indexes for table `pre_country`
--
ALTER TABLE `pre_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `pre_coupon`
--
ALTER TABLE `pre_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `pre_coupon_category`
--
ALTER TABLE `pre_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Indexes for table `pre_coupon_history`
--
ALTER TABLE `pre_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Indexes for table `pre_coupon_product`
--
ALTER TABLE `pre_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Indexes for table `pre_currency`
--
ALTER TABLE `pre_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `pre_customer`
--
ALTER TABLE `pre_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `pre_customer_activity`
--
ALTER TABLE `pre_customer_activity`
  ADD PRIMARY KEY (`activity_id`);

--
-- Indexes for table `pre_customer_group`
--
ALTER TABLE `pre_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Indexes for table `pre_customer_group_description`
--
ALTER TABLE `pre_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Indexes for table `pre_customer_history`
--
ALTER TABLE `pre_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Indexes for table `pre_customer_ip`
--
ALTER TABLE `pre_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `pre_customer_login`
--
ALTER TABLE `pre_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `pre_customer_online`
--
ALTER TABLE `pre_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Indexes for table `pre_customer_reward`
--
ALTER TABLE `pre_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Indexes for table `pre_customer_transaction`
--
ALTER TABLE `pre_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Indexes for table `pre_customer_wishlist`
--
ALTER TABLE `pre_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Indexes for table `pre_custom_field`
--
ALTER TABLE `pre_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Indexes for table `pre_custom_field_customer_group`
--
ALTER TABLE `pre_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Indexes for table `pre_custom_field_description`
--
ALTER TABLE `pre_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Indexes for table `pre_custom_field_value`
--
ALTER TABLE `pre_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Indexes for table `pre_custom_field_value_description`
--
ALTER TABLE `pre_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Indexes for table `pre_download`
--
ALTER TABLE `pre_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Indexes for table `pre_downloadpost`
--
ALTER TABLE `pre_downloadpost`
  ADD PRIMARY KEY (`downloadpost_id`);

--
-- Indexes for table `pre_downloadpost_description`
--
ALTER TABLE `pre_downloadpost_description`
  ADD PRIMARY KEY (`downloadpost_id`,`language_id`);

--
-- Indexes for table `pre_download_description`
--
ALTER TABLE `pre_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Indexes for table `pre_dqc_setting`
--
ALTER TABLE `pre_dqc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `pre_dqc_statistic`
--
ALTER TABLE `pre_dqc_statistic`
  ADD PRIMARY KEY (`statistic_id`);

--
-- Indexes for table `pre_email_subscribed`
--
ALTER TABLE `pre_email_subscribed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_event`
--
ALTER TABLE `pre_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `pre_extension`
--
ALTER TABLE `pre_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `pre_extra_info`
--
ALTER TABLE `pre_extra_info`
  ADD PRIMARY KEY (`extra_info_id`);

--
-- Indexes for table `pre_filter`
--
ALTER TABLE `pre_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `pre_filter_description`
--
ALTER TABLE `pre_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Indexes for table `pre_filter_group`
--
ALTER TABLE `pre_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Indexes for table `pre_filter_group_description`
--
ALTER TABLE `pre_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Indexes for table `pre_geo_zone`
--
ALTER TABLE `pre_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `pre_information`
--
ALTER TABLE `pre_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Indexes for table `pre_information_description`
--
ALTER TABLE `pre_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Indexes for table `pre_information_to_layout`
--
ALTER TABLE `pre_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `pre_information_to_store`
--
ALTER TABLE `pre_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Indexes for table `pre_language`
--
ALTER TABLE `pre_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `pre_layout`
--
ALTER TABLE `pre_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Indexes for table `pre_layout_module`
--
ALTER TABLE `pre_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Indexes for table `pre_layout_route`
--
ALTER TABLE `pre_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Indexes for table `pre_length_class`
--
ALTER TABLE `pre_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Indexes for table `pre_length_class_description`
--
ALTER TABLE `pre_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Indexes for table `pre_location`
--
ALTER TABLE `pre_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `pre_manufacturer`
--
ALTER TABLE `pre_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `pre_manufacturer_to_store`
--
ALTER TABLE `pre_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Indexes for table `pre_marketing`
--
ALTER TABLE `pre_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Indexes for table `pre_megamenu`
--
ALTER TABLE `pre_megamenu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_megamenu_options`
--
ALTER TABLE `pre_megamenu_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_menu`
--
ALTER TABLE `pre_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `pre_menu_group`
--
ALTER TABLE `pre_menu_group`
  ADD PRIMARY KEY (`menu_group_id`,`menu_id`);

--
-- Indexes for table `pre_menu_group_description`
--
ALTER TABLE `pre_menu_group_description`
  ADD PRIMARY KEY (`menu_group_id`,`language_id`);

--
-- Indexes for table `pre_modification`
--
ALTER TABLE `pre_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Indexes for table `pre_module`
--
ALTER TABLE `pre_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `pre_navigation`
--
ALTER TABLE `pre_navigation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_option`
--
ALTER TABLE `pre_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `pre_option_description`
--
ALTER TABLE `pre_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Indexes for table `pre_option_value`
--
ALTER TABLE `pre_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Indexes for table `pre_option_value_description`
--
ALTER TABLE `pre_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Indexes for table `pre_order`
--
ALTER TABLE `pre_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pre_order_custom_field`
--
ALTER TABLE `pre_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Indexes for table `pre_order_history`
--
ALTER TABLE `pre_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Indexes for table `pre_order_option`
--
ALTER TABLE `pre_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Indexes for table `pre_order_product`
--
ALTER TABLE `pre_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Indexes for table `pre_order_recurring`
--
ALTER TABLE `pre_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Indexes for table `pre_order_recurring_transaction`
--
ALTER TABLE `pre_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Indexes for table `pre_order_status`
--
ALTER TABLE `pre_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Indexes for table `pre_order_total`
--
ALTER TABLE `pre_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `pre_order_voucher`
--
ALTER TABLE `pre_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Indexes for table `pre_page`
--
ALTER TABLE `pre_page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `pre_post`
--
ALTER TABLE `pre_post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `pre_post_description`
--
ALTER TABLE `pre_post_description`
  ADD PRIMARY KEY (`post_description_id`);

--
-- Indexes for table `pre_post_image`
--
ALTER TABLE `pre_post_image`
  ADD PRIMARY KEY (`post_image_id`);

--
-- Indexes for table `pre_product`
--
ALTER TABLE `pre_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `pre_product_attribute`
--
ALTER TABLE `pre_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Indexes for table `pre_product_description`
--
ALTER TABLE `pre_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `pre_product_discount`
--
ALTER TABLE `pre_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_product_filter`
--
ALTER TABLE `pre_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Indexes for table `pre_product_image`
--
ALTER TABLE `pre_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_product_option`
--
ALTER TABLE `pre_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Indexes for table `pre_product_option_value`
--
ALTER TABLE `pre_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`),
  ADD KEY `bf_product_option_value` (`product_id`,`option_value_id`);

--
-- Indexes for table `pre_product_recurring`
--
ALTER TABLE `pre_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Indexes for table `pre_product_related`
--
ALTER TABLE `pre_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Indexes for table `pre_product_reward`
--
ALTER TABLE `pre_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Indexes for table `pre_product_special`
--
ALTER TABLE `pre_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_product_to_category`
--
ALTER TABLE `pre_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `pre_product_to_download`
--
ALTER TABLE `pre_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Indexes for table `pre_product_to_layout`
--
ALTER TABLE `pre_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `pre_product_to_store`
--
ALTER TABLE `pre_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Indexes for table `pre_recurring`
--
ALTER TABLE `pre_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Indexes for table `pre_recurring_description`
--
ALTER TABLE `pre_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Indexes for table `pre_return`
--
ALTER TABLE `pre_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `pre_return_action`
--
ALTER TABLE `pre_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Indexes for table `pre_return_history`
--
ALTER TABLE `pre_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Indexes for table `pre_return_reason`
--
ALTER TABLE `pre_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Indexes for table `pre_return_status`
--
ALTER TABLE `pre_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Indexes for table `pre_review`
--
ALTER TABLE `pre_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pre_reviewpost`
--
ALTER TABLE `pre_reviewpost`
  ADD PRIMARY KEY (`reviewpost_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `pre_setting`
--
ALTER TABLE `pre_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `pre_settingpost`
--
ALTER TABLE `pre_settingpost`
  ADD PRIMARY KEY (`settingpost_id`);

--
-- Indexes for table `pre_stock_status`
--
ALTER TABLE `pre_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Indexes for table `pre_store`
--
ALTER TABLE `pre_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `pre_tax_class`
--
ALTER TABLE `pre_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Indexes for table `pre_tax_rate`
--
ALTER TABLE `pre_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Indexes for table `pre_tax_rate_to_customer_group`
--
ALTER TABLE `pre_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Indexes for table `pre_tax_rule`
--
ALTER TABLE `pre_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Indexes for table `pre_tblform`
--
ALTER TABLE `pre_tblform`
  ADD PRIMARY KEY (`formId`);

--
-- Indexes for table `pre_tblformdesc`
--
ALTER TABLE `pre_tblformdesc`
  ADD PRIMARY KEY (`formDescId`);

--
-- Indexes for table `pre_tblformfield`
--
ALTER TABLE `pre_tblformfield`
  ADD PRIMARY KEY (`fieldId`);

--
-- Indexes for table `pre_tblformlang`
--
ALTER TABLE `pre_tblformlang`
  ADD PRIMARY KEY (`formLangId`);

--
-- Indexes for table `pre_tblformrecord`
--
ALTER TABLE `pre_tblformrecord`
  ADD PRIMARY KEY (`recordId`);

--
-- Indexes for table `pre_tblformrecorddata`
--
ALTER TABLE `pre_tblformrecorddata`
  ADD PRIMARY KEY (`recordDataId`);

--
-- Indexes for table `pre_thread`
--
ALTER TABLE `pre_thread`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `pre_thread_description`
--
ALTER TABLE `pre_thread_description`
  ADD PRIMARY KEY (`thread_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `pre_thread_filter`
--
ALTER TABLE `pre_thread_filter`
  ADD PRIMARY KEY (`thread_id`,`filter_id`);

--
-- Indexes for table `pre_thread_path`
--
ALTER TABLE `pre_thread_path`
  ADD PRIMARY KEY (`thread_id`,`path_id`);

--
-- Indexes for table `pre_thread_to_layout`
--
ALTER TABLE `pre_thread_to_layout`
  ADD PRIMARY KEY (`thread_id`,`store_id`);

--
-- Indexes for table `pre_thread_to_store`
--
ALTER TABLE `pre_thread_to_store`
  ADD PRIMARY KEY (`thread_id`,`store_id`);

--
-- Indexes for table `pre_upload`
--
ALTER TABLE `pre_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Indexes for table `pre_url_alias`
--
ALTER TABLE `pre_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Indexes for table `pre_user`
--
ALTER TABLE `pre_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `pre_user_group`
--
ALTER TABLE `pre_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Indexes for table `pre_user_to_thread`
--
ALTER TABLE `pre_user_to_thread`
  ADD PRIMARY KEY (`user_id`,`thread_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `pre_visitor_counter`
--
ALTER TABLE `pre_visitor_counter`
  ADD PRIMARY KEY (`ip`,`dt`);

--
-- Indexes for table `pre_voucher`
--
ALTER TABLE `pre_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Indexes for table `pre_voucher_history`
--
ALTER TABLE `pre_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Indexes for table `pre_voucher_theme`
--
ALTER TABLE `pre_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Indexes for table `pre_voucher_theme_description`
--
ALTER TABLE `pre_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Indexes for table `pre_weight_class`
--
ALTER TABLE `pre_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Indexes for table `pre_weight_class_description`
--
ALTER TABLE `pre_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Indexes for table `pre_zone`
--
ALTER TABLE `pre_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `pre_zone_to_geo_zone`
--
ALTER TABLE `pre_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pre_address`
--
ALTER TABLE `pre_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_affiliate`
--
ALTER TABLE `pre_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_affiliate_activity`
--
ALTER TABLE `pre_affiliate_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_affiliate_login`
--
ALTER TABLE `pre_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_affiliate_transaction`
--
ALTER TABLE `pre_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_api`
--
ALTER TABLE `pre_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pre_api_ip`
--
ALTER TABLE `pre_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pre_api_session`
--
ALTER TABLE `pre_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `pre_attribute`
--
ALTER TABLE `pre_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pre_attribute_group`
--
ALTER TABLE `pre_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_banner`
--
ALTER TABLE `pre_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pre_banner_image`
--
ALTER TABLE `pre_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `pre_bf_attribute_value`
--
ALTER TABLE `pre_bf_attribute_value`
  MODIFY `attribute_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_bf_tax_rate`
--
ALTER TABLE `pre_bf_tax_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_block`
--
ALTER TABLE `pre_block`
  MODIFY `block_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pre_cart`
--
ALTER TABLE `pre_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pre_category`
--
ALTER TABLE `pre_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `pre_country`
--
ALTER TABLE `pre_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- AUTO_INCREMENT for table `pre_coupon`
--
ALTER TABLE `pre_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_coupon_history`
--
ALTER TABLE `pre_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_coupon_product`
--
ALTER TABLE `pre_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_currency`
--
ALTER TABLE `pre_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pre_customer`
--
ALTER TABLE `pre_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_customer_activity`
--
ALTER TABLE `pre_customer_activity`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `pre_customer_group`
--
ALTER TABLE `pre_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_customer_history`
--
ALTER TABLE `pre_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_customer_ip`
--
ALTER TABLE `pre_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pre_customer_login`
--
ALTER TABLE `pre_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pre_customer_reward`
--
ALTER TABLE `pre_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_customer_transaction`
--
ALTER TABLE `pre_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_custom_field`
--
ALTER TABLE `pre_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_custom_field_value`
--
ALTER TABLE `pre_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_download`
--
ALTER TABLE `pre_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_downloadpost`
--
ALTER TABLE `pre_downloadpost`
  MODIFY `downloadpost_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_dqc_setting`
--
ALTER TABLE `pre_dqc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_dqc_statistic`
--
ALTER TABLE `pre_dqc_statistic`
  MODIFY `statistic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `pre_email_subscribed`
--
ALTER TABLE `pre_email_subscribed`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_event`
--
ALTER TABLE `pre_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pre_extension`
--
ALTER TABLE `pre_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `pre_extra_info`
--
ALTER TABLE `pre_extra_info`
  MODIFY `extra_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_filter`
--
ALTER TABLE `pre_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `pre_filter_group`
--
ALTER TABLE `pre_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pre_geo_zone`
--
ALTER TABLE `pre_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pre_information`
--
ALTER TABLE `pre_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pre_language`
--
ALTER TABLE `pre_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pre_layout`
--
ALTER TABLE `pre_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pre_layout_module`
--
ALTER TABLE `pre_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT for table `pre_layout_route`
--
ALTER TABLE `pre_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `pre_length_class`
--
ALTER TABLE `pre_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_length_class_description`
--
ALTER TABLE `pre_length_class_description`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_location`
--
ALTER TABLE `pre_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_manufacturer`
--
ALTER TABLE `pre_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pre_marketing`
--
ALTER TABLE `pre_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_megamenu`
--
ALTER TABLE `pre_megamenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `pre_megamenu_options`
--
ALTER TABLE `pre_megamenu_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pre_menu`
--
ALTER TABLE `pre_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_menu_group`
--
ALTER TABLE `pre_menu_group`
  MODIFY `menu_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `pre_modification`
--
ALTER TABLE `pre_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pre_module`
--
ALTER TABLE `pre_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `pre_navigation`
--
ALTER TABLE `pre_navigation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_option`
--
ALTER TABLE `pre_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pre_option_value`
--
ALTER TABLE `pre_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `pre_order`
--
ALTER TABLE `pre_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `pre_order_custom_field`
--
ALTER TABLE `pre_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_order_history`
--
ALTER TABLE `pre_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `pre_order_option`
--
ALTER TABLE `pre_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `pre_order_product`
--
ALTER TABLE `pre_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=610;

--
-- AUTO_INCREMENT for table `pre_order_recurring`
--
ALTER TABLE `pre_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_order_recurring_transaction`
--
ALTER TABLE `pre_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_order_status`
--
ALTER TABLE `pre_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pre_order_total`
--
ALTER TABLE `pre_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1483;

--
-- AUTO_INCREMENT for table `pre_order_voucher`
--
ALTER TABLE `pre_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_page`
--
ALTER TABLE `pre_page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_post`
--
ALTER TABLE `pre_post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_post_description`
--
ALTER TABLE `pre_post_description`
  MODIFY `post_description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `pre_post_image`
--
ALTER TABLE `pre_post_image`
  MODIFY `post_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `pre_product`
--
ALTER TABLE `pre_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `pre_product_discount`
--
ALTER TABLE `pre_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- AUTO_INCREMENT for table `pre_product_image`
--
ALTER TABLE `pre_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3044;

--
-- AUTO_INCREMENT for table `pre_product_option`
--
ALTER TABLE `pre_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `pre_product_option_value`
--
ALTER TABLE `pre_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pre_product_reward`
--
ALTER TABLE `pre_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `pre_product_special`
--
ALTER TABLE `pre_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=591;

--
-- AUTO_INCREMENT for table `pre_recurring`
--
ALTER TABLE `pre_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_return`
--
ALTER TABLE `pre_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_return_action`
--
ALTER TABLE `pre_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_return_history`
--
ALTER TABLE `pre_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_return_reason`
--
ALTER TABLE `pre_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pre_return_status`
--
ALTER TABLE `pre_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pre_review`
--
ALTER TABLE `pre_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pre_reviewpost`
--
ALTER TABLE `pre_reviewpost`
  MODIFY `reviewpost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pre_setting`
--
ALTER TABLE `pre_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40254;

--
-- AUTO_INCREMENT for table `pre_settingpost`
--
ALTER TABLE `pre_settingpost`
  MODIFY `settingpost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `pre_stock_status`
--
ALTER TABLE `pre_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pre_store`
--
ALTER TABLE `pre_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_tax_class`
--
ALTER TABLE `pre_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pre_tax_rate`
--
ALTER TABLE `pre_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `pre_tax_rule`
--
ALTER TABLE `pre_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `pre_tblform`
--
ALTER TABLE `pre_tblform`
  MODIFY `formId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pre_tblformdesc`
--
ALTER TABLE `pre_tblformdesc`
  MODIFY `formDescId` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pre_tblformfield`
--
ALTER TABLE `pre_tblformfield`
  MODIFY `fieldId` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pre_tblformlang`
--
ALTER TABLE `pre_tblformlang`
  MODIFY `formLangId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pre_tblformrecord`
--
ALTER TABLE `pre_tblformrecord`
  MODIFY `recordId` bigint(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pre_tblformrecorddata`
--
ALTER TABLE `pre_tblformrecorddata`
  MODIFY `recordDataId` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pre_thread`
--
ALTER TABLE `pre_thread`
  MODIFY `thread_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pre_upload`
--
ALTER TABLE `pre_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pre_url_alias`
--
ALTER TABLE `pre_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1449;

--
-- AUTO_INCREMENT for table `pre_user`
--
ALTER TABLE `pre_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_user_group`
--
ALTER TABLE `pre_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pre_voucher`
--
ALTER TABLE `pre_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_voucher_history`
--
ALTER TABLE `pre_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pre_voucher_theme`
--
ALTER TABLE `pre_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pre_weight_class`
--
ALTER TABLE `pre_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_weight_class_description`
--
ALTER TABLE `pre_weight_class_description`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pre_zone`
--
ALTER TABLE `pre_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4919;

--
-- AUTO_INCREMENT for table `pre_zone_to_geo_zone`
--
ALTER TABLE `pre_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
