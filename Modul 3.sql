-- NAMA  : RIFDAN
-- NIM   : 242421107
-- KELAS : E
-- MODUL : 3

USE kelas_e_mart;

-- =====================================================
-- LATIHAN MANDIRI 1 (ORDER BY)
-- =====================================================

-- Soal 1
SELECT *
FROM tr_penjualan_dqlab
ORDER BY qty, tgl_transaksi;

-- Soal 2
SELECT *
FROM ms_pelanggan
ORDER BY nama_pelanggan;

-- Soal 3
SELECT *
FROM ms_pelanggan
ORDER BY alamat;

-- =====================================================
-- LATIHAN MANDIRI 2 (ASC & DESC)
-- =====================================================

-- Soal 1
SELECT *
FROM tr_penjualan_dqlab
ORDER BY tgl_transaksi DESC, qty ASC;

-- Soal 2
SELECT *
FROM ms_pelanggan
ORDER BY nama_pelanggan DESC;

-- Soal 3
SELECT *
FROM ms_pelanggan
ORDER BY alamat DESC;

-- =====================================================
-- LATIHAN MANDIRI 3 (ORDER BY DENGAN PERHITUNGAN)
-- =====================================================

SELECT nama_produk,
       qty,
       harga,
       diskon,
       (qty * harga - diskon) AS total
FROM tr_penjualan_dqlab
ORDER BY total DESC;

-- =====================================================
-- LATIHAN MANDIRI 4 (WHERE + ORDER BY)
-- =====================================================

-- Soal 1
SELECT *
FROM tr_penjualan_dqlab
WHERE diskon > 0
ORDER BY harga DESC;

-- Soal 2
SELECT nama_produk,
       qty,
       harga
FROM tr_penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;

-- Soal 3
SELECT nama_produk,
       qty,
       harga
FROM tr_penjualan_dqlab
WHERE harga >= 100000
   OR nama_produk LIKE 'T%'
ORDER BY diskon DESC;

-- =====================================================
-- LATIHAN MANDIRI 5 (GROUP BY & HAVING)
-- =====================================================

-- Soal 1
SELECT nama_produk,
       SUM(qty) AS total_qty
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) > 4;

-- Soal 2
SELECT nama_produk,
       SUM(qty) AS total_qty
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) = 9;

-- Soal 3
SELECT nama_produk,
       SUM((qty * harga) - diskon) AS total_penjualan
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY total_penjualan DESC;
