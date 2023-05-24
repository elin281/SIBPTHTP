@php
$no = 1;
$s1 = ['nama'=>'Herlinda', 'nilai'=>90];
$s2 = ['nama'=>'Arizola', 'nilai'=>95];
$s3 = ['nama'=>'Elvinta', 'nilai'=>50];
$s4 = ['nama'=>'Oktramadi', 'nilai'=>70];
$s5 = ['nama'=>'Bawenti', 'nilai'=>55];

$judul = ['No', 'Nama', 'Nilai', 'Keterangan'];
$siswa = [$s1,$s2,$s3,$s4,$s5];

@endphp
<table border="1" align="center" cellpadding="10">
    <thead>
        <tr>
            @foreach($judul as $jdl)
            <th>{{$jdl}}</th>
            @endforeach
        </tr>
    </thead>
    <tbody>
        @foreach($siswa as $s)
        @php
        $ket = ($s['nilai']>=60) ? 'LULUS' : 'GAGAL';
        @endphp
        <tr>
            <td>{{$no++}}</td>
            <td>{{$s['nama']}}</td>
            <td>{{$s['nilai']}}</td>
            <td>{{$ket}}</td>
        </tr>
        @endforeach
    </tbody>
</table>