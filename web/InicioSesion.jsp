<%-- 
    Document   : InicioSesion
    Created on : 16/05/2020, 07:34:08 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <script src="js/validarEntradas.js"></script>
        <!--Nav o lo que se va a poner que aún no c-->
        <form name="formularioInicioSesión" method="post" action="IniciarSesion">
            Nombre de Usuario: <input type="text" name="nombre_usuario" onchange="return soloNumerosYletras(this)"> <br>
            Contraseña: <input type="password" name="pass" onchange="return soloNumerosYletras(this)">
            <input type="submit" value="Iniciar Sesión"><input type="reset" value="Vaciar Campos">
            <br>
            Si no tiene una cuenta, cree una pulsando <a href="Registro.jsp"><strong>aquí</strong></a>
        </form>
    </body>
</html>
