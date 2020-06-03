
<%@page import="Paquete_Clases.Tendencias"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%-- 
    Document   : index
    Created on : 16/05/2020, 07:37:48 PM
    Author     : Tenorio Aspiros
--%>
<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.DPapel"%>
<%@page import="Paquete_Clases.MPapel"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<% 
    ArrayList<MPapel> lista_Productos = new ArrayList<MPapel>();
    ArrayList<DPapel> detalles_Productos = new ArrayList<DPapel>();
%>

<%
    
    //Vamos a jugar un rato
Gson gsonObj = new Gson();
String[] ventas_semana = new String[3];
String[] ventas_mes = new String[3];
String[] ventas_quincena = new String[3];

ventas_semana[0] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("semana", "algo1"));
ventas_mes[1] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("mes", "algo2"));
ventas_quincena[2] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("quincena", "algo3"));

ventas_semana[0] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("semana", "algo1"));
ventas_mes[1] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("mes", "algo2"));
ventas_quincena[2] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("quincena", "algo3"));

ventas_semana[0] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("semana", "algo1"));
ventas_mes[1] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("mes", "algo2"));
ventas_quincena[2] = gsonObj.toJson(Tendencias.obtenerTendenciaBy("quincena", "algo3"));
/**
String semana = gsonObj.toJson(list);
String mes = gsonObj.toJson(list);
String quincena = gsonObj.toJson(list);
*/
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
        <main class="container justify-content-center">        
            <div  class="card col-md-12"  >
                <div class="card-body" id="semana" style="height: 370px; width: 100%;">
                    
                </div>
            </div>
            <br>
            <br>
            <div class="card col-md-12" >
                <div class="card-body" id="mes" style="height: 370px; width: 100%;">
                    
                </div>
            </div>
            <br>
            <br>
            <div class="card col-md-12">
                <div class="card-body" id="quincena" style="height: 370px; width: 100%;">
                    
                </div>
            </div>  
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    <script type="text/javascript">
        $(function () {
            var chart = new CanvasJS.Chart("semana", {
                theme: "light2",
                zoomEnabled: true,
                animationEnabled: true,
                title: {
                    text: "Tendencias de papel por semana"
                },
                subtitles: [
                    {
                        text: "Try Zooming and Panning"
                    }
                ],
                axisY:{
                    title: "Numero de ventas",
                    suffix: " unidades",
                    includeZero: false
                },
                axisX: {
                    title: "Semanas"
                },
                data: [{
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print( ventas_semana[0] );%>
                }, 
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_semana[1]);%>
                },
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_semana[2]);%>
                }]
            });
            chart.render();
        });
     </script>
         <script type="text/javascript">
        $(function () {
            var chart = new CanvasJS.Chart("mes", {
                theme: "light2",
                zoomEnabled: true,
                animationEnabled: true,
                title: {
                    text: "Tendencias de papel por mes"
                },
                subtitles: [
                    {
                        text: "Try Zooming and Panning"
                    }
                ],
                axisY:{
                    title: "Numero de ventas",
                    suffix: " unidades",
                    includeZero: false
                },
                axisX: {
                    title: "Meses"
                },
                data: [{
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print( ventas_mes[0] );%>
                }, 
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_mes[1]);%>
                },
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_mes[2]);%>
                }]
            });
            chart.render();
        });
     </script>
         <script type="text/javascript">
        $(function () {
            var chart = new CanvasJS.Chart("quincena", {
                theme: "light2",
                zoomEnabled: true,
                animationEnabled: true,
                title: {
                    text: "Tendencias de papel por quincena"
                },
                subtitles: [
                    {
                        text: "Try Zooming and Panning"
                    }
                ],
                axisY:{
                    title: "Numero de ventas",
                    suffix: " unidades",
                    includeZero: false
                },
                axisX: {
                    title: "Quincenas"
                },
                data: [{
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print( ventas_quincena[0] );%>
                }, 
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_quincena[1]);%>
                },
                {
                    type: "line",
                    toolTipContent: "<b>{label}</b>: {y}%",
                    dataPoints: <%out.print(ventas_quincena[2]);%>
                }]
            });
            chart.render();
        });
     </script>
</html>
