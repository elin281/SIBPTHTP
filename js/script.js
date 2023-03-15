function dataPerson(){
    let forms = document.getElementById('frm');
    let nama = forms.nama.value;
    let pekerjaan = forms.pekerjaan.value;
    let hobi = forms.hobi.value;
    let data = `Input data :
    <br> Nama: ${nama}
    <br> Pekerjaan: ${pekerjaan}
    <br> Hobi : ${hobi}`;
    document.getElementById('hasil').innerHTML = data;
}