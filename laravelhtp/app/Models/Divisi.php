<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Divisi extends Model
{
    use HasFactory;
    protected $table = 'divisi'; //pemanggilan nama tabel
    protected $primarykey = 'id'; //pemanggilan primary key id
    protected $fillable = ['nama']; //pemanggilan kolom nama

    public function pegawai(){
        return $this->hasMany(Pegawai::class); //memanggil relasi antara tabel divisi dengan tabel pegawai
    }
}
