-- ============================================================
-- Biopepti catalog from NCHEN.pdf wholesale kit list
-- Source: biopepti-leanbloom/src/data/products.ts
-- Price rule: sell_price = ROUND(pdf_price * 1.45, 2)
-- Generated: 2026-10-15 14:55:08
-- Products: 71 | Variants/sizes: 145
-- Run in MySQL Workbench against your Biopepti database.
-- WARNING: deletes existing products + variants first.
-- ============================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM product_variants;
DELETE FROM products;

SET FOREIGN_KEY_CHECKS = 1;

-- Tirzepatide (11 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-tirzepatide', 'TR', 'Tirzepatide', 'Weight Management', 'active', 1, NULL, 'Dual GIP/GLP-1 receptor agonist research peptide for metabolic pathway studies.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-tr5', 'prod-tirzepatide', '5mg/vial*10 vials', 43.50, 'in_stock', 'TR5', 0),
  ('var-tr10', 'prod-tirzepatide', '10mg/vial*10 vials', 65.25, 'in_stock', 'TR10', 1),
  ('var-tr15', 'prod-tirzepatide', '15mg/vial*10 vials', 85.55, 'in_stock', 'TR15', 2),
  ('var-tr20', 'prod-tirzepatide', '20mg/vial*10 vials', 108.75, 'in_stock', 'TR20', 3),
  ('var-tr30', 'prod-tirzepatide', '30mg/vial*10 vials', 131.95, 'in_stock', 'TR30', 4),
  ('var-tr40', 'prod-tirzepatide', '40mg/vial*10 vials', 181.25, 'in_stock', 'TR40', 5),
  ('var-tr50', 'prod-tirzepatide', '50mg/vial*10 vials', 210.25, 'in_stock', 'TR50', 6),
  ('var-tr60', 'prod-tirzepatide', '60mg/vial*10 vials', 234.90, 'in_stock', 'TR60', 7),
  ('var-tr80', 'prod-tirzepatide', '80mg/vial*10 vials', 300.15, 'in_stock', 'TR80', 8),
  ('var-tr100', 'prod-tirzepatide', '100mg/vial*10 vials', 365.40, 'in_stock', 'TR100', 9),
  ('var-tr120', 'prod-tirzepatide', '120mg/vial*10 vials', 429.20, 'in_stock', 'TR120', 10);

-- Retatrutide (8 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-retatrutide', 'RT', 'Retatrutide', 'Weight Management', 'active', 1, NULL, 'Triple agonist (GLP-1/GIP/Glucagon) peptide for advanced metabolic research models.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-rt5', 'prod-retatrutide', '5mg/vial*10 vials', 46.40, 'in_stock', 'RT5', 0),
  ('var-rt10', 'prod-retatrutide', '10mg/vial*10 vials', 79.75, 'in_stock', 'RT10', 1),
  ('var-rt15', 'prod-retatrutide', '15mg/vial*10 vials', 113.10, 'in_stock', 'RT15', 2),
  ('var-rt20', 'prod-retatrutide', '20mg/vial*10 vials', 134.85, 'in_stock', 'RT20', 3),
  ('var-rt30', 'prod-retatrutide', '30mg/vial*10 vials', 172.55, 'in_stock', 'RT30', 4),
  ('var-rt40', 'prod-retatrutide', '40mg/vial*10 vials', 188.50, 'in_stock', 'RT40', 5),
  ('var-rt50', 'prod-retatrutide', '50mg/vial*10 vials', 218.95, 'in_stock', 'RT50', 6),
  ('var-rt60', 'prod-retatrutide', '60mg/vial*10 vials', 243.60, 'in_stock', 'RT60', 7);

-- GHK-Cu (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ghk-cu', 'CU', 'GHK-Cu', 'Cosmetic & Peptides', 'active', 1, NULL, 'Copper-binding tripeptide researched for tissue remodeling and cosmetic biology.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cu50', 'prod-ghk-cu', '50mg/vial*10 vials', 42.05, 'in_stock', 'CU50', 0),
  ('var-cu100', 'prod-ghk-cu', '100mg/vial*10 vials', 75.40, 'in_stock', 'CU100', 1);

-- AHK-Cu (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ahk-cu', 'AHK', 'AHK-Cu', 'Cosmetic & Peptides', 'active', 0, NULL, 'Copper peptide analog investigated in dermal and follicular research models.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ahk50', 'prod-ahk-cu', '50mg/vial*10 vials', 55.10, 'in_stock', 'AHK50', 0),
  ('var-ahk100', 'prod-ahk-cu', '100mg/vial*10 vials', 84.10, 'in_stock', 'AHK100', 1);

-- IGF-1 LR3 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-igf-1-lr3', 'IG', 'IGF-1 LR3', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized IGF-1 LR3 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ig01', 'prod-igf-1-lr3', '0.1mg/vial*10 vials', 174.00, 'in_stock', 'IG01', 0),
  ('var-ig1', 'prod-igf-1-lr3', '1mg/vial*10 vials', 239.25, 'in_stock', 'IG1', 1);

-- Semaglutide (7 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-semaglutide', 'SM', 'Semaglutide', 'Weight Management', 'active', 1, NULL, 'Long-acting GLP-1 receptor agonist peptide for glucose and appetite pathway research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-sm5', 'prod-semaglutide', '5mg/vial*10 vials', 78.30, 'in_stock', 'SM5', 0),
  ('var-sm10', 'prod-semaglutide', '10mg/vial*10 vials', 117.45, 'in_stock', 'SM10', 1),
  ('var-sm15', 'prod-semaglutide', '15mg/vial*10 vials', 153.70, 'in_stock', 'SM15', 2),
  ('var-sm20', 'prod-semaglutide', '20mg/vial*10 vials', 192.85, 'in_stock', 'SM20', 3),
  ('var-sm30', 'prod-semaglutide', '30mg/vial*10 vials', 233.45, 'in_stock', 'SM30', 4),
  ('var-sm40', 'prod-semaglutide', '40mg/vial*10 vials', 272.60, 'in_stock', 'SM40', 5),
  ('var-sm50', 'prod-semaglutide', '50mg/vial*10 vials', 303.05, 'in_stock', 'SM50', 6);

-- Cagrilintide (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-cagrilintide', 'CGL', 'Cagrilintide', 'Weight Management', 'active', 1, NULL, 'High-purity lyophilized Cagrilintide research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cgl5', 'prod-cagrilintide', '5mg/vial*10 vials', 176.90, 'in_stock', 'CGL5', 0),
  ('var-cgl10', 'prod-cagrilintide', '10mg/vial*10 vials', 292.90, 'in_stock', 'CGL10', 1);

-- Tesamorelin (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-tesamorelin', 'TSM', 'Tesamorelin', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized Tesamorelin research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-tsm5', 'prod-tesamorelin', '5mg/vial*10 vials', 134.85, 'in_stock', 'TSM5', 0),
  ('var-tsm10', 'prod-tesamorelin', '10mg/vial*10 vials', 223.30, 'in_stock', 'TSM10', 1),
  ('var-tsm20', 'prod-tesamorelin', '20mg/vial*10 vials', 419.05, 'in_stock', 'TSM20', 2);

-- MOTS-C (5 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-mots-c', 'MS', 'MOTS-C', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Mitochondrial-derived peptide researched in metabolic and exercise biology.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ms5', 'prod-mots-c', '5mg/vial*10 vials', 75.40, 'in_stock', 'MS5', 0),
  ('var-ms10', 'prod-mots-c', '10mg/vial*10 vials', 113.10, 'in_stock', 'MS10', 1),
  ('var-ms20', 'prod-mots-c', '20mg/vial*10 vials', 208.80, 'in_stock', 'MS20', 2),
  ('var-ms30', 'prod-mots-c', '30mg/vial*10 vials', 253.75, 'in_stock', 'MS30', 3),
  ('var-ms40', 'prod-mots-c', '40mg/vial*10 vials', 323.35, 'in_stock', 'MS40', 4);

-- AOD9604 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-aod9604', 'AD', 'AOD9604', 'Weight Management', 'active', 1, NULL, 'High-purity lyophilized AOD9604 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-5ad', 'prod-aod9604', '5mg/vial*10 vials', 197.20, 'in_stock', '5AD', 0),
  ('var-10ad', 'prod-aod9604', '10mg/vial*10 vials', 336.40, 'in_stock', '10AD', 1);

-- GHRP-2 (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ghrp-2', 'GHRP2', 'GHRP-2', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized GHRP-2 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-g25', 'prod-ghrp-2', '5mg/vial*10 vials', 69.60, 'in_stock', 'G25', 0),
  ('var-g210', 'prod-ghrp-2', '10mg/vial*10 vials', 108.75, 'in_stock', 'G210', 1),
  ('var-g215', 'prod-ghrp-2', '15mg/vial*10 vials', 139.20, 'in_stock', 'G215', 2);

-- GHRP-6 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ghrp-6', 'GHRP6', 'GHRP-6', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized GHRP-6 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-g65', 'prod-ghrp-6', '5mg/vial*10 vials', 69.60, 'in_stock', 'G65', 0),
  ('var-g610', 'prod-ghrp-6', '10mg/vial*10 vials', 108.75, 'in_stock', 'G610', 1);

-- AICAR (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-aicar', 'AR', 'AICAR', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized AICAR research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ar50', 'prod-aicar', '50mg/vial*10 vials', 197.20, 'in_stock', 'AR50', 0);

-- NAD+ (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-nad', 'NJ', 'NAD+', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Nicotinamide adenine dinucleotide coenzyme for cellular energy and aging research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-nj100', 'prod-nad', '100mg/vial*10 vials', 71.05, 'in_stock', 'NJ100', 0),
  ('var-nj500', 'prod-nad', '500mg/vial*10 vials', 130.50, 'in_stock', 'NJ500', 1),
  ('var-nj1000', 'prod-nad', '1000mg/vial*10 vials', 233.45, 'in_stock', 'NJ1000', 2);

-- HGH 191 AA (5 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-hgh-191-aa', 'HGH191AA', 'HGH 191 AA', 'Growth Hormone & Longevity', 'active', 0, NULL, '191-amino-acid recombinant growth hormone sequence for endocrine research.', 97, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-h10', 'prod-hgh-191-aa', '10iu/vial*10 vials', 66.70, 'in_stock', 'H10', 0),
  ('var-h12', 'prod-hgh-191-aa', '12iu/vial*10 vials', 88.45, 'in_stock', 'H12', 1),
  ('var-h15', 'prod-hgh-191-aa', '15iu/vial*10 vials', 111.65, 'in_stock', 'H15', 2),
  ('var-h24', 'prod-hgh-191-aa', '24iu/vial*10 vials', 174.00, 'in_stock', 'H24', 3),
  ('var-h36', 'prod-hgh-191-aa', '36iu/vial*10 vials', 253.75, 'in_stock', 'H36', 4);

-- HCG (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-hcg', 'HC', 'HCG', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized HCG research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-hc1000', 'prod-hcg', '1000iu/vial*10 vials', 63.80, 'in_stock', 'HC1000', 0),
  ('var-hc2000', 'prod-hcg', '2000iu/vial*10 vials', 101.50, 'in_stock', 'HC2000', 1),
  ('var-hc5000', 'prod-hcg', '5000iu/vial*10 vials', 162.40, 'in_stock', 'HC5000', 2);

-- HMG (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-hmg', 'HM', 'HMG', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized HMG research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-hm75', 'prod-hmg', '75iu/vial*10 vials', 185.60, 'in_stock', 'HM75', 0);

-- BPC-157 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-bpc-157', 'BC', 'BPC-157', 'Recovery & Repair', 'active', 1, NULL, 'Synthetic gastric pentadecapeptide studied in tissue repair and angiogenesis assays.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-bc5', 'prod-bpc-157', '5mg/vial*10 vials', 55.10, 'in_stock', 'BC5', 0),
  ('var-bc10', 'prod-bpc-157', '10mg/vial*10 vials', 97.15, 'in_stock', 'BC10', 1);

-- TB-500 (Thymosin β4 Acetate) (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-tb-500-thymosin-4-acetate', 'BT', 'TB-500 (Thymosin β4 Acetate)', 'Recovery & Repair', 'active', 0, NULL, 'Thymosin β4 fragment researched for cell migration and recovery models.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-bt5', 'prod-tb-500-thymosin-4-acetate', '5mg/vial*10 vials', 117.45, 'in_stock', 'BT5', 0),
  ('var-bt10', 'prod-tb-500-thymosin-4-acetate', '10mg/vial*10 vials', 223.30, 'in_stock', 'BT10', 1);

-- CJC-1295 DAC (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-cjc-1295-dac', 'CD', 'CJC-1295 DAC', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Long-acting GHRH analog with Drug Affinity Complex for sustained GH research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cd5', 'prod-cjc-1295-dac', '5mg/vial*10 vials', 262.45, 'in_stock', 'CD5', 0),
  ('var-cd10', 'prod-cjc-1295-dac', '10mg/vial*10 vials', 479.95, 'in_stock', 'CD10', 1);

-- CJC-1295 No DAC (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-cjc-1295-no-dac', 'CND', 'CJC-1295 No DAC', 'Growth Hormone & Longevity', 'active', 0, NULL, 'GHRH analog without DAC for pulsed growth hormone secretagogue studies.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cnd5', 'prod-cjc-1295-no-dac', '5mg/vial*10 vials', 131.95, 'in_stock', 'CND5', 0),
  ('var-cnd10', 'prod-cjc-1295-no-dac', '10mg/vial*10 vials', 262.45, 'in_stock', 'CND10', 1);

-- Blend: BPC-157 5mg + TB-500 5mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-bpc-157-5mg-tb-500-5mg', 'BB', 'Blend: BPC-157 5mg + TB-500 5mg', 'Recovery & Repair', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-bb10', 'prod-blend-bpc-157-5mg-tb-500-5mg', '(5mg+5mg)/vial*10 vials', 169.65, 'in_stock', 'BB10', 0);

-- Blend: BPC-157 10mg + TB-500 10mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-bpc-157-10mg-tb-500-10mg', 'BB23', 'Blend: BPC-157 10mg + TB-500 10mg', 'Recovery & Repair', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-bb20', 'prod-blend-bpc-157-10mg-tb-500-10mg', '(10mg+10mg)/vial*10 vials', 337.85, 'in_stock', 'BB20', 0);

-- Blend: CJC-1295 No DAC 5mg + Ipamorelin 5mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-cjc-1295-no-dac-5mg-ipamorelin-5mg', 'CP', 'Blend: CJC-1295 No DAC 5mg + Ipamorelin 5mg', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cp10', 'prod-blend-cjc-1295-no-dac-5mg-ipamorelin-5mg', '(5mg+5mg)/vial*10 vials', 181.25, 'in_stock', 'CP10', 0);

-- Blend: BPC-157 10mg + TB-500 10mg + GHK-Cu 50mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-bpc-157-10mg-tb-500-10mg-ghk-cu-50mg', 'GLOW', 'Blend: BPC-157 10mg + TB-500 10mg + GHK-Cu 50mg', 'Recovery & Repair', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-glow70', 'prod-blend-bpc-157-10mg-tb-500-10mg-ghk-cu-50mg', '(10mg+10mg+50mg)/vial*10 vials', 316.10, 'in_stock', 'GLOW70', 0);

-- Blend: BPC-157 10mg + TB-500 10mg + GHK-Cu 50mg + KPV 10mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-bpc-157-10mg-tb-500-10mg-ghk-cu-50mg-kpv-10mg', 'KLOW', 'Blend: BPC-157 10mg + TB-500 10mg + GHK-Cu 50mg + KPV 10mg', 'Recovery & Repair', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-klow80', 'prod-blend-bpc-157-10mg-tb-500-10mg-ghk-cu-50mg-kpv-10mg', '(10mg+10mg+50mg+10mg)/vial*10 vials', 363.95, 'in_stock', 'KLOW80', 0);

-- Selank (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-selank', 'SK', 'Selank', 'Cognitive & Neuro', 'active', 0, NULL, 'Synthetic tuftsin analog researched in anxiolytic and cognitive models.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-sk5', 'prod-selank', '5mg/vial*10 vials', 60.90, 'in_stock', 'SK5', 0),
  ('var-sk10', 'prod-selank', '10mg/vial*10 vials', 116.00, 'in_stock', 'SK10', 1);

-- Epithalon (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-epithalon', 'ET', 'Epithalon', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Tetrapeptide studied in telomere and longevity research applications.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-et10', 'prod-epithalon', '10mg/vial*10 vials', 82.65, 'in_stock', 'ET10', 0),
  ('var-et50', 'prod-epithalon', '50mg/vial*10 vials', 272.60, 'in_stock', 'ET50', 1),
  ('var-et100', 'prod-epithalon', '100mg/vial*10 vials', 506.05, 'in_stock', 'ET100', 2);

-- PT-141 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-pt-141', 'PT141', 'PT-141', 'Cognitive & Neuro', 'active', 0, NULL, 'High-purity lyophilized PT-141 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-p41', 'prod-pt-141', '10mg/vial*10 vials', 116.00, 'in_stock', 'P41', 0);

-- Ipamorelin (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ipamorelin', 'IP', 'Ipamorelin', 'Growth Hormone & Longevity', 'active', 1, NULL, 'Selective growth hormone secretagogue peptide for pituitary research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ip5', 'prod-ipamorelin', '5mg/vial*10 vials', 59.45, 'in_stock', 'IP5', 0),
  ('var-ip10', 'prod-ipamorelin', '10mg/vial*10 vials', 113.10, 'in_stock', 'IP10', 1);

-- DSIP (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-dsip', 'DS', 'DSIP', 'Cognitive & Neuro', 'active', 0, NULL, 'High-purity lyophilized DSIP research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ds5', 'prod-dsip', '5mg/vial*10 vials', 85.55, 'in_stock', 'DS5', 0),
  ('var-ds10', 'prod-dsip', '10mg/vial*10 vials', 126.15, 'in_stock', 'DS10', 1);

-- Semax (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-semax', 'XA', 'Semax', 'Cognitive & Neuro', 'active', 0, NULL, 'ACTH(4-10) analog studied in nootropic and neuroprotective research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-xa5', 'prod-semax', '5mg/vial*10 vials', 59.45, 'in_stock', 'XA5', 0),
  ('var-xa10', 'prod-semax', '10mg/vial*10 vials', 113.10, 'in_stock', 'XA10', 1);

-- Kisspeptin-10 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-kisspeptin-10', 'KS', 'Kisspeptin-10', 'Cognitive & Neuro', 'active', 0, NULL, 'High-purity lyophilized Kisspeptin-10 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ks5', 'prod-kisspeptin-10', '5mg/vial*10 vials', 79.75, 'in_stock', 'KS5', 0),
  ('var-ks10', 'prod-kisspeptin-10', '10mg/vial*10 vials', 136.30, 'in_stock', 'KS10', 1);

-- Thymosin Alpha-1 (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-thymosin-alpha-1', 'TA', 'Thymosin Alpha-1', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized Thymosin Alpha-1 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ta5', 'prod-thymosin-alpha-1', '5mg/vial*10 vials', 178.35, 'in_stock', 'TA5', 0),
  ('var-ta10', 'prod-thymosin-alpha-1', '10mg/vial*10 vials', 262.45, 'in_stock', 'TA10', 1),
  ('var-ta50', 'prod-thymosin-alpha-1', '50mg/vial*10 vials', 996.15, 'in_stock', 'TA50', 2);

-- SLU-PP-332 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-slu-pp-332', 'SLUPP332', 'SLU-PP-332', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized SLU-PP-332 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-332-10', 'prod-slu-pp-332', '10mg/vial*10 vials', 127.60, 'in_stock', '332-10', 0);

-- Melanotan II (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-melanotan-ii', 'ML', 'Melanotan II', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized Melanotan II research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ml10', 'prod-melanotan-ii', '10mg/vial*10 vials', 101.50, 'in_stock', 'ML10', 0);

-- Melanotan I (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-melanotan-i', 'MT', 'Melanotan I', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized Melanotan I research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-mt1', 'prod-melanotan-i', '10mg/vial*10 vials', 92.80, 'in_stock', 'MT1', 0);

-- SS-31 (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ss-31', 'SS31', 'SS-31', 'Growth Hormone & Longevity', 'active', 0, NULL, 'Mitochondria-targeting tetrapeptide for oxidative stress research.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-2s10', 'prod-ss-31', '10mg/vial*10 vials', 150.80, 'in_stock', '2S10', 0),
  ('var-2s20', 'prod-ss-31', '20mg/vial*10 vials', 243.60, 'in_stock', '2S20', 1),
  ('var-2s50', 'prod-ss-31', '50mg/vial*10 vials', 736.60, 'in_stock', '2S50', 2);

-- Melatonin (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-melatonin', 'MT39', 'Melatonin', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized Melatonin research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-mt10', 'prod-melatonin', '10mg/vial*10 vials', 145.00, 'in_stock', 'MT10', 0);

-- Hexarelin (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-hexarelin', 'HX', 'Hexarelin', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized Hexarelin research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-hx5', 'prod-hexarelin', '5mg/vial*10 vials', 178.35, 'in_stock', 'HX5', 0),
  ('var-hx10', 'prod-hexarelin', '10mg/vial*10 vials', 204.45, 'in_stock', 'HX10', 1);

-- Adipotide (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-adipotide', 'AP', 'Adipotide', 'Weight Management', 'active', 0, NULL, 'High-purity lyophilized Adipotide research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ap5', 'prod-adipotide', '5mg/vial*10 vials', 246.50, 'in_stock', 'AP5', 0);

-- Sermorelin Acetate (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-sermorelin-acetate', 'SMO', 'Sermorelin Acetate', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized Sermorelin Acetate research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-smo-5', 'prod-sermorelin-acetate', '5mg/vial*10 vials', 174.00, 'in_stock', 'SMO-5', 0),
  ('var-smo-10', 'prod-sermorelin-acetate', '10mg/vial*10 vials', 261.00, 'in_stock', 'SMO-10', 1);

-- SNAP-8 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-snap-8', 'NP', 'SNAP-8', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized SNAP-8 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-np810', 'prod-snap-8', '10mg/vial*10 vials', 71.05, 'in_stock', 'NP810', 0);

-- Thymalin (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-thymalin', 'TY', 'Thymalin', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized Thymalin research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ty10', 'prod-thymalin', '10mg/vial*10 vials', 150.80, 'in_stock', 'TY10', 0);

-- FOXO4-DRI (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-foxo4-dri', 'FOXO4DRI', 'FOXO4-DRI', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized FOXO4-DRI research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-f410', 'prod-foxo4-dri', '10mg/vial*10 vials', 580.00, 'in_stock', 'F410', 0);

-- LL-37 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ll-37', 'LL37', 'LL-37', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized LL-37 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-375', 'prod-ll-37', '5mg/vial*10 vials', 169.65, 'in_stock', '375', 0);

-- Survodutide (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-survodutide', 'SUR', 'Survodutide', 'Weight Management', 'active', 0, NULL, 'High-purity lyophilized Survodutide research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-sur10', 'prod-survodutide', '10mg/vial*10 vials', 361.05, 'in_stock', 'SUR10', 0);

-- Ara-290 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ara-290', 'RA', 'Ara-290', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized Ara-290 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ra10', 'prod-ara-290', '10mg/vial*10 vials', 155.15, 'in_stock', 'RA10', 0);

-- Dermorphin (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-dermorphin', 'DR', 'Dermorphin', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized Dermorphin research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-dr5', 'prod-dermorphin', '5mg/vial*10 vials', 104.40, 'in_stock', 'DR5', 0);

-- KPV (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-kpv', 'KP', 'KPV', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized KPV research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-kp5', 'prod-kpv', '5mg/vial*10 vials', 59.45, 'in_stock', 'KP5', 0),
  ('var-kp10', 'prod-kpv', '10mg/vial*10 vials', 94.25, 'in_stock', 'KP10', 1);

-- VIP (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-vip', 'VP', 'VIP', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized VIP research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-vp10', 'prod-vip', '10mg/vial*10 vials', 262.45, 'in_stock', 'VP10', 0);

-- Blend: Cagrilintide 5mg + Semaglutide 5mg (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-blend-cagrilintide-5mg-semaglutide-5mg', 'CS', 'Blend: Cagrilintide 5mg + Semaglutide 5mg', 'Weight Management', 'active', 0, NULL, 'Multi-peptide research blend formulated for combined pathway studies. Lyophilized sterile kit.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-cs10', 'prod-blend-cagrilintide-5mg-semaglutide-5mg', '(5mg+5mg)/vial*10 vials', 269.70, 'in_stock', 'CS10', 0);

-- Gonadorelin Acetate (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-gonadorelin-acetate', 'GND', 'Gonadorelin Acetate', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized Gonadorelin Acetate research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-gnd2', 'prod-gonadorelin-acetate', '2mg/vial*10 vials', 78.30, 'in_stock', 'GND2', 0);

-- Bacteriostatic Water (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-bacteriostatic-water', 'BA', 'Bacteriostatic Water', 'Cellular Research', 'active', 0, NULL, 'Sterile bacteriostatic water for research peptide reconstitution.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ba3', 'prod-bacteriostatic-water', '3ml/vial*10 vials', 14.50, 'in_stock', 'BA3', 0),
  ('var-ba10', 'prod-bacteriostatic-water', '10ml/vial*10 vials', 18.85, 'in_stock', 'BA10', 1);

-- Acetic Acid Water (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-acetic-acid-water', 'AAW', 'Acetic Acid Water', 'Cellular Research', 'active', 0, NULL, 'Dilute acetic acid reconstitution solution for selected research peptides.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-aaw3', 'prod-acetic-acid-water', '3ml/vial*10 vials', 14.50, 'in_stock', 'AAW3', 0),
  ('var-aaw10', 'prod-acetic-acid-water', '10ml/vial*10 vials', 18.85, 'in_stock', 'AAW10', 1);

-- Lipo-C B12 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-lipo-c-b12', 'LIPOCB12', 'Lipo-C B12', 'Cellular Research', 'active', 0, NULL, 'High-purity lyophilized Lipo-C B12 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-b12', 'prod-lipo-c-b12', '10ml/vial*10 vials', 116.00, 'in_stock', 'B12', 0);

-- Lemon Bottle (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-lemon-bottle', 'LB', 'Lemon Bottle', 'Weight Management', 'active', 0, NULL, 'High-purity lyophilized Lemon Bottle research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-lb', 'prod-lemon-bottle', '10ml/vial*10 vials', 104.40, 'in_stock', 'LB', 0);

-- Oxytocin Acetate (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-oxytocin-acetate', 'OT', 'Oxytocin Acetate', 'Cognitive & Neuro', 'active', 0, NULL, 'High-purity lyophilized Oxytocin Acetate research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ot5', 'prod-oxytocin-acetate', '5mg/vial*10 vials', 139.20, 'in_stock', 'OT5', 0),
  ('var-ot10', 'prod-oxytocin-acetate', '10mg/vial*10 vials', 166.75, 'in_stock', 'OT10', 1);

-- HGH Fragment 176-191 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-hgh-fragment-176-191', 'FR', 'HGH Fragment 176-191', 'Weight Management', 'active', 0, NULL, 'High-purity lyophilized HGH Fragment 176-191 research peptide kit. HPLC/MS verified for laboratory use only.', 97, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-fr5', 'prod-hgh-fragment-176-191', '5mg/vial*10 vials', 168.20, 'in_stock', 'FR5', 0);

-- 5-Amino-1MQ (3 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-5-amino-1mq', 'AM', '5-Amino-1MQ', 'Weight Management', 'active', 0, NULL, 'High-purity lyophilized 5-Amino-1MQ research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-5am', 'prod-5-amino-1mq', '5mg/vial*10 vials', 75.40, 'in_stock', '5AM', 0),
  ('var-10am', 'prod-5-amino-1mq', '10mg/vial*10 vials', 108.75, 'in_stock', '10AM', 1),
  ('var-50am', 'prod-5-amino-1mq', '50mg/vial*10 vials', 153.70, 'in_stock', '50AM', 2);

-- MGF (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-mgf', 'FM', 'MGF', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized MGF research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-fm2', 'prod-mgf', '2mg/vial*10 vials', 97.15, 'in_stock', 'FM2', 0);

-- PEG-MGF (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-peg-mgf', 'FMP', 'PEG-MGF', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized PEG-MGF research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-fmp2', 'prod-peg-mgf', '2mg/vial*10 vials', 168.20, 'in_stock', 'FMP2', 0);

-- Glutathione (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-glutathione', 'GTT', 'Glutathione', 'Recovery & Repair', 'active', 0, NULL, 'High-purity lyophilized Glutathione research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-gtt600', 'prod-glutathione', '600mg/vial*10 vials', 69.60, 'in_stock', 'GTT600', 0),
  ('var-gtt1500', 'prod-glutathione', '1500mg/vial*10 vials', 113.10, 'in_stock', 'GTT1500', 1);

-- Semaglutide (cartridge) (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-semaglutide-cartridge', 'SMK', 'Semaglutide (cartridge)', 'Weight Management', 'active', 0, NULL, 'Pre-filled research cartridge presentation (pen not included). For laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-smk2', 'prod-semaglutide-cartridge', '2mg/cartridge*10 cartridges', 269.70, 'in_stock', 'SMK2', 0),
  ('var-smk5', 'prod-semaglutide-cartridge', '5mg/cartridge*10 cartridges', 337.85, 'in_stock', 'SMK5', 1);

-- Tirzepatide (cartridge) (4 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-tirzepatide-cartridge', 'TRK', 'Tirzepatide (cartridge)', 'Weight Management', 'active', 0, NULL, 'Pre-filled research cartridge presentation (pen not included). For laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-trk2', 'prod-tirzepatide-cartridge', '2.5mg/cartridge*10 cartridges', 303.05, 'in_stock', 'TRK2', 0),
  ('var-trk5', 'prod-tirzepatide-cartridge', '5mg/cartridge*10 cartridges', 384.25, 'in_stock', 'TRK5', 1),
  ('var-trk10', 'prod-tirzepatide-cartridge', '10mg/cartridge*10 cartridges', 510.40, 'in_stock', 'TRK10', 2),
  ('var-trk15', 'prod-tirzepatide-cartridge', '15mg/cartridge*10 cartridges', 639.45, 'in_stock', 'TRK15', 3);

-- Follistatin 344 (2 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-follistatin-344', 'FS344', 'Follistatin 344', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized Follistatin 344 research peptide kit. HPLC/MS verified for laboratory use only.', 95, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-fs344-1', 'prod-follistatin-344', '1mg/vial*10 vials', 524.90, 'in_stock', 'FS344-1', 0),
  ('var-fs344-2', 'prod-follistatin-344', '2mg/vial*10 vials', 980.20, 'in_stock', 'FS344-2', 1);

-- Matrixyl 3000 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-matrixyl-3000', 'MATRIXYL3000', 'Matrixyl 3000', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized Matrixyl 3000 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-m3000', 'prod-matrixyl-3000', '10mg/vial*10 vials', 504.60, 'in_stock', 'M3000', 0);

-- Oligopeptide-24 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-oligopeptide-24', 'OP', 'Oligopeptide-24', 'Cosmetic & Peptides', 'active', 0, NULL, 'High-purity lyophilized Oligopeptide-24 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-op-24', 'prod-oligopeptide-24', '10mg/vial*10 vials', 104.40, 'in_stock', 'OP-24', 0);

-- ACE-031 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-ace-031', 'ACE', 'ACE-031', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized ACE-031 research peptide kit. HPLC/MS verified for laboratory use only.', 95, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-ace031', 'prod-ace-031', '1mg/vial*10 vials', 524.90, 'in_stock', 'ACE031', 0);

-- GDF-8 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-gdf-8', 'GDF', 'GDF-8', 'Growth Hormone & Longevity', 'active', 0, NULL, 'High-purity lyophilized GDF-8 research peptide kit. HPLC/MS verified for laboratory use only.', 95, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-gdf-8', 'prod-gdf-8', '1mg/vial*10 vials', 527.80, 'in_stock', 'GDF-8', 0);

-- PNC-27 (1 sizes)
INSERT INTO products (id, sku, name, category, status, featured, image, description, purity, buy_link, created_at, updated_at) VALUES
  ('prod-pnc-27', 'PNC', 'PNC-27', 'Cognitive & Neuro', 'active', 0, NULL, 'High-purity lyophilized PNC-27 research peptide kit. HPLC/MS verified for laboratory use only.', 99, NULL, '2026-10-15 14:55:08', '2026-10-15 14:55:08');
INSERT INTO product_variants (id, product_id, strength, price, stock, sku, sort_order) VALUES
  ('var-pnc27', 'prod-pnc-27', '10mg/vial*10 vials', 104.40, 'in_stock', 'PNC27', 0);

-- Verify counts
SELECT COUNT(*) AS products FROM products;
SELECT COUNT(*) AS variants FROM product_variants;
SELECT p.name, v.sku, v.strength, v.price FROM products p JOIN product_variants v ON v.product_id = p.id ORDER BY p.name, v.sort_order LIMIT 25;