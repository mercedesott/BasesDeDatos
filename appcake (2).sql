-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 06, 2013 at 08:49 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `appcake`
--

-- --------------------------------------------------------

--
-- Table structure for table `aisles`
--

CREATE TABLE IF NOT EXISTS `aisles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `aisles`
--

INSERT INTO `aisles` (`id`, `description`) VALUES
(1, '1A'),
(2, '1B'),
(3, '1C'),
(4, '2A'),
(5, '2B'),
(6, '2C');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `number`, `product_id`) VALUES
(1, 2147483647, 1);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE IF NOT EXISTS `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`) VALUES
(1, 'Montevideo Shopping');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'Milka'),
(2, 'Coca Cola'),
(3, 'Pepsi'),
(4, 'Lays'),
(5, 'Pringles');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(80) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Sucursal_idSucursal` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `emails`
--


-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `link`) VALUES
(1, '/product_images/VM225130-1.jpg'),
(2, '/product_images/VM218058-1.jpg'),
(3, '/product_images/VM065576-1.jpg'),
(4, '/product_images/VM202965-1.jpg'),
(5, '/product_images/VM264210-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `shelf_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `aisle_id` int(11) NOT NULL,
  `address` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `alive` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Posicion_idPosicion` (`position_id`,`shelf_id`,`product_id`,`aisle_id`),
  KEY `shelf_id` (`shelf_id`),
  KEY `product_id` (`product_id`),
  KEY `aisle_id` (`aisle_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `position_id`, `shelf_id`, `product_id`, `aisle_id`, `address`, `number`, `alive`) VALUES
(1, 1, 1, 3, 1, 'AB45YU', 667786, 0),
(2, 2, 3, 3, 4, 'AB46MY', 569697, 0);

-- --------------------------------------------------------

--
-- Table structure for table `measures`
--

