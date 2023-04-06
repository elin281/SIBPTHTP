--DOKUMENTASI TUGAS

--Membuat Tabel produk
create table produk(
    -> id int not null auto_increment primary key,
    -> kode varchar(10) not null unique,
    -> nama varchar(45) not null,
    -> harga_beli double not null,
    -> harga_jual double not null,
    -> stok int not null,
    -> min_stok int not null,
    -> jenis_produk_id int not null references jenis_produk(id));

--Membuat Tabel pesanan_items
create table pesanan_items(
    -> id int not null auto_increment primary key,
    -> produk_id int not null references produk(id),
    -> pesanan_id int not null references pesanan(id),
    -> qty int not null,
    -> harga double not null);

--Membuat Tabel vendor
create table vendor(
    -> id int not null auto_increment primary key,
    -> nomor varchar(4) unique not null,
    -> nama varchar(40) not null,
    -> kota varchar(30) not null,
    -> kontak varchar(30) not null);

--Membuat Tabel pembelian
create table pembelian(
    -> id int not null auto_increment primary key,
    -> tanggal date not null,
    -> nomor varchar(10) not null unique,
    -> produk_id int not null references produk(id),
    -> jumlah int not null,
    -> harga double not null,
    -> vendor_id int not null references vendor(id));

--Menambahkan kolom alamat pada pelanggan dengan tipe data varchar(40)
alter table pelanggan
    -> add column alamat varchar(40) not null after email;

--Mengubah kolom nama pada pelanggan menjadi nama_pelanggan
alter table pelanggan
    -> change nama nama_pelanggan varchar(45) not null;

--Mengedit tipe data nama_pelanggan menjadi varchar(50)
alter table pelanggan
    -> modify nama_pelanggan varchar(50) not null after kode;