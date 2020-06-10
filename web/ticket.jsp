<%-- 
    Document   : ticket
    Created on : 29/05/2020, 10:55:12 PM
    Author     : maste
--%>

<%@page import="Paquete_Clases.MPapel"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>
<%
    
    
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket de compra</title>
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
                    }
                    %>
                </ul>
            </nav>
        </div>
        <main class="container-fluid"> 
            <% Calendar c2 = new GregorianCalendar(); %>
            <h1 class="container-fluid bg-primary text-left">Compra realizada con exito!</h1>
            <hr>
            <div id="ticket" class="container w-75 border-dark">
                <h2>Ticket de compra:</h2><br>
                <article> 
                    <ul class="list-group">
                        <%
                            Cookie cookie = null;
                            Cookie[] cookies = null;
                            ArrayList<String> lista_dp = null;
                            ArrayList<String> lista_mp = new ArrayList<String>();
                            DPapel papel = new DPapel();
                            String total = null;
                            try{
                                cookies = request.getCookies();
                                if( cookies != null ) {
                                    for (int i = 0; i < cookies.length; i++) {
                                        cookie = cookies[i];
                                        if (cookie.getName().equals("ListaProductos")){
                                            System.out.println("valor de la cookie: " + cookie.getValue());
                                            String replace = cookie.getValue().replace("['","");
                                            replace = replace.replace("[","");
                                            replace = replace.replace("]","");
                                            replace = replace.replace(" ","");
                                            System.out.println(replace);
                                            String replace1 = replace.replace("'","");
                                            System.out.println(replace1);
                                            lista_dp = new ArrayList<String>(Arrays.asList(replace1.split(",")));
                                            Iterator lista_dp_i = lista_dp.iterator();
                                            System.out.println(lista_dp);
                                            while(lista_dp_i.hasNext()){
                                                String id_producto = lista_dp_i.next().toString();
                                                if(!id_producto.equals("")){
                                                    papel = DPapel.obtenerDetallePapel(Integer.parseInt(id_producto));
                                                    MPapel mpapel = MPapel.obtenerPapelPorIdDPapel(Integer.parseInt(id_producto));
                                                    lista_mp.add(mpapel.getNombre_pap());
                                                }
                                            }
                                        }else if(cookie.getName().equals("Total")){
                                            total = cookie.getValue();
                                        }
                                    }
                                }
                                
                            }catch(Exception e){
                                System.out.println(e.getMessage());
                                System.out.println(e.getLocalizedMessage());
                                e.printStackTrace();
                            }
                        %>
                        <li class="list-group-item">Nombre del servicio: <input readonly="readonly" class="list-group-item-text" value="Compra"></li>
                        <li class="list-group-item">Fecha de la Compra: <input readonly="readonly"  class="list-group-item-text" value="<%= c2.get(Calendar.DATE) %>-<%= c2.get(Calendar.MONTH)+1 %>-<%= c2.get(Calendar.YEAR)%>"></li>
                        <li class="list-group-item">
                            <div class="dropdown">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                  Lista de los Productos Comprados
                                </button>
                                <div class="dropdown-menu">
                                <%
                                   for(int i = 0; i < lista_mp.size(); i++){
                                       %>
                                       <a class="dropdown-item"><%= lista_mp.get(i) %></a>
                                       <%
                                   }
                                %>
                               </div>
                            </div>
                        </li>
                        <li class="list-group-item">Total a pagar: <input readonly="readonly" class="list-group-item-text" value="<%= total %>"></li>
                        <li class="list-group-item">Número de Venta: <input readonly="readonly" class="list-group-item-text" value="<%= papel.getId_papel() %>"></li>
                    </ul>
                </article>
                <!--vamos a matar a todas las galletitas Unu-->
                <a class="btn btn-primary" href="MatarCookies">Finalizar</a>
            </div>
        </main><br>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
