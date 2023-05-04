MariaDB [dbtoko]> show tables;
+-------------------+
| Tables_in_dbtoko  |
+-------------------+
| detail_produk_vw  |
| jenis_produk      |
| kartu             |
| pelanggan         |
| pembayaran        |
| pembelian         |
| pesanan           |
| pesanan_items     |
| pesanan_produk    |
| pesanan_produk_vw |
| produk            |
| vendor            |
+-------------------+
12 rows in set (0.002 sec)

MariaDB [dbtoko]> select * from produk;
+----+------+--------------------+------------+------------+------+----------+-----------------+
| id | kode | nama               | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch         |    5000000 |    5500000 |    2 |        2 |               1 |
|  6 | TV02 | TV 21 inch         |    3000000 |    3500000 |   10 |        3 |               1 |
|  7 | K001 | Kulkas             |    9500000 |   10000000 |    5 |        3 |               1 |
|  8 | M001 | Meja Makan         |    1500000 |    2000000 |    4 |        2 |               4 |
|  9 | T001 | Taro Pop Ice       |       8500 |      10000 |    3 |        2 |               2 |
| 10 | TK01 | Teh Kotak          |       3000 |       5000 |    5 |       10 |               3 |
| 11 | KA01 | Kipas Angin Cosmos |     500000 |     550000 |    6 |        5 |               1 |
+----+------+--------------------+------------+------------+------+----------+-----------------+
7 rows in set (0.001 sec)

MariaDB [dbtoko]> select * from pesanan;
+----+------------+--------+--------------+
| id | tanggal    | total  | pelanggan_id |
+----+------------+--------+--------------+
|  1 | 2023-03-04 | 200000 |            1 |
|  2 | 2023-04-03 |  30000 |            3 |
|  3 | 2022-05-05 | 105000 |            2 |
|  4 | 2022-04-04 |  50000 |            4 |
+----+------------+--------+--------------+
4 rows in set (0.001 sec)

MariaDB [dbtoko]> desc pesanan_items;
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| id         | int(11) | NO   | PRI | NULL    | auto_increment |
| produk_id  | int(11) | NO   |     | NULL    |                |
| pesanan_id | int(11) | NO   |     | NULL    |                |
| qty        | int(11) | NO   |     | NULL    |                |
| harga      | double  | NO   |     | NULL    |                |
+------------+---------+------+-----+---------+----------------+
5 rows in set (0.035 sec)

MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create trigger keranjang_pesanan_items before insert on pesanan_items
    -> for each row
    -> begin
    -> set @stok = (select stok from produk where id = new.produk_id);
    -> set @sisa = @stok - new.qty;
    -> if @sisa < 0 then
    -> signal sqlstate '45000' set message_text = 'Warning: Stok tidak cukup';
    -> end if;
    -> update produk set stok = @sisa where id = new.produk_id;
    -> end
    -> $$
Query OK, 0 rows affected (0.043 sec)

MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> select * from pesanan_items;
Empty set (0.005 sec)

MariaDB [dbtoko]> insert into pesanan_items (produk_id, pesanan_id, qty, harga) values
    -> (5,1,1,5500000);
Query OK, 1 row affected (0.003 sec)

MariaDB [dbtoko]> select * from pesanan_items;
+----+-----------+------------+-----+---------+
| id | produk_id | pesanan_id | qty | harga   |
+----+-----------+------------+-----+---------+
|  1 |         5 |          1 |   1 | 5500000 |
+----+-----------+------------+-----+---------+
1 row in set (0.034 sec)

MariaDB [dbtoko]> select * from produk;
+----+------+--------------------+------------+------------+------+----------+-----------------+
| id | kode | nama               | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch         |    5000000 |    5500000 |    1 |        2 |               1 |
|  6 | TV02 | TV 21 inch         |    3000000 |    3500000 |   10 |        3 |               1 |
|  7 | K001 | Kulkas             |    9500000 |   10000000 |    5 |        3 |               1 |
|  8 | M001 | Meja Makan         |    1500000 |    2000000 |    4 |        2 |               4 |
|  9 | T001 | Taro Pop Ice       |       8500 |      10000 |    3 |        2 |               2 |
| 10 | TK01 | Teh Kotak          |       3000 |       5000 |    5 |       10 |               3 |
| 11 | KA01 | Kipas Angin Cosmos |     500000 |     550000 |    6 |        5 |               1 |
+----+------+--------------------+------------+------------+------+----------+-----------------+
7 rows in set (0.002 sec)

MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create trigger transaksi_update_before before update on pesanan_items
    -> for each row
    -> begin
    -> if old.id = new.produk_id then
    -> set @stok = (select stok from produk where id = old.produk_id);
    -> set @sisa = (@stok + old.qty) - new.qty;
    -> if @sisa < 0 then
    -> signal sqlstate '45000' set message_text = 'Warning: Stok tidak cukup';
    -> end if;
    -> update produk set stok = @sisa where id = old.produk_id;
    -> else
    -> set @stok_lama = (select stok from produk where id = old.produk_id);
    -> set @sisa_lama = (@stok_lama + old.qty);
    -> update produk set stok = @sisa_lama where id = old.produk_id;
    -> set @stok_baru = (select stok from produk where id = new.produk_id);
    -> set @sisa_baru = @stok_baru - new.qty;
    -> if @sisa_baru < 0 then
    -> signal sqlstate '45000' set message_text = 'Warning: Stok tidak tersedia';
    -> end if;
    -> update produk set stok = @sisa_baru where id = new.produk_id;
    -> end if;
    -> end;
    -> $$
Query OK, 0 rows affected (0.063 sec)

MariaDB [dbtoko]> select * from produk;
    -> $$
+----+------+--------------------+------------+------------+------+----------+-----------------+
| id | kode | nama               | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch         |    5000000 |    5500000 |    1 |        2 |               1 |
|  6 | TV02 | TV 21 inch         |    3000000 |    3500000 |   10 |        3 |               1 |
|  7 | K001 | Kulkas             |    9500000 |   10000000 |    5 |        3 |               1 |
|  8 | M001 | Meja Makan         |    1500000 |    2000000 |    4 |        2 |               4 |
|  9 | T001 | Taro Pop Ice       |       8500 |      10000 |    3 |        2 |               2 |
| 10 | TK01 | Teh Kotak          |       3000 |       5000 |    5 |       10 |               3 |
| 11 | KA01 | Kipas Angin Cosmos |     500000 |     550000 |    6 |        5 |               1 |
+----+------+--------------------+------------+------------+------+----------+-----------------+
7 rows in set (0.012 sec)

MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> select * from pesanan_items;
+----+-----------+------------+-----+---------+
| id | produk_id | pesanan_id | qty | harga   |
+----+-----------+------------+-----+---------+
|  1 |         5 |          1 |   1 | 5500000 |
+----+-----------+------------+-----+---------+
1 row in set (0.003 sec)

MariaDB [dbtoko]> update pesanan_items set qty = 2 where id = 1;
Query OK, 1 row affected (0.048 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [dbtoko]> select * from produk;
+----+------+--------------------+------------+------------+------+----------+-----------------+
| id | kode | nama               | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+--------------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch         |    5000000 |    5500000 |    0 |        2 |               1 |
|  6 | TV02 | TV 21 inch         |    3000000 |    3500000 |   10 |        3 |               1 |
|  7 | K001 | Kulkas             |    9500000 |   10000000 |    5 |        3 |               1 |
|  8 | M001 | Meja Makan         |    1500000 |    2000000 |    4 |        2 |               4 |
|  9 | T001 | Taro Pop Ice       |       8500 |      10000 |    3 |        2 |               2 |
| 10 | TK01 | Teh Kotak          |       3000 |       5000 |    5 |       10 |               3 |
| 11 | KA01 | Kipas Angin Cosmos |     500000 |     550000 |    6 |        5 |               1 |
+----+------+--------------------+------------+------------+------+----------+-----------------+
7 rows in set (0.001 sec)

MariaDB [dbtoko]> select * from pesanan_items;
+----+-----------+------------+-----+---------+
| id | produk_id | pesanan_id | qty | harga   |
+----+-----------+------------+-----+---------+
|  1 |         5 |          1 |   2 | 5500000 |
+----+-----------+------------+-----+---------+
1 row in set (0.002 sec)