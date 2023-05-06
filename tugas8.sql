--Buat db Baru
MariaDB [(none)]> create database dbtoko1;
Query OK, 1 row affected (0.003 sec)

--Buat Tabel Pesanan Baru
MariaDB [dbtoko1]> create table pesanan (
    -> id_pesanan int primary key,
    -> nama_pelanggan varchar(50) not null,
    -> total_harga decimal(10,2) not null,
    -> status_pembayaran varchar(25) not null
    -> );
Query OK, 0 rows affected (0.014 sec)

--Buat Tabel Pembayaran Baru
MariaDB [dbtoko1]> create table pembayaran (
    -> id_pembayaran int primary key,
    -> id_pesanan int not null,
    -> tgl_pembayaran date not null,
    -> jml_pembayaran decimal(10,2) not null,
    -> status_pembayaran varchar(25) not null
    -> );
Query OK, 0 rows affected (0.015 sec)

--Buat Trigger Update Status Pesanan (Belum/Sudah Lunas)
MariaDB [dbtoko1]> delimiter $$
MariaDB [dbtoko1]> create trigger update_status_bayar after insert on pembayaran
    -> for each row
    -> begin
    -> update pesanan
    -> set status_pembayaran = 'Sudah Lunas'
    -> where id_pesanan = new.id_pesanan;
    -> end
    -> $$
Query OK, 0 rows affected (0.012 sec)

--Tambah Data Baru Kedalam Tabel Pesanan
MariaDB [dbtoko1]> delimiter ;
MariaDB [dbtoko1]> insert into pesanan (id_pesanan, nama_pelanggan, total_harga, status_pembayaran) values
    -> (1,'Popo Barbie',75000,'Belum Lunas'),
    -> (2,'Dilan Cepmek',100000,'Belum Lunas'),
    -> (3,'Ayu Tingting',125000,'Belum Lunas');
Query OK, 3 rows affected (0.002 sec)
Records: 3  Duplicates: 0  Warnings: 0
MariaDB [dbtoko1]> select * from pesanan;
+------------+----------------+-------------+-------------------+
| id_pesanan | nama_pelanggan | total_harga | status_pembayaran |
+------------+----------------+-------------+-------------------+
|          1 | Popo Barbie    |    75000.00 | Belum Lunas       |
|          2 | Dilan Cepmek   |   100000.00 | Belum Lunas       |
|          3 | Ayu Tingting   |   125000.00 | Belum Lunas       |
+------------+----------------+-------------+-------------------+
3 rows in set (0.012 sec)

--Tambah Data Baru Kedalam Tabel Pembayaran
MariaDB [dbtoko1]> insert into pembayaran (id_pembayaran, id_pesanan, jml_pembayaran) values (1,1,75000);
Query OK, 1 row affected, 2 warnings (0.006 sec)
MariaDB [dbtoko1]> select * from pesanan where id_pesanan = 1;
+------------+----------------+-------------+-------------------+
| id_pesanan | nama_pelanggan | total_harga | status_pembayaran |
+------------+----------------+-------------+-------------------+
|          1 | Popo Barbie    |    75000.00 | Sudah Lunas       |
+------------+----------------+-------------+-------------------+
1 row in set (0.001 sec)

--Tampilkan Semua Data Pada Tabel Pesanan yang Paling Terupdate
MariaDB [dbtoko1]> select * from pesanan;
+------------+----------------+-------------+-------------------+
| id_pesanan | nama_pelanggan | total_harga | status_pembayaran |
+------------+----------------+-------------+-------------------+
|          1 | Popo Barbie    |    75000.00 | Sudah Lunas       |
|          2 | Dilan Cepmek   |   100000.00 | Belum Lunas       |
|          3 | Ayu Tingting   |   125000.00 | Belum Lunas       |
+------------+----------------+-------------+-------------------+
3 rows in set (0.001 sec)