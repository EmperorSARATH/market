-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2020 at 02:22 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `market_basket`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add bill', 7, 'add_bill'),
(26, 'Can change bill', 7, 'change_bill'),
(27, 'Can delete bill', 7, 'delete_bill'),
(28, 'Can view bill', 7, 'view_bill'),
(29, 'Can add category', 8, 'add_category'),
(30, 'Can change category', 8, 'change_category'),
(31, 'Can delete category', 8, 'delete_category'),
(32, 'Can view category', 8, 'view_category'),
(33, 'Can add company', 9, 'add_company'),
(34, 'Can change company', 9, 'change_company'),
(35, 'Can delete company', 9, 'delete_company'),
(36, 'Can view company', 9, 'view_company'),
(37, 'Can add product', 10, 'add_product'),
(38, 'Can change product', 10, 'change_product'),
(39, 'Can delete product', 10, 'delete_product'),
(40, 'Can view product', 10, 'view_product'),
(41, 'Can add customer', 11, 'add_customer'),
(42, 'Can change customer', 11, 'change_customer'),
(43, 'Can delete customer', 11, 'delete_customer'),
(44, 'Can view customer', 11, 'view_customer'),
(45, 'Can add cart', 12, 'add_cart'),
(46, 'Can change cart', 12, 'change_cart'),
(47, 'Can delete cart', 12, 'delete_cart'),
(48, 'Can view cart', 12, 'view_cart'),
(49, 'Can add wish list', 13, 'add_wishlist'),
(50, 'Can change wish list', 13, 'change_wishlist'),
(51, 'Can delete wish list', 13, 'delete_wishlist'),
(52, 'Can view wish list', 13, 'view_wishlist');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '123', '2019-12-06 15:54:28.318359', 1, 'admin', '', 'Admin', '', 1, 1, '2019-12-06 15:21:25.172265'),
(10, '123', '2020-01-06 03:57:01.742308', 0, 'abc@gmail.com', '', 'Company', '', 0, 1, '2019-12-06 15:53:50.388040'),
(11, '123', '2020-02-23 12:23:27.421351', 0, 'rashila@gmail.com', '', 'Customer', '', 0, 1, '0000-00-00 00:00:00.000000'),
(12, '123', '2020-01-31 05:18:45.300946', 0, 'c1@gmail.com', '', 'Customer', '', 0, 1, '2020-01-29 16:16:02.350809');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'myapp', 'bill'),
(12, 'myapp', 'cart'),
(8, 'myapp', 'category'),
(9, 'myapp', 'company'),
(11, 'myapp', 'customer'),
(10, 'myapp', 'product'),
(13, 'myapp', 'wishlist'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-11-30 09:55:30.482116'),
(2, 'auth', '0001_initial', '2019-11-30 09:55:31.963671'),
(3, 'admin', '0001_initial', '2019-11-30 09:55:39.756206'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-11-30 09:55:42.420176'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-11-30 09:55:42.472014'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-11-30 09:55:43.258010'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-11-30 09:55:44.519992'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-11-30 09:55:44.702481'),
(9, 'auth', '0004_alter_user_username_opts', '2019-11-30 09:55:44.783292'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-11-30 09:55:45.472416'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-11-30 09:55:45.513305'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-11-30 09:55:45.571192'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-11-30 09:55:45.709819'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-11-30 09:55:45.835461'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-11-30 09:55:45.966091'),
(16, 'auth', '0011_update_proxy_permissions', '2019-11-30 09:55:46.018981'),
(17, 'myapp', '0001_initial', '2019-11-30 09:55:48.735001'),
(18, 'sessions', '0001_initial', '2019-11-30 09:55:57.956935'),
(19, 'myapp', '0002_auto_20191130_1634', '2019-11-30 11:05:00.071679'),
(20, 'myapp', '0003_auto_20191130_1638', '2019-11-30 11:09:30.313902'),
(21, 'myapp', '0004_auto_20191206_2055', '2019-12-06 15:25:30.148223'),
(22, 'myapp', '0005_auto_20191206_2106', '2019-12-06 15:36:45.023981'),
(23, 'myapp', '0002_auto_20191224_2120', '2019-12-24 15:50:35.379243'),
(24, 'myapp', '0003_auto_20191224_2121', '2020-01-29 16:09:25.021342'),
(25, 'myapp', '0004_auto_20191224_2122', '2020-01-29 16:09:25.107426'),
(26, 'myapp', '0005_auto_20200116_0830', '2020-01-29 16:09:26.793063'),
(27, 'myapp', '0006_auto_20200116_1259', '2020-01-29 16:09:28.405346'),
(28, 'myapp', '0007_auto_20200116_1303', '2020-01-29 16:09:29.953316'),
(29, 'myapp', '0008_auto_20200129_2139', '2020-01-29 16:09:30.544989'),
(30, 'myapp', '0009_auto_20200130_0841', '2020-01-30 03:11:16.323968');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0y5iyrjmuedz2qjjk2v19935b5o3yryc', 'MjlhNWFkN2EzOTUzNzc1NjdkNzIwZGNmOTVmMjhlNDFkNjI5MzRlMzp7Im1lbV9pZCI6MTEsIl9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSIsImNhcnRJdGVtcyI6MX0=', '2020-02-29 09:55:06.098661'),
('47w8w8s2xjb829u58ql680ua7lqn9i28', 'MTlkMjFiODQ3ZjEwNzBhNzJiYTM2ZTc1ZmIwMjE0ZGM2ZTZhNGUyOTp7Im1lbV9pZCI6MTEsIl9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSIsImNhcnRJdGVtcyI6Mn0=', '2020-03-08 12:25:20.346335'),
('5sme4ldvcdkptlih57g0arxrhu2p96fm', 'ZjM2ZWU4NGM3NTA3M2EwODg5NWZjNGIxMjgzNzE2ZWQ1OGRiZjA4NDp7Im1lbV9pZCI6MTB9', '2019-12-29 14:20:45.256131'),
('666vu2sg9892hsaydlwstli29jvzgymf', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-01-20 03:57:01.956622'),
('9dz2ytitj4oq1h06uegu86047d5x2ina', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2019-12-30 03:35:39.234739'),
('avg2c21kx1ri3qzic6feb50ajfx0dzk0', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-01-10 03:36:43.525191'),
('c24g9eom78dd56r8bk5aoykjqq2h32wp', 'ZjM2ZWU4NGM3NTA3M2EwODg5NWZjNGIxMjgzNzE2ZWQ1OGRiZjA4NDp7Im1lbV9pZCI6MTB9', '2019-12-29 14:20:32.295992'),
('heptx6o6owq03zz8uxvz1alisjx8skmz', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-01-19 07:47:26.036930'),
('jhjf18kjx3gx5qlg0iv53x2k6anx1tz5', 'MWVlN2MwNzUxOGU3ZjYwZThjYTcyNzliYmU2ODUxODM5NWZhNTRlOTp7fQ==', '2019-12-29 04:10:45.495528'),
('lfs21imp9b8ivto8o8ubb0dod44pyye8', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-01-08 11:00:17.487547'),
('qpd7v6uajjshfylajlothe2ufqzc7xnb', 'YmNmODA0MDdjMGIxNzRkZDI4ODI0MDkwYjU2OTE3ZGE1ZTU5N2RjMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiNjQ3N2QwNDM0YTc4YmQ5MzU3ZGVjMjcwMGUwYTI3MDJlMjQ3NjM2In0=', '2019-12-20 15:54:28.385022'),
('sgzcsqad8pu9c095pkw5q6fyh4r2w0ij', 'NGQ0YjE5ZjdjNjU1ZDk3ZGM1NzRjYTAwODY4N2QxMmY4NjZhN2U0OTp7Im1lbV9pZCI6MTEsIl9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSIsImNhcnRJdGVtcyI6NH0=', '2020-02-17 03:10:02.187630'),
('tg0b42ajisuyl2pqusekcx49keayno0b', 'ZjRiN2EyYmU4MzNiODQ4MjgxMDZmZDUxNWM1Zjg5YjZkZTYxOWI3OTp7Im1lbV9pZCI6MTAsIl9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-01-09 05:20:29.878458'),
('wowgi35qpzbwf77gu6kf9yn9s6uq4o7u', 'MjlhNWFkN2EzOTUzNzc1NjdkNzIwZGNmOTVmMjhlNDFkNjI5MzRlMzp7Im1lbV9pZCI6MTEsIl9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSIsImNhcnRJdGVtcyI6MX0=', '2020-03-04 12:01:49.358926'),
('zox3gdvil232twz54f1sl2zwj4b15qbt', 'NGE5MmM0ODVjYWVhYjc3MGFhNDQ3ZDEzZmYxNjA1ZDI2Nzk3NmZiYzp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWQwMWQ2MmY0OTBjMzdmZDk0MTQyYzE0NzFhYTI4MTZmNWQ5NjIyMSJ9', '2020-02-14 05:18:45.445810');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_bill`
--

CREATE TABLE `myapp_bill` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `customer_id_id` int(11) NOT NULL,
  `phoneNo` int(11) DEFAULT NULL,
  `shippingAddress` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_bill`
--

INSERT INTO `myapp_bill` (`id`, `date`, `amount`, `payment_type`, `customer_id_id`, `phoneNo`, `shippingAddress`) VALUES
(2, '2020-02-23', 600, 'Cash on Delivery', 1, 2147483647, 'Rashila Rasheed, India, Street, Appartment, City, 678678');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_cart`
--

CREATE TABLE `myapp_cart` (
  `id` int(11) NOT NULL,
  `bill_id_id` int(11) DEFAULT NULL,
  `customer_id_id` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_cart`
--

INSERT INTO `myapp_cart` (`id`, `bill_id_id`, `customer_id_id`, `product_id_id`, `company_id`, `qty`) VALUES
(1, NULL, 2, 1, 1, 5),
(2, 2, 1, 1, 1, 4),
(3, 2, 1, 11, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_category`
--

CREATE TABLE `myapp_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_category`
--

INSERT INTO `myapp_category` (`id`, `category_name`) VALUES
(1, 'item'),
(2, 'Grocery'),
(3, 'Mobiles and Accessories'),
(4, 'Clothes'),
(5, 'Foot Wears');

-- --------------------------------------------------------

--
-- Table structure for table `myapp_company`
--

CREATE TABLE `myapp_company` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `pincode` int(11) NOT NULL,
  `gst_no` int(11) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_company`
--

INSERT INTO `myapp_company` (`id`, `name`, `contact_no`, `pincode`, `gst_no`, `user_id_id`) VALUES
(1, 'ABC', 2147483647, 678678, 667, 10);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_customer`
--

CREATE TABLE `myapp_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ph_no` bigint(20) NOT NULL,
  `pincode` int(11) NOT NULL,
  `address` varchar(500) NOT NULL,
  `user_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_customer`
--

INSERT INTO `myapp_customer` (`id`, `name`, `ph_no`, `pincode`, `address`, `user_id_id`) VALUES
(1, 'Rashila', 989, 678, 'gfcgf', 11),
(2, 'customer 1', 78787878, 678678, 'address of Customer 1', 12);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_product`
--

CREATE TABLE `myapp_product` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `offer` int(11) NOT NULL,
  `offer_price` double NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `category_id_id` int(11) NOT NULL,
  `company_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_product`
--

INSERT INTO `myapp_product` (`id`, `name`, `price`, `quantity`, `offer`, `offer_price`, `img`, `description`, `category_id_id`, `company_id_id`) VALUES
(1, 'I1', 25, 12, 0, 0, 'media/category-2.jpg', '', 1, 1),
(2, 'I2', 67, 9, 0, 0, 'media/category-2.jpg', '', 1, 1),
(3, 'I3', 98, 4, 10, 0, 'media/category-2.jpg', '', 1, 1),
(5, 'I4', 67, 4, 0, 0, 'media/category-2.jpg', '', 1, 1),
(6, 'I5', 45, 4, 0, 0, 'media/category-2.jpg', '', 1, 1),
(7, 'I6', 34, 7, 0, 0, 'media/category-2.jpg', '', 1, 1),
(8, 'I7', 98, 3, 0, 0, 'media/category-2.jpg', '', 1, 1),
(9, 'I8', 56, 7, 0, 0, 'media/category-2.jpg', '', 1, 1),
(10, 'I9', 98, 4, 0, 0, 'media/category-2.jpg', '', 1, 1),
(11, 'Product 1', 250, 10, 0, 0, 'media/category_VTQKVDP.jpg', '', 1, 1),
(12, 'Product 2', 300, 5, 0, 0, 'media/category-2.jpg', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `myapp_wishlist`
--

CREATE TABLE `myapp_wishlist` (
  `id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `myapp_wishlist`
--

INSERT INTO `myapp_wishlist` (`id`, `cust_id`, `product_id`) VALUES
(1, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(20) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `date`) VALUES
(1, 'gpu', 8500, '1999-03-29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `myapp_bill`
--
ALTER TABLE `myapp_bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_bill_customer_id_id_eaeacc23_fk_myapp_customer_id` (`customer_id_id`);

--
-- Indexes for table `myapp_cart`
--
ALTER TABLE `myapp_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_cart_bill_id_id_5127ee78_fk_myapp_bill_id` (`bill_id_id`),
  ADD KEY `myapp_cart_customer_id_id_257a3411_fk_myapp_customer_id` (`customer_id_id`),
  ADD KEY `myapp_cart_product_id_id_68bd7aae_fk_myapp_product_id` (`product_id_id`),
  ADD KEY `myapp_cart_company_id_73b268ea_fk_myapp_company_id` (`company_id`);

--
-- Indexes for table `myapp_category`
--
ALTER TABLE `myapp_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `myapp_company`
--
ALTER TABLE `myapp_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pincode` (`pincode`),
  ADD UNIQUE KEY `gst_no` (`gst_no`),
  ADD KEY `myapp_company_user_id_b3d04a51_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `myapp_customer`
--
ALTER TABLE `myapp_customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_customer_user_id_id_55011c4f_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `myapp_product`
--
ALTER TABLE `myapp_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_product_category_id_id_3a558605_fk_myapp_category_id` (`category_id_id`),
  ADD KEY `myapp_product_company_id_id_02ee2b22_fk_myapp_company_id` (`company_id_id`);

--
-- Indexes for table `myapp_wishlist`
--
ALTER TABLE `myapp_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `myapp_wishlist_cust_id_f1097e39_fk_myapp_customer_id` (`cust_id`),
  ADD KEY `myapp_wishlist_product_id_85e36668_fk_myapp_product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `myapp_bill`
--
ALTER TABLE `myapp_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_cart`
--
ALTER TABLE `myapp_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `myapp_category`
--
ALTER TABLE `myapp_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `myapp_company`
--
ALTER TABLE `myapp_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `myapp_customer`
--
ALTER TABLE `myapp_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `myapp_product`
--
ALTER TABLE `myapp_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `myapp_wishlist`
--
ALTER TABLE `myapp_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `myapp_bill`
--
ALTER TABLE `myapp_bill`
  ADD CONSTRAINT `myapp_bill_customer_id_id_eaeacc23_fk_myapp_customer_id` FOREIGN KEY (`customer_id_id`) REFERENCES `myapp_customer` (`id`);

--
-- Constraints for table `myapp_cart`
--
ALTER TABLE `myapp_cart`
  ADD CONSTRAINT `myapp_cart_company_id_73b268ea_fk_myapp_company_id` FOREIGN KEY (`company_id`) REFERENCES `myapp_company` (`id`),
  ADD CONSTRAINT `myapp_cart_customer_id_id_257a3411_fk_myapp_customer_id` FOREIGN KEY (`customer_id_id`) REFERENCES `myapp_customer` (`id`),
  ADD CONSTRAINT `myapp_cart_product_id_id_68bd7aae_fk_myapp_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `myapp_product` (`id`);

--
-- Constraints for table `myapp_company`
--
ALTER TABLE `myapp_company`
  ADD CONSTRAINT `myapp_company_user_id_id_3d7fe422_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `myapp_customer`
--
ALTER TABLE `myapp_customer`
  ADD CONSTRAINT `myapp_customer_user_id_id_55011c4f_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `myapp_product`
--
ALTER TABLE `myapp_product`
  ADD CONSTRAINT `myapp_product_category_id_id_3a558605_fk_myapp_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `myapp_category` (`id`),
  ADD CONSTRAINT `myapp_product_company_id_id_02ee2b22_fk_myapp_company_id` FOREIGN KEY (`company_id_id`) REFERENCES `myapp_company` (`id`);

--
-- Constraints for table `myapp_wishlist`
--
ALTER TABLE `myapp_wishlist`
  ADD CONSTRAINT `myapp_wishlist_cust_id_f1097e39_fk_myapp_customer_id` FOREIGN KEY (`cust_id`) REFERENCES `myapp_customer` (`id`),
  ADD CONSTRAINT `myapp_wishlist_product_id_85e36668_fk_myapp_product_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
