-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2020 pada 13.37
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_crane`
--

CREATE TABLE `m_crane` (
  `id_crane` varchar(10) NOT NULL,
  `desc_crane` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_crane`
--

INSERT INTO `m_crane` (`id_crane`, `desc_crane`) VALUES
('CC#01', 'CRANE #01'),
('CC#02', 'CRANE #02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kapal`
--

CREATE TABLE `m_kapal` (
  `id_kapal` int(11) NOT NULL,
  `nama_kapal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_kapal`
--

INSERT INTO `m_kapal` (`id_kapal`, `nama_kapal`) VALUES
(1, 'SINAR PRAYA'),
(2, 'TANTO LUAS'),
(3, 'PULAU HOKI');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_shift`
--

CREATE TABLE `m_shift` (
  `id_shift` int(11) NOT NULL,
  `shift_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_shift`
--

INSERT INTO `m_shift` (`id_shift`, `shift_desc`) VALUES
(1, '(07:00) I'),
(2, '(15:00) II'),
(3, '(23:00) III');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_status`
--

CREATE TABLE `m_status` (
  `id_status` varchar(50) NOT NULL,
  `desc_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_status`
--

INSERT INTO `m_status` (`id_status`, `desc_status`) VALUES
('A', 'ACCIDENT'),
('B', 'BREAKDOWN'),
('M', 'MAINTENANCE'),
('O', 'OPERATION'),
('S', 'STANDBY'),
('SD', 'SHUTDOWN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`id_user`, `nama_user`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules_a`
--

CREATE TABLE `schedules_a` (
  `id_sch` int(11) NOT NULL,
  `id_crane` varchar(20) NOT NULL,
  `date_sch` date NOT NULL,
  `ehrm` int(11) NOT NULL,
  `ohrm` int(11) NOT NULL,
  `tangki_bawah` int(11) NOT NULL,
  `tangki_atas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `schedules_a`
--

INSERT INTO `schedules_a` (`id_sch`, `id_crane`, `date_sch`, `ehrm`, `ohrm`, `tangki_bawah`, `tangki_atas`) VALUES
(20, 'CC#02', '2020-05-22', 11, 11, 11, 11),
(22, 'CC#01', '2020-05-22', 444, 44, 77, 77),
(23, 'CC#02', '2020-05-26', 11, 11, 11, 11),
(24, 'CC#01', '2020-05-26', 11, 11, 11, 11),
(25, 'CC#01', '2020-06-24', 111111, 11, 11, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedules_b`
--

CREATE TABLE `schedules_b` (
  `id_sch_dtl` int(11) NOT NULL,
  `id_sch` int(11) NOT NULL,
  `id_shift` int(11) NOT NULL,
  `id_kapal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_crane`
--
ALTER TABLE `m_crane`
  ADD PRIMARY KEY (`id_crane`);

--
-- Indeks untuk tabel `m_kapal`
--
ALTER TABLE `m_kapal`
  ADD PRIMARY KEY (`id_kapal`);

--
-- Indeks untuk tabel `m_shift`
--
ALTER TABLE `m_shift`
  ADD PRIMARY KEY (`id_shift`);

--
-- Indeks untuk tabel `m_status`
--
ALTER TABLE `m_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `schedules_a`
--
ALTER TABLE `schedules_a`
  ADD PRIMARY KEY (`id_sch`),
  ADD KEY `id_crane` (`id_crane`);

--
-- Indeks untuk tabel `schedules_b`
--
ALTER TABLE `schedules_b`
  ADD PRIMARY KEY (`id_sch_dtl`),
  ADD UNIQUE KEY `id_sch` (`id_sch`),
  ADD UNIQUE KEY `id_shift` (`id_shift`),
  ADD UNIQUE KEY `id_kapal` (`id_kapal`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_kapal`
--
ALTER TABLE `m_kapal`
  MODIFY `id_kapal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_shift`
--
ALTER TABLE `m_shift`
  MODIFY `id_shift` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `m_user`
--
ALTER TABLE `m_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `schedules_a`
--
ALTER TABLE `schedules_a`
  MODIFY `id_sch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `schedules_b`
--
ALTER TABLE `schedules_b`
  MODIFY `id_sch_dtl` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `schedules_a`
--
ALTER TABLE `schedules_a`
  ADD CONSTRAINT `id_crane_fk` FOREIGN KEY (`id_crane`) REFERENCES `m_crane` (`id_crane`);

--
-- Ketidakleluasaan untuk tabel `schedules_b`
--
ALTER TABLE `schedules_b`
  ADD CONSTRAINT `id_kapal_fk` FOREIGN KEY (`id_kapal`) REFERENCES `m_kapal` (`id_kapal`),
  ADD CONSTRAINT `id_sch_fk` FOREIGN KEY (`id_sch`) REFERENCES `schedules_a` (`id_sch`),
  ADD CONSTRAINT `id_shift` FOREIGN KEY (`id_shift`) REFERENCES `m_shift` (`id_shift`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
