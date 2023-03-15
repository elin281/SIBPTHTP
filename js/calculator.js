function addition(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var total = n1 + n2;
    frm.result.value = total;
}
function subtraction(){
    var frm = document.getElementById('calculator');
    var n1 = parseFloat(frm.number1.value);
    var n2 = parseFloat(frm.number2.value);
    var total = n1 - n2;
    frm.result.value = total;
}