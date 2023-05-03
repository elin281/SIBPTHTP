MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> select produk.*, jenis_produk.nama as jenis from jenis_produk inner join
    -> produk on produk.jenis_produk_id = jenis_produk.id;
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
6 rows in set (0.215 sec)

MariaDB [dbtoko]> select p.*, j.nama as jenis from jenis_produk j inner join
    -> produk p on p.jenis_produk_id = j.id;
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
6 rows in set (0.002 sec)

MariaDB [dbtoko]> create view detail_produk_vw as select p.*, j.nama as jenis from jenis_produk j
    -> inner join produk p on p.jenis_produk_id = j.id;
Query OK, 0 rows affected (0.018 sec)

MariaDB [dbtoko]> select * from detail_produk_vw;
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
6 rows in set (0.006 sec)

MariaDB [dbtoko]> start transaction;
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbtoko]> insert into pesanan(tanggal, total, pelanggan_id) values (2023-02-01,200000,1);
Query OK, 1 row affected, 1 warning (0.067 sec)

MariaDB [dbtoko]> commit;
Query OK, 0 rows affected (0.001 sec)

MariaDB [dbtoko]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> start transaction;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> delete from pesanan;
Query OK, 1 row affected (0.003 sec)

MariaDB [dbtoko]> select * from pesanan;
Empty set (0.000 sec)

MariaDB [dbtoko]> rollback;
Query OK, 0 rows affected (0.070 sec)

MariaDB [dbtoko]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 0000-00-00 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.002 sec)

MariaDB [dbtoko]> start transaction;
Query OK, 0 rows affected (0.000 sec)

MariaDB [dbtoko]> savepoint update_tanggal;
Query OK, 0 rows affected (0.016 sec)

MariaDB [dbtoko]> update pesanan set tanggal = '2023-03-04' where id = 1;
Query OK, 1 row affected (0.005 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-04 | 200000 |            1 |
+----+------------+--------+--------------+
1 row in set (0.000 sec)

MariaDB [dbtoko]> commit;
Query OK, 0 rows affected (0.003 sec)

MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> select * from produk;
    -> $$
+----+------+--------------+------------+------------+------+----------+-----------------+
| id | kode | nama         | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch   |    5000000 |    5500000 |    2 |        2 |               1 |
|  6 | TV02 | TV 21 inch   |    3000000 |    3500000 |   10 |        3 |               1 |
|  7 | K001 | Kulkas       |    9500000 |   10000000 |    5 |        3 |               1 |
|  8 | M001 | Meja Makan   |    1500000 |    2000000 |    4 |        2 |               4 |
|  9 | T001 | Taro Pop Ice |       8500 |      10000 |    3 |        2 |               2 |
| 10 | TK01 | Teh Kotak    |       3000 |       5000 |    5 |       10 |               3 |
+----+------+--------------+------------+------------+------+----------+-----------------+
6 rows in set (0.002 sec)

MariaDB [dbtoko]> create procedure showProduk()
    -> begin
    -> select nama, harga_beli, harga_jual from produk;
    -> end
    -> $$
Query OK, 0 rows affected (0.151 sec)

MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call showProduk();
+--------------+------------+------------+
| nama         | harga_beli | harga_jual |
+--------------+------------+------------+
| TV 42 inch   |    5000000 |    5500000 |
| TV 21 inch   |    3000000 |    3500000 |
| Kulkas       |    9500000 |   10000000 |
| Meja Makan   |    1500000 |    2000000 |
| Taro Pop Ice |       8500 |      10000 |
| Teh Kotak    |       3000 |       5000 |
+--------------+------------+------------+
6 rows in set (0.005 sec)

Query OK, 0 rows affected (0.517 sec)

MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure addPesanan(tanggal date, total double, pelanggan_id int)
    -> begin
    -> insert into pesanan (tanggal, total, pelanggan_id) values (tanggal, total, pelanggan_id);
    -> end$$
Query OK, 0 rows affected (0.019 sec)

MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call addPesanan('2022-02-02',30000,3);
Query OK, 1 row affected (0.014 sec)

MariaDB [dbtoko]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-04 | 200000 |            1 |
|  2 | 2022-02-02 |  30000 |            3 |
+----+------------+--------+--------------+
2 rows in set (0.008 sec)

MariaDB [dbtoko]> show procedure status;
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db     | Name       | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| dbtoko | addPesanan | PROCEDURE | root@localhost | 2023-05-03 10:27:56 | 2023-05-03 10:27:56 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_general_ci |
| dbtoko | showProduk | PROCEDURE | root@localhost | 2023-05-03 10:20:22 | 2023-05-03 10:20:22 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_general_ci |
+--------+------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
2 rows in set (0.089 sec)

MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure addJenis_produk(nama varchar(20), ket varchar(50))
    -> begin
    -> insert into jenis_produk(nama, ket) values(nama, ket);
    -> end$$
Query OK, 0 rows affected (0.036 sec)

MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call addJenis_produk('Alat Kebersihan','Tersedia');
Query OK, 1 row affected (0.013 sec)

MariaDB [dbtoko]> select * from jenis_produk;
+----+-----------------+---------------+
| id | nama            | ket           |
+----+-----------------+---------------+
|  1 | Elektronik      | Tersedia      |
|  2 | Makanan         | Tersedia      |
|  3 | Minuman         | Tidak Tesedia |
|  4 | Furniture       | Tersedia      |
|  5 | Alat Kebersihan | Tersedia      |
+----+-----------------+---------------+
5 rows in set (0.005 sec)

MariaDB [dbtoko]>