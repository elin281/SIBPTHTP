<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membuat Rumus Bangun Datar Persegi</title>
</head>
<body>
    <h2>Bangun Datar Persegi</h2>
    <form method="POST">
        <table>
            <tr>
                <th><label for="sisi1">Sisi 1</label></th>
                <th>:</th>
                <td><input type="number" name="sisi1" require></td>
            </tr>
            <tr>
                <th><label for="sisi2">Sisi 2</label></th>
                <th>:</th>
                <td><input type="number" name="sisi2" require></td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="submit" name="submit" value="Hitung">
                    <input type="reset" value="Batal">
                </td>
            </tr>
        </table>
    </form>
    <?php
        if(isset($_POST['submit'])){
            $sisi1 = $_POST['sisi1'];
            $sisi2 = $_POST['sisi2'];
            $luas = $sisi1 * $sisi2;
            echo "<hr>";
            echo "Diketahui :";
            echo "<br>Sisi 1 = ".$sisi1, " cm";
            echo "<br>Sisi 2 = ".$sisi2, " cm";
            echo "<br>Ditanya :";
            echo "<br>Luas = ?";
            echo "<br>Dijawab :";
            echo "<br>Luas = Sisi x Sisi";
            echo "<br>Luas = ".$luas, " cm^2";
        }
     ?>
</body>
</html>