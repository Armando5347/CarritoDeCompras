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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>-Lista de empelados-</title>
    </head>
    <body>
        <h1>Ver empleados</h1>
        <main>
            <table>
                <thead>
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
        </main>
    </body>
</html>
