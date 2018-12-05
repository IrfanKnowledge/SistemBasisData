-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2018 at 02:19 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiket_kereta_api`
--
CREATE DATABASE IF NOT EXISTS `tiket_kereta_api` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tiket_kereta_api`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_phone_number` (IN `no` VARCHAR(20))  NO SQL
BEGIN
    DECLARE panjang_no varchar(20) default "hello world1";
    DECLARE awal_no varchar(20) default "hello world2";
    DECLARE str_int_no varchar(20) default "hello world3";
		DECLARE i int default 1;
    DECLARE kondisi int default 1; /*asumsi data masih benar*/
		
    SET panjang_no = length(no);
    SET awal_no = substring(no, 1, 1);
    SET str_int_no = cast(no AS signed);
		
IF awal_no != '0' THEN 
    	SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Maaf, input nomor harus dimulai nol (0)';
      	/* SELECT 'Maaf, input nomor harus dimulai nol (0)'; */
ELSEIF panjang_no < 7 THEN
		SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'Maaf, batas minimal digit nomor telepon = 7';
        /*SELECT 'Maaf, batas minimal digit nomor telepon = 7'; */
ELSEIF panjang_no > 15 THEN
		SIGNAL SQLSTATE '45002'
            SET MESSAGE_TEXT = 'Maaf, batas maksimal digit nomor HP = 13';
        /*SELECT 'Maaf, batas maksimal digit nomor HP = 15';*/
ELSEIF str_int_no < 100000 THEN
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;

IF panjang_no = 8 && str_int_no < 1000000 THEN /*Digit ke 8, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 9 && str_int_no < 10000000 THEN /*Digit ke 9, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 10 && str_int_no < 100000000 THEN /*Digit ke 10, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 11 && str_int_no < 1000000000 THEN /*Digit ke 11, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 12 && str_int_no < 10000000000 THEN /*Digit ke 12, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 13 && str_int_no < 100000000000 THEN /*Digit ke 13, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/
END IF;
IF panjang_no = 14 && str_int_no < 1000000000000 THEN /*Digit ke 14, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/        
END IF;
IF panjang_no = 15 && str_int_no < 10000000000000 THEN /*Digit ke 14, awal angka nol input tidak dihitung*/
		SIGNAL SQLSTATE '45003'
            SET MESSAGE_TEXT = 'Maaf, no telepon harus menggunakan angka';
        /*SELECT 'Maaf, no telepon harus menggunakan angka';*/        
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `admin`:
--

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `nama`, `username`, `password`) VALUES
(1, 'admin kereta', 'adminkai', 'fe83b9b33b52a13ecfdf296e01620ed9');

-- --------------------------------------------------------

--
-- Table structure for table `anonim`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `anonim` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `anonim`:
--

--
-- Dumping data for table `anonim`
--

INSERT INTO `anonim` (`ID`, `nama`, `email`, `no_tlp`, `tgl_lahir`) VALUES
(1, 'irfan muhammad', 'irfanmuhammad@gmail.com', '089112112321', '1998-07-13'),
(2, 'ahmad maulana', 'ahmadmaulana@gmail.com', '089765432253', '1998-09-01');

--
-- Triggers `anonim`
--
DELIMITER $$
CREATE TRIGGER `anonim_no_tlp_before_insert` BEFORE INSERT ON `anonim` FOR EACH ROW BEGIN
CALL check_phone_number(new.no_tlp);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `anonim_no_tlp_before_update` BEFORE UPDATE ON `anonim` FOR EACH ROW BEGIN
CALL check_phone_number(new.no_tlp);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `customer` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  `cash` mediumint(1) NOT NULL DEFAULT '0',
  `no_tlp` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `customer`:
--

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`ID`, `nama`, `email`, `password`, `cash`, `no_tlp`, `tgl_lahir`, `alamat`) VALUES
(1, 'ridjal zuhri', 'ridjalzuhri@gmail.com', 'bee0f0a44794f513e9f7595bd3fe0e75', 500000, '089656826182', '1998-07-03', 'Kebumen'),
(2, 'Muhammad Furqan', 'mfurqan@gmail.com', '813a1997eeb66cf48a6e9cc27c940fa1', 300000, '081327599014', '1998-03-03', 'Garut');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `customer_no_tlp_before_insert` BEFORE INSERT ON `customer` FOR EACH ROW BEGIN
CALL check_phone_number(new.no_tlp);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `customer_no_tlp_before_update` BEFORE UPDATE ON `customer` FOR EACH ROW BEGIN
CALL check_phone_number(new.no_tlp);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `gerbong`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `gerbong` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_kereta` varchar(50) NOT NULL,
  `no_gerbong` varchar(2) NOT NULL,
  `kelas` enum('Ekonomi','Premium','Bisnis','Eksekutif') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_kd_kereta_gerbong` (`kd_kereta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `gerbong`:
