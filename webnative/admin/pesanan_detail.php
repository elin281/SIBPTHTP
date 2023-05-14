<?php
    $id = $_REQUEST['id'];
    $model = new Pesanan();
    $pesanan = $model->getPesanan($id);
 ?>

<h1 class="mt-4">Tabel Pesanan</h1>
<div class="card-body">
    <div class="card mb-4">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th>Tanggal</th>
                    <th>Total</th>
                    <th>ID Pelanggan</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= $produk['tanggal']?></td>
                    <td><?= $produk['total']?></td>
                    <td><?= $produk['pelanggan_id']?></td>
                    <td><?= $produk['status']?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>