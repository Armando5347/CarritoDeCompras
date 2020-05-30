<%-- 
    Document   : actualizarProducto
    Created on : 16/05/2020, 08:57:48 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true"%>
<%
    HttpSession sesion_admin = request.getSession();
    boolean tagud = true;
    String redirect = "";
    String tipo_user = (String) sesion_admin.getAttribute("tipo_user");
    if(tipo_user == null || tipo_user.isEmpty() || !tipo_user.equals("empleado")){
        System.out.println("Tipo user invalido");
        tagud = false;
        redirect = "error.jsp";
    }
    Empleado admin = (Empleado)sesion_admin.getAttribute("usuario");
    int priv = admin.getCprivilegio_id();
    String id_ver = request.getParameter("id");
    int id_Pap = 0;
    try{
        id_Pap = Integer.parseInt(id_ver);
    }catch(Exception e){
        System.out.println("No tiene permisos");
        tagud = false;
        redirect = "error.jsp";
    }
    MPapel papel_act = null;
    DPapel detalle_actual = null;
    try{
        papel_act =  MPapel.obtenerPapelPorId(id_Pap);
        int id_dpap = papel_act.getId_MPapel();
        detalle_actual = DPapel.obtenerDetallePapel(id_dpap);
    }catch(Exception e){
        tagud = false;
       redirect = "error.jsp";
    }
    if(!tagud){ %>
    <jsp:forward page="<%=redirect%>"></jsp:forward>
    <%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar info. producto.</title>
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
                <% 
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
                        int privilegio =((Empleado)sesion_admin.getAttribute("usuario")).getCprivilegio_id();
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
            <h1 class="text-center container-fluid bg-primary">Actualizar Producto</h1> <hr>

            <form method="post" action="actualizarPapel" class="container was-validated">
                <h2 class="text-right bg-info"><%=papel_act.getNombre_pap()%></h2>
                <div class="input-group">    
                        <div class="input-group-prepend">
                            <span class="input-group-text">Precio</span>
                        </div>
                <input name="precio" type="number" value="<%=detalle_actual.getPrecio()%>" onkeypress="return quieroTeclearNumeros(event,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br>
                <div class="input-group">    
                        <div class="input-group-prepend">
                            <span class="input-group-text">Stock:</span>
                        </div>
                <input name="stock" type="number" value="<%=detalle_actual.getStock()%>" onkeypress="return quieroTeclearNumerosEnteros(event)" onchange="return quieroNumerosEnteros(this)">
                </div>
                <br>
                <input type="hidden" name="id" value="<%=papel_act.getId_dp()%>">
                <input type="submit" value="Actualizar" class="btn-primary">
                <br> <small>Nota: si no se usa el boton de actualizacion, no se aplicaran los cambios</small>
                <br>
                <a href="listaProductosAdimn.jsp" class="btn btn-info">Regresar al listado de productos</a>
                <br>
            </form>
        </main>
    </body>
</html>
