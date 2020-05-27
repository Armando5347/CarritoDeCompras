<%-- 
    Document   : VerDetalleProducto
    Created on : 16/05/2020, 07:30:59 PM
    Author     : maste
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Paquete_Clases.CatalogosPapel"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<%
    
    String idEnString = request.getParameter("id");
    int id = 0;
    try{
        id = Integer.parseInt(idEnString);
    }catch(Exception ex){
        System.out.println("Yo lo romí, el ide de MPapel");
        response.sendRedirect("error.jsp");
    }
    MPapel papel_A_detallar = MPapel.obtenerPapelPorId(id);
    DPapel detalle_a_mostrar = DPapel.obtenerDetallePapel(papel_A_detallar.getId_dp());
    
    ArrayList detalles_catalogos = new ArrayList();
    detalles_catalogos = CatalogosPapel.obtenerValores(
            detalle_a_mostrar.getcMaterial_id(),
            detalle_a_mostrar.getcTipos_id(),
            detalle_a_mostrar.getcAroma_id(),
            detalle_a_mostrar.getcRollosIncluidos_id(),
            detalle_a_mostrar.getcTipo_hojas_id(),
            detalle_a_mostrar.getcHojasxRollo_id()
            );
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papel: <%=papel_A_detallar.getNombre_pap()%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <main class="container float-left">
            <div class=" float-left w-50">
                <h1>Nombre: <%=papel_A_detallar.getNombre_pap()%></h1>
                <p>Precio: <b><%=detalle_a_mostrar.getPrecio()%></b></p>
                <p>Material de elaboracion: <b><%=(String)detalles_catalogos.get(0)%></b></p>
                <p>Tipo de papel: <b><%=(String)detalles_catalogos.get(1)%></b></p>
                <p>Aroma: <b><%=(String)detalles_catalogos.get(2)%></b></p>
                <p>Rollos Incluidos en el paquete: <b><%=(String)detalles_catalogos.get(3)%></b></p>
                <p>Tipo de hojas: <b><%=(String)detalles_catalogos.get(4)%></b></p>
                <p>Hojas por rollos: <b><%=(String)detalles_catalogos.get(5)%></b></p>
            </div>
        <!--<p><a href="Comprar?id='<%=id%>'">Comprar el Producto</a></p>-->
        <div class="  float-left w-50 align-middle text-center">
            <a href="AgregarAlCarrito?id='<%=id%>'"><button class="btn-primary">Agregar al carrito</button></a> <hr> <p class="text-center">Ó</p> <hr> <a href="index.jsp">Regresar al index</a>
        </div>
        </main>
    </body>
</html>
