--DOKUMENTASI LATIHAN

--Masuk ke folder xampp, kemudian masuk ke folder mysql, masuk ke bin
cd \xampp\mysql\bin

--Mengakses mysql dengan username -u nya root dan passwordnya -p kosong
mysql -u root -p

--Menampilkan database yang tersedia
show databases;

--Membuat database baru
create database dbtoko;

--Memilih database yang akan digunakan
use dbtoko;

--Menampilkan daftar tabel yang tersedia pada database yang digunakan
show tables;

--Menampilkan struktur tabel yang dipilih
desc kartu;

--Memodifikasi tabel dengan menambah kolom baru
alter table jenis_produk
    -> add column keterangan varchar(30) after nama;

--Memodifikasi nama kolom pada tabel
alter table jenis_produk
    -> change keterangan ket varchar(30);

--Memodifikasi struktur table pada salah satu kolom
alter table jenis_produk
    -> modify ket varchar(50) not null after nama;