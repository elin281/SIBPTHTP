<?php
    include_once 'koneksi.php';
    include_once 'models/Jenis_Produk.php';

    //Menangkap request form
    $nama = $_POST['nama'];
    $ket = $_POST['ket'];

    //Form dijadikan array
    $data = [
        $nama,
        $ket
    ];
    $model = new Jenis_Produk();
    $tombol = $_REQUEST['proses'];
    switch($tombol){
        case 'simpan':$model->simpan($data); break;
        case 'ubah':
            $data[] = $_POST['idx']; $model->ubah($data); break;
        case 'hapus':
            unset($data);
            $model->hapus($_POST['idx']); break;
        default;
        header('location:index.php?url=jenis_product');
        break;
    }
    header('location:index.php?url=jenis_product');
 ?>