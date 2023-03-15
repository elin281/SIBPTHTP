//Fungsi Pertambahan
function addition(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var result = n1 + n2;
    frm.result.value = result;
    if (isNaN(result)){
        document.getElementById("calculator").result.value = "";
        alert("Please, complete your input data!");
    }
    else{
        document.getElementById("calculator").result.value = result;
    }
}
//Fungsi Pengurangan
function subtraction(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var result = n1 - n2;
    frm.result.value = result;
    if (isNaN(result)){
        document.getElementById("calculator").result.value = "";
        alert("Please, complete your input data!");
    }
    else{
        document.getElementById("calculator").result.value = result;
    }
}
//Fungsi Pembagian
function division(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var result = n1 / n2;
    frm.result.value = result;
    if (isNaN(result)){
        document.getElementById("calculator").result.value = "";
        alert("Please, complete your input data!");
    }
    else{
        document.getElementById("calculator").result.value = result;
    }
}
//Fungsi Perkalian
function multiplication(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var result = n1 * n2;
    frm.result.value = result;
    if (isNaN(result)){
        document.getElementById("calculator").result.value = "";
        alert("Please, complete your input data!");
    }
    else{
        document.getElementById("calculator").result.value = result;
    }
}
//Fungsi Perpangkatan
function exponent(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    //Menggunakan simbol operasi aritmatika dasar
    //var result = n1 ** n2;
    //Menggunakan fungsi Math.pow()
    var result = Math.pow(n1,n2);
    frm.result.value = result;
    if (isNaN(result)){
        document.getElementById("calculator").result.value = "";
        alert("Please, complete your input data!");
    }
    else{
        document.getElementById("calculator").result.value = result;
    }
}