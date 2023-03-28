<?php
    //Array scalar (satu dimensi)
    $ar_fruit = ['Mango','Banana','Lemon','Grape','Guava'];
    //Menampilkan id/index array
    foreach($ar_fruit as $id => $fruit){
        echo '<br>Show key '.$id;
    }
    echo '<hr>';
    //Menampilkan isi elemen dari array
    foreach($ar_fruit as $fruit){
        echo '<br>Show value '.$fruit;
    }
 ?>