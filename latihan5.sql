MariaDB [dbtoko]> select produk.*, jenis_produk.* from produk inner join
    -> jenis_produk on produk.jenis_produk_id = jenis_produk.id;
+----+------+--------------+------------+------------+------+----------+-----------------+----+------------+---------------+
| id | kode | nama         | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | id | nama       | ket           |
+----+------+--------------+------------+------------+------+----------+-----------------+----+------------+---------------+
|  5 | TV01 | TV 42 inch   |    5000000 |    5500000 |    2 |        2 |               1 |  1 | Elektronik | Tersedia      |
|  6 | TV02 | TV 21 inch   |    3000000 |    3500000 |   10 |        3 |               1 |  1 | Elektronik | Tersedia      |
|  7 | K001 | Kulkas       |    9500000 |   10000000 |    5 |        3 |               1 |  1 | Elektronik | Tersedia      |
|  8 | M001 | Meja Makan   |    1500000 |    2000000 |    4 |        2 |               4 |  4 | Furniture  | Tersedia      |
|  9 | T001 | Taro Pop Ice |       8500 |      10000 |    3 |        2 |               2 |  2 | Makanan    | Tersedia      |
| 10 | TK01 | Teh Kotak    |       3000 |       5000 |    5 |       10 |               3 |  3 | Minuman    | Tidak Tesedia |
+----+------+--------------+------------+------------+------+----------+-----------------+----+------------+---------------+
6 rows in set (0.001 sec)

MariaDB [dbtoko]> select produk.*, jenis_produk.nama as jenis from produk inner join
    -> jenis_produk on produk.jenis_produk_id = jenis_produk.id;
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama         | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
|  5 | TV01 | TV 42 inch   |    5000000 |    5500000 |    2 |        2 |               1 | Elektronik |
|  6 | TV02 | TV 21 inch   |    3000000 |    3500000 |   10 |        3 |               1 | Elektronik |
|  7 | K001 | Kulkas       |    9500000 |   10000000 |    5 |        3 |               1 | Elektronik |
|  8 | M001 | Meja Makan   |    1500000 |    2000000 |    4 |        2 |               4 | Furniture  |
|  9 | T001 | Taro Pop Ice |       8500 |      10000 |    3 |        2 |               2 | Makanan    |
| 10 | TK01 | Teh Kotak    |       3000 |       5000 |    5 |       10 |               3 | Minuman    |
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.051 sec)

MariaDB [dbtoko]> select produk.*, jenis_produk.nama as jenis from produk left join
    -> jenis_produk on produk.jenis_produk_id = jenis_produk.id;
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
| id | kode | nama         | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
|  5 | TV01 | TV 42 inch   |    5000000 |    5500000 |    2 |        2 |               1 | Elektronik |
|  6 | TV02 | TV 21 inch   |    3000000 |    3500000 |   10 |        3 |               1 | Elektronik |
|  7 | K001 | Kulkas       |    9500000 |   10000000 |    5 |        3 |               1 | Elektronik |
|  8 | M001 | Meja Makan   |    1500000 |    2000000 |    4 |        2 |               4 | Furniture  |
|  9 | T001 | Taro Pop Ice |       8500 |      10000 |    3 |        2 |               2 | Makanan    |
| 10 | TK01 | Teh Kotak    |       3000 |       5000 |    5 |       10 |               3 | Minuman    |
+----+------+--------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.005 sec)

MariaDB [dbtoko]> select produk.*, jenis_produk.nama as jenis from produk right join
    -> jenis_produk on produk.jenis_produk_id = jenis_produk.id;
+------+------+--------------+------------+------------+------+----------+-----------------+------------+
| id   | kode | nama         | harga_beli | harga_jual | stok | min_stok | jenis_produk_id | jenis      |
+------+------+--------------+------------+------------+------+----------+-----------------+------------+
|    5 | TV01 | TV 42 inch   |    5000000 |    5500000 |    2 |        2 |               1 | Elektronik |
|    6 | TV02 | TV 21 inch   |    3000000 |    3500000 |   10 |        3 |               1 | Elektronik |
|    7 | K001 | Kulkas       |    9500000 |   10000000 |    5 |        3 |               1 | Elektronik |
|    8 | M001 | Meja Makan   |    1500000 |    2000000 |    4 |        2 |               4 | Furniture  |
|    9 | T001 | Taro Pop Ice |       8500 |      10000 |    3 |        2 |               2 | Makanan    |
|   10 | TK01 | Teh Kotak    |       3000 |       5000 |    5 |       10 |               3 | Minuman    |
+------+------+--------------+------------+------------+------+----------+-----------------+------------+
6 rows in set (0.026 sec)

MariaDB [dbtoko]> select jenis_produk.nama as kategori, sum(produk.stok) as total_stok from jenis_produk
    -> left join produk on jenis_produk.id = produk.jenis_produk_id;
+------------+------------+
| kategori   | total_stok |
+------------+------------+
| Elektronik |         29 |
+------------+------------+
1 row in set (0.004 sec)

MariaDB [dbtoko]> select pesanan.*, pelanggan.kartu_id as kartu from pesanan left join
    -> pelanggan on pesanan.pelanggan_id = pelanggan.id;
Empty set (0.117 sec)

MariaDB [dbtoko]> select pesanan.*, pelanggan.kartu_id as kartu from pesanan right join
    -> pelanggan on pesanan.pelanggan_id = pelanggan.id;
+------+---------+-------+--------------+-------+
| id   | tanggal | total | pelanggan_id | kartu |
+------+---------+-------+--------------+-------+
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     2 |
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     1 |
| NULL | NULL    |  NULL |         NULL |     2 |
+------+---------+-------+--------------+-------+
6 rows in set (0.001 sec)