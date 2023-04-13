/*
SOAL
3.1
*/

MariaDB [dbtoko]> select sum(harga_beli*stok) as total from produk;
+----------+
| total    |
+----------+
| 93540500 |
+----------+
1 row in set (0.006 sec)

MariaDB [dbtoko]> select sum(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|       7 |
+---------+
1 row in set (0.083 sec)

MariaDB [dbtoko]> select sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          29 |
+-------------+
1 row in set (0.028 sec)

MariaDB [dbtoko]> select * from pelanggan where year(tgl_lahir) between 1999 and 2004;
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
|  3 | 011103 | Sekar          | P  | Kediri    | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  5 | 011105 | Pradina        | P  | Banten    | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi    | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
3 rows in set (0.026 sec)

MariaDB [dbtoko]> select * from pelanggan where year(tgl_lahir) = 1998;
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat      | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati |        2 |
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
1 row in set (0.022 sec)

MariaDB [dbtoko]> select * from pelanggan where month(tgl_lahir) = 08;
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati   |        2 |
|  5 | 011105 | Pradina        | P  | Banten     | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
2 rows in set (0.007 sec)

MariaDB [dbtoko]> select nama_pelanggan, tmp_lahir, tgl_lahir,
    -> (year(now())-year(tgl_lahir)) as umur from pelanggan;
+----------------+------------+------------+------+
| nama_pelanggan | tmp_lahir  | tgl_lahir  | umur |
+----------------+------------+------------+------+
| Agung          | Bandung    | 1997-09-06 |   26 |
| Puspita        | Yogyakarta | 1998-08-07 |   25 |
| Sekar          | Kediri     | 2001-09-08 |   22 |
| Suandi         | Jakarta    | 1997-09-05 |   26 |
| Pradina        | Banten     | 2001-08-02 |   22 |
| Ganta          | Bekasi     | 2002-04-04 |   21 |
+----------------+------------+------------+------+
6 rows in set (0.002 sec)

/*
SOAL
3.2
*/

MariaDB [dbtoko]> select count(tgl_lahir) as jml_lahiran_1998 from pelanggan
    -> group by tgl_lahir having year(tgl_lahir) = 1998;
+------------------+
| jml_lahiran_1998 |
+------------------+
|                1 |
+------------------+
1 row in set (0.001 sec)

