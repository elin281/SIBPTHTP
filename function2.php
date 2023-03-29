<?php
    function calculate($x1,$x2,$button){
        if($button == '+') $result = $x1 + $x2;
        else if($button == '-') $result = $x1 - $x2;
        else if($button == 'x') $result = $x1 * $x2;
        else if($button == '/') $result = $x1 / $x2;
        else $result = 0;
        return $result;
    }
 ?>
 <style>
    form, table, input{
        font-size: 18px;
    }
 </style>
 <form method="POST">
    <div class="input">
        <table border=0 align=center cellpadding=5>
            <tr>
                <th colspan=2><h2>Calculator</h2></th>
            </tr>
            <tr>
                <td><label for="x1">First Number</label></td>
                <td><input type="number" name="x1"></td>
            </tr>
            <tr>
                <td><label for="x2">Second Number</label></td>
                <td><input type="number" name="x2"></td>
            </tr>
            <tr>
                <th colspan=2>
                    <input type="submit" name="button" value="+">
                    <input type="submit" name="button" value="-">
                    <input type="submit" name="button" value="x">
                    <input type="submit" name="button" value="/">
                </th>
            </tr>
            <tr>
                <th colspan=2><input type="reset" name="reset" value="Reset"></th>
            </tr>
        </table>
    </div>
    <div class="result">
        <?php
            if(isset($_POST['button'])){
                $x1 = $_POST['x1'];
                $x2 = $_POST['x2'];
                $button = $_POST['button'];
                $result = calculate($x1,$x2,$button);
                echo "<br><center><b>The result is $result.<b></center>";
            }
         ?>
    </div>
 </form>