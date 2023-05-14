<?php
include_once 'admin/koneksi.php';
include_once 'admin/models/Produk.php';
include_once 'admin/models/Jenis_Produk.php';
include_once 'admin/models/Pelanggan.php';
include_once 'admin/models/Pesanan.php';
include_once 'admin/models/Kartu.php';

include_once 'header.php';

?>
<?php
error_reporting(0);
$hal = $_GET['hal'];
if($hal == '/'){
	include_once 'home.php';
} else if( !empty($hal)){
	include_once '' .$hal.'.php';
} else {
	include_once 'home.php';
}

?>


<?php
include_once 'footer.php';
?>