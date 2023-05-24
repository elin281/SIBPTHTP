<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
//use Illuminate\Support\Facades\DB;
use DB;

class StaffSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //Ini adalah proses untuk seeder atau pengisian data menggunakan sintaks php
        for ($i=0; $i<10; $i++){
            DB::table('staff')->insert(
                [
                    'id' => rand(),
                    'nip' => ('n'),
                    'name' => ('name_'),
                    'gender' => ('P'),
                    'alamat' => ('alamat_'),
                    'email' => uniqid().'@gmail.com',
                    'foto' => ('foto_'),
                    'created_at' => new \DateTime,
                    'updated_at' => null,
                ]
            );
        }
    }
}
