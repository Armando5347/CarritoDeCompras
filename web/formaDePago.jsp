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
            <h1 class="container-fluid text-center bg-primary centrar">Ingrese su metodo de pago</h1>
            <hr>
            <div class="container btn-group justify-content-center text-center align-middle">
                <div  onclick ="seleccionMetodo('paypal')" class="btn btn-info w-25"><img src="img/paypal.jpg" class="img-fluid" alt="imagen paypal"></div>
                <div  onclick="seleccionMetodo('tarjeta')" class="btn btn-info w-25"><img src="img/targeta_credito.png" class="img-fluid" alt="imagen targeta"></div>
                <div onclick="seleccionMetodo('efectivo')" class="btn btn-info w-25" ><img src="img/efectivo.png" class="img-fluid" alt="imagen efectivo"></div>
            </div>
        <div id="info">Total a pagar: <input type="number" readonly="readonly" name="precio_a_pagar"></div>
            <div id="metodos">
                <div class="card centrar w-75" style="opacity: 0;" id="paypal">
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">Paypal</h2>
                    </div>
                    <form method='post' class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="paypal">
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre de usuario:</span>
                            </div>
                            <input type="text" name="username">
                        </div>
                        <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Otra cosa:</span>
                            </div>
                            <input type="email" name="cuenta?">
                        </div>
                    </form>

                </div>
                <div class="card centrar w-75" style="opacity: 0;" id="targeta" >
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">Tarjeta de credito</h2>
                    </div>
                    <form method="post" class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="tarjeta">
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Tarjetas validas:</span>
                            </div>
                            <select name="targeta" readonly="true">
                                <option>Master card</option>
                                <option>VISA</option>
                            </select>
                        </div> <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre del Propietario:</span>
                                <input type="text" name="propietario" onkeypress="return quieroTeclearNumerosEnteros(event)" onchange="return quieroNumerosEnteros(this)">
                            </div>
                        </div> <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Codigo tarjeta:</span>
                            </div>
                            <input type="number" name="codigo">
                        </div><br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Inserte los 3 numeros finales</span>
                            </div>
                            <input type="password" name="3numeros" onkeypre>
                        </div>
                    </form>
                </div>

                <div class="card centrar w-75" style="opacity: 0;" id="efectivo" >
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">En efectivo</h2>
                    </div>
                    <form method="post" class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="efectivo">
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Algo:</span>
                            </div>
                            <input type="" name="">
                        </div>
                    </form>
                </div>
            </div>
        </main>
       
    </bo
</html>
