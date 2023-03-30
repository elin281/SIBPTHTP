<?php
    class Gempa{
        private $lokasi;
        private $skala;
        static $jml = 0;
        const GEMPA = 'Gempa Bumi Dunia Terkini';
        public function __construct($lokasi, $skala){
            $this->lokasi = $lokasi;
            $this->skala = $skala;
            self::$jml++;
        }
        private function dampak($skala){
            $this->$skala = $skala;
            if($skala >=0 && $skala <=2) $dampak = 'Tidak Terasa';
            else if($skala > 2 && $skala <= 4) $dampak = 'Bangunan Retak-retak';
            else if($skala > 4 && $skala <= 6) $dampak = 'Bangunan Roboh';
            else $dampak = 'Berpotensi Tsunami';
            return $dampak;
        }
        public function cetak(){
            echo "<b><u>".self::GEMPA."</u></b>";
            echo "<br>Lokasi : ".$this->lokasi;
            echo "<br>Skala : ".$this->skala;
            echo "<br>Dampak : ".$this->dampak($this->skala);
            echo "<hr>";
        }
    }
 ?>