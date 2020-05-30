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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Clientes</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        
        <main class="container-fluid" >
            <h1 class="bg-primary text-center container-fluid" >Clientes registrados</h1> <hr>
            <table class="text-center container border-dark table-bordered table-hover w-75">
                <thead class="bg-primary">
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
                <br>
                <div class="text-center"><a href='index.jsp'>Regresar al index</a></div>
        </main>
    </body>
</html>
