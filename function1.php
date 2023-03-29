<?php
    //Example of Void Function (returns no value)
    function greeting(){
        echo "Good Morning!<br><br>";
    }
    echo "<h3>Example of Void Function</h3>";
    greeting();

    function sayHello($name,$age){
        echo "Hello $name, you $age years old.<br>";
    }
    sayHello("Elin",22);
    sayHello("Zola",20);
    sayHello("Lumi",17);

    //Example of Return Function (returns value)
    function add($a,$b){
        $c = $a + $b;
        return $c;
    }
    $x=10;
    $y=20;
    echo "<hr>";
    echo "<h3>Example of Return Function</h3>";
    echo "Hasil 50 + 30 = ".add(50,30);
    echo "<br>Hasil 30 + 80 = ".add(30,80);
    echo "<br>Hasil $x + $y = ".add($x,$y);

    //Prime Number Check Formula
    function primes($number){
        $primes = true;
        for($i=2; $i<$number; $i++){
            if($number % $i == 0){
                $primes = false;
                break;
            }
        }
        return $primes;
    }
    if(primes(12)){
        echo "<hr>";
        echo "<h3>Prime Number Check</h3>";
        echo "Primes";
    }
    else{
        echo "<hr>";
        echo "<h3>Prime Number Check</h3>";
        echo "Not Primes";
    }
 ?>