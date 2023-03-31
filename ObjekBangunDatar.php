<?php
    require_once('Lingkaran.php');
    require_once('PersegiPanjang.php');
    require_once('Segitiga.php');
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Object Bangun Datar</title>
</head>
<style>
    html, body{
        margin: 0;
        background-color: #000000;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    h1{
        color: #FFFFFF;
    }
    table{
        text-align: center;
        font-size: 18px;
        margin-top: 3%;
        font-weight: bold;
    }
</style>
<body>
    <h1><center>Menghitung Luas & Keliling Bangun Datar</center></h1>
    <table border="0" cellpadding="10" align="center" width="100%">
        <thead bgcolor="#333436" style="color: #FFFFFF;">
            <tr>
                <td>Nama Bangun Datar</td>
                <td>Luas (cm^2)</td>
                <td>Keliling (cm)</td>
            </tr>
        </thead>
        <tbody bgcolor="fucia">
            <?php
                $lingkaran = new Lingkaran(7);
                $persegi_panjang = new PersegiPanjang(8, 6);
                $segitiga = new Segitiga(5, 5, 9);

                $bidangs = array($lingkaran, $persegi_panjang, $segitiga);

                foreach ($bidangs as $bidang) {
                    echo "<tr>";
                    echo "<td>" . $bidang->namaBidang() . "</td>";
                    echo "<td>" . $bidang->luasBidang() . "</td>";
                    echo "<td>" . $bidang->kelilingBidang() . "</td>";
                    echo "</tr>";
                }
             ?>
        </tbody>
        <tfoot bgcolor="#333436" style="color: #FFFFFF;">
            <tr>
                <td colspan="3" style="font-size: 12px;"><i>Herlinda Elvinta Bawenti / MSIB Batch 4 / PT HTP</i></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>