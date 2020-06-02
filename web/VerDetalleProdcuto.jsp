<%-- 
    Document   : VerDetalleProducto
    Created on : 16/05/2020, 07:30:59 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.Empleado"%>
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
<html lang="es"
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
        <link rel="stylesheet" href="css/estilos.css">
    </head>
    <body>
        <div class="container-fluid">
            <header class="d-flex">
                <div class="col-md-8 d-flex centrar align-items-center">
                    <a href="index.jsp" class="col-md-2"><img class="img-fluid" src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% HttpSession sesion_actual = request.getSession();
                    String tipo_user = (String)sesion_actual.getAttribute("tipo_user");
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 float-md-right align-middle align-items-center">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm align-middle h-2rem">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm align-middle h-2rem">Registrarse</a>
                </div>
                <%}else{
                %>
                <div class="btn-group d-flex col-md-4  float-md-right align-middle h-2rem align-items-center">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm flex align-middle h-2rem">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm flex align-middle h-2rem">Registrarse</a>
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
                        int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
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
                    }else{
                        //Este es el guest
                    %>
                        <li class="carrito nav-item">
                            <a href="carritoDeCompras.jsp" class="nav-link">Ver tu carrito de compras</a>
                        </li>
                        <li class="carrito nav-item">
                            <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
                        </li>
                        <li class="carrito nav-item">
                            <a href="Registro.jsp" class="nav-link">Registrarse</a>
                        </li>
                    <%
                    }
                    %>
                </ul>
            </nav>
        </div>
        <main class="container-fluid float-left">
            <h1 class="bg-primary container-fluid text-center">Visulización dle producto</h1> <hr>
            <div class="container float-left w-50">
                <h2>Nombre: <%=papel_A_detallar.getNombre_pap()%></h2>
                <p>Precio: <b><%=detalle_a_mostrar.getPrecio()%></b></p>
                <p>Material de elaboracion: <b><%=(String)detalles_catalogos.get(0)%></b></p>
                <p>Tipo de papel: <b><%=(String)detalles_catalogos.get(1)%></b></p>
                <p>Aroma: <b><%=(String)detalles_catalogos.get(2)%></b></p>
                <p>Rollos Incluidos en el paquete: <b><%=(String)detalles_catalogos.get(3)%></b></p>
                <p>Tipo de hojas: <b><%=(String)detalles_catalogos.get(4)%></b></p>
                <p>Hojas por rollos: <b><%=(String)detalles_catalogos.get(5)%></b></p>
            </div>
        <!--<p><a href="Comprar?id='<%=id%>'">Comprar el Producto</a></p>-->
        <div class=" float-left w-50 align-middle flex text-center">
            <a href="<%= request.getContextPath() %>/AgregarAlCarrito?id='<%=id%>'"><button class="btn-primary">Agregar al carrito</button></a> <hr> <p class="text-center">Ó</p> <hr> <a href="index.jsp">Regresar al index</a>
        </div>
        <br>
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
