<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Latihan Pemrosesan Form</title>
</head>
<body>
    <form method="POST">
        <table>
            <tr>
                <th colspan="2">Form Input Nilai Mahasiswa</th>
            </tr>
            <tr>
                <td><label for="nama">Nama</label></td>
                <td><input type="text" name="nama" placeholder="Masukkan nama anda"></td>
            </tr>
            <tr>
                <td><label for="matkul">Mata Kuliah</label></td>
                <td>
                    <select name="matkul">
                        <option>--- Pilih Mata Kuliah ---</option>
                        <option value="HTML & CSS">HTML & CSS</option>
                        <option value="UI/UX">UI/UX</option>
                        <option value="GitHub">GitHub</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="PHP">PHP</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="nilai">Nilai</label></td>
                <td><input type="number" name="nilai" placeholder="Masukkan nilai anda"></td>
            </tr>
            <tr>
                <td colspan="2"><button name="proses" type="submit">Simpan</button></td>
            </tr>
        </table>
    </form>
    <?php
        error_reporting(0);
        //Memproses form
        $nama = $_POST['nama'];
        $matkul = $_POST['matkul'];
        $nilai = $_POST['nilai'];
        $tombol = $_POST['proses'];
        $ket = ($nilai >=60) ? "Lulus" : "Gagal";

        if($nilai >=85 && $nilai <=100) $grade = "A";
        else if($nilai >=75 && $nilai <=84) $grade = "B";
        else if($nilai >=60 && $nilai <=74) $grade = "C";
        else if($nilai >=30 && $nilai <=59) $grade = "D";
        else if($nilai >=0 && $nilai <=29) $grade = "E";
        else $grade = "";

        switch($grade){
            case "A" : $predikat = "Memuaskan"; break;
            case "B" : $predikat = "Bagus"; break;
            case "C" : $predikat = "Cukup"; break;
            case "D" : $predikat = "Kurang"; break;
            case "E" : $predikat = "Buruk"; break;
            default : $predikat = "";
        }

        if(isset($tombol)){
     ?>
        Nama Mahasiswa : <?= $nama ?>
        <br>Mata Kuliah : <?= $matkul ?>
        <br>Nilai : <?= $nilai ?>
        <br>Keterangan : <?= $ket ?>
        <br>Grade : <?= $grade ?>
        <br>Predikat : <?= $predikat ?>
        <?php } ?>
</body>
</html>