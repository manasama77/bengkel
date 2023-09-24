/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80100 (8.1.0)
 Source Host           : localhost:3306
 Source Schema         : bengkel

 Target Server Type    : MySQL
 Target Server Version : 80100 (8.1.0)
 File Encoding         : 65001

 Date: 24/09/2023 16:51:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for gajis
-- ----------------------------
DROP TABLE IF EXISTS `gajis`;
CREATE TABLE `gajis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `karyawan_id` bigint UNSIGNED NOT NULL,
  `nominal` decimal(19, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gajis
-- ----------------------------
INSERT INTO `gajis` VALUES (1, 2, 38.00, '2023-09-24 09:46:49', '2023-09-24 09:46:49', NULL, NULL);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parrent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for karyawans
-- ----------------------------
DROP TABLE IF EXISTS `karyawans`;
CREATE TABLE `karyawans`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` enum('l','p') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `updated_by` bigint UNSIGNED NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of karyawans
-- ----------------------------
INSERT INTO `karyawans` VALUES (1, 'Minim velit assumen', 'l', '+1 (293) 122-6702', 'Hic delectus et rep', '72', 'Incididunt ipsum seq', 1, 1, NULL, '2023-09-16 17:59:57', '2023-09-16 18:12:59', '2023-09-16 18:12:59');
INSERT INTO `karyawans` VALUES (2, 'Adam Karyawan', 'l', '082114578976', 'test', '123456789', 'BE CE A', 1, 1, NULL, '2023-09-16 18:12:04', '2023-09-16 18:13:32', NULL);

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES (1, 'Tools', 'label', 'tools', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `kategori` VALUES (2, 'Material', 'label', 'material', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `kategori` VALUES (3, 'Furnitur', 'label', 'furnitur', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `kategori` VALUES (4, 'Aksesoris', 'label', 'aksesoris', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `kategori` VALUES (5, 'Listrik', 'label', 'listrik', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `kategori` VALUES (6, 'Lainnya', 'label', 'lainnya', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parrent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of label
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_02_19_012158_create_settings_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_02_22_014329_create_kategori_table', 1);
INSERT INTO `migrations` VALUES (7, '2022_02_22_084924_create_portofolio_table', 1);
INSERT INTO `migrations` VALUES (8, '2022_02_22_085102_create_label_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_02_22_085112_create_image_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_03_07_143337_create_produk_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_03_07_143618_create_produkdetail_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_03_07_144322_create_pelanggan_table', 1);
INSERT INTO `migrations` VALUES (13, '2022_03_07_144520_create_transaksi_table', 1);
INSERT INTO `migrations` VALUES (14, '2022_03_07_144921_create_transaksidetail_table', 1);
INSERT INTO `migrations` VALUES (15, '2022_03_08_043703_create_restok_table', 1);
INSERT INTO `migrations` VALUES (16, '2022_03_17_055044_add_bank_on_settings_table', 1);
INSERT INTO `migrations` VALUES (17, '2022_03_19_070852_add_desc_on_settings_table', 1);
INSERT INTO `migrations` VALUES (18, '2022_06_12_130348_add_some_field_on_transaksi_table', 1);
INSERT INTO `migrations` VALUES (19, '2023_09_11_170131_create_karyawans_table', 1);
INSERT INTO `migrations` VALUES (21, '2023_09_24_091111_create_gajis_table', 2);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
INSERT INTO `pelanggan` VALUES (1, 'Salmon', 'Laki-laki', 'malang', '08123456789', '3', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `pelanggan` VALUES (2, 'Sri', 'Perempuan', 'malang', '08123456799', '4', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `pelanggan` VALUES (3, 'Joko', 'Laki-laki', 'malang', '08234123123', '5', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for portofolio
-- ----------------------------
DROP TABLE IF EXISTS `portofolio`;
CREATE TABLE `portofolio`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tahun` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `github` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `demo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of portofolio
-- ----------------------------

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_jual` int NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `berat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '100',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (1, 'Paku kayu tembok dinding', 14000, 'paku-kayu-tembok-dinding', 'Kondisi: Baru, Berat:50gr', 'Gram', NULL, '2023-09-16 17:59:44', '2023-09-16 17:59:44', '100');
INSERT INTO `produk` VALUES (2, 'Keramik 40x40 krem ivory motif marble marmer asap', 42000, 'keramik-40x40-krem-ivory-motif-marble-marmer-asap', 'Kondisi: Baru, Berat :200gr', 'Gram', NULL, '2023-09-16 17:59:44', '2023-09-16 17:59:44', '100');
INSERT INTO `produk` VALUES (3, 'Tang toho professional cutting pliers 7 kualitas bagus', 105000, 'tang-toho-professional-cutting-pliers-7-kualitas-bagus', 'Kondisi: Baru, Berat:500gr', 'Pcs', NULL, '2023-09-16 17:59:44', '2023-09-16 17:59:44', '100');
INSERT INTO `produk` VALUES (4, 'Palu Tukang kombinasi konde bulat kambing pencabut Paku', 27000, 'palu-tukang-kombinasi-konde-bulat-kambing-pencabut-paku', 'Kondisi: Baru, Berat:450gr', 'Pcs', NULL, '2023-09-16 17:59:44', '2023-09-16 17:59:44', '100');

-- ----------------------------
-- Table structure for produkdetail
-- ----------------------------
DROP TABLE IF EXISTS `produkdetail`;
CREATE TABLE `produkdetail`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `produk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `jml` int NOT NULL,
  `restok_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produkdetail
-- ----------------------------
INSERT INTO `produkdetail` VALUES (1, '1', 14000, 14000, 0, '1', '2023-09-16 18:50:25', '2023-09-16 18:50:14', '2023-09-16 18:50:25');
INSERT INTO `produkdetail` VALUES (2, '2', 42000, 42000, 0, '1', '2023-09-16 18:50:25', '2023-09-16 18:50:14', '2023-09-16 18:50:25');
INSERT INTO `produkdetail` VALUES (3, '3', 105000, 105000, 0, '1', '2023-09-16 18:50:25', '2023-09-16 18:50:14', '2023-09-16 18:50:25');
INSERT INTO `produkdetail` VALUES (4, '4', 27000, 27000, 0, '1', '2023-09-16 18:50:25', '2023-09-16 18:50:14', '2023-09-16 18:50:25');
INSERT INTO `produkdetail` VALUES (5, '1', 14000, 14000, 100, '2', NULL, '2023-09-16 18:50:49', '2023-09-16 18:50:49');
INSERT INTO `produkdetail` VALUES (6, '2', 42000, 42000, 100, '2', NULL, '2023-09-16 18:50:49', '2023-09-16 18:50:49');
INSERT INTO `produkdetail` VALUES (7, '3', 105000, 105000, 100, '2', NULL, '2023-09-16 18:50:49', '2023-09-16 18:50:49');
INSERT INTO `produkdetail` VALUES (8, '4', 27000, 27000, 100, '2', NULL, '2023-09-16 18:50:49', '2023-09-16 18:50:49');

-- ----------------------------
-- Table structure for restok
-- ----------------------------
DROP TABLE IF EXISTS `restok`;
CREATE TABLE `restok`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kodetrans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `namatoko` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tglbeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalbayar` int NOT NULL,
  `penanggungjawab` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of restok
-- ----------------------------
INSERT INTO `restok` VALUES (1, 'cc21207e-525c-3b5d-ac14-ffe803b04570', 'TEST', '2023-09-16', 0, 'ada deh', '2023-09-16 18:50:25', '2023-09-16 18:50:14', '2023-09-16 18:50:25');
INSERT INTO `restok` VALUES (2, 'b9cc632c-4cb0-3ca7-a630-2baebcc80ba8', 'test', '2023-09-16', 18800000, 'test', NULL, '2023-09-16 18:50:49', '2023-09-16 18:50:49');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `app_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `app_namapendek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `paginationjml` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lembaga_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lembaga_jalan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lembaga_telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lembaga_kota` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `lembaga_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `bank_rekening` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'Nama App', 'Bae', '10', 'PT Baemon Indonesia', 'Jl.Raya Ramai Sekali No 2 Kav. B', '0341-123456', 'Malang', 'assets/upload/logo.png', '2023-09-16 17:59:43', '2023-09-16 17:59:43', 'Bank BRI', '5252-123456-123', 'Termurah, Terpercaya dan Terlengkap.', 'Semua ada semua bisa.');

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `kodetrans` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelanggan_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pelanggan_tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaksi_tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tglbeli` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ppn` int NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_konfirmasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `totalbayar` int NOT NULL,
  `penanggungjawab` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dibayar` int NULL DEFAULT NULL,
  `kembalian` int NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provinsi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '11',
  `city_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '255',
  `weight` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '100',
  `courir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'jne',
  `ongkir` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `totaltagihan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  `telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (1, '4576dedd-a33a-35c6-a7b1-4bbbbde9a00d', 'test', 'nonmember', 'offline', NULL, '2023-09-16', NULL, 'success', NULL, 38000, 'test', NULL, NULL, NULL, '2023-09-16 19:07:31', '2023-09-16 19:11:59', '11', '255', '200', 'jne', '10000', '28000', NULL);

-- ----------------------------
-- Table structure for transaksidetail
-- ----------------------------
DROP TABLE IF EXISTS `transaksidetail`;
CREATE TABLE `transaksidetail`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaksi_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `produk_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_jual` int NOT NULL,
  `jml` int NOT NULL,
  `diskon` int NOT NULL,
  `harga_akhir` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jml_berat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '100',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksidetail
-- ----------------------------
INSERT INTO `transaksidetail` VALUES (1, '1', '1', 14000, 2, 0, 14000, NULL, '2023-09-16 19:07:31', '2023-09-16 19:07:31', '100');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nomerinduk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tipeuser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', 'admin', '123', 'admin', NULL, '$2y$10$8p0BhtSqmmEEOmzoLsJuZuWrIXZt5ngHDu3R9AYaLySp6DgkqZ6i2', NULL, '2023-09-16 17:59:43', '2023-09-24 09:09:34');
INSERT INTO `users` VALUES (2, 'Owner', 'owner@gmail.com', 'owner', '123', 'owner', NULL, '$2y$10$UV1Ntzbi4N0iIgxNmKFYluUpW54G2vmHIDQ0VcRw4o7nq7wQG1Wkq', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `users` VALUES (3, 'Salmon', 'pelanggan@gmail.com', 'pelanggan', NULL, 'pelanggan', NULL, '$2y$10$L7f9l5y4v3wX7H2.xuqfX.EgiCxkpe.nUCpBY7q0O1zgWRMdVqpw6', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `users` VALUES (4, 'Sri', 'sri@gmail.com', 'sri', NULL, 'pelanggan', NULL, '$2y$10$bDVeIFzGZy9.jDEJbJBxgeFE1xL0KKu8SQjdTkXUjHMNtVppiupo.', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');
INSERT INTO `users` VALUES (5, 'Joko', 'joko@gmail.com', 'joko', NULL, 'pelanggan', NULL, '$2y$10$B2diPq7E9LqjjR1G3GIL3.sYDlGPfPD4hz9ce4Lx66EZEuxqRxhrm', NULL, '2023-09-16 17:59:43', '2023-09-16 17:59:43');

SET FOREIGN_KEY_CHECKS = 1;
