<?php
    class Pegawai{
        protected $nip;
        public $nama;
        private $jabatan;
        private $agama;
        private $status;
        private $tunjab;
        private $tunkel;
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
        public function setGajiPokok(){
            switch($this->jabatan){
                case "Manager" : $gapok = 15000000; break;
                case "Asisten Manager" : $gapok = 10000000; break;
                case "Kepala Bagian" : $gapok = 7000000; break;
                case "Staff" : $gapok = 5000000; break;
                default : $gapok = 0;
            }
            return $gapok;
        }
        public function setTunjab(){
            $tunjab = $this->setGajiPokok() * 0.2;
            return $tunjab;
        }
        public function setTunkel(){
            $tunkel = ($this->status == "Sudah Menikah") ? $this->setGajiPokok() * 0.1 : 0;
            return $tunkel;
        }
        public function setGator(){
            $gator = $this->setGajiPokok() + $this->setTunjab() + $this->setTunkel();
            return $gator;
        }
        public function setZakatProfesi(){
            $zakprof = ($this->setGator() >= 6000000 && $this->agama == "Islam") ? $this->setGator() * 0.025 : 0;
            return $zakprof;
        }
        public function setGaber(){
            $gaber = $this->setGator() - $this->setZakatProfesi();
            return $gaber;
        }
        public function cetak(){
            echo "<b><u>".self::PT."</u></b>";
            echo '<br>NIP : '.$this->nip;
            echo '<br>Nama : '.$this->nama;
            echo '<br>Jabatan : '. $this->jabatan;
            echo '<br>Agama : '.$this->agama;
            echo '<br>Status : '.$this->status;
            echo '<br>Gaji Pokok : Rp'.number_format($this->setGajiPokok(),0,',','.');
            echo '<br>Tunjangan Jabatan : Rp'.number_format($this->setTunjab(),0,',','.');
            echo '<br>Tunjangan Keluarga : Rp'.number_format($this->setTunkel(),0,',','.');
            echo '<br>Gaji Kotor : Rp'.number_format($this->setGator(),0,',','.');
            echo '<br>Zakat Profesi : Rp'.number_format($this->setZakatProfesi(),0,',','.');
            echo '<br>Gaji Bersih : Rp'.number_format($this->setGaber(),0,',','.');
            echo '<hr>';
        }
    }
 ?>