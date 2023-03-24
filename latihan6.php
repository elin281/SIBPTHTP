<form method="GET">
    <table>
        <tr><td><label for="nama">Nama</label></td></tr>
        <tr><td><input type="text" name="nama"></td></tr>
        <tr><td><label for="alamat">Alamat</label></td></tr>
        <tr><td><textarea name="alamat" id="" cols="30" rows="10"></textarea></td></tr>
        <tr><td><input type="submit" name="proses" value="Simpan"></td></tr>
    </table>
</form>
<?php
    error_reporting(0);
    //Memproses form
    $nama = $_GET['nama'];
    $alamat = $_GET['alamat'];
    $proses = $_GET['proses'];
    if(isset($proses)){
        echo 'Nama : '.$nama.'<br>Alamat : '.$alamat;
    }
 ?>