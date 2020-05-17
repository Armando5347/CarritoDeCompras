<%-- 
    Document   : Registro
    Created on : 16/05/2020, 07:33:53 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"  session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
        <link rel="stylesheet" href="estilos.css">
        <script src="js/validarEntradas.js"></script>
    </head>
    <body>
        <h1>Ingrese los datos solicitados para crear su cuenta</h1>
        <form name="formulario_Registro" method="post" action="Registrar_Usuario">
            <div class="">
                Nombre: <input type="text" name="nombre">
                Apellido paterno: <input type="text" name="appat" onclick="return noTecleesNumeros(ev)" onchange="return noNumeros(this)">
                Apellido Materno: <input type="text" name="apmat" onclick="return noTecleesNumeros(ev)" onchange="return noNumeros(this)">
                Fecha nacimiento: <input type="date" name="fecha_nac">
                Usuario: <input type="text" name="username"  onchange="return soloNumerosYletras()(this)">
                Contraseña: <input type="password" name="pass" onchange="return soloNumerosYletras()(this)">
                Verificar Contraseña: <input type="password" name="ver_pass" onchange="return soloNumerosYletras()(this)">
            </div>
            <div class="">
                <input type="submit" value="Registrarse"> | | <input type="reset" value="Vaciar Campos.">
            </div>
        </form>
    </body>
</html>
