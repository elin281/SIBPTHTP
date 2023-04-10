--DOKUMENTASI LATIHAN

-- Menambahkan value pada tabel kartu dengan perintah insert (cara 1)
insert into kartu values
    -> ('','10111','Gold',20000,2000),
    -> ('','10112','Silver',15000,1500);

-- Menampilkan tabel kartu dengan perintah select
select * from kartu;

-- Menambahkan value pada tabel kartu dengan perintah insert (cara 2)
insert into kartu (kode,nama,diskon,iuran)
    -> values ('10113','Perak',10000,1000);

-- Mengupdate value dari salah sau kolom pada tabel kartu dengan perintah update
update kartu set nama = 'Platinum' where id = 3;

-- Menghapus salah satu baris yang ada menggunakan kolom id pada tabel kartu dengan perintah delete
delete from kartu where id = 3;