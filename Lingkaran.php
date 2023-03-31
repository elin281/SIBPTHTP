<?php
	require_once("BangunDatar.php");

	class Lingkaran extends Bentuk2D{
		private $jari2;
		public function __construct($jari2){
			$this->jari2 = $jari2;
		}
		public function namaBidang(){
			return "Lingkaran";
		}
		public function luasBidang(){
			$luas = number_format(pi() * $this->jari2 * $this->jari2, 2);
			return $luas;
		}
		public function kelilingBidang(){
			$keliling = number_format(2 * pi() * $this->jari2, 2);
			return $keliling;
		}
	}
 ?>