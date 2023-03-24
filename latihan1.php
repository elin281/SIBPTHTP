<?php
    echo 'Dokumen PHP saya ada di '.$_SERVER['DOCUMENT_ROOT'];
    echo '<br>Nama File'.$_SERVER['SCRIPT_FILENAME'];
    //Ini adalah pemanggilan di php
    echo "<hr>Hello world! I want introduce myself.";

    //Variabel pada php
    //Penulisan didalam tag php
    $nama = "Elin";
    $usia = 22;
    $bb = 55;
    $tb = 160;
    $pekerjaan = "Part Time Barista";
    $tes = "Coba";
    echo "<hr>";
    echo "Nama Mahasiswa : ".$nama;
    echo "<br>Usia : ".$usia, " tahun";
    echo "<br>Berat Badan : ".$bb, " kg";
    echo "<br>Tinggi Badan : ".$tb, " cm";
    echo "<br>Pekerjaan : ".$pekerjaan;
 ?>
 <hr>
 Nama Mahasiswa : <?= $nama ?>
 <br>Usia : <?= $usia ?> tahun
 <br>Berat Badan : <?= $bb ?> kg
 <br>Tinggi Badan : <?= $tb ?> cm
 <br>Pekerjaan : <?= $pekerjaan ?>
