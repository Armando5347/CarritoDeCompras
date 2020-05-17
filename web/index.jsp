<%-- 
    Document   : nindex
    Created on : 16/05/2020, 07:37:48 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal</title>
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <header><h1>¡Papelilandia!</h1>
            <div class="img_izquierda"><img src="img/papel.png"></div>
            <div class="derecho"><input  class="boton_link" type="button" value="Registrarse" onclick=""> <input type="button" class="boton_link" value="Iniciar Sesión" onclick=""></div>
        </header>
        <nav>
            <a href="index.jsp"><img src="papel.png"></a>
            <ul>
                <li><a href="historial.jsp">Historial</a></li>
                <li><a href="editarUser.jsp">Sesion de usuario</a></li>
            </ul>
        </nav>
    </body>
</html>
