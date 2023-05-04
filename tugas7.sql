-- Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure inputPelanggan(
    -> id int, kode varchar(10), nama_pelanggan varchar(50), jk char(1),
    -> tmp_lahir varchar(30), tgl_lahir date, email varchar(45),
    -> alamat varchar(40), kartu_id int)
    -> begin
    -> insert into pelanggan(id, kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id)
    -> values(id, kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, alamat, kartu_id);
    -> end$$
Query OK, 0 rows affected (0.006 sec)
MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call inputPelanggan(7,'011107','Roji','P','Jonggol','1945-08-17','roji@gmail.com','Jln.Batu',1);
Query OK, 1 row affected (0.006 sec)
MariaDB [dbtoko]> select * from pelanggan;
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
|  1 | 011101 | Agung          | L  | Bandung    | 1997-09-06 | agung@gmail.com   | Jln.Bangau    |        1 |
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati   |        2 |
|  3 | 011103 | Sekar          | P  | Kediri     | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  4 | 011104 | Suandi         | L  | Jakarta    | 1997-09-05 | suandi@gmail.com  | Jln.Jagorawi  |        1 |
|  5 | 011105 | Pradina        | P  | Banten     | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi     | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
|  7 | 011107 | Roji           | P  | Jonggol    | 1945-08-17 | roji@gmail.com    | Jln.Batu      |        1 |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
7 rows in set (0.001 sec)

-- Buat fungsi showPelanggan(), setelah itu panggil fungsinya
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure showPelanggan()
    -> begin
    -> select * from pelanggan;
    -> end
    -> $$
Query OK, 0 rows affected (0.004 sec)
MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call showPelanggan();
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
|  1 | 011101 | Agung          | L  | Bandung    | 1997-09-06 | agung@gmail.com   | Jln.Bangau    |        1 |
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati   |        2 |
|  3 | 011103 | Sekar          | P  | Kediri     | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  4 | 011104 | Suandi         | L  | Jakarta    | 1997-09-05 | suandi@gmail.com  | Jln.Jagorawi  |        1 |
|  5 | 011105 | Pradina        | P  | Banten     | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi     | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
|  7 | 011107 | Roji           | P  | Jonggol    | 1945-08-17 | roji@gmail.com    | Jln.Batu      |        1 |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
7 rows in set (0.001 sec)
Query OK, 0 rows affected (0.047 sec)

-- Buat fungsi inputProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure inputProduk(
    -> id int, kode varchar(10), nama varchar(45), harga_beli double, harga_jual double,
    -> stok int, min_stok int, jenis_produk_id int)
    -> begin
    -> insert into produk(id, kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
    -> values(id, kode, nama, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
    -> end$$
Query OK, 0 rows affected (0.006 sec)
MariaDB [dbtoko]> call inputProduk(11,'KA01','Kipas Angin Cosmos',500000,550000,6,5,1);
Query OK, 1 row affected (0.004 sec)
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

-- Buat fungsi showProduk(), setelah itu panggil fungsinya
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure showProduks()
    -> begin
    -> select * from produk;
    -> end
    -> $$
Query OK, 0 rows affected (0.007 sec)
MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call showProduks();
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
Query OK, 0 rows affected (0.024 sec)

-- Buat fungsi totalPesanan(), setelah itu panggil fungsinya
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure totalPesanan()
    -> begin
    -> select sum(total) from pesanan;
    -> end$$
Query OK, 0 rows affected (0.004 sec)
MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call totalPesanan();
+------------+
| sum(total) |
+------------+
|     385000 |
+------------+
1 row in set (0.001 sec)
Query OK, 0 rows affected (0.032 sec)

-- tampilkan seluruh pesanan dari semua pelanggan
MariaDB [dbtoko]> delimiter $$
MariaDB [dbtoko]> create procedure showPesanan()
    -> begin
    -> select pesanan.id, pesanan.tanggal, pelanggan.nama_pelanggan, pesanan.total from pesanan
    -> join pelanggan on pesanan.pelanggan_id = pelanggan.id;
    -> end$$
Query OK, 0 rows affected (0.006 sec)
MariaDB [dbtoko]> delimiter ;
MariaDB [dbtoko]> call showPesanan();
+----+------------+----------------+--------+
| id | tanggal    | nama_pelanggan | total  |
+----+------------+----------------+--------+
|  1 | 2023-03-04 | Agung          | 200000 |
|  2 | 2023-04-03 | Sekar          |  30000 |
|  3 | 2022-05-05 | Puspita        | 105000 |
|  4 | 2022-04-04 | Suandi         |  50000 |
+----+------------+----------------+--------+
4 rows in set (0.001 sec)
Query OK, 0 rows affected (0.022 sec)

/* buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw
(menggunakan join dari table pesanan,pelanggan dan produk) */
MariaDB [dbtoko]> create view pesanan_produk_vw as
    -> select pesanan.id as pesanan_id, pesanan.tanggal, pelanggan.nama_pelanggan, produk.nama, pesanan.total from pesanan
    -> inner join pelanggan on pesanan.pelanggan_id = pelanggan.id
    -> inner join produk on pesanan.pelanggan_id = produk.jenis_produk_id;
Query OK, 0 rows affected (0.014 sec)
MariaDB [dbtoko]> select * from pesanan_produk_vw;
+------------+------------+----------------+--------------------+--------+
| pesanan_id | tanggal    | nama_pelanggan | nama               | total  |
+------------+------------+----------------+--------------------+--------+
|          1 | 2023-03-04 | Agung          | TV 42 inch         | 200000 |
|          1 | 2023-03-04 | Agung          | TV 21 inch         | 200000 |
|          1 | 2023-03-04 | Agung          | Kulkas             | 200000 |
|          4 | 2022-04-04 | Suandi         | Meja Makan         |  50000 |
|          3 | 2022-05-05 | Puspita        | Taro Pop Ice       | 105000 |
|          2 | 2023-04-03 | Sekar          | Teh Kotak          |  30000 |
|          1 | 2023-03-04 | Agung          | Kipas Angin Cosmos | 200000 |
+------------+------------+----------------+--------------------+--------+
7 rows in set (0.012 sec)