CREATE TABLE IF NOT EXISTS `measures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `measures`
--

INSERT INTO `measures` (`id`, `type`) VALUES
(1, 'Gramos'),
(2, 'Kilogramos'),
(3, 'Litros');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE IF NOT EXISTS `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `description`) VALUES
(1, 'Derecha'),
(2, 'Izquierda'),
(3, 'Centro');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `measure_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `number` int(11) NOT NULL COMMENT 'numero de caja',
  `quantity` double NOT NULL COMMENT 'cantidad para la medida',
  `description` varchar(100) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Medida_idMedida` (`measure_id`,`brand_id`,`image_id`),
  KEY `brand_id` (`brand_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `measure_id`, `brand_id`, `image_id`, `name`, `number`, `quantity`, `description`, `featured`, `price`) VALUES
(1, 1, 1, 1, 'Milka Caramel', 225130, 100, 'Chocolate Milka Caramel', 0, 60),
(2, 3, 2, 2, 'Coca Cola Zero', 218058, 1.5, 'Coca Cola Zero 1.5L', 0, 60),
(3, 3, 3, 3, 'Pepsi Cola', 65576, 1.5, 'Pepsi Cola Descartable 1.5L', 0, 54),
(4, 1, 4, 4, 'Papas Fritas Lays', 202965, 440, 'Papas Fritas Lays Clasicas 440gr', 0, 119),
(5, 1, 5, 5, 'Papas Pringles Cream & Onions', 264210, 181, 'Papas Pringles Cream & Onions', 0, 69);

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `start_time` time NOT NULL,
  `finish_time` time NOT NULL,
  `description` varchar(20) NOT NULL,
  `new_price` double NOT NULL,
  `old_price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Producto_idProducto` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `product_id`, `active`, `start_date`, `finish_date`, `start_time`, `finish_time`, `description`, `new_price`, `old_price`) VALUES
(1, 1, 0, '2013-01-07', '2013-01-07', '20:15:00', '21:15:00', '50% off', 30, 60),
(2, 3, 0, '2013-01-09', '2013-01-09', '22:05:00', '23:05:00', 'Descuento', 50, 54),
(3, 3, 0, '2013-01-10', '2013-01-10', '08:11:00', '11:11:00', 'Descuento', 50, 54),
(4, 2, 0, '2013-01-25', '2013-01-25', '02:05:00', '02:05:00', '20% off', 48, 60),
(5, 4, 0, '2013-02-11', '2013-02-12', '02:06:00', '02:06:00', '20% off', 95, 119),
(6, 2, 0, '2013-02-19', '2013-02-19', '07:07:00', '08:07:00', '20 off', 48, 60),
(7, 5, 0, '2013-01-28', '2013-01-28', '09:08:00', '10:08:00', '20 off', 55, 69),
(8, 5, 0, '2013-01-25', '2013-01-25', '02:09:00', '02:09:00', '20% off', 55, 69),
(9, 5, 0, '2013-01-30', '2013-01-30', '00:09:00', '13:09:00', '20% off', 55, 69),
(10, 1, 0, '2013-03-13', '2013-03-13', '10:11:00', '11:11:00', '50% off', 30, 60),
(11, 1, 0, '2013-02-10', '2013-02-10', '09:11:00', '10:11:00', '50% off', 30, 60),
(12, 3, 0, '2013-02-18', '2013-02-18', '10:35:00', '11:35:00', '50% off', 27, 54),
(13, 3, 0, '2013-01-25', '2013-01-25', '11:36:00', '00:36:00', '50% off', 27, 54),
(14, 4, 0, '2013-04-21', '2013-04-21', '11:36:00', '00:36:00', '50% off', 60, 119),
(15, 4, 0, '2013-03-11', '2013-03-11', '09:37:00', '10:37:00', '50% off', 119, 60),
(16, 5, 0, '2013-02-17', '2013-02-17', '00:39:00', '13:39:00', '50% off', 35, 69),
(17, 5, 0, '2013-07-25', '2013-07-25', '09:39:00', '10:39:00', '50% off', 35, 69),
(18, 5, 0, '2013-06-25', '2013-06-25', '02:40:00', '02:40:00', '50% off', 35, 69),
(19, 1, 0, '2013-04-25', '2013-04-25', '02:40:00', '02:40:00', '50% off', 30, 60),
(20, 1, 0, '2013-07-25', '2013-07-25', '02:40:00', '02:40:00', '50% off', 30, 60),
(21, 1, 0, '2013-07-19', '2013-07-19', '02:40:00', '02:40:00', '50% off', 30, 60),
(22, 5, 1, '2013-08-25', '2013-08-25', '02:41:00', '07:41:00', '50% off', 35, 69),
(23, 1, 1, '2013-01-27', '2013-01-27', '16:32:00', '16:32:00', '50% off', 30, 60);

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

CREATE TABLE IF NOT EXISTS `shelves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `shelves`
--

INSERT INTO `shelves` (`id`, `description`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero'),
(4, 'Cuarto');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_id` int(11) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` char(100) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_type_id` (`user_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `username`, `password`, `active`) VALUES
(2, 1, 'admin', '891226c92695035081bedb06ec4def6cb91eb0e9', 1),
(3, 2, 'compras', 'e440fbbf06607832749a6c37b8f23bd888b35f1b', 1),
(4, 3, 'marketing', 'e7fa73e27af6de6f8d7b456b474d8f317f29bd68', 1),
(5, 4, 'reponedor', '4ab55ebea3188a0c7ad6b3ef36c32f853382d429', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`) VALUES
(1, 'Administrador'),
(2, 'Encargado de compras'),
(3, 'Encargado de marketing'),
(4, 'Reponedor');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`);

--
-- Constraints for table `labels`
--
ALTER TABLE `labels`
  ADD CONSTRAINT `labels_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  ADD CONSTRAINT `labels_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `shelves` (`id`),
  ADD CONSTRAINT `labels_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `labels_ibfk_4` FOREIGN KEY (`aisle_id`) REFERENCES `aisles` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);

--
-- Constraints for table `promotions`
--
ALTER TABLE `promotions`
  ADD CONSTRAINT `promotions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
