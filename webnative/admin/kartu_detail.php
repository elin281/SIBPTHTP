<?php
    $id = $_REQUEST['id'];
    $model = new Kartu();
    $kartu = $model->getKartu($id);
 ?>

<h1 class="mt-4">Tabel Kartu</h1>
<div class="card-body">
    <div class="card mb-4">
        <table id="datatablesSimple">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Kode</th>
                    <th>Nama</th>
                    <th>Diskon</th>
                    <th>Iuran</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= $produk['id']?></td>
                    <td><?= $produk['kode']?></td>
                    <td><?= $produk['nama']?></td>
                    <td><?= $produk['diskon']?></td>
                    <td><?= $produk['Iuran']?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>