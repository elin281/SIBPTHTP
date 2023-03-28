<body bgcolor="#000000"></body>
<?php
    //Array Scalar
    $std1 = ['nim'=>'10120042', 'name'=>'Adhela Amallya Putri', 'score'=>90];
    $std2 = ['nim'=>'10120247', 'name'=>'Brian Viko Nura', 'score'=>80];
    $std3 = ['nim'=>'10120725', 'name'=>'Catherine Margaretha', 'score'=>75];
    $std4 = ['nim'=>'10120257', 'name'=>'Ditya Calvin Bima', 'score'=>65];
    $std5 = ['nim'=>'10120354', 'name'=>'Edhia Nuraisyah Rachman', 'score'=>45];
    $std6 = ['nim'=>'10120363', 'name'=>'Farhan Maulana Fernando', 'score'=>80];
    $std7 = ['nim'=>'10120508', 'name'=>'Herlinda Elvinta', 'score'=>100];
    $std8 = ['nim'=>'10120805', 'name'=>'Muhammad Arizola', 'score'=>95];
    $std9 = ['nim'=>'10120890', 'name'=>'Pradipta Dwidanda', 'score'=>45];
    $std10 = ['nim'=>'10120918', 'name'=>'Rafif Fauzi Fadholi', 'score'=>60];
    $std11 = ['nim'=>'11120082', 'name'=>'Sefa Febrian', 'score'=>90];
    $std12 = ['nim'=>'11120150', 'name'=>'Varizan Diyaro Masulili', 'score'=>80];
    $std13 = ['nim'=>'11120152', 'name'=>'Widya Nuraini', 'score'=>65];
    $std14 = ['nim'=>'11120713', 'name'=>'Xavier Fernando', 'score'=>55];
    $std15 = ['nim'=>'11120818', 'name'=>'Yuyun Yunarni', 'score'=>70];
    //Array Associative
    $students = [$std1, $std2, $std3, $std4, $std5, $std6, $std7, $std8, $std9, $std10, $std11, $std12, $std13, $std14, $std15];
    //Array for Title of Table
    $ar_title = ['No','NIM','Name','Score','Description','Grade','Predicate'];
    //Another Function
    $amount_of_student = count($students); //Counting the number of students
    $amount_of_data = array_column($students, 'score'); //Counts the number of data rows
    $highest_score = max($amount_of_data); //Displays the highest score
    $lowest_score = min($amount_of_data); //Displays the lowest score
    //Calculate the total score of all students
    $amount_of_score = ($std1['score']+$std2['score']+$std3['score']+$std4['score']+$std5['score']+
                        $std6['score']+$std7['score']+$std8['score']+$std9['score']+$std10['score']+
                        $std11['score']+$std12['score']+$std13['score']+$std14['score']+$std15['score']);
    $average_score = $amount_of_score/$amount_of_student; //Calculates the average value of all student scores
    //Arrays for tfoot
    $informations = [
        'Student Total'=>$amount_of_student,
        'Highest Score'=>$highest_score,
        'Lowest Score'=>$lowest_score,
        'Total Score'=>$amount_of_score,
        'Average Score'=>$average_score
    ];
 ?>
<table border=0 width="100%" align="center" cellpadding=10 style="font-weight: bold;">
    <thead>
        <th colspan="7" bgcolor="#333436" style="color:white;">
            <p style="font-size: 25px; padding: 10px">Score List of PHP Programming Task</p>
        </th>
        <tr bgcolor="#333436" height="50px">
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
                //Description
                $desc = ($stds['score']>=60) ? 'Graduate' : 'Not Graduate';
                //Grade
                if($stds['score'] >= 85 && $stds['score'] <= 100) $grade = 'A';
                else if($stds['score'] >= 75 && $stds['score'] <= 80) $grade = 'B';
                else if($stds['score'] >= 60 && $stds['score'] <= 74) $grade = 'C';
                else if($stds['score'] >= 30 && $stds['score'] <= 59) $grade = 'D';
                else if($stds['score'] >= 0 && $stds['score'] <= 29) $grade = 'E';
                else $grade = 'Null';
                //Predicate
                switch($grade){
                    case 'A' : $predicate = "Very Good"; break;
                    case 'B' : $predicate = "Good"; break;
                    case 'C' : $predicate = "Average"; break;
                    case 'D' : $predicate = "Deficient"; break;
                    case 'E' : $predicate = "Unsatisfactory"; break;
                    default : $predicate = "Null";
                }
         ?>
        <tr bgcolor="<?= $color; ?>">
            <td><?= $no ?></td>
            <td><?= $stds['nim'] ?></td>
            <td><?= $stds['name'] ?></td>
            <td><?= $stds['score'] ?></td>
            <td><?= $desc ?></td>
            <td><?= $grade ?></td>
            <td><?= $predicate ?></td>
        </tr>
        <?php $no++; } ?>
    </tbody>
    <tfoot bgcolor="#333436">
        <?php
            foreach($informations as $info => $result){
         ?>
        <tr style="color:white" height="50px">
            <th colspan="6"><?= $info ?></th>
            <th colspan="1"><?= $result ?></th>
        </tr>
        <?php } ?>
    </tfoot>
</table>