--   `kd_kereta`
--       `kereta` -> `nama`
--

--
-- Dumping data for table `gerbong`
--

INSERT INTO `gerbong` (`ID`, `kd_kereta`, `no_gerbong`, `kelas`) VALUES
(1, 'Malabar 13', '1', 'Eksekutif'),
(2, 'Malabar 13', '2', 'Eksekutif'),
(3, 'Malabar 13', '3', 'Bisnis'),
(4, 'Malabar 13', '4', 'Bisnis'),
(5, 'Malabar 13', '5', 'Ekonomi');

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--
-- Creation: Dec 04, 2018 at 05:12 PM
--

CREATE TABLE IF NOT EXISTS `harga` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_jadwal` int(1) UNSIGNED NOT NULL,
  `kelas` enum('ekonomi','premium','bisnis','eksekutif') NOT NULL,
  `harga_tiket` mediumint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_jadwal_harga` (`id_jadwal`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `harga`:
--   `id_jadwal`
--       `jadwal` -> `ID`
--

--
-- Dumping data for table `harga`
--

INSERT INTO `harga` (`ID`, `id_jadwal`, `kelas`, `harga_tiket`) VALUES
(1, 1, 'eksekutif', 360000),
(2, 2, 'eksekutif', 360000),
(3, 3, 'bisnis', 270000),
(4, 4, 'bisnis', 270000),
(5, 5, 'ekonomi', 160000);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--
-- Creation: Dec 04, 2018 at 05:28 PM
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_kereta` varchar(50) NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `kd_stasiun_keberangkatan` char(5) NOT NULL,
  `kd_stasiun_tujuan` char(5) NOT NULL,
  `waktu_berangkat` time NOT NULL,
  `waktu_tiba` time NOT NULL,
  `status` enum('Tersedia','Penuh') NOT NULL DEFAULT 'Tersedia',
  `harga_tiket` mediumint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_kd_stasiun_keberangkatan_jadwal` (`kd_stasiun_keberangkatan`),
  KEY `fk_kd_stasiun_tujuan_jadwal` (`kd_stasiun_tujuan`),
  KEY `fk_kd_kereta_jadwal` (`kd_kereta`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `jadwal`:
--   `kd_kereta`
--       `kereta` -> `nama`
--   `kd_stasiun_keberangkatan`
--       `stasiun` -> `kd_stasiun`
--   `kd_stasiun_tujuan`
--       `stasiun` -> `kd_stasiun`
--

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`ID`, `kd_kereta`, `tgl_keberangkatan`, `kd_stasiun_keberangkatan`, `kd_stasiun_tujuan`, `waktu_berangkat`, `waktu_tiba`, `status`, `harga_tiket`) VALUES
(1, 'Malabar 13', '2018-12-05', 'ML', 'BD', '16:00:00', '07:48:00', 'Tersedia', 360000),
(2, 'Malabar 13', '2018-12-05', 'ML', 'BD', '16:00:00', '07:48:00', 'Tersedia', 360000),
(3, 'Malabar 13', '2018-12-05', 'ML', 'BD', '16:00:00', '07:48:00', 'Tersedia', 270000),
(4, 'Malabar 13', '2018-12-05', 'ML', 'BD', '16:00:00', '07:48:00', 'Tersedia', 270000),
(5, 'Malabar 13', '2018-12-05', 'ML', 'BD', '16:00:00', '07:48:00', 'Tersedia', 160000);

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `kereta` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `kereta`:
--

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`ID`, `nama`) VALUES
(1, 'Malabar 13');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--
-- Creation: Dec 04, 2018 at 11:39 AM
--

