<%-- 
    Document   : Registro
    Created on : 16/05/2020, 07:33:53 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"  session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
        <script src="js/validarEntradas.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <header class="d-flex">
                <div class="col-md-8 d-flex centrar">
                    <a href="index.jsp" class="col-md-2"><img class="img-fluid" src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% HttpSession sesion_actual = request.getSession();
                    String tipo_user = (String)sesion_actual.getAttribute("tipo_user");
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right align-middle">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm flex align-middle">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle">Registrarse</a>
                </div>
                <%}else{
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right align-middle">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm flex align-middle">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle">Registrarse</a>
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
        <main class="container-fluid  ">
            <h1 class=" bg-primary text-center container-fluid">Ingrese los datos solicitados para crear su cuenta</h1>
            <hr>
            <form name="formulario_Registro" method="post" action="Registrar_Usuario" class="justify-content-center container w-75 was-validated">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div>
                    <input class="form-control" type="text" name="nombre">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido Paterno:</span>
                    </div>
                    <input class="form-control" type="text" name="appat" onkeypress="return quieroTeclearNumeros(ev,false)" onchange="return quieroNumeros(this,false)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido Materno:</span>
                    </div>
                    <input class="form-control" type="text" name="apmat" onkeypress="return quieroTeclearNumeros(ev,false)" onchange="return quieroNumeros(this,false)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha nacimiento:</span>
                    </div>
                    <input class="form-control" type="date" name="fecha_nac">
                </div>
                <br>    
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono fijo:</span>
                    </div>
                    <input class="form-control" type="number" name="telefono" onkeypress="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br>  
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono Celular:</span>
                    </div>    
                    <input  class="form-control" type="number" name="celular" onkeypress="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br> 
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div>    
                    <input  class="form-control" type="text" name="username"  onchange="return soloNumerosYletras(this)">
                </div>
                <br> 
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div> 
                    <input class="form-control" type="password" name="pass" onchange="return soloNumerosYletras(this)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Verificar Contraseña: </span>
                    </div>    
                    <input class="form-control" type="password" name="ver_pass" onchange="return soloNumerosYletras(this)">
                </div>
                <hr>
                <div class="">
                    <input class="btn-primary"  type="submit" value="Registrarse"><input type="reset" value="Vaciar Campos." class="btn-secondary">
                </div>
            </form>
        </main>
    </body>
</html>
