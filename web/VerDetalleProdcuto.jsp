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
    
    String idEnString = request.getParameter("id_papel");
    int id = 0;
    try{
        id = Integer.parseInt(idEnString);
    }catch(Exception ex){
        response.sendRedirect("error.jsp");
    }
    MPapel papel_A_detallar = MPapel.obtenerPapelPorId(id);
    DPapel detalle_a_mostrar = DPapel.obtenerDetallePapel(papel_A_detallar.getId_dp());
    int ides[] = new int[6];
    ides[0] = detalle_a_mostrar.getcMaterial_id();
    ides[2] = detalle_a_mostrar.getcTipos_id();
    ides[3] = detalle_a_mostrar.getcAroma_id();
    ides[4] = detalle_a_mostrar.getcRollosIncluidos_id();
    ides[5] = detalle_a_mostrar.getcTipo_hojas_id();
    ides[6] = detalle_a_mostrar.getcHojasxRollo_id();
    
    ArrayList detalles_catalogos = CatalogosPapel.obtenerValores(ides);
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papel: <%=papel_A_detallar.getNombre_pap()%></title>
        <link rel="stylesheet" href="estilos.css">
    </head>
    <body>
        <main>
        <h1>Nombre: <%=papel_A_detallar.getNombre_pap()%></h1>
        <p>Precio: <%=detalle_a_mostrar.getPrecio()%></p>
        <p>Material de elaboracion: <%=detalles_catalogos.get(0)%></p>
        <p>Tipo de papel: <%=detalles_catalogos.get(1)%></p>
        <p>Aroma: <%=detalles_catalogos.get(2)%></p>
        <p>Rollos Incluidos en el paquete: <%=detalles_catalogos.get(3)%></p>
        <p>Tipo de hojas: <%=detalles_catalogos.get(4)%></p>
        <p>Hojas por rollos: <%=detalles_catalogos.get(5)%></p>
        
        <!--<p><a href="Comprar?id='<%=id%>'">Comprar el Producto</a></p>-->
        <p><a href="AgregarAlCarrito?id='<%=id%>'">Añadir al Carrito</a></p>
        </main>
    </body>
</html>
