<%-- 
    Document   : listaEmpleados
    Created on : 25/05/2020, 05:39:12 PM
    Author     : maste
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<%
    ArrayList <Empleado> empleados_que_puede_ver = new ArrayList<Empleado>();
    
    HttpSession sesion_empleado = request.getSession();
    String tipo_user = (String)sesion_empleado.getAttribute("tipo_user");
    if(tipo_user != "empleado") response.sendRedirect("error.jsp");
    Empleado emp = (Empleado) sesion_empleado.getAttribute("usuario");
    int id_priv = emp.getCprivilegio_id();
    empleados_que_puede_ver = Empleado.mostrarEmpleados(id_priv);
    if(empleados_que_puede_ver == null) response.sendRedirect("error.jsp");
    

    
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>-Lista de empelados-</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="bg-primary text-center container-fluid">Ver empleados</h1>
            <hr>
            <table class="table-responsive container table-bordered table-hover w-75">
                <thead class="bg-primary">
                    <tr>
                        <th>Id</th>
                        <th>Nombre</th>
                        <th>Apellido paterno</th>
                        <th>Apellido materno</th>
                        <th>Puesto</th>
                        <th>Telefono</th>
                        <th>Celular</th>
                        <th>Fecha nacimiento</th>
                        <th>Operaciones</th>
                    </tr>
                </thead>
                <tbody>
                <% for(Empleado e:empleados_que_puede_ver){
                    int id_priv_check = e.getCprivilegio_id();
                String privilegio = Empleado.traducirIdePriv(e.getCprivilegio_id());
                %>
                <tr>
                    <td><%=e.getId_emp()%></td>
                    <td><%=e.getNombre_emp()%></td>
                    <td><%=e.getAppat_emp()%></td>
                    <td><%=e.getApmat_emp()%> </td> 
                    <td><%=privilegio%></td>
                    <td>Telefono: <%=e.getTel_emp()%></td>
                    <td>Celular: <%=e.getCel_emp()%></td>
                    <td>Fecha_nacimiento: <%=e.getFecha_nac_emp()%> </td>
                    <%if(id_priv_check < id_priv ){ %>
                    <td><a href="borrarCuenta?id_b=<%=e.getId_emp()%>">Despedir</a></rd>
                    <%}else{%>
                    <td>Ninguna</td>
                    <%}%>
                </tr>
                <%}%>
                </tbody>
            </table>
                <br>
                <div class="text-center"><a href='index.jsp'>Regresar al index</a></div>
        </main>
    </body>
</html>
