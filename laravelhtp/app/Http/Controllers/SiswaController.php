<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SiswaController extends Controller
{
    //ini adalah tempat edit untuk fungsi dan perintah
    public function dataSiswa(){
        $siswa1 = 'Herlinda'; $asal1 = 'Bandung';
        $siswa2 = 'Akifa'; $asal2 = 'Bekasi';
        return view ('data_siswa',
        compact('siswa1', 'siswa2', 'asal1', 'asal2')
    );
    }
}
