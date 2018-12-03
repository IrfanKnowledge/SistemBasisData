-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2018 at 10:55 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
-- Creation: Dec 03, 2018 at 08:41 AM
--

CREATE TABLE IF NOT EXISTS `admin` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `admin`:
--

-- --------------------------------------------------------

--
-- Table structure for table `anonim`
--
-- Creation: Dec 03, 2018 at 08:44 AM
--

CREATE TABLE IF NOT EXISTS `anonim` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `anonim`:
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--
-- Creation: Dec 03, 2018 at 03:25 AM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `customer`:
--

-- --------------------------------------------------------

--
-- Table structure for table `gerbong`
--
-- Creation: Dec 03, 2018 at 09:24 AM
--

CREATE TABLE IF NOT EXISTS `gerbong` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_kereta` varchar(50) NOT NULL,
  `no_gerbong` varchar(2) NOT NULL,
  `kelas` enum('Ekonomi','Premium','Bisnis','Eksekutif') NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_kd_kereta_gerbong` (`kd_kereta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `gerbong`:
--   `kd_kereta`
--       `kereta` -> `nama`
--

-- --------------------------------------------------------

--
-- Table structure for table `harga`
--
-- Creation: Dec 03, 2018 at 09:05 AM
--

CREATE TABLE IF NOT EXISTS `harga` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_jadwal` int(1) UNSIGNED NOT NULL,
  `harga_tiket` mediumint(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_id_jadwal_harga` (`id_jadwal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `harga`:
--   `id_jadwal`
--       `jadwal` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--
-- Creation: Dec 03, 2018 at 09:13 AM
--

CREATE TABLE IF NOT EXISTS `jadwal` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gerbong` int(1) UNSIGNED NOT NULL,
  `tgl_keberangkatan` date NOT NULL,
  `kd_stasiun_keberangkatan` char(5) NOT NULL,
  `kd_stasiun_tujuan` char(5) NOT NULL,
  `waktu_berangkat` time NOT NULL,
  `waktu_tiba` time NOT NULL,
  `status` enum('Tersedia','Penuh') NOT NULL DEFAULT 'Tersedia',
  PRIMARY KEY (`ID`),
  KEY `fk_id_gerbong_jadwal` (`id_gerbong`),
  KEY `fk_kd_stasiun_keberangkatan_jadwal` (`kd_stasiun_keberangkatan`),
  KEY `fk_kd_stasiun_tujuan_jadwal` (`kd_stasiun_tujuan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `jadwal`:
--   `id_gerbong`
--       `gerbong` -> `ID`
--   `kd_stasiun_keberangkatan`
--       `stasiun` -> `kd_stasiun`
--   `kd_stasiun_tujuan`
--       `stasiun` -> `kd_stasiun`
--

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--
-- Creation: Dec 03, 2018 at 09:18 AM
--

CREATE TABLE IF NOT EXISTS `kereta` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nama` (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `kereta`:
--

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi`
--
-- Creation: Dec 03, 2018 at 08:56 AM
--

CREATE TABLE IF NOT EXISTS `konfirmasi` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_pemesanan` int(1) UNSIGNED NOT NULL,
  `id_admin` int(1) UNSIGNED NOT NULL,
  `status` enum('Menunggu Pembayaran','Menunggu Konfirmasi','Gagal','Berhasil') NOT NULL DEFAULT 'Menunggu Pembayaran',
  PRIMARY KEY (`ID`),
  KEY `fk_id_pemesanan_konfirmasi` (`id_pemesanan`),
  KEY `fk_id_admin_konfirmasi` (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `konfirmasi`:
--   `id_admin`
--       `admin` -> `ID`
--   `id_pemesanan`
--       `pemesanan` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--
-- Creation: Dec 03, 2018 at 09:27 AM
--

CREATE TABLE IF NOT EXISTS `kursi` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gerbong` int(1) UNSIGNED NOT NULL,
  `no_kursi` varchar(3) NOT NULL,
  `status` enum('Terisi','Kosong') NOT NULL DEFAULT 'Kosong',
  PRIMARY KEY (`ID`),
  KEY `fk_id_gerbong_kursi` (`id_gerbong`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `kursi`:
--   `id_gerbong`
--       `gerbong` -> `ID`
--

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--
-- Creation: Dec 03, 2018 at 08:51 AM
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_pembeli_customer` varchar(40) DEFAULT NULL,
  `kd_pembeli_anonim` varchar(40) DEFAULT NULL,
  `tgl_pemesanan` date NOT NULL,
  `id_harga` int(1) UNSIGNED NOT NULL,
  `id_gerbong` int(1) UNSIGNED NOT NULL,
  `jumlah_tiket_dewasa` tinyint(1) UNSIGNED NOT NULL,
  `jumlah_tiket_bayi` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `total_harga` mediumint(1) UNSIGNED NOT NULL,
  `status` enum('Gagal','Proses','Berhasil') NOT NULL DEFAULT 'Proses',
  `kode_booking` char(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_kd_pembeli_customer_pemesanan` (`kd_pembeli_customer`),
  KEY `fk_kd_pembeli_anonim_pemesanan` (`kd_pembeli_anonim`),
  KEY `fk_id_harga_pemesanan` (`id_harga`),
  KEY `fk_kd_id_gerbong_pemesanan` (`id_gerbong`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `pemesanan`:
--   `id_harga`
--       `harga` -> `ID`
--   `id_gerbong`
--       `gerbong` -> `ID`
--   `kd_pembeli_anonim`
--       `anonim` -> `email`
--   `kd_pembeli_customer`
--       `customer` -> `email`
--

-- --------------------------------------------------------

--
-- Table structure for table `stasiun`
--
-- Creation: Dec 03, 2018 at 09:16 AM
--

CREATE TABLE IF NOT EXISTS `stasiun` (
  `ID` int(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `kd_stasiun` char(5) NOT NULL,
  `kota_utama` varchar(50) NOT NULL,
  `sub_stasiun` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `kd_stasiun` (`kd_stasiun`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `stasiun`:
--

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--
-- Creation: Dec 03, 2018 at 09:02 AM
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
  KEY `fk_id_kursi_tiket` (`id_kursi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `tiket`:
--   `id_kursi`
--       `kursi` -> `ID`
--   `id_pemesanan`
--       `pemesanan` -> `ID`
--

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
  ADD CONSTRAINT `fk_id_gerbong_jadwal` FOREIGN KEY (`id_gerbong`) REFERENCES `gerbong` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `fk_kd_id_gerbong_pemesanan` FOREIGN KEY (`id_gerbong`) REFERENCES `gerbong` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
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
