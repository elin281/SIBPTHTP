<?php
    echo '<h3>Latihan Looping PHP</h3>';

    //Tidak menggunakan looping
    echo 'Bilangan 1';
    echo '<br>Bilangan 2';
    echo '<br>Bilangan 3';
    echo '<hr>';

    //Menggunakan looping for
    //Increment
    for($a=1;$a<=10;$a++){
        echo '<br>Bilangan '.$a;
    }
    echo '<hr>';
    //Decrement
    for($b=10;$b>=1;$b--){
        echo '<br>Bilangan '.$b;
    }
    echo '<hr>';

    //Menggunakan looping while
    //Increment
    $c=1;
    while($c<=5){
        echo '<br>Bilangan '.$c;
        $c++;
    }
    echo '<hr>';
    //Decrement
    $d=5;
    while($d>=1){
        echo '<br>Bilangan '.$d;
        $d--;
    }
    echo '<hr>';

    //Menggunakan looping do while
    //Increment
    $e=1;
    do {
        echo '<br>'.$e;
        $e++;
    }
    while($e<=10);
    echo '<hr>';
    //Decrement
    $f=10;
    do {
        echo '<br>'.$f;
        $f--;
    }
    while($f>=1);
 ?>