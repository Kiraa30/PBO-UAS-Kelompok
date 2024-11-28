-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Nov 2024 pada 16.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tdlaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`username`, `password`) VALUES
('ilham', 'admin4'),
('rachel', 'admin1'),
('riva', 'admin2'),
('kaniz', 'admin3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menupesanan`
--

CREATE TABLE `menupesanan` (
  `id_customer` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `layanan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menupesanan`
--

INSERT INTO `menupesanan` (`id_customer`, `nama`, `no_telepon`, `alamat`, `layanan`) VALUES
(1, 'Ilham', '085659650179', 'Perum Pebabri', 'Motor'),
(2, 'Putra', '08563238741', 'Kos Mr Bean Blok C', 'Mobil Rp. 10000'),
(3, 'Uus', '08634283742', 'Gang Hisana', 'Motor Rp. 2000'),
(4, 'Rafa D', '08532645214', 'Mahkota Blok J', 'Mobil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prosespesanan`
--

CREATE TABLE `prosespesanan` (
  `order_id` int(11) NOT NULL,
  `tanggalmasuk` datetime NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `layanan` varchar(50) NOT NULL,
  `metode` varchar(50) NOT NULL,
  `hargatotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `prosespesanan`
--

INSERT INTO `prosespesanan` (`order_id`, `tanggalmasuk`, `nama_customer`, `no_telepon`, `alamat`, `layanan`, `metode`, `hargatotal`) VALUES
(1, '2024-11-25 01:01:34', 'Ilham', '085659650179', 'Perum Pebabri', 'Motor', 'Cuci Kering + Setrika', 41000),
(2, '2024-11-25 09:26:43', 'Putra', '08563238741', 'Kos Mr Bean Blok C', 'Mobil', 'Cuci Kering', 87000),
(4, '2024-11-27 22:36:33', 'Rafa D', '08532645214', 'Mahkota Blok J', 'Mobil', 'Cuci Kering + Setrika', 62000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menupesanan`
--
ALTER TABLE `menupesanan`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `prosespesanan`
--
ALTER TABLE `prosespesanan`
  ADD PRIMARY KEY (`order_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menupesanan`
--
ALTER TABLE `menupesanan`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7123517;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
