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
        alert("Campo "+input.name+" No es valido");
        return false;
    }
    var patron_numeritos = /[0-9]/;
    if(!boolean){ //Este e sde que no lo quiero números
         sirve = !patron_numeritos.test(contenido);
    }else{ //Este de que si quiero números
        if(contenido < 0 ) return false;
        sirve = patron_numeritos.test(contenido);
    }
    if(!sirve){
        alert("Campo "+input.name+" No es valido");
        input.focus();
    }
    return sirve;
}
function soloNumerosYletras(input){
    console.log("Validando");
    var contenido = input.value;
    var sirve = false;
    sirve = verMaximoCaracteres(contenido, 20); //20 de manera temporal
    if(!sirve){
        alert("Campo "+contenido.name+" es deamsiado largo");
        return false;
    }
    var patron_numeritos = /[A-Za-z0-9\.\_]/;
    sirve = patron_numeritos.test(contenido);
    if(!sirve){
        alert("Formato invalido para usuario y/o contraseña");
        input.focus();
    }
}
function quieroNumerosEnteros(input){
    var enterotest = input.value;
    var enteros = /[0-9]/;
    return (enteros.test(enterotest));
}

function quieroTeclearNumeros(e, boolean){
    console.log("ver teclado");
   var teclado = (document.all)?e.keyCode:e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]\./;
    var tec=String.fromCharCode(teclado);
    if(boolean){
        return patron.test(tec);    
    }else{
        return !patron.test(tec);
    }
    
    
}

function quieroTeclearNumerosEnteros(e){
   var teclado = (document.all)?e.keyCode:e.which;
    if(teclado == 8) return true;
    var patron = /[0-9]/;
    var tec=String.fromCharCode(teclado);
    if(!patron.test(tec)){
        alert("Ingreso invalido");
    }
    return patron.test(tec);    
    
}

function noDefault(select){
    console.log("Validando");
    var indice = select.selectedIndex;
    var seleccionado = select.options[indice].value;
    if(seleccionado === "Seleccione alguna opción" || indice===0){
        alert("Debe de seleccionar algún elemento del campo: " +select.name);
        select.focus();
        return false;
    }else{
        return true;
    }
}

function verMaximoCaracteres(contenido, maxCaracteres){
    return (contenido.length>maxCaracteres)?false:true;
}

function switchCampos(id_camp){
    var campoActivar = document.getElementById(id_camp);
    campoActivar.readOnly = campoActivar.readOnly==false ? true : false;
    
}

function esFecha(input){
    var patron_fechas = /^[0-9]{4}\\-[0-9]{1,2}\\-[0-9]{1,2}$/;
    
    if(!patron_fechas.test(input.value)){
        alert("Ingeso de fecha invalido");
        input.focus()
    }
    return patron_fechas.test(input.value);
}

function esCorreo(input){
    var patron_correos = /^\d{4}([\-/.])(0?[1-9]|1[1-2])\1(3[01]|[12][0-9]|0?[1-9])$/;
    if(!patron_correos.test(input.value)){
        alert("Correo invalido");
    }
    return patron_correos.test(input.value);
}