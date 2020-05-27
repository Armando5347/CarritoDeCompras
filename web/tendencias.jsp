
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
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

map = new HashMap<Object,Object>(); map.put("x", 10);  map.put("y", 71);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 20);  map.put("y", 55);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 30);  map.put("y", 50);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 40);  map.put("y", 65);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 50);  map.put("y", 95);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 60);  map.put("y", 68);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 70);  map.put("y", 28);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 80);  map.put("y", 34);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 90);  map.put("y", 14);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 100);  map.put("y", 33);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 110);  map.put("y", 42);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 120);  map.put("y", 62);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 130);  map.put("y", 70);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 140);  map.put("y", 85);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 150);  map.put("y", 58);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 160);  map.put("y", 34);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 170);  map.put("y", 24);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 180);  map.put("y", 33);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 190);  map.put("y", 28);list.add(map);
map = new HashMap<Object,Object>(); map.put("x", 200);  map.put("y", 42);list.add(map);	
String dataPoints = gsonObj.toJson(list);
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
                <div class="col-md-8 d-flex centrar">
                    <a href="index.jsp" class="col-md-2"><img src="img/papel.png"></a>
                    <h1>¡Papelilandia!</h1>
                </div>
                <% HttpSession sesion_actual = request.getSession();
                    String tipo_user = (String)sesion_actual.getAttribute("tipo_user");
                if(tipo_user == null){ %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="InicioSesion.jsp" class="btn btn-primary btn-sm">Iniciar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(tipo_user == "cliente"){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(tipo_user == "empleado"){
                int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
                if(privilegio == 1){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="Registro.jsp" class="btn btn-primary btn-sm">Registrarse</a>
                </div>
                <%}else if(privilegio == 2){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="RegistrarEmpleados.jsp" class="btn btn-primary btn-sm">Registrar nuevo Empleado</a>
                    <a href="listaEmpleados.jsp" class="btn btn-primary btn-sm">Ver empleados</a>
                </div>
                <%}else if(privilegio == 3){
                %>
                <div class="btn-group d-flex col-md-4 centrar-derecha float-md-right">
                    <a href="Cerrar_Sesion" class="btn btn-primary btn-sm">Cerrar Sesión</a>
                    <a href="RegistrarEmpleados.jsp" class="btn btn-primary btn-sm">Registrar nuevo Empleado</a>
                    <a href="listaEmpleados.jsp" class="btn btn-primary btn-sm">Ver empleados</a>
                    <a href="listaClientes.jsp" class="btn btn-primary btn-sm">Ver clientes</a>
                </div>
                <%}
                }%>
            </header>
            <nav>
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a href="Historial.jsp" class="nav-link">Historial</a>
                    </li>
                    <li class="nav-item">
                        <a href="editarUser.jsp" class="nav-link">Sesion de usuario</a>
                    </li>
                    <%if(tipo_user == "empleado"){
                        int privilegio =((Empleado)sesion_actual.getAttribute("usuario")).getCprivilegio_id();
                        if(privilegio == 3){%>
                    <li class="nav-item"><a href='listaProductosAdmin.jsp'>Ver inventario de productos</a></li>
                    <%}}%>
                    <li class="carrito nav-item">
                        <a href="carritoDeCompras.jsp" class="nav-link">Ver tu carrito de compras</a>
                    </li>
                    <li clas="carrito nav-item">
                        <a href=tendencias.jsp" class="nav-link">Ver tendencias</a>
                    </li>
                </ul>
            </nav>
        </div>
        <main class="container justify-content-center">        
            <div  class="card col-md-12"  style="width: 900px; height: 500px">
                <div class="card-body" id="semana">
                    
                </div>
            </div>
            <br>
            <div class="card col-md-12" style="width: 900px; height: 500px">
                <div class="card-body" id="mes">
                    
                </div>
            </div>
            <br>
            <div class="card col-md-12" style="width: 900px; height: 500px">
                <div class="card-body" id="quincena">
                    
                </div>
            </div>  
        </main>
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
                data: [{
                    type: "line",
                    dataPoints: <%out.print(dataPoints);%>
                }]
            });
            chart.render();
        });
     </script>
</html>
