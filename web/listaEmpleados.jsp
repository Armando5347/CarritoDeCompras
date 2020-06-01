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
        <div class="container-fluid">
            <header class="d-flex">
                <div class="col-md-8 d-flex centrar">
                    <a href="index.jsp" class="col-md-2"><img class="img-fluid" src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% 
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right align-middle">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm flex align-middle">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle">Registrarse</a>
                </div>
                <%}else{
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right align-middle">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm flex align-middle">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle">Registrarse</a>
                </div>
                <%}%>
                
            </header>
            <nav>
                <ul class="nav nav-tabs">
                    <%
                    if(tipo_user=="cliente"){
                    %>
                    <li class="nav-item">
                        <a href="Historial.jsp" class="nav-link">Historial</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="carritoDeCompras.jsp" class="nav-link">Ver tu carrito de compras</a>
                    </li>
                    <%}else if(tipo_user == "empleado"){
                        int privilegio =((Empleado)sesion_empleado.getAttribute("usuario")).getCprivilegio_id();
                        if(privilegio == 3){%>
                    <li class="nav-item">
                        <a class="nav-link" href='listaProductosAdmin.jsp'>Ver inventario de productos</a></li>
                    <li class="carrito nav-item">
                        <a href="listaEmpleados.jsp" class="nav-link">Ver empleados</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaClientes.jsp" class="nav-link">Ver clientes</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}else if(privilegio==2){%>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaEmpleados.jsp" class="nav-link">Ver empleados</a>
                    </li>
                    <li class="carrito nav-item">
                        <a href="listaClientes.jsp" class="nav-link">Ver clientes</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}else if(privilegio == 1){ %>
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%}
                    }
                    %>
                </ul>
            </nav>
        </div>
        <main class="container-fluid">
            <h1 class="bg-primary text-center container-fluid">Ver empleados</h1>
            <hr>
            <table class="text-center container table-bordered table-hover w-75">
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
                    <td><a href="borrarCuenta?id_b=<%=e.getId_emp()%>" class="btn btn-danger">Despedir</a></rd>
                    <%}else{%>
                    <td>Ninguna</td>
                    <%}%>
                </tr>
                <%}%>
                </tbody>
            </table>
                <br>
                <div class="text-center"><a href='index.jsp' class="btn btn-info">Regresar al index</a></div>
        </main>
                <footer class="container-fluid bg-secondary">
            <small class="contanier font-italic">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.
            </small>
        </footer>
    </body>
</html>
