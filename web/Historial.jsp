<%-- 
    Document   : Historial
    Created on : 16/05/2020, 07:34:18 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Historial"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Paquete_Clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<%
    HttpSession sesion_usuario = request.getSession();
    String tipo_user = (String)sesion_usuario.getAttribute("tipo_user");
    Cliente cli = null;
    ArrayList<Historial> historial = new ArrayList<Historial>();
    if(tipo_user.isEmpty() || tipo_user == null ||!tipo_user.equals("cliente")){
        response.sendRedirect("error.jsp");
    }else{
        cli = (Cliente)sesion_usuario.getAttribute("usuario");
        int id_busqueda = cli.getId_cli();
        try{
            historial = Historial.obtenerHistorialCliente(id_busqueda);
        }catch(NullPointerException e){
            response.sendRedirect("error.jsp");
        }
        /*Aquí deberá obtenerse el historial ,aún no c como le vamos a hacer
        historial = objetoHistorial.obtenerHistorial(cli.getId_cli());
        */
    }
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de compras</title>
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
                    <%}else response.sendRedirect("error.jsp"); %>
                </ul>
            </nav>
        </div><br>
        <main class="container-fluid">
            <h1 class="container-fluid bg-primary ">Historial de compras de <%=cli.getAppat_cli() + " " +cli.getApmat_cli() +" "+cli.getNombre_cli()%></h1>
            <div class="container card-deck">
            <%for(Historial h:historial){ %>
                <div class="card">
                    <div class="card-header">
                        <h2 class="card-title">Compra del <%=h.getFecha()%></h2>
                    </div>
                    <div class="card-body">
                        Total pagado: <%=h.getPrecio()%> <br>
                        
                    </div>
                </div>
            <%}%>
            </div>
        </main><br>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body> 
    
</html>
