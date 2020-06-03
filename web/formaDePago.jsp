<%-- 
    Document   : formaDePago
    Created on : 16/05/2020, 08:57:07 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.Empleado"%>
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
        <link rel="stylesheet" href="css/estilos.css">
        
        <!--Script para validaciones-->
        <script src="js/validarEntradas.js"></script>
        <script src="js/validarMetodosPago.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <header class="d-flex">
                <div class="col-md-8 d-flex centrar align-items-center">
                    <a href="index.jsp" class="col-md-2"><img class="img-fluid" src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% HttpSession sesion_actual = request.getSession();
                    String tipo_user = (String)sesion_actual.getAttribute("tipo_user");
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 float-md-right align-middle align-items-center">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm align-middle h-2rem">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm align-middle h-2rem">Registrarse</a>
                </div>
                <%}else{
                %>
                <div class="btn-group d-flex col-md-4  float-md-right align-middle h-2rem align-items-center">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm flex align-middle h-2rem">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle h-2rem">Registrarse</a>
                </div>
                <%}%>
                
            </header>
            <nav>
                <ul class="nav nav-tabs">
                    <%
                    if(tipo_user=="cliente"){
                    %>
                    <li class="nav-item">
                        <a href="Historial.jsp" class="nav-link">Historial</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="carritoDeCompras.jsp" class="nav-link">Ver tu carrito de compras</a>
                    </li>
                    <%}else if(tipo_user == "empleado"){
                        int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
                        if(privilegio == 3){%>
                    <li class="nav-item">
                        <a class="nav-link" href='listaProductosAdmin.jsp'>Ver inventario de productos</a></li>
                    <li class="carrito nav-item">
                        <a href="listaEmpleados.jsp" class="nav-link">Ver empleados</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaClientes.jsp" class="nav-link">Ver clientes</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}else if(privilegio==2){%>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaEmpleados.jsp" class="nav-link">Ver empleados</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaClientes.jsp" class="nav-link">Ver clientes</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}else if(privilegio == 1){ %>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}
                    }
                    %>
                </ul>
            </nav>
        </div>
        <main class="container-fluid">
            <h1 class="container-fluid text-center bg-primary centrar">Ingrese su metodo de pago</h1>
            <hr>
            <div class="container  flex btn-group justify-content-center text-center align-middle">
                <div  onclick ="seleccionMetodo('paypal')" class="btn btn-info w-25"><img src="img/paypal.png" class="img-fluid" alt="imagen paypal"></div>
                <div  onclick="seleccionMetodo('tarjeta')" class="btn btn-info w-25"><img src="img/targeta_credito.png" class="img-fluid" alt="imagen targeta"></div>
                <div onclick="seleccionMetodo('efectivo')" class="btn btn-info w-25" ><img src="img/efectivo.png" class="img-fluid" alt="imagen efectivo"></div>
            </div>
            <hr>
            <div id="info">Total a pagar: <input type="number" readonly="readonly" name="precio_a_pagar" value="<%= request.getParameter("total") %>"></div>
            <div id="metodos" class="container">
                <div class="card centrar w-75" style="opacity: 0;" id="paypal">
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">Paypal</h2>
                    </div>
                    <form method='post' class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="paypal">
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span  class="input-group-text">Correo de la cuenta:</span>
                            </div>
                            <input type="email" name="username" class="form-control" onchange="return esCorreo(this)">
                        </div>
                        <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Contraseña:</span>
                            </div>
                            <input type="password"  class="form-control" name="pass" onchange="return soloNumerosYletras(this)">
                        </div><br>
                        <input type="submit" class="btn btn-primary" value="efectuar compra">
                    </form>

                </div>
                <div class="card centrar w-75" style="opacity: 0;" id="tarjeta" >
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">Tarjeta de credito</h2>
                    </div>
                    <form method="post" class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="tarjeta">
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Tarjetas validas:</span>
                            </div>
                            <select name="select_tarjeta" readonly="true" class="custom-select">
                                <option>Ver tarjetas</option>
                                <option>MasterCard</option>
                                <option>America express</option>
                                <option>VISA</option>
                            </select>
                        </div> <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Codigo tarjeta:</span>
                            </div>
                            <input type="number" class="form-control" name="codigo" onkeypress=" return quieroTeclearNumerosEnteros(event)" onchange=" return quieroNumerosEnteros(this)">
                        </div><br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Ingrese la fecha de vencimiento</span>
                            </div>
                            <input type="number"  class="form-control" size="2" min="1" max="12" name="fecha_vencimiento_mes" onchange="return quieroNumerosEnteros(this)" onkeypress="return quieroTeclearNumerosEnteros(event)"> / <input type="number" class="form-control" size="4" name="fecha_vencimiento_ano" onkeypress=" return quieroTeclearNumerosEnteros(event)" onchange=" return quieroNumerosEnteros(this)"> 
                        </div><br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">CVV</span>
                            </div>
                            <input type="password"  name="cvv" class="form-control" name="3numeros" size ="3" onkeypress=" return quieroTeclearNumerosEnteros(event)" onchange=" return quieroNumerosEnteros(this)">
                        </div>
                        <br><input type="submit" class="btn btn-primary" value="efectuar compra">
                    </form>
                </div>

                <div class="card centrar w-75" style="opacity: 0;" id="efectivo" >
                    <div class="card-header bg-secondary">
                        <h2 class="card-title">En efectivo por tienda de conveniencia</h2>
                    </div>
                    <form method="post" class="card-body" action='ejecutar_compra'>
                        <input type="hidden" name="metodo" value="efectivo">
                        <p>Si desea hacer un pago por efectivo en alguna tienda de conveniencia, seleccione alguna de las sucursales compatibles</p>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Ingrese la sucursal de su preferencia:</span>
                            </div>
                            <select readonly="readonly" name="sucursal">
                                <option >--Tiendas compatibles--</option>
                                <option>OXXO</option>
                                <option>Seven Eleven</option>
                                <option>Faramcias del Ahorro</option>
                                <option>Extra</option>
                                <option>Operama</option>
                                <option>Circle k</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">    
                            <div class="input-group-prepend">
                                <span class="input-group-text">Ingrese la direccion de la sucursal de su agrado:</span>
                            </div>
                            <input class="form-control" name="direccion_sucursal" type="text" onclick="quieroTeclearNumeros(this,false)" onchange="quieroNumeros(this,false)">
                        </div>
                        <input type="submit" class="btn btn-primary" value="efectuar compra">
                    </form>
                </div>
            </div>
        </main><br>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
