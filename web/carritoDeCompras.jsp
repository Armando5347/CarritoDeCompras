<%-- 
    Document   : carritoDeCompras
    Created on : 16/05/2020, 08:59:02 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.util.ArrayList" session="true"%>
<!DOCTYPE html>
<%--Aquise debe traer un arrayList de todos los productos--%>
<%
    ArrayList<Object> lista_Productos = new ArrayList<>();
                                        //Aquí iria un metodo como obtenerProductosDelCarrito(id_carrito || id_cliente)
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sus Papeles en su Carrito de compras</title>
    </head>
    <body>
        <h1></h1>
        <% 
        for(Object o:lista_Productos){
            
        
        %>
        <div class="">
            <h2></h2>
            <p></p>
            <p></p>
            <p><a href="AgregarPapelAlCarrito?id='1'">Agregar al carrito de compras</a> || <a href="ComprarPoducto"></a></p>
        </div>
        
        <%}%>
    </body>
</html>
