/*
SOAL
3.1
*/
--1.Tampilkan produk yang asset nya diatas 20jt
MariaDB [dbtoko]> select sum(harga_beli*stok) as total from produk;
+----------+
| total    |
+----------+
| 93540500 |
+----------+
1 row in set (0.006 sec)
--2.Tampilkan data produk beserta selisih stok dengan minimal stok
MariaDB [dbtoko]> select sum(stok - min_stok) as selisih from produk;
+---------+
| selisih |
+---------+
|       7 |
+---------+
1 row in set (0.083 sec)
--3.Tampilkan total asset produk secara keseluruhan
MariaDB [dbtoko]> select sum(stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|          29 |
+-------------+
1 row in set (0.028 sec)
--4.Tampilkan data pelanggan yang lahirnya antara tahun 1999 sampai 2004
MariaDB [dbtoko]> select * from pelanggan where year(tgl_lahir) between 1999 and 2004;
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
|  3 | 011103 | Sekar          | P  | Kediri    | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  5 | 011105 | Pradina        | P  | Banten    | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi    | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
3 rows in set (0.026 sec)
--5.Tampilkan data pelanggan yang lahirnya tahun 1998
MariaDB [dbtoko]> select * from pelanggan where year(tgl_lahir) = 1998;
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat      | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati |        2 |
+----+--------+----------------+----+------------+------------+-------------------+-------------+----------+
1 row in set (0.022 sec)
--6.Tampilkan data pelanggan yang berulang tahun bulan agustus
MariaDB [dbtoko]> select * from pelanggan where month(tgl_lahir) = 08;
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati   |        2 |
|  5 | 011105 | Pradina        | P  | Banten     | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
2 rows in set (0.007 sec)
/*7.Tampilkan data pelanggan : nama, tmp_lahir, tgl_lahir dan umur (selisih tahun sekarang 
dikurang tahun kelahiran)*/
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
--1.Berapa jumlah pelanggan yang tahun lahirnya 1998
MariaDB [dbtoko]> select count(tgl_lahir) as jml_lahiran_1998 from pelanggan
    -> group by tgl_lahir having year(tgl_lahir) = 1998;
+------------------+
| jml_lahiran_1998 |
+------------------+
|                1 |
+------------------+
1 row in set (0.001 sec)
--2.Berapa jumlah pelanggan perempuan yang tempat lahirnya di Jakarta
MariaDB [dbtoko]> select count(*) from pelanggan where jk = 'P' and tmp_lahir = 'Jakarta';
+----------+
| count(*) |
+----------+
|        0 |
+----------+
1 row in set (0.165 sec)
--3.Berapa jumlah total stok semua produk yang harga jualnya dibawah 10rb
MariaDB [dbtoko]> select sum(stok) from produk where harga_jual < 10000;
+-----------+
| sum(stok) |
+-----------+
|         5 |
+-----------+
1 row in set (0.003 sec)
--4.Ada berapa produk yang mempunyai kode awal K
MariaDB [dbtoko]> select count(*) from produk where kode like 'K%';
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.006 sec)
--5.Berapa harga jual rata-rata produk yang diatas 1jt
MariaDB [dbtoko]> select avg(harga_jual) as rata2_harga_jual from produk where harga_jual > 1000000;
+------------------+
| rata2_harga_jual |
+------------------+
|          5250000 |
+------------------+
1 row in set (0.002 sec)
--6.Tampilkan jumlah stok yang paling besar
MariaDB [dbtoko]> select max(stok) as jml_stok_terbanyak from produk;
+--------------------+
| jml_stok_terbanyak |
+--------------------+
|                 10 |
+--------------------+
1 row in set (0.002 sec)
--7.Ada berapa produk yang stoknya kurang dari minimal stok
MariaDB [dbtoko]> select count(*) as jml_produk from produk where stok < min_stok;
+------------+
| jml_produk |
+------------+
|          1 |
+------------+
1 row in set (0.001 sec)
--8.Berapa total asset dari keseluruhan produk
MariaDB [dbtoko]> select sum(harga_beli * stok) as total_asset from produk;
+-------------+
| total_asset |
+-------------+
|    93540500 |
+-------------+
1 row in set (0.001 sec)

