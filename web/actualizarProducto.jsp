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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
        
        <script src="js/validarEntradas.js"></script>
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="text-center container-fluid bg-primary">Actualizar Producto</h1> <hr>

            <form method="post" action="actualizarPapel" class="container was-validated">
                <h2 class="text-right bg-info"><%=papel_act.getNombre_pap()%></h2>
                <div class="input-group">    
                        <div class="input-group-prepend">
                            <span class="input-group-text">Precio</span>
                        </div>
                <input name="precio" type="number" value="<%=detalle_actual.getPrecio()%>" onkeypress="return quieroTeclearNumeros(event,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br>
                <div class="input-group">    
                        <div class="input-group-prepend">
                            <span class="input-group-text">Stock:</span>
                        </div>
                <input name="stock" type="number" value="<%=detalle_actual.getStock()%>" onkeypress="return quieroTeclearNumerosEnteros(event)" onchange="return quieroNumerosEnteros(this)">
                </div>
                <br>
                <input type="hidden" name="id" value="<%=papel_act.getId_dp()%>">
                <input type="submit" value="Actualizar" class="btn-primary">
                <br> <small>Nota: si no se usa el boton de actualizacion, no se aplicaran los cambios</small>
                <br>
                <a href="listaProductosAdimn.jsp" class="btn btn-info">Regresar al listado de productos</a>
                <br>
            </form>
        </main>
    </body>
</html>
