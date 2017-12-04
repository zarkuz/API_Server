-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 04 Des 2017 pada 18.04
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mahasiswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_buku`
--

CREATE TABLE `tbl_buku` (
  `id` int(10) NOT NULL,
  `nama_pemilik` varchar(100) NOT NULL,
  `buku` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_buku`
--

INSERT INTO `tbl_buku` (`id`, `nama_pemilik`, `buku`) VALUES
(8, 'Fariz Ramadhan', 'Android Programming'),
(9, 'Frederick Fuller', 'Laravel Development');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pemilik`
--

CREATE TABLE `tbl_pemilik` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `buku` varchar(100) NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pemilik`
--

INSERT INTO `tbl_pemilik` (`id`, `nama`, `buku`, `no_hp`) VALUES
(1, 'Fariz Ramadhan', 'Android Programming', '085811223341'),
(2, 'Fariz Dotid', 'Web Programming', '085811223342'),
(3, 'Marcos Bryan', 'System Information', '085811223343'),
(4, 'Henry Ford', 'Matematika Logika', '085811223344'),
(5, 'Maxine Douglas', 'Node JS Development', '085811223345'),
(6, 'Mitchell Baker', 'Angular Development', '085811223346'),
(7, 'Nina Cortez', 'React Native Development', '085811223347'),
(8, 'Frederick Fuller', 'Laravel Development', '085811223348'),
(9, 'Kristopher Bush', 'Codeigniter Development', '085811223349'),
(10, 'Marcia Mccarthy', 'iOS Development', '085811223350');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(80) NOT NULL,
  `salt` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `unique_id`, `nama`, `email`, `encrypted_password`, `salt`) VALUES
(1, '596dda79af4ec6.84666352', 'farizdotid', 'me.farizdotid@gmail.com', '+ai42FQ9ItCLqIjG8hONzgslh5BlYWExZmRjZWYz', 'eaa1fdcef3'),
(2, '5a1e3d35ad56e5.90345360', 'usman', 'usman', 'N+0SyyVfAZsXmj7F622kM7BbyvpjYjFmNWE3ZDhi', 'cb1f5a7d8b'),
(3, '5a25616adc7981.48496760', 'usman', 'www', 'HCeKAtCjKjmtaEx5DXX0oz+lopY5ZjdmZGE5YjYw', '9f7fda9b60');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pemilik`
--
ALTER TABLE `tbl_pemilik`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_pemilik`
--
ALTER TABLE `tbl_pemilik`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