/*
SOAL
3.3
*/
/*1.Tampilkan data produk : id, nama, stok dan informasi jika stok telah sampai batas minimal atau 
kurang dari minimum stok dengan informasi ‘segera belanja’ jika tidak ‘stok aman’.*/
MariaDB [dbtoko]> select id,nama,stok,
    -> case
    -> when stok <= min_stok then 'Segera Belanja'
    -> else 'Stok Aman'
    -> end as status_stok
    -> from produk;
+----+--------------+------+----------------+
| id | nama         | stok | status_stok    |
+----+--------------+------+----------------+
|  5 | TV 42 inch   |    2 | Segera Belanja |
|  6 | TV 21 inch   |   10 | Stok Aman      |
|  7 | Kulkas       |    5 | Stok Aman      |
|  8 | Meja Makan   |    4 | Stok Aman      |
|  9 | Taro Pop Ice |    3 | Stok Aman      |
| 10 | Teh Kotak    |    5 | Segera Belanja |
+----+--------------+------+----------------+
6 rows in set (0.003 sec)
/*2.Tampilkan data pelanggan: id, nama, umur dan kategori umur : jika umur < 17 → ‘muda’ , 17-55 
→ ‘Dewasa’, selainnya ‘Tua’*/
MariaDB [dbtoko]> select id,nama_pelanggan,
    -> datediff(current_date,tgl_lahir)/365 as umur,
    -> case
    -> when datediff(current_date,tgl_lahir)/365 < 17 then 'Muda'
    -> when datediff(current_date,tgl_lahir)/365 between 17 and 55 then 'Dewasa'
    -> else 'Tua'
    -> end as kategori_umur
    -> from pelanggan;
+----+----------------+---------+---------------+
| id | nama_pelanggan | umur    | kategori_umur |
+----+----------------+---------+---------------+
|  1 | Agung          | 25.6192 | Dewasa        |
|  2 | Puspita        | 24.7014 | Dewasa        |
|  3 | Sekar          | 21.6110 | Dewasa        |
|  4 | Suandi         | 25.6219 | Dewasa        |
|  5 | Pradina        | 21.7123 | Dewasa        |
|  6 | Ganta          | 21.0411 | Dewasa        |
+----+----------------+---------+---------------+
6 rows in set (0.005 sec)
/*3.Tampilkan data produk: id, kode, nama, dan bonus untuk kode ‘TV01’ →’DVD Player’ , ‘K001’ → 
‘Rice Cooker’ selain dari diatas ‘Tidak Ada’*/
MariaDB [dbtoko]> select id,kode,nama,
    -> case
    -> when kode = 'TV01' then 'DVD Player'
    -> when kode = 'K001' then 'Rice Cooker'
    -> else 'Tidak Ada'
    -> end as bonus
    -> from produk;
+----+------+--------------+-------------+
| id | kode | nama         | bonus       |
+----+------+--------------+-------------+
|  5 | TV01 | TV 42 inch   | DVD Player  |
|  6 | TV02 | TV 21 inch   | Tidak Ada   |
|  7 | K001 | Kulkas       | Rice Cooker |
|  8 | M001 | Meja Makan   | Tidak Ada   |
|  9 | T001 | Taro Pop Ice | Tidak Ada   |
| 10 | TK01 | Teh Kotak    | Tidak Ada   |
+----+------+--------------+-------------+
6 rows in set (0.001 sec)

/*
SOAL
3.4
*/
--1.Tampilkan data statistik jumlah tempat lahir pelanggan
MariaDB [dbtoko]> select tmp_lahir,count(*) as jml_pelanggan from pelanggan group by tmp_lahir;
+------------+---------------+
| tmp_lahir  | jml_pelanggan |
+------------+---------------+
| Bandung    |             1 |
| Banten     |             1 |
| Bekasi     |             1 |
| Jakarta    |             1 |
| Kediri     |             1 |
| Yogyakarta |             1 |
+------------+---------------+
6 rows in set (0.008 sec)
--2.Tampilkan jumlah statistik produk berdasarkan jenis produk
MariaDB [dbtoko]> select jenis_produk_id,count(*) as jml_produk from produk
    -> group by jenis_produk_id;
