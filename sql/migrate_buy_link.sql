-- Run once in Workbench if products table already exists without buy_link
USE `biopepti`;

ALTER TABLE `products`
  ADD COLUMN `buy_link` VARCHAR(500) NULL AFTER `purity`;
