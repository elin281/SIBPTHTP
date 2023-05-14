<?php
    include_once 'koneksi.php';
    include_once 'models/Kartu.php';

    //Menangkap request form
    $kode = $_POST['kode'];
    $nama = $_POST['nama'];
    $diskon = $_POST['diskon'];
    $iuran = $_POST['iuran'];

    //Form dijadikan array
    $data = [
        $kode,
        $nama,
        $diskon,
        $iuran
    ];
    $model = new Kartu();
    $tombol = $_REQUEST['proses'];
    switch($tombol){
        case 'simpan':$model->simpan($data); break;
        case 'ubah':
            $data[] = $_POST['idx']; $model->ubah($data); break;
        case 'hapus':
            unset($data);
            $model->hapus($_POST['idx']); break;
        default;
        header('location:index.php?url=kartu');
        break;
    }
    header('location:index.php?url=kartu');
 ?>