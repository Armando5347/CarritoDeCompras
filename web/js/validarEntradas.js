/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function quieroNumeros(input, boolean){
    var contenido = input.value;
    var sirve = false;
    sirve = verMaximoCaracteres(contenido, 20); //20 de manera temporal
    if(!sirve){
        alert("Campo "+contenido.name+" No es valido");
        return false;
    }
    var patron_numeritos = /[0-9]/;
    if(!boolean){ //Este e sde que no lo quiero números
         sirve = !patron_numeritos.test(contenido);
    }else{ //Este de que si quiero números
        if(contenido < 0 ) return false;
        sirve = patron_numeritos.test(contenido);
    }
   
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
function quieroNumerosEnteros(input){
    var enterotest = input.value;
    var enteros = /[0-9]/;
    return (enteros.test(enterotest));
}

function quieroTeclearNumeros(e, boolean){
   var teclado = (document.all)?e.keyCode:e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]\./;
    var tec=String.fromCharCode(teclado);
    alert(patron + (patron.test(tec)?" Jala":" No jala"));
    alert(tec);
    if(boolean){
        return patron.test(tec);    
    }else{
        return !patron.test(tec);
    }
    
}

function quieroTeclearNumeros(e){
   var teclado = (document.all)?e.keyCode:e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]/;
    var tec=String.fromCharCode(teclado);
    alert("Stock" + (patron.test(tec)?" Valido":" No valido"));
    return patron.test(tec);    
    
}

function noDefault(select){
    var indice = select.selectedIndex;
    var seleccionado = select.options[indice].value;
    if(seleccionado === "Seleccione alguna opción"){
        alert("Debe de seleccionar algún elemento del campo: " +select.name);
        return false;
    }
}

function verMaximoCaracteres(contenido, maxCaracteres){
    return (contenido.length>maxCaracteres)?false:true;
}