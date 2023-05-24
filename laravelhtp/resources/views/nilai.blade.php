@php
$nama = "Herlinda";
$nilai = 88.00;
@endphp
{{-- Struktur Kendali IF --}}
@if ($nilai >= 60)
@php $ket = "LULUS"; @endphp
@else
@php $ket = "GAGAL"; @endphp
@endif
<h3>Siswa bernama {{$nama}} dengan nilai {{$nilai}}</h3>
<h1><u>DINYATAKAN {{$ket}}</u></h1>