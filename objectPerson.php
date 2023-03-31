<?php
    require_once("Dosen.php");
    require_once("Mahasiswa.php");
    require_once("Staff.php");

    $dosen1 = new Dosen('Arip','L','111','M.Kom');
    $dosen2 = new Dosen('Diah','P','112','M.Psi');
    $mhs1 = new Mahasiswa('Zola','L','8','Teknik Informatika');
    $mhs2 = new Mahasiswa('Elin','P','6','Sistem Informasi');
    $staff1 = new Staff('Kairi','L','211','Kebersihan','Rp5.000.000');
    $staff2 = new Staff('Vior','P','212','Keamanan','Rp3.500.000');

    $ar_data = [$dosen1, $dosen2, $mhs1, $mhs2, $staff1, $staff2];

    foreach($ar_data as $data){
        $data->cetak();
    }
 ?>