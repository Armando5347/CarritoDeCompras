<%-- 
    Document   : listaClientes
    Created on : 25/05/2020, 07:35:56 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true"%>
<%
    ArrayList <Cliente> clientes = new ArrayList<Cliente>();
    
    HttpSession sesion_empleado = request.getSession();
    String tipo_user = (String)sesion_empleado.getAttribute("tipo_user");
    if(tipo_user != "empleado") response.sendRedirect("error.jsp");
    Empleado emp = (Empleado) sesion_empleado.getAttribute("usuario");
    int id_priv = emp.getCprivilegio_id();
    if(id_priv < 3) response.sendRedirect("error.jsp");
    clientes = Cliente.obtenerClientes();
    if(clientes == null) response.sendRedirect("error.jsp");
    

    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Clientes</title>
    </head>
    <body>
        <h1>Clientes registrados</h1>
        <main>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido paterno</th>
                    <th>Apellido Materno</th>
                    <th>Telefono</th>
                    <th>Celular</th>
                    <th>Fecha nacimiento</th>
                </tr>
            </thead>
            <tbody>
            <%
            for(Cliente cli:clientes){
                %>
                <tr>
                    <td><%=cli.getId_cli()%></td>
                    <td><%=cli.getNombre_cli()%></td>
                    <td><%=cli.getAppat_cli()%></td>
                    <td><%=cli.getApmat_cli()%></td>
                    <td><%=cli.getTel_cli()%></td>
                    <td><%=cli.getCel_cli()%></td>
                    <td><%=cli.getFecha_nacimiento_cli()%></td>
                </tr> 
            <%}%>
            </tbody>
        </table>
        </main>
    </body>
</html>
