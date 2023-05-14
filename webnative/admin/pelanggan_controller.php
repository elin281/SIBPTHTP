<?php
    include_once 'koneksi.php';
    include_once 'models/Pelanggan.php';

    //Menangkap request form
    $kode = $_POST['kode'];
    $nama_pelanggan = $_POST['nama_pelanggan'];
    $jk = $_POST['jk'];
    $tmp_lahir = $_POST['tmp_lahir'];
    $tgl_lahir = $_POST['tgl_lahir'];
    $email = $_POST['email'];
    $alamat = $_POST['alamat'];
    $kartu_id = $_POST['kartu_id'];

    //Form dijadikan array
    $data = [
        $kode,
        $nama_pelanggan,
        $jk,
        $tmp_lahir,
        $tgl_lahir,
        $email,
        $alamat,
        $kartu_id
    ];
    $model = new Pelanggan();
    $tombol = $_REQUEST['proses'];
    switch($tombol){
        case 'simpan':$model->simpan($data); break;
        case 'ubah':
            $data[] = $_POST['idx']; $model->ubah($data); break;
        case 'hapus':
            unset($data);
            $model->hapus($_POST['idx']); break;
        default;
        header('location:index.php?url=pelanggan');
        break;
    }
    header('location:index.php?url=pelanggan');
 ?>