/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function noNumeros(input){
    var contenido = input.value;
    var sirve = false;
    sirve = verMaximoCaracteres(contenido, 20); //20 de manera temporal
    if(!sirve){
        alert("Campo "+contenido.name+" No es valido");
        return false;
    }
    var patron_numeritos = /[0-9]/;
    sirve = !patron_numeritos.test(contenido);
    return sirve;
}
function soloNumerosYletras(input){
    var contenido = input.value;
    var sirve = false;
    sirve = verMaximoCaracteres(contenido, 20); //20 de manera temporal
    if(!sirve){
        alert("Campo "+contenido.name+" es deamsiado largo");
        return false;
    }
    var patron_numeritos = /[A-Za-z0-9]/;
    sirve = patron_numeritos.test(contenido);
    return sirve;
}
function noTecleesNumeros(e){
   var teclado = (document.all)?e.keyCode:e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]\./;
    var tec=String.fromCharCode(teclado);
    alert(patron + (patron.test(tec)?" Jala":" No jala"));
    alert(tec);
    return patron.test(tec);
}

function verMaximoCaracteres(contenido, maxCaracteres){
    return (contenido.length>maxCaracteres)?false:true;
}