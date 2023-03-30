<?php
    require('Gempa.php');

    $gempa1 = new Gempa('Banten', 0.1);
    $gempa2 = new Gempa('Manila', 3.5);
    $gempa3 = new Gempa('Paris', 5.1);
    $gempa4 = new Gempa('Tokyo', 7.2);

    $ar_gempa = [$gempa1, $gempa2, $gempa3, $gempa4];

    foreach($ar_gempa as $data){
        $data->cetak();
    }
    echo "<br><b><i>Jumlah Daerah Terkena Gempa = ".Gempa::$jml." Daerah";
 ?>