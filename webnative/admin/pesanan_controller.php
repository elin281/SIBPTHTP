<?php
    include_once 'koneksi.php';
    include_once 'models/Pesanan.php';

    //Menangkap request form
    $tanggal = $_POST['tanggal'];
    $total = $_POST['total'];
    $pelanggan_id = $_POST['pelanggan_id'];
    $status = $_POST['status'];

    //Form dijadikan array
    $data = [
        $tanggal,
        $total,
        $pelanggan_id,
        $status
    ];
    $model = new Pesanan();
    $tombol = $_REQUEST['proses'];
    switch($tombol){
        case 'simpan':$model->simpan($data); break;
        case 'ubah':
            $data[] = $_POST['idx']; $model->ubah($data); break;
        case 'hapus':
            unset($data);
            $model->hapus($_POST['idx']); break;
        default;
        header('location:index.php?url=pesanan');
        break;
    }
    header('location:index.php?url=pesanan');
 ?>