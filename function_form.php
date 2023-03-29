<?php
    $ar_prodi = ["S1"=>"Sistem Informasi", "TI"=>"Teknik Informatika", "ILKOM"=>"Ilmu Komputer", "TE"=>"Teknik Elektro"];
    $ar_skill = ["HTML"=>10, "CSS"=>10, "JavaScript"=>20, "RWD Bootsrtap"=>20, "PHP"=>30, "MySQL"=>30, "Laravel"=>40];
    $domisili = ["Jakarta","Bekasi","Depok","Bogor","Tangerang"];
 ?>
 <fieldset style="background-color: aquamarine;">
    <legend>Form Registrasi Kelompok Belajar</legend>
    <form method="POST">
        <table>
            <thead>
                <tr><th>Form Registrasi</th></tr>
            </thead>
            <tbody>
                <tr>
                    <td><label for="nim">NIM</label></td>
                    <td>:</td>
                    <td><input type="text" name="nim"></td>
                </tr>
                <tr>
                    <td><label for="nama">Nama</label></td>
                    <td>:</td>
                    <td><input type="text" name="nama"></td>
                </tr>
                <tr>
                    <td><label for="jk">Jenis Kelamin</label></td>
                    <td>:</td>
                    <td>
                        <input type="radio" name="jk" value="Pria">Pria
                        <input type="radio" name="jk" value="Wanita">Wanita
                    </td>
                </tr>
                <tr>
                    <td><label for="prodi">Program Studi</label></td>
                    <td>:</td>
                    <td>
                        <select name="prodi">
                            <?php
                                foreach($ar_prodi as $prodi => $p){
                            ?>
                                    <option value="<?= $p ?>"><?= $p ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="skill">Skill</label></td>
                    <td>:</td>
                    <td>
                        <?php
                            foreach($ar_skill as $skill => $s){
                        ?>
                                <input type="checkbox" name="skill[]" value="<?= $skill ?>"><?= $skill ?>
                        <?php } ?>
                    </td>
                </tr>
                <tr>
                    <td><label for="domisili">Domisili</label></td>
                    <td>:</td>
                    <td>
                        <select name="domisili">
                            <?php
                                foreach($domisili as $d){
                            ?>
                                    <option value="<?= $d ?>"><?= $d ?></option>
                            <?php } ?>
                        </select>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan=3><button name="proses">Submit</button></th>
                </tr>
            </tfoot>
        </table>
    </form>
</fieldset>
<?php
    error_reporting(0);
    if(isset($_POST['proses'])){
        $nim = $_POST['nim'];
        $nama = $_POST['nama'];
        $jk = $_POST['jk'];
        $prodi = $_POST['prodi'];
        $skill = $_POST['skill'];
        $domisili = $_POST['domisili'];
    }
 ?>
<hr>
NIM : <?= $nim ?><br>
Nama : <?= $nama ?><br>
Jenis Kelamin : <?= $jk ?><br>
Program Studi : <?= $prodi ?><br>
Skill :
<?php
    foreach($skill as $s){
 ?>
<?= $s ?>,
<?php } ?><br>
Domisili : <?= $domisili ?>