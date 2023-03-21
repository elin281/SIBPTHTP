<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membuat Rumus Bangun Datar Jajar Genjang</title>
</head>
<body>
    <h2>Hitung Luas & Keliling Bangun Datar Jajar Genjang</h2>
    <form method="POST">
        <table>
            <tr>
                <td><label for="a"><b>Alas (a)<b></label></td>
                <th>:</th>
                <td><input type="number" name="a" require></td>
            </tr>
            <tr>
                <td><label for="b"><b>Sisi Miring (b)<b></label></td>
                <th>:</th>
                <td><input type="number" name="b" require></td>
            </tr>
            <tr>
                <td><label for="t"><b>Tinggi (t)<b></label></td>
                <th>:</th>
                <td><input type="number" name="t" require></td>
            </tr>
            <tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>
            <tr>
                <th colspan="3">
                    <input type="submit" name="submit" value="Hitung">
                    <input type="reset" value="Batal">
                </th>
            </tr>
        </table>
    </form>
    <?php
        if(isset($_POST['submit'])){
            $a = $_POST['a'];
            $b = $_POST['b'];
            $t = $_POST['t'];
            $luas = $a * $t;
            $keliling = 2 * ($a + $b);
            echo "<hr>";
            echo "Diketahui :";
            echo "<br>Alas (a) = ".$a, " cm";
            echo "<br>Sisi Miring (b) = ".$b, " cm";
            echo "<br>Tinggi (t) = ".$t, " cm";
            echo "<br><br>Ditanya :";
            echo "<br>Luas = ?";
            echo "<br>Keliling = ?";
            echo "<br><br>Dijawab :";
            echo "<br>Luas = Alas (a) x Tinggi (t)";
            echo "<br>Luas = ".$luas, " cm^2";
            echo "<br>Keliling = 2 x (Alas (a) + Sisi Miring (b))";
            echo "<br>Keliling = ".$keliling, " cm";
        }
     ?>
</body>
</html>