<?php
    //Array Scalar
    $f1 = ['code'=>'a01', 'fruit'=>'Apple', 'price'=>30000, 'amount'=>2];
    $f2 = ['code'=>'a02', 'fruit'=>'Mango', 'price'=>35000, 'amount'=>4];
    $f3 = ['code'=>'a03', 'fruit'=>'Guava', 'price'=>40000, 'amount'=>6];
    $f4 = ['code'=>'a04', 'fruit'=>'Banana', 'price'=>45000, 'amount'=>8];
    $f5 = ['code'=>'a05', 'fruit'=>'Grape', 'price'=>50000, 'amount'=>10];
    //Array Associative
    $fruits = [$f1,$f2,$f3,$f4,$f5];
    $ar_title = ['No','Code','Fruit','Price (Rp)','Amount (Pcs)'];
    //Another Function
    $amount_of_data = count($fruits);
    $amount_of_fruit = array_column($fruits,'amount');
    $total_fruit = array_sum($amount_of_fruit);
    $max_amount = max($amount_of_fruit);
    $min_amount = min($amount_of_fruit);
    $price_of_fruit = array_column($fruits,'price');
    $total_price = array_sum($price_of_fruit);
    $information = [
        'Amount of Data'=>$amount_of_data,
        'Total (Pcs)'=>$total_fruit,
        'Maximum Amount'=>$max_amount,
        'Minimum Amount'=>$min_amount,
        'Total Price (Rp)'=>$total_price
    ];

 ?>
<table border=1 width="100%" align="center" cellpadding=5>
    <thead>
        <th colspan="5" bgcolor="#333436" style="color:white;"><p style="font-size: 25px; padding: 10px">Fruit List</p></th>
        <tr bgcolor="#333436">
            <?php
                foreach($ar_title as $t){
             ?>
                <th style="color:white"><?= $t ?></th>
            <?php } ?>
        </tr>
    </thead>
    <tbody align="center">
        <?php
            $no = 1;
            foreach($fruits as $a){
                $color = $no % 2 == 1 ? 'fucia' : 'grey';
        ?>
        <tr bgcolor="<?= $color; ?>">
            <td><?= $no ?></td>
            <td><?= $a['code'] ?></td>
            <td><?= $a['fruit'] ?></td>
            <td><?= $a['price'] ?></td>
            <td><?= $a['amount'] ?></td>
        </tr>
        <?php
            $no ++;
            }
        ?>
    </tbody>
    <tfoot bgcolor="#333436">
        <?php
            foreach($information as $info => $result){
         ?>
        <tr style="color:white">
            <th colspan="4"><?= $info ?></th>
            <th><?= $result ?></th>
        </tr>
        <?php } ?>
    </tfoot>
</table>