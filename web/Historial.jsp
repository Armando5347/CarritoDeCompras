<%-- 
    Document   : Historial
    Created on : 16/05/2020, 07:34:18 PM
    Author     : maste
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Paquete_Clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<%
    HttpSession sesion_usuario = request.getSession();
    String tipo_user = (String)sesion_usuario.getAttribute("tipo_user");
    ArrayList historal = new ArrayList();
    Cliente cli = null;
    if(tipo_user.isEmpty() || tipo_user == null ||!tipo_user.equals("cliente")){
        response.sendRedirect("error.jsp");
    }else{
        cli = (Cliente)sesion_usuario.getAttribute("usuario");
        /*Aquí deberá obtenerse el historial ,aún no c como le vamos a hacer
        historial = objetoHistorial.obtenerHistorial(cli.getId_cli());
        */
    }
%>
<html>
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
        
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="container-fluid bg-primary ">Historial de compras de <%=cli.getAppat_cli() + " " +cli.getApmat_cli() +" "+cli.getNombre_cli()%></h1>
            <div class="container card-deck">
            <%-- insertar forEach for(ObjetoHistorial h:historial). --%>
                <div class="card">
                    <div class="card-header">
                        <h2 class="card-title">Compra del <%--historial.getFechaCompra() --%></h2>
                    </div>
                    <div class="card-body"></div>
                </div>
            <%--}--%>
            </div>
        </main><br>
        <footer class="container-fluid bg-secondary">
            <small class="contanier font-italic">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.
            </small>
        </footer>
    </body>
</html>
