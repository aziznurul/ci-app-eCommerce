-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2024 at 11:13 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `keterangan` varchar(500) NOT NULL,
  `kategori` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(13, 'HP', 'Samsung 5A Pro', 'Elektronik', 3000000, 8, 'hp1.jpg'),
(14, 'Kemeja', 'Alisan', 'Pakaian Pria', 175000, 67, 'd25af2ed-2745-4143-ac74-0a1cee395f021.jpg'),
(15, 'Mukena', 'Mukena Alisan', 'Pakaian Wanita', 150000, 33, '9ee94bafbcadb91ba45325df6720c7511.jpg'),
(16, 'Kaos  Halus', 'untuk lebaran', 'Pakaian Anak-anak', 180000, 44, '8aec9b71afc1289f599ed1ae50f8e15d1.jpg'),
(17, 'Bola ', 'Merek Adidas', 'Peralatan Olahraga', 500000, 13, 'images1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `tgl_bayar` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_bayar`, `batas_bayar`) VALUES
(1, 'Aziz Nurul Hidayat', 'Bandung, Jawa Barat', '2024-02-17 17:29:09', '2024-02-18 17:29:09'),
(2, 'Sri Wahyuni', 'Majalaya, Bandung Jawa Barat', '2024-02-17 17:32:15', '2024-02-18 17:32:15'),
(3, 'Rahaden', 'Bandung, Jawa Barat', '2024-02-17 19:26:15', '2024-02-18 19:26:15'),
(4, 'Aziz Nurul H', 'Garut', '2024-02-17 21:30:04', '2024-02-18 21:30:04'),
(5, '', '', '2024-02-17 21:31:43', '2024-02-18 21:31:43'),
(6, '', '', '2024-02-18 17:04:21', '2024-02-19 17:04:21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_barang`, `nama_barang`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 1, 'Sepatu', 1, 300000, ''),
(2, 1, 2, 'Kamera', 1, 5900000, ''),
(3, 1, 3, 'HP', 1, 1300000, ''),
(4, 1, 4, 'Laptop', 1, 3000000, ''),
(5, 2, 7, 'Jam Tangan Pria', 1, 100000, ''),
(6, 2, 2, 'Kamera', 1, 5900000, ''),
(7, 3, 1, 'Sepatu', 1, 300000, ''),
(8, 4, 13, 'HP', 1, 3000000, ''),
(9, 5, 15, 'Mukena', 1, 150000, ''),
(10, 5, 16, 'Kaos  Halus', 1, 180000, ''),
(11, 6, 13, 'HP', 1, 3000000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_barang = NEW.id_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'admin', 'admin', '123456', 1),
(2, 'user', 'user', '123456', 2),
(3, 'Aziz Nurul Hidayat', 'aziznurulhidayat', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
