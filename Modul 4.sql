-- NAMA  : RIFDAN
-- NIM   : 242421107
-- KELAS : E
-- MODUL : 4

USE kelas_e_mart;

-- =====================================================
-- LATIHAN MANDIRI MODUL 4
-- =====================================================

-- Soal 1
-- Join 3 tabel menggunakan INNER JOIN

SELECT tp.kode_pelanggan,
       mp.nama_pelanggan,
       mpd.kategori_produk,
       mpd.nama_produk,
       tp.qty
FROM tr_penjualan_dqlab tp
INNER JOIN ms_pelanggan_dqlab mp
ON tp.kode_pelanggan = mp.kode_pelanggan
INNER JOIN ms_produk_dqlab mpd
ON tp.kode_produk = mpd.kode_produk;

-- =====================================================

-- Soal 2
-- LEFT JOIN + Filter qty tidak NULL

SELECT tp.kode_pelanggan,
       mp.nama_pelanggan,
       mpd.kategori_produk,
       mpd.nama_produk,
       tp.qty
FROM ms_pelanggan_dqlab mp
LEFT JOIN tr_penjualan_dqlab tp
ON mp.kode_pelanggan = tp.kode_pelanggan
LEFT JOIN ms_produk_dqlab mpd
ON tp.kode_produk = mpd.kode_produk
WHERE tp.qty IS NOT NULL;

-- =====================================================

-- Soal 3
-- INNER JOIN + GROUP BY + SUM

SELECT mpd.kategori_produk,
       SUM(tp.qty) AS total_qty
FROM tr_penjualan_dqlab tp
INNER JOIN ms_pelanggan_dqlab mp
ON tp.kode_pelanggan = mp.kode_pelanggan
INNER JOIN ms_produk_dqlab mpd
ON tp.kode_produk = mpd.kode_produk
GROUP BY mpd.kategori_produk;

-- =====================================================

-- Soal 4
-- Self JOIN pada tabel ms_produk

SELECT p1.kode_produk,
       p1.nama_produk,
       p2.kode_produk,
       p2.nama_produk
FROM ms_produk_dqlab p1
INNER JOIN ms_produk_dqlab p2
ON p1.kode_produk = p2.kode_produk;
