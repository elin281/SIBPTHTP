<?php
    class Pesanan{
        private $koneksi;
        public function __construct(){
            global $dbh; //instance object koneksi.php
            $this->koneksi = $dbh;
        }
        public function dataPesanan(){
            $sql = "SELECT pesanan.*, pelanggan.nama_pelanggan as customer from pesanan inner join
            pelanggan on pelanggan.id = pesanan.pelanggan_id";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute();
            $rs = $ps->fetchAll();
            return $rs;
        }
        public function getPesanan($id){
            $sql = "SELECT pesanan.*, pelanggan.nama_pelanggan as customer from pesanan inner join
            pelanggan on pelanggan.id = pesanan.pelanggan_id";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute([$id]);
            $rs = $ps->fetch();
            return $rs;
        }
        public function simpan($data){
            $sql = "INSERT INTO pesanan(tanggal, total, pelanggan_id, status) values (?,?,?,?)";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute($data);
        }
        public function ubah($data){
            $sql = "UPDATE pesanan SET tanggal=?, total=?, pelanggan_id=?, status=?
            WHERE id=?";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute($data);
        }
        public function hapus($id){
            $sql = "DELETE FROM pesanan WHERE id=?";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute([$id]);
        }
    }
 ?>