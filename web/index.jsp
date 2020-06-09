<%-- 
    Document   : index
    Created on : 16/05/2020, 07:37:48 PM
    Author     : maste y tenorio
--%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<% 
    ArrayList<MPapel> lista_Productos = new ArrayList<MPapel>();
    ArrayList<DPapel> detalles_Productos = new ArrayList<DPapel>();
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal</title>
         <!-- Latest compiled and minified CSS -->
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
                <!-- ok ya vi que paso con el nav bar basicamente se nos olvido meter al guest-->
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
                    <li class="carrito nav-item">
                        <a href="tendencias.jsp" class="nav-link">Ver tendencias</a>
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
                    <br>
            <main class="container">
        <% 
            /*Tuve que comentar las lineas de codigo por que no podia trabajar
            no hay pex equis de
            */
            lista_Productos = MPapel.obtenerPapelesVista();
            detalles_Productos = DPapel.obtenerTodosDetallesPapel();
            //Pos si las dudas
            
            //Un for clasico para poder trabajar adecuadamente
            
            //pd me acobo de dar cuenta de que esto terminara siendo una matriz
            double tamanno = lista_Productos.size();
            System.out.println(tamanno/6.0);
            int u = (int)Math.round(tamanno/6.0); 
            System.out.println(lista_Productos.size());
            int controlador = 1;
        for(int i=0;i<=u;i++){
        %>
        <section class="container card-deck">
        <%
            for(int j=0;j<=5;j++){
                if(6*i+j+1 <= lista_Productos.size()){
                    MPapel mp = lista_Productos.get((j+1)* controlador);
                    DPapel dp = detalles_Productos.get((j+1)* controlador);                    
        %>
        <!--Se debe mostrar el nombre, precio-->
        
        <div class="card col-md-2 border-dark">
            <div class="card-body">
                <img src="img/papel.png" class="card-img">
                <hr>
                <h6 class="card-title "><%=mp.getNombre_pap()%></h6>
                <p class="card-subtitle">Precio: <%=dp.getPrecio()%></p>
                <p><a class="card-link" href="VerDetalleProdcuto.jsp?id=<%=mp.getId_MPapel()%>">Ver Producto</a></p>
            </div>
        </div>  
        <%
            }else{
                    break;
                }
            }
            controlador+=1;
        %>
        </section>
        <%
            }
        %>
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
