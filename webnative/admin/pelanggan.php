<?php
    $model = new Pelanggan();
    $data_pelanggan = $model->dataPelanggan();

    //foreach($data_pelanggan as $row){
    //    print $row['kode'];
    //}
    $sesi = $_SESSION['MEMBER'];
    if(isset($sesi)){
 ?>
                    <h1 class="mt-4">Data Pelanggan</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Master Data</li>
                            <li class="breadcrumb-item active">Data Pelanggan</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <!--<i class="fas fa-table me-1"></i>-->
                                <a href="index.php?url=pelanggan_form" class="btn btn-primary btn-sm">Tambah</a>
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>No</th>
                                            <th>Kode</th>
                                            <th>Nama</th>
                                            <th>Jenis Kelamin</th>
                                            <th>Action</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php
                                        $no = 1;
                                        foreach($data_pelanggan as $row){
                                         ?>
                                        <tr>
                                            <td><?= $no ?></td>
                                            <td><?= $row['kode'] ?></td>
                                            <td><?= $row['nama_pelanggan'] ?></td>
                                            <td><?= $row['jk'] ?></td>
                                            <td>
                                                <form action="pelanggan_controller.php" method="post">
                                                    <?php
                                                        if($sesi['role'] != 'staff'){
                                                     ?>
                                                    <a class="btn btn-info btn-sm" href="index.php?url=pelanggan_detail&id=<?= $row ['id'] ?>">Detail</a>
                                                    <a class="btn btn-warning btn-sm" href="index.php?url=pelanggan_form&idedit=<?= $row ['id'] ?>">Ubah</a>
                                                    <button type="submit" class="btn btn-danger btn-sm" name="proses" value="hapus"
                                                    onclick="return confirm('Anda yakin ingin menghapus?')">Hapus</button>

                                                    <input type="hidden" name="idx" value="<?= $row['id'] ?>">
                                                    <?php } ?>
                                                </form>
                                            </td>
                                        </tr>
                                        <?php $no++; } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
<?php
    }
    else {
        echo '<script>alert("Anda tidak dapat masuk!");history.back();</script>';
    }
 ?>