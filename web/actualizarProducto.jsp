<%-- 
    Document   : actualizarProducto
    Created on : 16/05/2020, 08:57:48 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar info. producto.</title>
    </head>
    <body>
        <h1>Actualizar Prdocuto</h1>
        <form method="post" action="actualizarPapel">
            Precio: <input name="precio" type="number"> <br>
            Stock:  <input name="stock" type="number">  <br>
            <input type="submit" value="Actualizar">
        </form>
    </body>
</html>
