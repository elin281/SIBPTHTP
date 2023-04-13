Microsoft Windows [Version 10.0.19044.2130]
(c) Microsoft Corporation. All rights reserved.

C:\Users\ASUS>cd..\..

C:\>cd xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.27-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use dbtoko;
Database changed
MariaDB [dbtoko]> select * from produk;
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
6 rows in set (0.174 sec)

MariaDB [dbtoko]> select count(*) as harga_beli from produk;
+------------+
| harga_beli |
+------------+
|          6 |
+------------+
1 row in set (0.003 sec)

MariaDB [dbtoko]> select count(*) as harga_beli from produk where harga_beli > 4000;
+------------+
| harga_beli |
+------------+
|          5 |
+------------+
1 row in set (0.006 sec)

MariaDB [dbtoko]> select max(harga_beli) as harga_beli_termahal from produk;
+---------------------+
| harga_beli_termahal |
+---------------------+
|             9500000 |
+---------------------+
1 row in set (0.048 sec)

MariaDB [dbtoko]> select min(harga_beli) as harga_beli_termurah from produk;
+---------------------+
| harga_beli_termurah |
+---------------------+
|                3000 |
+---------------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> select avg(harga_beli) as harga_rata2 from produk;
+--------------------+
| harga_rata2        |
+--------------------+
| 3168583.3333333335 |
+--------------------+
1 row in set (0.001 sec)

MariaDB [dbtoko]> select sum(harga_beli) as jumlah_harga_beli from produk;
+-------------------+
| jumlah_harga_beli |
+-------------------+
|          19011500 |
+-------------------+
1 row in set (0.003 sec)

MariaDB [dbtoko]> select * from produk where stok = (select max(stok) from produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  6 | TV02 | TV 21 inch |    3000000 |    3500000 |   10 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
1 row in set (0.167 sec)