-- Biopepti Admin — MySQL schema
-- Run this in MySQL Workbench (File → Open SQL Script → Execute)

CREATE DATABASE IF NOT EXISTS `biopepti`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `biopepti`;

-- -----------------------------------------------------
-- Table: admins (login / profile)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `admins` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `email` VARCHAR(190) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `role` VARCHAR(80) NOT NULL DEFAULT 'Store Admin',
  `initials` VARCHAR(8) NOT NULL DEFAULT 'AD',
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_admins_email` (`email`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: products (catalog)
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `products` (
  `id` VARCHAR(64) NOT NULL,
  `sku` VARCHAR(64) NOT NULL,
  `name` VARCHAR(190) NOT NULL,
  `category` VARCHAR(120) NOT NULL,
  `status` ENUM('active', 'draft') NOT NULL DEFAULT 'active',
  `featured` TINYINT(1) NOT NULL DEFAULT 0,
  `image` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `purity` DECIMAL(5,2) NULL,
  `buy_link` VARCHAR(500) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_products_sku` (`sku`),
  KEY `idx_products_status` (`status`),
  KEY `idx_products_category` (`category`)
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: product_variants (strengths + prices)
-- e.g. 5mg / 10mg / 20mg each with its own price
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_variants` (
  `id` VARCHAR(64) NOT NULL,
  `product_id` VARCHAR(64) NOT NULL,
  `strength` VARCHAR(64) NOT NULL,
  `price` DECIMAL(12,2) NOT NULL,
  `stock` ENUM('in_stock', 'low', 'out_of_stock') NOT NULL DEFAULT 'in_stock',
  `sku` VARCHAR(64) NULL,
  `sort_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_variants_product` (`product_id`),
  CONSTRAINT `fk_variants_product`
    FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;
