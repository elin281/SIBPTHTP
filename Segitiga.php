<?php
	require_once("BangunDatar.php");

	class Segitiga extends Bentuk2D{
		private $sisi, $alas, $tinggi;
		public function __construct($sisi, $alas, $tinggi){
			$this->sisi = $sisi;
			$this->alas = $alas;
			$this->tinggi = $tinggi;
		}
		public function namaBidang(){
			return "Segitiga";
		}
		public function luasBidang(){
			$luas = 0.5 * ($this->alas * $this->tinggi);
			return $luas;
		}
		public function kelilingBidang(){
			$keliling = $this->sisi + $this->sisi + $this->sisi;
			return $keliling;
		}
	}
 ?>