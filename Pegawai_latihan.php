<?php
    //Ini adalah file latihan Pegawai
    class Pegawai_latihan{
        protected $nip;
        public $nama;
        private $jabatan;
        private $agama;
        private $status;
        static $jumlah = 0;
        const PT = "PT. HTP Indonesia";

        public function __construct($nip, $nama, $jabatan, $agama, $status){
            $this->nip = $nip;
            $this->nama = $nama;
            $this->jabatan = $jabatan;
            $this->agama = $agama;
            $this->status = $status;
            self::$jumlah++;
        }
        public function setGajiPokok($jabatan){
            $this->jabatan = $jabatan;
            switch($jabatan){
                case 'Manager' : $gapok = 15000000; break;
                case 'Asisten Manager' : $gapok = 10000000; break;
                case 'Kepala Bagian' : $gapok = 7000000; break;
                case 'Staff' : $gapok = 5000000; break;
                default : $gapok = "";
            }
            return $gapok;
        }
        public function cetak(){
            echo "<b><u>".self::PT."</u></b>";
            echo "<br>NIP : ".$this->nip;
            echo "<br>Nama : ".$this->nama;
            echo "<br>Jabatan : ".$this->jabatan;
            echo "<br>Agama : ".$this->agama;
            echo "<br>Status : ".$this->status;
            echo "<br>Gaji Pokok : ".$this->setGajiPokok($this->jabatan);
            echo "<hr>";
        }
    }
 ?>
