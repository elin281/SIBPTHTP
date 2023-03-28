<?php
    $std1 = ['nim'=>'10120508', 'name'=>'Herlinda Elvinta', 'score'=>95];
    $std2 = ['nim'=>'10120805', 'name'=>'Muhammad Arizola', 'score'=>80];
    $std3 = ['nim'=>'10120111', 'name'=>'Lumiana Poetry', 'score'=>50];
    $std4 = ['nim'=>'10120121', 'name'=>'Muhammad Zoel', 'score'=>65];
    $std5 = ['nim'=>'10120161', 'name'=>'Razita Syazwana', 'score'=>40];
    $students = [$std1, $std2, $std3, $std4, $std5];
    $ar_title = ['No','NIM','Name','Score','Description'];
 ?>
<table border=1 width="100%" align="center" cellpadding=5>
    <thead>
        <tr bgcolor="#333436">
            <?php
                foreach($ar_title as $title){
            ?>
            <th style="color:white"><?= $title ?></th>
            <?php } ?>
        </tr>
    </thead>
    <tbody align="center">
        <?php
            $no = 1;
            foreach($students as $stds){
                //Coloring rows
                $color = $no % 2 == 1 ? 'fucia' : 'grey';
                $desc = ($stds['score']>=60) ? 'Graduate' : 'Not Graduate';
                //Grade
                if($stds['score'] >= 85 && $stds['score'] <= 100) $grade = 'A';
                else if($stds['score'] >= 75 && $stds['score'] <= 80) $grade = 'B';
                else if($stds['score'] >= 60 && $stds['score'] <= 74) $grade = 'C';
                else if($stds['score'] >= 30 && $stds['score'] <= 59) $grade = 'D';
                else if($stds['score'] >= 0 && $stds['score'] <= 29) $grade = 'E';
                else $grade = '';
         ?>
        <tr bgcolor="<?= $color; ?>">
            <td><?= $no ?></td>
            <td><?= $stds['nim'] ?></td>
            <td><?= $stds['name'] ?></td>
            <td><?= $stds['score'] ?></td>
            <td><?= $desc ?></td>
        </tr>
        <?php $no++; } ?>
    </tbody>
</table>