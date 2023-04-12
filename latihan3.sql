--DOKUMENTASI LATIHAN

--Menambahkan data pada tabel pelanggan menggunakan perintah insert
insert into pelanggan (kode,nama_pelanggan,jk,tmp_lahir,tgl_lahir,email,alamat,kartu_id) values
    -> ('011101','Agung','L','Bandung','1997-09-06','agung@gmail.com','Jln.Bangau',1),
    -> ('011102','Puspita','P','Yogyakarta','1998-08-07','puspita@gmail.com','Jln.Merpati',2),
    -> ('011103','Sekar','P','Kediri','2001-09-08','sekar@gmail.com','Jln.Rajawali',1),
    -> ('011104','Suandi','L','Malang','1997-09-05','suandi@gmail.com','Jln.Jagorawi',1),
    -> ('011105','Pradina','P','Banten','2001-08-02','Pradina@gmail.com','Jln.Manokwari',1),
    -> ('011106','Gayuh','L','Bekasi','2002-04-04','Gayuh@gmail.com','Jln.Flaminggo',2);
--Menambahkan data pada tabel jenis_produk menggunakan perintah insert
insert into jenis_produk (nama,ket) values
    -> ('Elektronik','Tersedia'),
    -> ('Makanan','Tersedia'),
    -> ('Minuman','Tidak Tesedia'),
    -> ('Furniture','Tersedia');
--Mengubah salah satu baris data di kolom nama pada tabel pelanggan dengan kondisi berupa id
update pelanggan set nama_pelanggan = 'Ganta' where id = '011106';
--Mengubah salah satu baris data di kolom tmp_lahir pada tabel pelanggan dengan kondisi berupa nama pelanggan
update pelanggan set tmp_lahir = 'Jakarta' where nama_pelanggan = 'Suandi';
--Menambahkan data pada tabel produk menggunakan perintah insert
insert into produk (kode,nama,harga_beli,harga_jual,stok,min_stok,jenis_produk_id) values
    -> ('1111','TV 42 inch',5000000,5500000,2,2,1),
    -> ('1112','TV 21 inch',3000000,3500000,10,3,1),
    -> ('1113','Kulkas',9500000,10000000,5,3,1),
    -> ('1114','Meja Makan',1500000,2000000,4,2,4),
    -> ('1115','Sari Roti Keju',8500,10000,3,2,2),
    -> ('1116','Teh Kotak',3000,5000,5,10,3);
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='TV01' where id=5;
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='TV02' where id=6;
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='K001' where id=7;
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='M001' where id=8;
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='T001' where id=9;
--Mengubah value pada kolom kode di tabel produk menggunakan perintah update
update produk set kode='TK01' where id=10;
--Mengubah value pada kolom nama di tabel produk menggunakan perintah update dengan kondisi id
update produk set nama='Taro Pop Ice' where id=9;

--WORKSHEET-2
--SOAL 2.1
--Menampilkan seluruh data produk diurutkan berdasarkan harga_jual mulai dari yang termahal
select * from produk order by harga_jual desc;
--Menampilkan data kode, nama, tmp_lahir, tgl_lahir dari table pelanggan
select kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan;
--Menampilkan kode,nama,stok dari table produk yang stok-nya hanya 4
select kode,nama, stok from produk where stok=4;
--Menampilkan seluruh data pelanggan yang tempat lahirnya Jakarta
select * from pelanggan where tmp_lahir = 'Jakarta';
/*Menampilkan kode, nama, tmp_lahir, tgl_lahir dari pelanggan diurutkan dari yang paling muda
usianya*/
select kode, nama_pelanggan, tmp_lahir, tgl_lahir from pelanggan order by tgl_lahir desc;

--SOAL 2.2
--Menampilkan data produk yang stoknya 3 dan 10
select * from produk where stok = 3 OR stok = 10;
--Menampilkan data produk yang harga jualnya kurang dari 5 juta tetapi lebih dari 500 ribu
select * from produk where harga_jual < 5000000 AND harga_jual > 500000;
--Menampilkan data produk yang harus segera ditambah stoknya
select * from produk where min_stok > stok;
--Menampilkan data pelanggan yang lahirnya di Jakarta dan gendernya perempuan
select * from pelanggan where tmp_lahir = 'jakarta' AND jk = 'P';
--Menampilkan data pelanggan yang ID nya 2, 4 dan 6
select * from pelanggan where id in (2,4,6);
--Menampilkan data produk yang harganya antara 500 ribu sampai 6 juta
select * from produk where harga_jual >= 500000 and harga_jual <= 6000000;

--SOAL 2.3
--Menampilkan produk yang kode awalnya huruf K dan huruf M
select * from produk where kode like 'K%' or kode like 'M%';

--SOAL 2.4
--Menampilkan 2 data produk termahal
select * from produk order by harga_beli desc limit 2;