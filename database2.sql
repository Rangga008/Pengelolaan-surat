-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_surat_masuk_keluar
CREATE DATABASE IF NOT EXISTS `db_surat_masuk_keluar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_surat_masuk_keluar`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_agenda
CREATE TABLE IF NOT EXISTS `tabel_agenda` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `id_ruangan` int NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `detail_acara` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `terverifikasi` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `id_ruangan` (`id_ruangan`),
  CONSTRAINT `tabel_agenda_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `tabel_ruangan` (`id_ruangan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_agenda: ~0 rows (approximately)
DELETE FROM `tabel_agenda`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_arsip
CREATE TABLE IF NOT EXISTS `tabel_arsip` (
  `id_arsip` int NOT NULL AUTO_INCREMENT,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_dokumen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_arsip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_arsip: ~0 rows (approximately)
DELETE FROM `tabel_arsip`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_inventaris
CREATE TABLE IF NOT EXISTS `tabel_inventaris` (
  `id_inventaris` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumlah` int NOT NULL,
  `harga` bigint NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_inventaris`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_inventaris: ~2 rows (approximately)
DELETE FROM `tabel_inventaris`;
INSERT INTO `tabel_inventaris` (`id_inventaris`, `nama`, `merk`, `jumlah`, `harga`, `tanggal_pembelian`, `keterangan`) VALUES
	(1, 'Laptop ASUS', 'ASUS K513EA', 10, 10000000, '2024-09-09', 'Barang Baru'),
	(2, 'Kamera Canon', 'Canon EOS-1D', 5, 15000000, '2024-09-09', 'Barang Baru'),
	(3, 'Infocus', 'Canon', 2, 2000000, '2024-09-09', NULL);

-- Dumping structure for table db_surat_masuk_keluar.tabel_kode_surat
CREATE TABLE IF NOT EXISTS `tabel_kode_surat` (
  `id_kode_surat` int NOT NULL AUTO_INCREMENT,
  `jenis_surat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkatan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_kode_surat`),
  UNIQUE KEY `singkatan` (`singkatan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_kode_surat: ~8 rows (approximately)
DELETE FROM `tabel_kode_surat`;
INSERT INTO `tabel_kode_surat` (`id_kode_surat`, `jenis_surat`, `singkatan`) VALUES
	(1, 'Surat Keputusan', 'SK'),
	(2, 'Surat Undangan', 'SU'),
	(3, 'Surat Permohonan', 'SPm'),
	(4, 'Surat Pemberitahuan', 'SPb'),
	(5, 'Surat Peminjaman', 'SPp'),
	(6, 'Surat Pernyataan', 'SPn'),
	(7, 'Surat Mandat', 'SM'),
	(8, 'Surat Tugas', 'ST'),
	(9, 'Surat Keterangan', 'Sket'),
	(10, 'Surat Rekomendasi', 'SR'),
	(11, 'Surat Balasan', 'SB'),
	(12, 'Surat Perintah Perjalanan Dinas', 'SPPD'),
	(13, 'Sertifikat', 'SRT'),
	(14, 'Surat Perjanjian Kerja ', 'PK'),
	(15, 'Surat Pengantar ', 'Speng');

-- Dumping structure for table db_surat_masuk_keluar.tabel_peminjaman_inventaris
CREATE TABLE IF NOT EXISTS `tabel_peminjaman_inventaris` (
  `id_peminjaman_inventaris` int NOT NULL AUTO_INCREMENT,
  `id_inventaris` int NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `sampai` datetime NOT NULL,
  `keperluan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENGAJUAN','DITERIMA','DITOLAK') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_peminjaman_inventaris`),
  KEY `id_inventaris` (`id_inventaris`),
  CONSTRAINT `tabel_peminjaman_inventaris_ibfk_1` FOREIGN KEY (`id_inventaris`) REFERENCES `tabel_inventaris` (`id_inventaris`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_peminjaman_inventaris: ~0 rows (approximately)
DELETE FROM `tabel_peminjaman_inventaris`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_peserta
CREATE TABLE IF NOT EXISTS `tabel_peserta` (
  `id_peserta` int NOT NULL AUTO_INCREMENT,
  `id_ruangan` int NOT NULL,
  `id_agenda` int NOT NULL,
  PRIMARY KEY (`id_peserta`),
  KEY `id_ruangan` (`id_ruangan`),
  KEY `id_agenda` (`id_agenda`),
  CONSTRAINT `tabel_peserta_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `tabel_ruangan` (`id_ruangan`),
  CONSTRAINT `tabel_peserta_ibfk_2` FOREIGN KEY (`id_agenda`) REFERENCES `tabel_agenda` (`id_agenda`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_peserta: ~0 rows (approximately)
DELETE FROM `tabel_peserta`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_ruangan
CREATE TABLE IF NOT EXISTS `tabel_ruangan` (
  `id_ruangan` int NOT NULL AUTO_INCREMENT,
  `nama_ruangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkatan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fasilitas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_ruangan`),
  UNIQUE KEY `singkatan` (`singkatan`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_ruangan: ~0 rows (approximately)
DELETE FROM `tabel_ruangan`;
INSERT INTO `tabel_ruangan` (`id_ruangan`, `nama_ruangan`, `singkatan`, `fasilitas`, `keterangan`) VALUES
	(1, 'Umum dan Kepegawaian', 'UK', NULL, ''),
	(2, 'Perencanaan dan Keuangan', 'PK', NULL, ''),
	(3, 'Sekretaris', 'S1', NULL, ''),
	(4, 'Fungsional', 'F', NULL, ''),
	(5, 'Ruang Kepala Dinas', 'RKD', NULL, ''),
	(6, 'Studio Mini', 'SM', NULL, ''),
	(7, 'Musholla', 'M', NULL, ''),
	(8, 'Wakapitu', 'W', NULL, ''),
	(9, 'Aula', 'A', NULL, ''),
	(10, 'Brailie Corner', 'BC', NULL, ''),
	(11, 'Perpustakaan Keliling', 'PTK', NULL, ''),
	(12, 'Sirkulasi', 'S2', NULL, ''),
	(13, 'Ruangan Anak', 'RA', NULL, ''),
	(14, 'Depo Arsip', 'DA', NULL, '');

-- Dumping structure for table db_surat_masuk_keluar.tabel_surat_disposisi
CREATE TABLE IF NOT EXISTS `tabel_surat_disposisi` (
  `id_surat_disposisi` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_disposisi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tujuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomor_telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokumen_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_surat_disposisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_surat_disposisi: ~0 rows (approximately)
DELETE FROM `tabel_surat_disposisi`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_surat_keluar
CREATE TABLE IF NOT EXISTS `tabel_surat_keluar` (
  `id_surat_keluar` int NOT NULL AUTO_INCREMENT,
  `id_ruangan` int NOT NULL,
  `id_kode_surat` int NOT NULL,
  `nomor_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifat_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokumen_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_surat_keluar`),
  KEY `id_ruangan` (`id_ruangan`),
  KEY `id_kode_surat` (`id_kode_surat`),
  CONSTRAINT `tabel_surat_keluar_ibfk_1` FOREIGN KEY (`id_ruangan`) REFERENCES `tabel_ruangan` (`id_ruangan`),
  CONSTRAINT `tabel_surat_keluar_ibfk_2` FOREIGN KEY (`id_kode_surat`) REFERENCES `tabel_kode_surat` (`id_kode_surat`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_surat_keluar: ~0 rows (approximately)
DELETE FROM `tabel_surat_keluar`;
INSERT INTO `tabel_surat_keluar` (`id_surat_keluar`, `id_ruangan`, `id_kode_surat`, `nomor_surat`, `tanggal_surat`, `sifat_surat`, `dokumen_surat`) VALUES
	(1, 1, 5, '1/SPp/UK/IX/2024', '2024-09-09', 'Tugas', '20240909014342_lokasi_kejadian.jpg');

-- Dumping structure for table db_surat_masuk_keluar.tabel_surat_masuk
CREATE TABLE IF NOT EXISTS `tabel_surat_masuk` (
  `id_surat_masuk` int NOT NULL AUTO_INCREMENT,
  `nomor_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perihal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sifat_surat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pengirim` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokumen_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_surat_masuk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_surat_masuk: ~0 rows (approximately)
DELETE FROM `tabel_surat_masuk`;

-- Dumping structure for table db_surat_masuk_keluar.tabel_user
CREATE TABLE IF NOT EXISTS `tabel_user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_user` enum('ADMIN','PETUGAS','PIMPINAN') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table db_surat_masuk_keluar.tabel_user: ~3 rows (approximately)
DELETE FROM `tabel_user`;
INSERT INTO `tabel_user` (`id_user`, `nama_user`, `username_user`, `password_user`, `status_user`) VALUES
	(1, 'admin', 'admin@gmail.com', 'admin', 'ADMIN'),
	(2, 'Muhammad Iqbal', 'iqbal@gmail.com', 'iqbal', 'PETUGAS'),
	(3, 'Muhammad Iqbal Pimpinan', 'pimpinan@gmail.com', 'pimpinan', 'PIMPINAN');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
