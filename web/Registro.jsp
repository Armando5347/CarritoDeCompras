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
    </head>
    <body>
        <h1>Ingrese los datos solicitados para crear su cuenta</h1>
        <form name="formulario_Registro" method="post" action="Registrar_Usuario">
            <div class="">
                Nombre: <input type="text" name="nombre">
                Apellido paterno: <input type="text" name="appat">
                Apellido Materno: <input type="text" name="apmat">
                <!--Lo que sea para la direccion-->
                Usuario: <input type="text" name="username">
                Contraseña: <input type="password" name="pass">
                Verificar Contraseña: <input type="password" name="ver_pass">
            </div>
            <div class="">
                <input type="submit" value="Registrarse"> | | <input type="reset" value="Vaciar Campos.">
            </div>
        </form>
    </body>
</html>
