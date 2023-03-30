<?php
    require('Pegawai.php');

    $pegawai1 = new Pegawai('2777','Elin','Staff','Islam','Belum Menikah');

    $ar_pegawai = [$pegawai1];

    foreach($ar_pegawai as $pegawai){
        $pegawai->cetak();
    }
 ?>