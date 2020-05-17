<%-- 
    Document   : VerDetalleProducto
    Created on : 16/05/2020, 07:30:59 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<%
    String nombre_papel = "Papelito ejemplo";
    String idEnString = request.getParameter("id_papel");
    int id = Integer.parseInt(idEnString);
    
    /*Object papel_A_detallar = Object.obtenerPapelPorId(id);
    Luego se tendrá que cambiar el object por el nombre de la clase,y crear ese metodo
    Y con eso ya se detectó que papel se va a mostrar
    Para que luego estos datos se envien al carrito de compras en forma de cookies (Servlet),
    O para que se haga la compra directa
    */
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papel: <%=nombre_papel%></title>
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <main>
        <h1><%=nombre_papel%></h1>
        <p><%=%></p>
        <!--<p><a href="Comprar?id='<%=id%>'">Comprar el Producto</a></p>-->
        <p><a href="AgregarAlCarrito?id='<%=id%>'">Añadir al Carrito</a></p>
        </main>
    </body>
</html>
