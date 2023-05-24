<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('staff', function (Blueprint $table) {
            /**
             * Ini adalah pembuatan kolom yg nantinya akan masuk kedalam table staff
             * table staff ini akan dikirimkan menggunakan kode first
             * dari file migration kedalam php myadmin
             */
            $table->bigIncrements('id');
            $table->char('nip', 3)->unique();
            $table->string('name', 50);
            $table->enum('gender', ['L','P']);
            $table->text('alamat');
            $table->string('email')->unique();
            $table->string('foto', 255);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('staff');
    }
};
