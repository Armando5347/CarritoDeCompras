<%-- 
    Document   : InicioSesion
    Created on : 16/05/2020, 07:34:08 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
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
                    if(tipo_user != null) response.sendRedirect("index.jsp");
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
        <script src="js/validarEntradas.js"></script>
        <!--Nav o lo que se va a poner que aún no c-->
        <main class="container-fluid justify-content-center">
            <h1 class="text-center container-fluid bg-primary">Inicio de sesión</h1>
            <hr>
            <form name="formularioInicioSesión" method="post" action="IniciarSesion" class="text-center was-validated w-50 container">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div>  
                    <input class="form-control" type="text" name="nombre_usuario" onchange="return soloNumerosYletras(this)">
                </div> 
                <br>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div>
                    <input class="form-control" type="password" name="pass" onchange="return soloNumerosYletras(this)">
                </div>
                <hr>
                <input type="submit" value="Iniciar Sesión" class="btn-primary"> <input type="reset" value="Vaciar Campos" class="btn-secondary">
                <br>
                Si no tiene una cuenta, cree una pulsando <a href="Registro.jsp"><strong>aquí</strong></a>
            </form>
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
