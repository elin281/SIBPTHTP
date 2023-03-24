<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Membuat Rincian Gaji Karyawan</title>
</head>
<style>
	table, label, input, select, button{
		font-size: 18px;
		font-family: Calibri;
	}
</style>
<body>
	<form method="POST">
		<table border="0" cellpadding="5" align="center" width="50%">
			<tr>
				<th colspan="3"><h2>Form Gaji Karyawan PT HEB</h2></th>
			</tr>
			<tr>
				<td><label for="nama">Nama</label></td>
				<td>:</td>
				<td><input type="text" name="nama"></td>
			</tr>
			<tr>
				<td><label for="jabatan">Jabatan</label></td>
				<td>:</td>
				<td>
					<select name="jabatan">
						<option>--- Pilih Jabatan ---</option>
						<option value="Manager">Manager</option>
						<option value="Asisten">Asisten</option>
						<option value="Kepala Bagian">Kepala Bagian</option>
						<option value="Staff">Staff</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="status">Status</label></td>
				<td>:</td>
				<td>
					<input type="radio" name="status" value="Lajang">Lajang
					<input type="radio" name="status" value="Menikah">Menikah
				</td>
			</tr>
			<tr>
				<td><label for="anak">Jumlah Anak</label></td>
				<td>:</td>
				<td><input type="number" name="anak"></td>
			</tr>
			<tr>
				<td><label for="agama">Agama</label></td>
				<td>:</td>
				<td>
					<select name="agama">
						<option>--- Pilih Agama ---</option>
						<option value="Islam">Islam</option>
						<option value="Kristen">Kristen</option>
						<option value="Katolik">Katolik</option>
						<option value="Hindu">Hindu</option>
						<option value="Budha">Budha</option>
						<option value="Konghucu">Konghucu</option>
						<option value="Lainnya">Lainnya</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="3"></td></tr><tr><td colspan="3"></td></tr>
			<tr>
				<th colspan="3">
					<button type="submit" name="proses">Submit</button> &nbsp;&nbsp;
					<button type="reset">Reset</button>
				</th>
			</tr>
		</table>
	</form>
	<?php 
		error_reporting(0);
        //Memproses form
		$nama = $_POST['nama'];
		$jabatan = $_POST['jabatan'];
		$status = $_POST['status'];
		$jmlanak = $_POST['anak'];
		$agm = $_POST['agama'];
		$button = $_POST['proses'];
		$gapok = 0;
		$tunjab = 0;
		$tunkel = 0;
		$gator = 0;
		$zakat = 0;
		$thp = 0;

		switch($jabatan){
            case "Manager" : $gapok = 20000000; break;
            case "Asisten" : $gapok = 15000000; break;
            case "Kepala Bagian" : $gapok = 10000000; break;
            case "Staff" : $gapok = 4000000; break;
            default : $gapok = "";
        }

        if($status == "Menikah" && $jmlanak <=2) $tunkel = 0.05 * $gapok;
        else if($status == "Menikah" && $jmlanak <=5) $tunkel = 0.1 * $gapok;
        else if($status == "Menikah" && $jmlanak >5) $tunkel = 0;
        else $tunkel = "";

        $tunjab = 0.2 * $gapok;
		$gator = $gapok + $tunjab + $tunkel;
		$zakat = ($agm == "Islam" && $gator >= 6000000) ? 0.025 * $gator : 0;
		$thp = $gator - $zakat;

        if(isset($button)){
	 ?>
			<br><hr><hr>
			<table border="0" cellpadding="5" align="center" width="50%">
				<tr>
					<th colspan="3"><h2>Rincian Gaji Karyawan PT HEB</h2></th>
				</tr>
				<tr>
					<td>Nama</td>
					<td>:</td>
					<td><?= $nama ?></td>
				</tr>
				<tr>
					<td>Jabatan</td>
					<td>:</td>
					<td><?= $jabatan ?></td>
				</tr>
				<tr>
					<td>Status</td>
					<td>:</td>
					<td><?= $status ?></td>
				</tr>
				<tr>
					<td>Jumlah Anak</td>
					<td>:</td>
					<td><?= $jmlanak ?></td>
				</tr>
				<tr>
					<td>Agama</td>
					<td>:</td>
					<td><?= $agm ?></td>
				</tr>
				<tr>
					<td>Gaji Pokok</td>
					<td>:</td>
					<td>Rp<?= number_format($gapok, 0, ',', '.') ?></td>
				</tr>
				<tr>
					<td>Tunjangan Jabatan</td>
					<td>:</td>
					<td>Rp<?= number_format($tunjab, 0, ',', '.') ?></td>
				</tr>
				<tr>
					<td>Tunjangan Keluarga</td>
					<td>:</td>
					<td>Rp<?= number_format($tunkel, 0, ',', '.') ?></td>
				</tr>
				<tr>
					<td>Gaji Kotor</td>
					<td>:</td>
					<td>Rp<?= number_format($gator, 0, ',', '.') ?></td>
				</tr>
				<tr>
					<td>Zakat Profesi</td>
					<td>:</td>
					<td>Rp<?= number_format($zakat, 0, ',', '.') ?></td>
				</tr>
				<tr>
					<td><b>Take Home Pay</b></td>
					<td>:</td>
					<td><b>Rp<?= number_format($thp, 0, ',', '.') ?></b></td>
				</tr>
			</table>
		<?php } ?>
</body>
</html>