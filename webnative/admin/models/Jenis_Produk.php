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
    }
 ?>