+-----------------+------------+
| jenis_produk_id | jml_produk |
+-----------------+------------+
|               1 |          3 |
|               2 |          1 |
|               3 |          1 |
|               4 |          1 |
+-----------------+------------+
4 rows in set (0.001 sec)
--3.Tampilkan data pelanggan yang usianya dibawah rata usia pelanggan
MariaDB [dbtoko]> select * from pelanggan where tgl_lahir > date_sub(curdate(),
    -> interval (select avg(year(curdate())-year(tgl_lahir)) from pelanggan) year);
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
|  3 | 011103 | Sekar          | P  | Kediri    | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  5 | 011105 | Pradina        | P  | Banten    | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi    | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
+----+--------+----------------+----+-----------+------------+-------------------+---------------+----------+
3 rows in set (0.088 sec)
--4.Tampilkan data produk yang harganya diatas rata-rata harga produk
MariaDB [dbtoko]> select * from produk where harga_jual > (select avg(harga_jual) from produk);
+----+------+------------+------------+------------+------+----------+-----------------+
| id | kode | nama       | harga_beli | harga_jual | stok | min_stok | jenis_produk_id |
+----+------+------------+------------+------------+------+----------+-----------------+
|  5 | TV01 | TV 42 inch |    5000000 |    5500000 |    2 |        2 |               1 |
|  7 | K001 | Kulkas     |    9500000 |   10000000 |    5 |        3 |               1 |
+----+------+------------+------------+------------+------+----------+-----------------+
2 rows in set (0.006 sec)
--5.Tampilkan data pelanggan yang memiliki kartu dimana iuran tahunan kartu diatas 90rb
MariaDB [dbtoko]> select p.* from pelanggan p join kartu k
    -> on p.kartu_id = k.id
    -> where k.iuran > 90000;
Empty set (0.264 sec)
/*6.Tampilkan statistik data produk dimana harga produknya dibawah rata-rata harga produk secara 
keseluruhan*/
MariaDB [dbtoko]> select avg(harga_jual) as rata2_harga from produk
    -> where harga_jual < (select avg(harga_jual) from produk);
+-------------+
| rata2_harga |
+-------------+
|     1378750 |
+-------------+
1 row in set (0.001 sec)
--7.Tampilkan data pelanggan yang memiliki kartu dimana diskon kartu yang diberikan diatas 3%
MariaDB [dbtoko]> select p.* from pelanggan p join kartu k
    -> on p.kartu_id = k.id
    -> where k.diskon > 3;
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
| id | kode   | nama_pelanggan | jk | tmp_lahir  | tgl_lahir  | email             | alamat        | kartu_id |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
|  1 | 011101 | Agung          | L  | Bandung    | 1997-09-06 | agung@gmail.com   | Jln.Bangau    |        1 |
|  2 | 011102 | Puspita        | P  | Yogyakarta | 1998-08-07 | puspita@gmail.com | Jln.Merpati   |        2 |
|  3 | 011103 | Sekar          | P  | Kediri     | 2001-09-08 | sekar@gmail.com   | Jln.Rajawali  |        1 |
|  4 | 011104 | Suandi         | L  | Jakarta    | 1997-09-05 | suandi@gmail.com  | Jln.Jagorawi  |        1 |
|  5 | 011105 | Pradina        | P  | Banten     | 2001-08-02 | Pradina@gmail.com | Jln.Manokwari |        1 |
|  6 | 011106 | Ganta          | L  | Bekasi     | 2002-04-04 | Gayuh@gmail.com   | Jln.Flaminggo |        2 |
+----+--------+----------------+----+------------+------------+-------------------+---------------+----------+
6 rows in set (0.001 sec)