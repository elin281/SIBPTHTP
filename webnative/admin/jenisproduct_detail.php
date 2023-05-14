<?php
    $id = $_REQUEST['id'];
    $model = new Jenis_Produk();
    $jenisproduk = $model->getJenisProduk($id);
 ?>

<h1 class="mt-4">Tabel Jenis Produk</h1>
<div class="card-body">
    <div class="card mb-4">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th>Nama </th>
                    <th>Keterangan</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= $jenisproduk['nama']?></td>
                    <td><?= $jenisproduk['ket']?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>