<?php
    require_once("hewan1.php");
    require_once("hewan2.php");
    require_once("hewan3.php");

    $hewan1 = new Kucing();
    $hewan2 = new Kambing();
    $hewan3 = new Sapi();

    $ar_hewan = [$hewan1, $hewan2, $hewan3];
    foreach($ar_hewan as $hewan){
        echo "<br>".$hewan->bersuara();
    }
 ?>