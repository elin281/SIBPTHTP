<?php
    class Pelanggan{
        private $koneksi;
        public function __construct(){
            global $dbh; //instance object koneksi.php
            $this->koneksi = $dbh;
        }
        public function dataPelanggan(){
            $sql = "SELECT pelanggan.*, kartu.nama as member from pelanggan inner join
            kartu on kartu.id = pelanggan.kartu_id";
            $ps = $this->koneksi->prepare($sql);
            $ps->execute();
            $rs = $ps->fetchAll();
            return $rs;
        }
    }
 ?>