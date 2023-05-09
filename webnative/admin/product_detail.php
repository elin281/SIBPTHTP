<?php
    $id = $_REQUEST['id'];
    $model = new Produk();
    $produk = $model->getProduk($id);
 ?>
<br>
<div>
    <h5><?= $produk['kode']?></h5>

</div>