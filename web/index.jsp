<%-- 
    Document   : index
    Created on : 16/05/2020, 07:37:48 PM
    Author     : maste y tenorio
--%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<% 
    ArrayList<MPapel> lista_Productos = new ArrayList<MPapel>();
    ArrayList<DPapel> detalles_Productos = new ArrayList<DPapel>();
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal</title>
         <!-- Latest compiled and minified CSS -->
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
                <div class="col-md-8 d-flex centrar">
                    <a href="index.jsp" class="col-md-2"><img src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% HttpSession sesion_actual = request.getSession();
                    String tipo_user = (String)sesion_actual.getAttribute("tipo_user");
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(tipo_user == "cliente"){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(tipo_user == "empleado"){
                int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
                if(privilegio == 1){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(privilegio == 2){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="RegistrarEmpleados.jsp" class="btn btn-primary btn-sm">Registrar nuevo Empleado</a>
                    <a href="listaEmpleados.jsp" class="btn btn-primary btn-sm">Ver empleados</a>
                </div>
                <%}else if(privilegio == 3){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="RegistrarEmpleados.jsp" class="btn btn-primary btn-sm">Registrar nuevo Empleado</a>
                    <a href="listaEmpleados.jsp" class="btn btn-primary btn-sm">Ver empleados</a>
                    <a href="listaClientes.jsp" class="btn btn-primary btn-sm">Ver clientes</a>
                </div>
                <%}
                }%>
            </header>
            <nav>
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="Historial.jsp" class="nav-link">Historial</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%if(tipo_user == "empleado"){
                        int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
                        if(privilegio == 3){%>
                    <li class="nav-item"><a href='listaProductosAdmin.jsp'>Ver inventario de productos</a></li>
                    <%}}%>
                    <li class="carrito nav-item">
                        <a href="carritoDeCompras.jsp" class="nav-link">Ver tu carrito de compras</a>
                    </li>
                    <li clas="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                </ul>
            </nav>
        </div>
            <main class="row container">
        <% 
            /*Tuve que comentar las lineas de codigo por que no podia trabajar
            no hay pex equis de
            */
            lista_Productos = MPapel.obtenerPapelesVista();
            detalles_Productos = DPapel.obtenerTodosDetallesPapel();
            //Pos si las dudas
            
            //Un for clasico para poder trabajar adecuadamente
        for(int i=0;i<lista_Productos.size();i++){
            MPapel mp = lista_Productos.get(i);
            DPapel dp = detalles_Productos.get(i);
        %>
        <!--Se debe mostrar el nombre, precio-->
        
        <div class="card col-md-2">
            <div class="card-body">
                <img src="img/papel.png">
                <p><a href="VerDetalldeProdcuto.jsp?id=''">Ver Producto</a></p>
                <h6>Nombre del producto:<%=mp.getNombre_pap()%></h6>
                <p>Precio:<%=dp.getPrecio()%></p>
                <p><a href="VerDetalleProdcuto.jsp?id=<%=mp.getId_MPapel()%>">Ver Producto</a></p>
            </div>
        </div>  
        <%}%>
        </main>
    </body>
</html>
