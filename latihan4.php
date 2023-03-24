<?php
    $nama = "Elin";
    $totbel = 300000;
    $ket = "";

    if($totbel > 100000){
        $ket = "Selamat $nama Anda dapat hadiah!";
    }
    else{
        $ket = "Terimakasih $nama sudah berbelanja.";
    }
 ?>

Nama Pelanggan : <?= $nama ?>
<br>Total Belanja : <?= $totbel ?>
<br>Keterangan : <?= $ket ?>