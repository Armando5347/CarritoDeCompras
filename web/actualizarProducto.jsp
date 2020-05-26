<%-- 
    Document   : actualizarProducto
    Created on : 16/05/2020, 08:57:48 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true"%>
<%
    HttpSession sesion_admin = request.getSession();
    String tipo_user = (String) sesion_admin.getAttribute("tipo_user");
    if(tipo_user == null || tipo_user.isEmpty() || !tipo_user.equals("empleado")){
        response.sendRedirect("error.jsp");
    }
    
    Empleado admin = (Empleado)sesion_admin.getAttribute("usuario");
    int priv = admin.getCprivilegio_id();
    String id_ver = request.getParameter("id");
    int id_Pap = 0;
    try{
        id_Pap = Integer.parseInt(id_ver);
    }catch(Exception e){
        response.sendRedirect("error.jsp");
    }
    MPapel papel_act =  MPapel.obtenerPapelPorId(id_Pap);
    DPapel detalle_actual = DPapel.obtenerDetallePapel(id_Pap);
    if(paple_act == null || detalle_actual == null){
        response.sendRedirect("error.jsp");
    }
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar info. producto.</title>
    </head>
    <body>
        <h1>Actualizar Producto</h1>
        <h2><%=</h2>
        <form method="post" action="actualizarPapel">
            Precio: <input name="precio" type="number"> <br>
            Stock:  <input name="stock" type="number">  <br>
            <input type="submit" value="Actualizar">
        </form>
    </body>
</html>
