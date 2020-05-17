<%-- 
    Document   : nindex
    Created on : 16/05/2020, 07:37:48 PM
    Author     : maste
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
        <% ArrayList<Object> lista_Productos = new ArrayList<>();
        %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal</title>
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <header><h1>¡Papelilandia!</h1>
            <div class="img_izquierda"><img src="img/papel.png"></div>
            <% 
                
                HttpSession sesion_actual = request.getSession();
                if(sesion_actual==null){ %>
            <div class="derecho"><a href="InicioSesion.jsp">Iniciar Sesion.</a> || <a href="Registro.jsp">Registrarse.</a></div>
            <%}else{%>
            <div class="derecho"><a href="Cerrar_Sesion">Cerrar Sesion.</a> || <a href="Registro.jsp">Registrarse.</a></div>
            <%}%>
        </header>
        <nav>
            <a href="index.jsp"><img src="papel.png"></a>
            <ul>
                <li><a href="historial.jsp">Historial</a></li>
                <li><a href="editarUser.jsp">Sesion de usuario</a></li>
                <li clas="carrito"><a href="carritoDeCompras.jsp">Ver tu carrito de compras</a></li>
            </ul>
        </nav>
        <main>
            <% 
        for(Object o:lista_Productos){
            
        
        %>
        <div class=""> <!--Se debe mostrar el nombre, precio-->
            <h2><%=%></h2>
            <p><%=%></p>
            <p><%=%></p>
            <p><a href="VerDetalldeProdcuto.jsp?id='<%=%>'">Ver Producto</a></p>
        </div>
        
        <%}%>
        </main>
    </body>
</html>
