<%-- 
    Document   : listaProductosAdmin
    Created on : 26/05/2020, 01:34:27 AM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>

<%  
    HttpSession sesion_admin = request.getSession();
    String tipo_user = (String) sesion_admin.getAttribute("tipo_user");
    if(tipo_user == null || tipo_user.isEmpty() || !tipo_user.equals("empleado")) response.sendRedirect("error.jsp");
    Empleado admin = (Empleado)sesion_admin.getAttribute("usuario");
    int priv = admin.getCprivilegio_id();
    ArrayList<MPapel> productos = new ArrayList<MPapel>();
    ArrayList<DPapel> detalles = new ArrayList<DPapel>();
    
    productos = MPapel.obtenerPapelesVista();
    detalles = DPapel.obtenerTodosDetallesPapel();
    
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de productos</title>
    </head>
    <body>
        <h1>Productos registrados en el sistema</h1>
        <main>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Editar_param</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(int i = 0; i< productos.size(); i++){
                        MPapel mp = productos.get(i);
                        DPapel dp = detalles.get(i);
                    %>
                    <tr>
                        <td><%=mp.getId_MPapel()%></td>
                        <td><%=mp.getNombre_pap()%></td>
                        <td><%=dp.getPrecio()%></td>
                        <td><%=dp.getStock()%></td>
                        <td><a href="actualizarProducto.jsp?id='<%=mp.getId_MPapel()%>'">Actualizar precio/stock</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
                <div><a href='GuardarProductos.jsp'>Agregar papeles al almacen</a> || <a href='index.jsp'>Regresar al index</a></div>
        </main>
    </body>
</html>