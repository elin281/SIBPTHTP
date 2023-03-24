<form method="POST">
    <table>
        <tr><td><label for="uname">Username</label></td></tr>
        <tr><td><input type="text" name="uname"></td></tr>
        <tr><td><label for="pwd">Password</label></td></tr>
        <tr><td><input type="password" name="pwd"></td></tr>
        <tr><td><input type="submit" name="login" value="Login"></td></tr>
    </table>
</form>
<?php
    error_reporting(0);
    //Memproses form
    $uname = $_POST['uname'];
    $pwd = $_POST['pwd'];
    $login = $_POST['login'];
    if(isset($login)){
        echo 'Hello '.$uname.'<br>Password Anda '.$pwd;
    }
 ?>