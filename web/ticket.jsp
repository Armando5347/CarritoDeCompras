<%-- 
    Document   : ticket
    Created on : 29/05/2020, 10:55:12 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>
<%
    
    
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket de compra</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="container-fluid bg-primary text-left">Compra realizada con exito!</h1>
            <hr>
            <div id="ticket" class="container w-75 border-dark">
                <h2>Ticket de compra:</h2><br>
                <article>
                    <ul class="list-group">
                        <li class="list-group-item">Nombre del servicio: <input readonly="readonly" class="list-group-item-text" value=""></li>
                        <li class="list-group-item">Fecha de la Compra: <input readonly="readonly"  class="list-group-item-text" value=""></li>
                        <li class="list-group-item">Productos Comprados: <input readonly="readonly"  class="list-group-item-text"value=""></li>
                        <li class="list-group-item">Total a pagar: <input readonly="readonly" class="list-group-item-text" value=""></li>
                        <li class="list-group-item">Número de Venta: <input readonly="readonly" class="list-group-item-text" value=""></li>
                    </ul>
                </article>
            </div>
        </main><br>
        <footer class="container-fluid bg-secondary">
            <small class="contanier font-italic">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.
            </small>
        </footer>
    </body>
</html>
