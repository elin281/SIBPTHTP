<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Jabatan extends Model
{
    use HasFactory;
    protected $table = 'jabatan'; //pemanggilan nama tabel
    protected $primarykey = 'id'; //pemanggilan primary key id
    protected $fillable = ['nama']; //pemanggilan kolom nama
    
    public function pegawai(){
        return $this->hasMany(Pegawai::class); //membuat relasi antara jabatan dan pegawai
    }
}
