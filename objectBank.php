<?php
    require('Bank.php');
    //Ciptakan Object
    
    $nasabah1 = new Bank('001','Elin',50000);
    $nasabah2 = new Bank('002','Zola',100000);
    $nasabah3 = new Bank('003','Linda',150000);
    $nasabah4 = new Bank('004','Ari',200000);

    $dataNasabah = array($nasabah1, $nasabah2, $nasabah3, $nasabah4);

    $nasabah1->ambil(40000);
    $nasabah1->setor(100000);
    $nasabah2->ambil(50000);
    $nasabah2->setor(70000);
    $nasabah3->ambil(30000);
    $nasabah3->setor(300000);
    $nasabah4->ambil(90000);
    $nasabah4->setor(1000000);

    //$nasabah1->cetak();
    //$nasabah2->cetak();
    //$nasabah3->cetak();
    //$nasabah4->cetak();

    foreach ($dataNasabah as $data){
        $data->cetak();
    }
    echo "<br><b><i>Jumlah Nasabah = ".Bank::$jml." Orang";
 ?>