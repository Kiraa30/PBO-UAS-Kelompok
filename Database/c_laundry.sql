-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2024 at 04:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_adm` int(11) NOT NULL,
  `nama_adm` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuci_kering`
--

CREATE TABLE `cuci_kering` (
  `no_layanan` int(10) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cuci_kering_setrika`
--

CREATE TABLE `cuci_kering_setrika` (
  `no_layanan` int(10) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_cust` int(11) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

CREATE TABLE `laundry` (
  `layanan` enum('Cuci Kering','Cuci Kering + Setrika') NOT NULL,
  `no_layanan` int(10) NOT NULL,
  `antar_jemput` enum('Motor','Mobil') NOT NULL,
  `no_antar_jemput` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `no_antar_jemput` int(10) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `motor`
--

CREATE TABLE `motor` (
  `no_antar_jemput` int(10) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nama_cust` varchar(100) NOT NULL,
  `id_adm` int(11) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `beratPakaian` decimal(10,2) NOT NULL,
  `totalHarga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_adm`);

--
-- Indexes for table `cuci_kering`
--
ALTER TABLE `cuci_kering`
  ADD UNIQUE KEY `nama_cust` (`nama_cust`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `no_layanan` (`no_layanan`);

--
-- Indexes for table `cuci_kering_setrika`
--
ALTER TABLE `cuci_kering_setrika`
  ADD UNIQUE KEY `nama_cust` (`nama_cust`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `no_layanan` (`no_layanan`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`nama_cust`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `alamat` (`alamat`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD UNIQUE KEY `layanan` (`layanan`),
  ADD UNIQUE KEY `antar_jemput` (`antar_jemput`),
  ADD UNIQUE KEY `no_layanan` (`no_layanan`),
  ADD UNIQUE KEY `no_antar_jemput` (`no_antar_jemput`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD UNIQUE KEY `nama_cust` (`nama_cust`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `alamat` (`alamat`),
  ADD UNIQUE KEY `no_antar_jemput` (`no_antar_jemput`);

--
-- Indexes for table `motor`
--
ALTER TABLE `motor`
  ADD UNIQUE KEY `nama_cust` (`nama_cust`),
  ADD UNIQUE KEY `no_telp` (`no_telp`),
  ADD UNIQUE KEY `alamat` (`alamat`),
  ADD UNIQUE KEY `no_antar_jemput` (`no_antar_jemput`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`nama_cust`),
  ADD UNIQUE KEY `id_adm` (`id_adm`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cuci_kering`
--
ALTER TABLE `cuci_kering`
  ADD CONSTRAINT `cuci_kering_ibfk_1` FOREIGN KEY (`nama_cust`) REFERENCES `customer` (`nama_cust`),
  ADD CONSTRAINT `cuci_kering_ibfk_2` FOREIGN KEY (`no_telp`) REFERENCES `customer` (`no_telp`),
  ADD CONSTRAINT `cuci_kering_ibfk_3` FOREIGN KEY (`no_layanan`) REFERENCES `laundry` (`no_layanan`);

--
-- Constraints for table `cuci_kering_setrika`
--
ALTER TABLE `cuci_kering_setrika`
  ADD CONSTRAINT `cuci_kering_setrika_ibfk_1` FOREIGN KEY (`nama_cust`) REFERENCES `customer` (`nama_cust`),
  ADD CONSTRAINT `cuci_kering_setrika_ibfk_2` FOREIGN KEY (`no_telp`) REFERENCES `customer` (`no_telp`),
  ADD CONSTRAINT `cuci_kering_setrika_ibfk_3` FOREIGN KEY (`no_layanan`) REFERENCES `laundry` (`no_layanan`);

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`nama_cust`) REFERENCES `customer` (`nama_cust`),
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`no_telp`) REFERENCES `customer` (`no_telp`),
  ADD CONSTRAINT `mobil_ibfk_3` FOREIGN KEY (`alamat`) REFERENCES `customer` (`alamat`),
  ADD CONSTRAINT `mobil_ibfk_4` FOREIGN KEY (`no_antar_jemput`) REFERENCES `laundry` (`no_antar_jemput`);

--
-- Constraints for table `motor`
--
ALTER TABLE `motor`
  ADD CONSTRAINT `motor_ibfk_1` FOREIGN KEY (`nama_cust`) REFERENCES `customer` (`nama_cust`),
  ADD CONSTRAINT `motor_ibfk_2` FOREIGN KEY (`no_telp`) REFERENCES `customer` (`no_telp`),
  ADD CONSTRAINT `motor_ibfk_3` FOREIGN KEY (`alamat`) REFERENCES `customer` (`alamat`),
  ADD CONSTRAINT `motor_ibfk_4` FOREIGN KEY (`no_antar_jemput`) REFERENCES `laundry` (`no_antar_jemput`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`nama_cust`) REFERENCES `customer` (`nama_cust`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_adm`) REFERENCES `admin` (`id_adm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
