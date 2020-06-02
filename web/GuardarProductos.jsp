<%-- 
    Document   : GuardarProductos
    Created on : 16/05/2020, 07:34:38 PM
    Author     : maste
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Paquete_Clases.CatalogosPapel"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<%
    ArrayList catalogoMaterial = new ArrayList();
    ArrayList catalogoTipos = new ArrayList();
    ArrayList catalogoAromas = new ArrayList();
    ArrayList catalogoRollos = new ArrayList();
    ArrayList catalogoHojas = new ArrayList();
    ArrayList catalogoHojasXRollo = new ArrayList();
    try{
        catalogoMaterial = CatalogosPapel.obtenerCatalogo("cmaterial");
        catalogoTipos = CatalogosPapel.obtenerCatalogo("ctipos");
        catalogoAromas = CatalogosPapel.obtenerCatalogo("caromas");
        catalogoRollos = CatalogosPapel.obtenerCatalogo("crollosincluidos");
        catalogoHojas = CatalogosPapel.obtenerCatalogo("ctipo_hojas");
        catalogoHojasXRollo = CatalogosPapel.obtenerCatalogo("chojasxrollo");
    }catch(Exception e){
        response.sendRedirect("error.jsp");
    }
    %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador -Registrar Productos-</title>
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
                    try{
                    if(tipo_user != "empleado" || ((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id() != 3) response.sendRedirect("error.jsp");
                    }catch(NullPointerException ed){
                        response.sendRedirect("error.jsp");
                    }
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
        <main class="container-fluid">
            <h1 class="bg-primary text-center container-fluid">Registrar un nuevo producto</h1> <hr>
            <form method="post" action="registrarPapel" class="container was-validated">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div><input type="text" name="nombre_papel" onchange="return quieroNumeros(this, false)" onkeypress="return quieroTeclearNumeros(event, false)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Stock Inicial:</span>
                    </div><input type="number" name="stock" onchange="return quieroNumerosEnteros(this)" onkeypress="return quieroTeclearNumerosEnteros(event)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Precio:</span>
                    </div><input type="number" name="precio" onchange="return quieroNumeros(this, true)" onkeypress="return quieroTeclearNumeros(event, true)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Material:</span>
                    </div>
                    <select name="material" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i<catalogoMaterial.size(); i++){
                                String vm = (String)catalogoMaterial.get(i);
                            
                        %>
                        <option><%=vm%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Aroma</span>
                    </div>
                    <select name="aroma" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i<catalogoAromas.size(); i++){
                                String va = (String)catalogoAromas.get(i);
                            
                        %>
                        <option><%=va%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Tipo de papel:</span>
                    </div>
                    <select name="tipo_papel" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i< catalogoTipos.size(); i++){
                                String vt = (String)catalogoTipos.get(i);
                            
                        %>
                        <option><%=vt%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Hojas por rollo:</span>
                    </div>
                    <select name="hojasRollo" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i< catalogoHojasXRollo.size(); i++){
                                String vhrs = (String)catalogoHojasXRollo.get(i);
                                int vhr = Integer.parseInt(vhrs);
                        %>
                        <option><%=vhr%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Tipo de Hojas:</span>
                    </div>
                    <select name="tipo_hojas" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i< catalogoHojas.size(); i++){
                                String vh = (String)catalogoHojas.get(i);
                            
                        %>
                        <option><%=vh%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Rollos incluidos:</span>
                    </div>
                    <select name="rollos" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <%
                            for(int i = 0; i< catalogoRollos.size(); i++){
                                String vrs = (String)catalogoRollos.get(i);
                                int vr = Integer.parseInt(vrs);
                        %>
                        <option><%=vr%></option>
                        <%}%>
                    </select>
                </div>
                <br>
                <div class="btn-group"><input type="submit" value="Registrar producto" class="btn-primary">  <input type="reset" value="Reiniciar campos" class="btn-secondary"></div>
                
            </form>
            <a href="listaProductosAdmin.jsp" class="btn btn-info">Volver</a>
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
