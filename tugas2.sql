--DOKUMENTASI TUGAS

--WORKSHEET-2
--SOAL 2.3
--Menampilkan produk yang kode awalnya bukan huruf M
select * from produk where kode not like 'M%';
--Menampilkan produk-produk televisi
    --Cara 1
    select * from produk where kode like 'TV%';
    --Cara 2
    select * from produk where kode in ('TV01','TV02');
--Menampilkan pelanggan mengandung huruf 'SA'
select * from pelanggan where nama_pelanggan like '%SA%';
--Menampilkan pelanggan yang lahirnya bukan di Jakarta dan mengandung huruf ‘yo‘
    --Cara 1
    select * from pelanggan where tmp_lahir <> 'Jakarta' and nama_pelanggan like '%yo%';
    --Cara 2
    select * from pelanggan where tmp_lahir != 'Jakarta' and nama_pelanggan like '%yo%';
--Menampilkan pelanggan yang karakter huruf ke – 2 nya adalah A
select * from pelanggan where nama_pelanggan like '_A%';

--SOAL 2.4
--Menampilkan produk yang paling murah
    --Cara 1
    select min(harga_beli) as produk_paling_murah from produk;
    --Cara 2
    select * from produk where harga_beli = (select min(harga_beli) from produk);
--Menampilkan produk yang stoknya paling banyak
    --Cara 1
    select max(stok) as stok_paling_banyak from produk;
    --Cara 2
    select * from produk where stok = (select max(stok) from produk);
--Menampilkan dua produk yang stoknya paling sedikit
select * from produk order by stok asc limit 2;
--Menampilkan pelanggan yang paling muda
    --Cara 1
    select * from pelanggan order by tgl_lahir desc limit 1;
    --Cara 2 (jika mengetahui jumlah baris datanya)
    select * from pelanggan order by tgl_lahir asc limit 1 offset 5;
    --Cara 3
    select * from pelanggan where tgl_lahir = (select max(tgl_lahir) from pelanggan);
--Menampilkan pelanggan yang paling tua
    --Cara 1
    select * from pelanggan order by tgl_lahir asc limit 1;
    --Cara 2 (jika mengetahui jumlah baris datanya)
    select * from pelanggan order by tgl_lahir desc limit 1 offset 5;
    --Cara 3
    select * from pelanggan where tgl_lahir = (select min(tgl_lahir) from pelanggan);