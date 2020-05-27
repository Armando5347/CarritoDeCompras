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
    boolean tagud = true;
    String redirect = "";
    String tipo_user = (String) sesion_admin.getAttribute("tipo_user");
    if(tipo_user == null || tipo_user.isEmpty() || !tipo_user.equals("empleado")){
        System.out.println("Tipo user invalido");
        tagud = false;
        redirect = "error.jsp";
    }
    Empleado admin = (Empleado)sesion_admin.getAttribute("usuario");
    int priv = admin.getCprivilegio_id();
    String id_ver = request.getParameter("id");
    int id_Pap = 0;
    try{
        id_Pap = Integer.parseInt(id_ver);
    }catch(Exception e){
        System.out.println("No tiene permisos");
        tagud = false;
        redirect = "error.jsp";
    }
    MPapel papel_act = null;
    DPapel detalle_actual = null;
    try{
        papel_act =  MPapel.obtenerPapelPorId(id_Pap);
        int id_dpap = papel_act.getId_MPapel();
        detalle_actual = DPapel.obtenerDetallePapel(id_dpap);
    }catch(Exception e){
        tagud = false;
       redirect = "error.jsp";
    }
    if(!tagud){ %>
    <jsp:forward page="<%=redirect%>"></jsp:forward>
    <%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar info. producto.</title>
    </head>
    <body>
        <h1>Actualizar Producto</h1>
        <h2><%=papel_act.getNombre_pap()%></h2>
        <form method="post" action="actualizarPapel">
            Precio: <input name="precio" type="number" value="<%=detalle_actual.getPrecio()%>"> <br>
            Stock:  <input name="stock" type="number" value="<%=detalle_actual.getStock()%>">  <br>
            <input type="hidden" name="id" value="<%=papel_act.getId_dp()%>">
            <input type="submit" value="Actualizar">
            <br> <small>Nota: si no se usa el boton de actualizacion, no se aplicaran los cambios</small>
        </form>
    </body>
</html>
