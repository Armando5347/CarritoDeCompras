<%-- 
    Document   : formaDePago
    Created on : 16/05/2020, 08:57:07 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingrese su forma de pago.</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
        
        <!--Script para validaciones-->
        <script src="js/validarEntradas.js"></script>
        <script src="js/validarMetodosPago.js"></script>
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="container-fluid text-center bg-primary">Ingrese su metodo de pago</h1>
            <hr>
            <div class=" container btn-group">
                <div  onclick ="" class="btn btn-info"><img src="img/paypal.jpg" alt="imagen paypal"></div>
                <div  onclick="" class="btn btn-info"><img src="img/targeta_credito.png" alt="imagen targeta"></div>
                <div onclick="" class="btn btn-info"><img src="img/targetas-credito.jpg" alt="imagen credito"></div>
            </div>
            <div class="invisible" id="paypal"></div>
            <div class="invisible" id="targeta"></div>
            <div class="invisible" id="efectivo"></div>
        </main>
       
    </bo
</html>
