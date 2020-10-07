-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2020 at 06:56 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id_restaurant` int(11) NOT NULL,
  `name` varchar(246) CHARACTER SET utf8 NOT NULL,
  `address` varchar(246) CHARACTER SET utf8 NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `kind_food` set('Mexicano','Vegetariano','Mediterraneo','Fast-Food') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id_restaurant`, `name`, `address`, `lat`, `lng`, `kind_food`) VALUES
(1, 'Bar Centro - Burgers & Craft Beer', 'Carrer de Casp, 55, 08010 Barcelona', 41.39288, 2.17522, 'Fast-Food'),
(2, 'La Vespa Burger bar', 'Carrer del Torrent de l\'Olla, 99, 08012 Barcelona', 41.40201, 2.15722, 'Fast-Food'),
(3, 'La Central Hamburguesería Laietana', 'Via Laietana, 45, 08003 Barcelona', 41.3867, 2.17493, 'Fast-Food'),
(4, 'Restaurant Terroir Barcelona', 'Carrer de Palaudȧries, 26, 08004 Barcelona', 41.37279, 2.17207, 'Vegetariano,Mediterraneo'),
(5, 'Quinoa Bar Vegetarià', 'Travessera de Gràcia, 203, 08012 Barcelona', 41.399731, 2.154731, 'Vegetariano,Fast-Food'),
(6, 'Güell Away\r\n', 'Carrer de Larrard, 39, 08024 Barcelona', 41.413207, 2.153667, 'Mexicano,Vegetariano,Mediterraneo,Fast-Food'),
(7, 'Mood Rooftop Bar', 'Carrer de Provença, 277, 08037 Barcelona', 41.396663, 2.162749, 'Vegetariano,Fast-Food'),
(8, 'Restaurant l’Olla', '08012 Barcelona', 41.409643, 2.152176, 'Vegetariano,Mediterraneo'),
(9, 'Restaurant Saó BCN', 'Carrer de Cesare Cantú, 2, 08023 Barcelona', 41.419684, 2.13913, 'Mexicano,Vegetariano,Mediterraneo'),
(10, 'BURRITOS', 'Ronda de Sant Pere, 16, 08010 Barcelona', 41.38941, 2.172288, 'Mexicano,Fast-Food'),
(11, 'Taquería Los Güeros', 'C/ d\'Aragó, 359, 08009 Barcelona', 41.398847, 2.172262, 'Mexicano,Vegetariano,Fast-Food');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id_restaurant`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id_restaurant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
