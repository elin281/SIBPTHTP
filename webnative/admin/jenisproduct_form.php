<br>
<?php
    error_reporting(0);
    $obj_jenisproduk = new Jenis_Produk();
    $data_jenisproduk = $obj_jenisproduk->dataJenisProduk();
    $idedit = $_REQUEST['idedit'];
    $jprod = !empty($idedit) ? $obj_jenisproduk->getJenisProduk($idedit) : array();
 ?>
<form action="jenisproduct_controller.php" method="post">
      <div class="form-group row">
        <label for="text2" class="col-4 col-form-label">Nama</label> 
        <div class="col-8">
          <input id="nama" name="nama" type="text" class="form-control" value="<?= $jprod['nama']?>">
        </div>
      </div>
      <div class="form-group row">
        <label for="text" class="col-4 col-form-label">Keterangan</label> 
        <div class="col-8">
          <input id="ket" name="ket" type="text" class="form-control" value="<?= $jprod['ket']?>">
        </div>
      </div>
      <div class="form-group row">
        <div class="offset-4 col-8">
          <?php
            if(empty($idedit)){
           ?>
            <button name="proses" type="submit" value="simpan" class="btn btn-primary">Submit</button>
          <?php
            }
            else{
              ?>
            <button name="proses" type="submit" value="ubah" class="btn btn-primary">Update</button>
            <input type="hidden" name="idx" value="<?=$idedit?>">
          <?php
            }
           ?>
          <button name="proses" type="submit" value="batal" class="btn btn-primary">Cancel</button>
        </div>
      </div>
</form>