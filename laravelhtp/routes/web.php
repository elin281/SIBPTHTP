<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiswaController; //panggil controller yang dibuat sebelumnya
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\PegawaiController;
use App\Http\Controllers\DivisiController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/salam', function () {
    return "Selamat Datang";
});//ini adalah routing untuk pemanggilan dirinya sendiri
Route::get('/ucapan', function () {
    return view('ucapan');
    /*--ini adalah routing yang mengarahkan ke view yang ada di folder resources/views--*/
});
Route::get('/nilai', function () {
    return view('nilai');
    //arahkan return nilai ke file nilai yang ada di view
});
Route::get('/daftar_nilai', function () {
    return view('daftar_nilai');
    //arahkan return daftar nilai ke file daftar_nilai yang ada di view
});
Route::get('/siswa', [SiswaController::class, 'dataSiswa']);//mengarahkan routing ke controller
//prefix atau grouping
Route::prefix('admin')->group(function(){
Route::get('/dashboard', [DashboardController::class, 'index'])->name('index');//mengarahkan ke controller dashboard
Route::get('/staff', [StaffController::class, 'index']);
//ini adalah crud untuk pegawai
Route::get('/pegawai', [PegawaiController::class, 'index']);
Route::get('/pegawai/create', [PegawaiController::class, 'create']);
Route::post('/pegawai/store', [PegawaiController::class, 'store']);
//ini adalah crud untuk divisi
Route::get('/divisi', [DivisiController::class, 'index']);
Route::get('/divisi/create', [DivisiController::class, 'create']);
Route::post('/divisi/store', [DivisiController::class, 'store']);
});
//nantinya pegawai tsb mengambil pelatihan & pd table pelatihan bertambah