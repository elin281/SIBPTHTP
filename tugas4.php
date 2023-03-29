<?php
    $ar_prodi = ["SI"=>"Sistem Informasi", "TI"=>"Teknik Informatika", "ILKOM"=>"Ilmu Komputer", "TE"=>"Teknik Elektro"];
    $ar_skill = ["HTML"=>10, "CSS"=>10, "JavaScript"=>20, "RWD Bootsrtap"=>20, "PHP"=>30, "MySQL"=>30, "Laravel"=>40];
    $domisili = ["Jakarta","Bekasi","Depok","Bogor","Tangerang","Lainnya"];
    //Fungsi untuk menghitung skor dari skill yang dimiliki user
    function dihitung_skor($skills){
        $skor = 0;
        foreach($skills as $skill){
            if(isset($ar_skill[$skill])){
                $skor += $ar_skill[$skill];
            }
        }
        return $skor;
    }
    //Fungsi untuk menentukan kategori skill berdasarkan hasil skor dari skill yang dimiliki user
    function skill_kategori($skor){
        if($skor <= 0){return "Tidak Memadai";}
        elseif($skor <= 40){return "Kurang";}
        elseif($skor <= 60){return "Cukup";}
        elseif($skor <= 100){return "Baik";}
        else{return "Sangat Baik";}
    }
 ?>
<style>
    html, body{margin: 0; background-color: #dbdad9;}
    form{width: 100%; background-color: #fcd392;}
    form, table, label{
        font-size: 20px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        font-weight: bold;
    }
    fieldset{border: 5px solid #000000;}
    legend{font-size: 22px; font-weight: bold;}
    input, select, button{
        padding: 5px;
        font-size: 18px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        font-weight: bold;
        border-radius: 5px;
    }
    button{width: 15%;}
    button:hover{background-color: #333436; color: #FFFFFF; letter-spacing: 2px;}
    /*CSS Class*/
    .inputan{width: 50%; border-radius: 5px;}
    .checkboxan{margin-left: 10px;}
    .io_form{
        padding: 10px;
        background-color: #333436;
        color: #FFFFFF;
        letter-spacing: 5px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
</style>
<div class="io_form">
    <h2 align="center">INPUT FORM</h2>
</div>
<form method="POST"><br>
    <fieldset>
        <legend>Form Registrasi Asisten Laboratorium (Aslab) Fisika Dasar || Universitas Gunadarma</legend><br>
            <table border="0" cellpadding="5" cellspacing="10">
                <tr>
                    <td><label for="nim">NIM</label></td>
                    <td>:</td>
                    <td><input type="number" name="nim" class="inputan"></td>
                </tr>
                <tr>
                    <td><label for="nama">Nama</label></td>
                    <td>:</td>
                    <td><input type="text" name="nama" class="inputan"></td>
                </tr>
                <tr>
                    <td><label for="jk">Jenis Kelamin</label></td>
                    <td>:</td>
                    <td>
                        <input type="radio" name="jk" value="L">Laki-laki &nbsp;&nbsp;&nbsp;
                        <input type="radio" name="jk" value="P">Perempuan
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
                                    <option value="<?= $prodi ?>"><?= $p ?></option>
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
                                <input type="checkbox" name="skill[]" class = "checkboxan" value="<?= $skill ?>"><?= $skill ?>
                        <?php } ?>
                    </td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td>:</td>
                    <td><input type="email" name="email" class="inputan"></td>
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
                <tr><th colspan=3></th></tr><tr><th colspan=3></th></tr>
                <tr>
                    <th colspan=3>
                        <button name="proses">Submit</button> &nbsp;
                        <button name="reset" type="reset">Reset</button>
                    </th>
                </tr>
            </table>
    </fieldset>
</form>
<?php
    error_reporting(0);
    if(isset($_POST['proses'])){
        $nim = $_POST['nim'];
        $nama = $_POST['nama'];
        $jk = $_POST['jk'];
        $prodi = $_POST['prodi'];
        $skill = $_POST['skill'];
        $skill_total = 0;
        foreach($skill as $s) {
            $skill_total += $ar_skill[$s];
        }
        $skill_skor = $skill_total;
        $skill_kategori = skill_kategori($skill_skor);
        $email = $_POST['email'];
        $domisili = $_POST['domisili'];
    }
 ?>
<div class="io_form">
    <h2 align="center">OUTPUT FORM</h2>
</div>
<form><br>
    <fieldset>
        <legend>Data Registrasi Asisten Laboratorium (Aslab) Fisika Dasar || Universitas Gunadarma</legend><br>
        <table border="0" cellpadding="5" cellspacing="10">
            <tr>
                <td>NIM</td>
                <td>:</td>
                <td><?= $nim ?></td>
            </tr>
            <tr>
                <td>Nama</td>
                <td>:</td>
                <td><?= $nama ?></td>
            </tr>
            <tr>
                <td>Jenis Kelamin</td>
                <td>:</td>
                <td><?= $jk ?></td>
            </tr>
            <tr>
                <td>Program Studi</td>
                <td>:</td>
                <td><?= $prodi ?></td>
            </tr>
            <tr>
                <td>Skill</td>
                <td>:</td>
                <td>
                    <?php
                        foreach($skill as $s){
                     ?>
                            <?= $s ?>,
                    <?php } ?>
                </td>
            </tr>
            <tr>
                <td>Skor Skill</td>
                <td>:</td>
                <td><?= $skill_skor ?></td>
            </tr>
            <tr>
                <td>Kategori Skill</td>
                <td>:</td>
                <td><?= $skill_kategori ?></td>
            </tr>
            <tr>
                <td>Email</td>
                <td>:</td>
                <td><?= $email ?></td>
            </tr>
            <tr>
                <td>Domisili</td>
                <td>:</td>
                <td><?= $domisili ?></td>
            </tr>
        </table>
    </fieldset>
</form>