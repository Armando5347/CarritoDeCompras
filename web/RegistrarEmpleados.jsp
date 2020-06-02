<%-- 
    Document   : RegistrarEmpleados
    Created on : 24/05/2020, 02:42:26 AM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de empleados del sistema</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/estilos.css">
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
                    <%}else if(privilegio == 1) response.sendRedirect("error.jsp");
                    }
                    %>
                </ul>
            </nav>
        </div><br>
        <script src="js/validarEntradas.js"></script>
        
        <main class="container-fluid">
            <h1 class="text-center bg-primary container-fluid">Registrar nuevo empleado</h1> <hr>
            <form method="post" action="Registrar_Usuario" class="container was-validated">
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div>
                    <input name="nombre" type="text" onchange="return quieroNumeros(this, false)" onkeypress="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido paterno:</span>
                    </div>
                    <input name="appat" type="text" onchange="return quieroNumeros(this, false)" onkeypress="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido materno:</span>
                    </div>
                    <input name="apmat" type="text" onchange="return quieroNumeros(this, false)" onkeypress="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha nacimiento:</span>
                    </div>
                    <input type="date" name="fecha_nac" onchange="return esDate(this)"></div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono fijo:</span>
                    </div>
                    <input type="number" name="telefono" onkeypress="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono celular:</span>
                    </div>
                    <input type="number" name="celular" onkeypress="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div> 
                    <input type="text" name="username"  onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div>
                    <input type="password" name="pass" onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Verificar Contraseña:</span>
                    </div>
                    <input type="password" name="ver_pass" onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Puesto de trabajo:</span>
                    </div>
                    <select name="puesto" readOnly="readonly" class="custom-select">
                            <option>Puestos a seleccionar</option>
                            <option>Empleado</option>
                            <option>Gerente</option>
                            <option>Admin</option>
                        </select>
                </div>
                
                    <div class="btn-group"><input type="submit" value="Registrar" class="btn-primary"> <input type="reset" value="Reiniciar campos" class="btn-secondary"></div>
            
            </form>
            <a href='index.jsp' class="btn btn-info">Regresar al index</a>
        </main><br>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
