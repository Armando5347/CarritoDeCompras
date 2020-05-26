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
            <% for(Empleado e:empleados_que_puede_ver){
                int id_priv_check = e.getCprivilegio_id();
            String privilegio = Empleado.traducirIdePriv(e.getCprivilegio_id());
            %>
            <div>
                <img src="img/user.png">
                <h2><%=e.getAppat_emp()%> <%=e.getAppat_emp()%> <%=e.getNombre_emp()%></h2>
                <p><%=privilegio%></p>
                <%if(id_priv_check < id_priv ){ %>
                <p><a href="borrarCuenta?id='<%=id_priv_check%>'">Despedir</a></p>
                <%}%>
            </div>
            <%}%>
        </main>
    </body>
</html>
