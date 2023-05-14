<?php
    class Jenis_Produk{
        private $koneksi;
        public function __construct(){
            global $dbh; //instance object koneksi.php
            $this->koneksi = $dbh;
        }
        public function dataJenisProduk(){
            $sql = "SELECT * FROM jenis_produk";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute();
            $rs = $ps->fetchAll();
            return $rs;
        }
        public function getJenisProduk($id){
            $sql = "SELECT * FROM jenis_produk";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute([$id]);
            $rs = $ps->fetch();
            return $rs;
        }
        public function simpan($data){
            $sql = "INSERT INTO jenis_produk(nama, ket) values (?,?)";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute($data);
        }
        public function ubah($data){
            $sql = "UPDATE jenis_produk SET nama=?, ket=? WHERE id=?";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute($data);
        }
        public function hapus($id){
            $sql = "DELETE FROM jenis_produk WHERE id=?";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute([$id]);
        }
    }
 ?>