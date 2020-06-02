<%-- 
    Document   : carritoDeCompras
    Created on : 16/05/2020, 08:59:02 PM
    Author     : maste
--%>

<%@page import="java.util.*"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page import="java.util.Iterator"%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.util.ArrayList" session="true"%>
<!DOCTYPE html>
<%--Aquise debe traer un arrayList de todos los productos--%>
<%
    //ArrayList<Object> lista_Productos = new ArrayList<>(); voy a omitirlo para ahcer pruebas
                                        //Aquí iria un metodo como obtenerProductosDelCarrito(id_carrito || id_cliente)
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito de compras</title>
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
        <h1></h1>
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
        <%--
        <% 
        //for(Object o:lista_Productos){
            
        
        %>
        <div class="">
            <h2></h2>
            <p></p>
            <p></p>
            <p><a href="AgregarPapelAlCarrito?id='1'">Agregar al carrito de compras</a> || <a href="ComprarPoducto"></a></p>
        </div>
        
        <%}%>
        --%>
        <main>
            <div class="container">
                <div class="row">
                    <% if(sesion_actual==null){ %>
                    <h1>Lo sentimos solo puede facturar cuando haya realizado un inicio de sesion</h1>
                    <p>Sus compras siguien guardadas pero es necesario realizar un inicoo de sesion</p>
                    <% }else{ %>
                    <!-- Elementos generados a partir de la lista -->
                    <section id="items" class="col-sm-8 row">
                        <%! double total_neto = 0;%>
                        <%! Pattern twopart = Pattern.compile("\\d"); %>
                        <%
                         Cookie cookie = null;
                         Cookie[] cookies = null;
                         ArrayList<String> lista_dp = null;
                         // Obtenemos 
                         cookies = request.getCookies();
                         if( cookies != null ) {
                            for (int i = 0; i < cookies.length; i++) {
                               cookie = cookies[i];
                                    if (cookie.getName().equals("ListaProductos")){
                                        System.out.println("valor de la cookie: " + cookie.getValue());
                                        String replace = cookie.getValue().replace("['","");
                                        System.out.println(replace);
                                        String replace1 = replace.replace("']","");
                                        System.out.println(replace1);
                                        lista_dp = new ArrayList<String>(Arrays.asList(replace1.split(",")));
                                        Iterator lista_dp_i = lista_dp.iterator();
                                        while(lista_dp_i.hasNext()){
                                            String id_producto = lista_dp_i.next().toString();
                                            DPapel papel = new DPapel();
                                            papel = DPapel.obtenerDetallePapel(Integer.parseInt(id_producto));
                                            MPapel mpapel = MPapel.obtenerPapelPorIdDPapel(Integer.parseInt(id_producto));
                                        %>
                                        <div class="card col-sm-4">
                                            <div class="card-body" id="<%= papel.getId_papel() %>">
                                                <!-- Aqui seria una buena idea laterar la base de datos para la ruta 
                                                pdt: dicho y hehco-->
                                                <img class="img-fluid" src="img/papel.png" alt="<%= papel.getId_papel() %>">
                                                <h5 class="card-title"> <%= mpapel.getNombre_pap() %> </h5>
                                                <p class="card-text"> <%= papel.getPrecio() %> </p>
                                                <button class="btn btn-primary btn-agregar">+</button>
                                            </div>
                                        </div>
                                        <%
                                        }
                                        break;
                                    }else{
                                   %>
                                    <h3>Su carrito de compras esta vacio</h3>
                                   <%
                                   System.out.println(cookie.getValue());
                               }
                            }
                         } else {
                            System.out.println("No se encontraron cokies");
                         }
                        %>
                    </section>
                    <!-- Carrito -->
                    <aside class="col-sm-4">
                        <h2>Carrito</h2>
                        <!-- Elementos del carrito -->
                        <ul id="carrito" class="list-group">
                        <!-- Aqui iran los elementos de pago -->
                        <%
                        try{
                            Iterator lista_dp_i = lista_dp.iterator();
                            while(lista_dp_i.hasNext()){
                                String id_producto = lista_dp_i.next().toString();
                                DPapel papel = new DPapel();
                                papel = DPapel.obtenerDetallePapel(Integer.parseInt(id_producto));                          
                        %>
                        <li class="list-group-item text-right mx-2">
                            <p>Precio:<%= papel.getPrecio() %></p>
                            <p class="catidad-<%= papel.getId_papel() %>">Cantidad:<span id=can-"<%= papel.getId_papel() %>" >0</span></p>
                            <button class="btn btn-danger mx-5 btn-eliminar" style="margin-left: 1rem;">X</button>
                        </li>
                        <%
                            }
                        }catch(Exception e){
                            e.printStackTrace();
                            System.out.println(e.getMessage());
                            System.out.println(e.getLocalizedMessage());
                        }
                        %>
                        </ul>
                        <hr>
                        <!-- Precio total -->
                        <p class="text-right">Total: <span id="total"><%= total_neto %></span>$</p>
                        <a href="<%= request.getContextPath() %>/formaDePago?total=<%= total_neto %>">Cobrar</a>
                    </aside>
                    <%}%>
                </div>
            </div>
                
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
        <script>
            var btn_eliminar = Array.prototype.slice.call(document.getElementsByClassName("btn-eliminar"));
            var btn_agregar = Array.prototype.slice.call(document.getElementsByClassName("btn-agregar"));
            var ids = [];
            btn_eliminar.forEach(element => {
                element.addEventListener("click", function () {
                    element.parentNode.remove();
                })
            });
            btn_agregar.forEach(element => {
                element.addEventListener("click", function () {
                    var id = element.parentNode.id;
                    var contenedor = document.getElementById("cant-" + id);
                    contenedor.value += 1;
                })
            });
        </script>
    </body>
</html>