CREATE TABLE IF NOT EXISTS `konfirmasi` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pemesanan` int(1) UNSIGNED NOT NULL,
  `id_admin` int(1) UNSIGNED NOT NULL,
  `status` enum('Menunggu Pembayaran','Menunggu Konfirmasi','Gagal','Berhasil') NOT NULL DEFAULT 'Menunggu Pembayaran',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `fk_id_pemesanan_konfirmasi` (`id_pemesanan`) USING BTREE,
  KEY `fk_id_admin_konfirmasi` (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `konfirmasi`:
--   `id_admin`
--       `admin` -> `ID`
--   `id_pemesanan`
--       `pemesanan` -> `ID`
--

--
-- Dumping data for table `konfirmasi`
--

INSERT INTO `konfirmasi` (`ID`, `id_pemesanan`, `id_admin`, `status`) VALUES
(1, 1, 1, 'Menunggu Pembayaran'),
(2, 2, 1, 'Berhasil');

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `kursi` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gerbong` int(1) UNSIGNED NOT NULL,
  `no_kursi` varchar(3) NOT NULL,
  `status` enum('Terisi','Kosong') NOT NULL DEFAULT 'Kosong',
  PRIMARY KEY (`ID`),
  KEY `fk_id_gerbong_kursi` (`id_gerbong`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `kursi`:
--   `id_gerbong`
--       `gerbong` -> `ID`
--

--
-- Dumping data for table `kursi`
--

INSERT INTO `kursi` (`ID`, `id_gerbong`, `no_kursi`, `status`) VALUES
(225, 1, '3A', 'Kosong'),
(226, 1, '3B', 'Kosong'),
(227, 1, '3C', 'Kosong'),
(228, 1, '3D', 'Kosong'),
(229, 1, '3E', 'Kosong'),
(230, 1, '4A', 'Kosong'),
(231, 1, '4B', 'Kosong'),
(232, 1, '4C', 'Kosong'),
(233, 1, '4D', 'Kosong'),
(234, 1, '4E', 'Kosong'),
(235, 1, '5A', 'Kosong'),
(236, 1, '5B', 'Kosong'),
(237, 1, '5C', 'Kosong'),
(238, 1, '5D', 'Kosong'),
(239, 1, '5E', 'Kosong'),
(240, 1, '6A', 'Kosong'),
(241, 1, '6B', 'Kosong'),
(242, 1, '6C', 'Kosong'),
(243, 1, '6D', 'Kosong'),
(244, 1, '6E', 'Kosong'),
(245, 1, '7A', 'Kosong'),
(246, 1, '7B', 'Kosong'),
(247, 1, '7C', 'Kosong'),
(248, 1, '7D', 'Kosong'),
(249, 1, '7E', 'Kosong'),
(250, 1, '8A', 'Kosong'),
(251, 1, '8B', 'Kosong'),
(252, 1, '8C', 'Kosong'),
(253, 1, '8D', 'Kosong'),
(254, 1, '8E', 'Kosong'),
(255, 1, '9A', 'Kosong'),
(256, 1, '9B', 'Kosong'),
(257, 1, '9C', 'Kosong'),
(258, 1, '9D', 'Kosong'),
(259, 1, '9E', 'Kosong'),
(260, 1, '10A', 'Kosong'),
(261, 1, '10B', 'Kosong'),
(262, 1, '10C', 'Kosong'),
(263, 1, '10D', 'Kosong'),
(264, 1, '10E', 'Kosong'),
(265, 2, '1A', 'Kosong'),
(266, 2, '2A', 'Kosong'),
(267, 2, '3A', 'Kosong'),
(268, 2, '3B', 'Kosong'),
(269, 2, '3C', 'Kosong'),
(270, 2, '3D', 'Kosong'),
(271, 2, '3E', 'Kosong'),
(272, 2, '4A', 'Kosong'),
(273, 2, '4B', 'Kosong'),
(274, 2, '4C', 'Kosong'),
(275, 2, '4D', 'Kosong'),
(276, 2, '4E', 'Kosong'),
(277, 2, '5A', 'Kosong'),
(278, 2, '5B', 'Kosong'),
(279, 2, '5C', 'Kosong'),
(280, 2, '5D', 'Kosong'),
(281, 2, '5E', 'Kosong'),
(282, 2, '6A', 'Kosong'),
(283, 2, '6B', 'Kosong'),
(284, 2, '6C', 'Kosong'),
(285, 2, '6D', 'Kosong'),
(286, 2, '6E', 'Kosong'),
(287, 2, '7A', 'Kosong'),
(288, 2, '7B', 'Kosong'),
(289, 2, '7C', 'Kosong'),
(290, 2, '7D', 'Kosong'),
(291, 2, '7E', 'Kosong'),
(292, 2, '8A', 'Kosong'),
(293, 2, '8B', 'Kosong'),
(294, 2, '8C', 'Kosong'),
(295, 2, '8D', 'Kosong'),
(296, 2, '8E', 'Kosong'),
(297, 2, '9A', 'Kosong'),
(298, 2, '9B', 'Kosong'),
(299, 2, '9C', 'Kosong'),
(300, 2, '9D', 'Kosong'),
(301, 2, '9E', 'Kosong'),
(302, 2, '10A', 'Kosong'),
(303, 2, '10B', 'Kosong'),
(304, 2, '10C', 'Kosong'),
(305, 2, '10D', 'Kosong'),
(306, 2, '10E', 'Kosong'),
(307, 3, '1A', 'Kosong'),
(308, 3, '2A', 'Kosong'),
(309, 3, '3A', 'Kosong'),
(310, 3, '3B', 'Kosong'),
(311, 3, '3C', 'Kosong'),
(312, 3, '3D', 'Kosong'),
(313, 3, '3E', 'Kosong'),
(314, 3, '4A', 'Kosong'),
(315, 3, '4B', 'Kosong'),
(316, 3, '4C', 'Kosong'),
(317, 3, '4D', 'Kosong'),
(318, 3, '4E', 'Kosong'),
(319, 3, '5A', 'Kosong'),
(320, 3, '5B', 'Kosong'),
(321, 3, '5C', 'Kosong'),
(322, 3, '5D', 'Kosong'),
(323, 3, '5E', 'Kosong'),
(324, 3, '6A', 'Kosong'),
(325, 3, '6B', 'Kosong'),
(326, 3, '6C', 'Kosong'),
(327, 3, '6D', 'Kosong'),
(328, 3, '6E', 'Kosong'),
(329, 3, '7A', 'Kosong'),
(330, 3, '7B', 'Kosong'),
(331, 3, '7C', 'Kosong'),
(332, 3, '7D', 'Kosong'),
(333, 3, '7E', 'Kosong'),
(334, 3, '8A', 'Kosong'),
(335, 3, '8B', 'Kosong'),
(336, 3, '8C', 'Kosong'),
(337, 3, '8D', 'Kosong'),
(338, 3, '8E', 'Kosong'),
(339, 3, '9A', 'Kosong'),
(340, 3, '9B', 'Kosong'),
(341, 3, '9C', 'Kosong'),
(342, 3, '9D', 'Kosong'),
(343, 3, '9E', 'Kosong'),
(344, 3, '10A', 'Kosong'),
(345, 3, '10B', 'Kosong'),
(346, 3, '10C', 'Kosong'),
(347, 3, '10D', 'Kosong'),
(348, 3, '10E', 'Kosong'),
(349, 4, '1A', 'Kosong'),
(350, 4, '2A', 'Kosong'),
(351, 4, '3A', 'Kosong'),
(352, 4, '3B', 'Kosong'),
(353, 4, '3C', 'Kosong'),
(354, 4, '3D', 'Kosong'),
(355, 4, '3E', 'Kosong'),
(356, 4, '4A', 'Kosong'),
(357, 4, '4B', 'Kosong'),
(358, 4, '4C', 'Kosong'),
(359, 4, '4D', 'Kosong'),
(360, 4, '4E', 'Kosong'),
(361, 4, '5A', 'Kosong'),
(362, 4, '5B', 'Kosong'),
(363, 4, '5C', 'Kosong'),
(364, 4, '5D', 'Kosong'),
(365, 4, '5E', 'Kosong'),
(366, 4, '6A', 'Kosong'),
(367, 4, '6B', 'Kosong'),
(368, 4, '6C', 'Kosong'),
(369, 4, '6D', 'Kosong'),
(370, 4, '6E', 'Kosong'),
(371, 4, '7A', 'Kosong'),
(372, 4, '7B', 'Kosong'),
(373, 4, '7C', 'Kosong'),
(374, 4, '7D', 'Kosong'),
(375, 4, '7E', 'Kosong'),
(376, 4, '8A', 'Kosong'),
(377, 4, '8B', 'Kosong'),
(378, 4, '8C', 'Kosong'),
(379, 4, '8D', 'Kosong'),
(380, 4, '8E', 'Kosong'),
(381, 4, '9A', 'Kosong'),
(382, 4, '9B', 'Kosong'),
(383, 4, '9C', 'Kosong'),
(384, 4, '9D', 'Kosong'),
(385, 4, '9E', 'Kosong'),
(386, 4, '10A', 'Kosong'),
(387, 4, '10B', 'Kosong'),
(388, 4, '10C', 'Kosong'),
(389, 4, '10D', 'Kosong'),
(390, 4, '10E', 'Kosong'),
(391, 5, '1A', 'Kosong'),
(392, 5, '2A', 'Kosong'),
(393, 5, '3A', 'Kosong'),
(394, 5, '3B', 'Kosong'),
(395, 5, '3C', 'Kosong'),
(396, 5, '3D', 'Kosong'),
(397, 5, '3E', 'Kosong'),
(398, 5, '4A', 'Kosong'),
(399, 5, '4B', 'Kosong'),
(400, 5, '4C', 'Kosong'),
(401, 5, '4D', 'Kosong'),
(402, 5, '4E', 'Kosong'),
(403, 5, '5A', 'Kosong'),
(404, 5, '5B', 'Kosong'),
(405, 5, '5C', 'Kosong'),
(406, 5, '5D', 'Kosong'),
(407, 5, '5E', 'Kosong'),
(408, 5, '6A', 'Kosong'),
(409, 5, '6B', 'Kosong'),
(410, 5, '6C', 'Kosong'),
(411, 5, '6D', 'Kosong'),
(412, 5, '6E', 'Kosong'),
(413, 5, '7A', 'Kosong'),
(414, 5, '7B', 'Kosong'),
(415, 5, '7C', 'Kosong'),
(416, 5, '7D', 'Kosong'),
(417, 5, '7E', 'Kosong'),
(418, 5, '8A', 'Kosong'),
(419, 5, '8B', 'Kosong'),
(420, 5, '8C', 'Kosong'),
(421, 5, '8D', 'Kosong'),
(422, 5, '8E', 'Kosong'),
(423, 5, '9A', 'Kosong'),
(424, 5, '9B', 'Kosong'),
(425, 5, '9C', 'Kosong'),
(426, 5, '9D', 'Kosong'),
(427, 5, '9E', 'Kosong'),
(428, 5, '10A', 'Kosong'),
(429, 5, '10B', 'Kosong'),
(430, 5, '10C', 'Kosong'),
(431, 5, '10D', 'Kosong'),
(432, 5, '10E', 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--
-- Creation: Dec 04, 2018 at 05:18 PM
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_pembeli_customer` varchar(40) DEFAULT NULL,
  `kd_pembeli_anonim` varchar(40) DEFAULT NULL,
  `tgl_pemesanan` datetime NOT NULL,
  `id_jadwal` int(1) UNSIGNED NOT NULL,
  `id_harga` int(1) UNSIGNED NOT NULL,
  `jumlah_tiket_dewasa` tinyint(1) UNSIGNED NOT NULL,
  `jumlah_tiket_bayi` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `total_harga` mediumint(1) UNSIGNED NOT NULL,
  `status` enum('Gagal','Proses','Berhasil') NOT NULL DEFAULT 'Proses',
  `kode_booking` char(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_kd_pembeli_anonim_pemesanan` (`kd_pembeli_anonim`),
  KEY `fk_kd_pembeli_customer_pemesanan` (`kd_pembeli_customer`),
  KEY `fk_id_jadwal_pemesanan` (`id_jadwal`),
  KEY `fk_id_harga_pemesanan` (`id_harga`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `pemesanan`:
--   `id_harga`
--       `harga` -> `ID`
--   `id_jadwal`
--       `jadwal` -> `ID`
--   `kd_pembeli_anonim`
--       `anonim` -> `email`
--   `kd_pembeli_customer`
--       `customer` -> `email`
--

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`ID`, `kd_pembeli_customer`, `kd_pembeli_anonim`, `tgl_pemesanan`, `id_jadwal`, `id_harga`, `jumlah_tiket_dewasa`, `jumlah_tiket_bayi`, `total_harga`, `status`, `kode_booking`) VALUES
(1, NULL, 'ahmadmaulana@gmail.com', '2018-12-05 10:00:00', 1, 1, 1, 0, 360000, 'Proses', 'KB0001'),
(2, 'mfurqan@gmail.com', NULL, '2018-12-05 07:00:00', 2, 2, 2, 0, 540000, 'Proses', 'KB0002');

-- --------------------------------------------------------

--
-- Table structure for table `stasiun`
--
-- Creation: Dec 04, 2018 at 11:14 AM
--

CREATE TABLE IF NOT EXISTS `stasiun` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_stasiun` char(5) NOT NULL,
  `kota_utama` varchar(50) NOT NULL,
  `sub_stasiun` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `kd_stasiun` (`kd_stasiun`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `stasiun`:
--

--
-- Dumping data for table `stasiun`
--

INSERT INTO `stasiun` (`ID`, `kd_stasiun`, `kota_utama`, `sub_stasiun`) VALUES
(1, 'ML', 'Malang', 'Malang'),
(2, 'BD', 'Bandung', 'Bandung'),
(3, 'KAC', 'Bandung', 'Kiaracondong');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--
-- Creation: Dec 04, 2018 at 05:53 PM
--

CREATE TABLE IF NOT EXISTS `tiket` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pemesanan` int(1) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kategori` enum('Dewasa','Bayi') NOT NULL,
  `no_id` varchar(30) NOT NULL,
  `id_kursi` int(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_pemesanan_tiket` (`id_pemesanan`),
  KEY `fk_id_kursi_tiket` (`id_kursi`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `tiket`:
--   `id_kursi`
--       `kursi` -> `ID`
--   `id_pemesanan`
--       `pemesanan` -> `ID`
--

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`ID`, `id_pemesanan`, `nama`, `kategori`, `no_id`, `id_kursi`) VALUES
(1, 2, 'Muhammad Furqan', 'Dewasa', '1604321', 260);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gerbong`
--
ALTER TABLE `gerbong`
  ADD CONSTRAINT `fk_kd_kereta_gerbong` FOREIGN KEY (`kd_kereta`) REFERENCES `kereta` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `fk_id_jadwal_harga` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `fk_kd_kereta_jadwal` FOREIGN KEY (`kd_kereta`) REFERENCES `kereta` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kd_stasiun_keberangkatan_jadwal` FOREIGN KEY (`kd_stasiun_keberangkatan`) REFERENCES `stasiun` (`kd_stasiun`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kd_stasiun_tujuan_jadwal` FOREIGN KEY (`kd_stasiun_tujuan`) REFERENCES `stasiun` (`kd_stasiun`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `fk_id_admin_konfirmasi` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pemesanan_konfirmasi` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `fk_id_gerbong_kursi` FOREIGN KEY (`id_gerbong`) REFERENCES `gerbong` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `fk_id_harga_pemesanan` FOREIGN KEY (`id_harga`) REFERENCES `harga` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_jadwal_pemesanan` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kd_pembeli_anonim_pemesanan` FOREIGN KEY (`kd_pembeli_anonim`) REFERENCES `anonim` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kd_pembeli_customer_pemesanan` FOREIGN KEY (`kd_pembeli_customer`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `fk_id_kursi_tiket` FOREIGN KEY (`id_kursi`) REFERENCES `kursi` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_pemesanan_tiket` FOREIGN KEY (`id_pemesanan`) REFERENCES `pemesanan` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
