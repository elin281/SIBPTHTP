<?php
    require('Pegawai.php');

    $pegawai1 = new Pegawai('2777','Elin','Manager','Islam','Belum Menikah');
    $pegawai2 = new Pegawai('2778','Zola','Asisten Manager','Kristen','Sudah Menikah');
    $pegawai3 = new Pegawai('2779','Ari','Kepala Bagian','Katolik','Belum Menikah');
    $pegawai4 = new Pegawai('2780','Nile','Staff','Islam','Sudah Menikah');

    $ar_pegawai = [$pegawai1, $pegawai2, $pegawai3, $pegawai4];

    foreach($ar_pegawai as $pegawai){
        $pegawai->cetak();
    }
    echo "<br><b><i>Jumlah Pegawai = ".Pegawai::$jumlah." Orang";
 ?>