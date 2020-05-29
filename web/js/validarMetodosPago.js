/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function seleccionMetodo(name_metodo){
    switch(name_metodo){
        case "paypal":
            var paypal = document.getElementById("paypal");
            var tarjeta = document.getElementById("tarjeta");
            var efectivo = document.getElementById("efectivo");
            paypal.style.opacity = 1;
            tarjeta.style.opacity = 0;
            efectivo.style.opacity = 0;
            
            break;
        case "tarjeta":
            var paypal = document.getElementById("paypal");
            var tarjeta = document.getElementById("tarjeta");
            var efectivo = document.getElementById("efectivo");
            paypal.style.opacity = 0;
            tarjeta.style.opacity = 1;
            efectivo.style.opacity = 0;
            break;
        case "efectivo":
            var paypal = document.getElementById("paypal");
            var tarjeta = document.getElementById("tarjeta");
            var efectivo = document.getElementById("efectivo");
            paypal.style.opacity = 0;
            tarjeta.style.opacity = 0;
            efectivo.style.opacity = 1;
            break;
    }
}

