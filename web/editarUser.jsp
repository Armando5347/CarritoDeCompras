

<%@page import="Paquete_Clases.Empleado"%>
<%@page import="Paquete_Clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true"%>
<!DOCTYPE html>
<% HttpSession sesion_actual = request.getSession();
    String tipo_user;
    Cliente cli = null;
    Empleado emp = null;
    String nombre = "", appat = "", apmat = "", fecha_n = "", username = "", pass = "";
    int tel = 0;
    long cel= 0;
    try{
    tipo_user = (String)sesion_actual.getAttribute("tipo_user");
    }catch(NullPointerException e){
        tipo_user = "null";
        response.sendRedirect("InicioSesion.jsp");
    }
    switch(tipo_user){
        case "null":
            response.sendRedirect("InicioSesion.jsp");
            break;
        case "cliente":
            cli = (Cliente)sesion_actual.getAttribute("usuario");
            nombre = cli.getNombre_cli();
            appat = cli.getAppat_cli();
            apmat = cli.getApmat_cli();
            fecha_n = cli.getFecha_nacimiento_cli();
            tel = cli.getTel_cli();
            cel = cli.getCel_cli();
            username = cli.getUsername_cli();
            pass = cli.getPass_cli();
            break;
        case "empleado":
            emp = (Empleado)sesion_actual.getAttribute("usuario");
            nombre = emp.getNombre_emp();
            appat = emp.getAppat_emp();
            apmat = emp.getApmat_emp();
            fecha_n = emp.getFecha_nac_emp();
            tel = emp.getTel_emp();
            cel = emp.getCel_emp();
            username = emp.getUsername_emo();
            pass = emp.getPassword_emp();
            break;
    }
    
%>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar información Cuenta</title>
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
                <%
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
        <script src="js/validarEntradas.js"></script>
        
        <main class="container-fluid">
            <h1 class="text-center bg-primary container-fluid">Editar cuenta de usuario</h1> <hr>
            <form method="post" action="actualizar_cliente" class="container was-validated">
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div>
                    <input readOnly="true" type="text" id="nombre" name="nombre" onkeypress="return quieroTeclearNumeros(event,false)" onchange="return quieroNumeros(this,false)" value="<%=nombre%>">  
                    <input type="button" value="Activar Campo" onclick="switchCampos('nombre')">
                </div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido paterno:</span>
                    </div>
                    <input readOnly="true" type="text"  id="appat"  name="appat" onkeypress="return quieroTeclearNumeros(event,false)" onchange="return quieroNumeros(this,false)" value="<%=appat%>">
                    <input type="button" value="Activar Campo" onclick="switchCampos('appat')"></div>
                    <br>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido materno:</span>
                    </div> 
                    <input readOnly="true" type="text" id="apmat" name="apmat" onkeypress="return quieroTeclearNumeros(event,false)" onchange="return quieroNumeros(this,false)" value="<%=apmat%>">
                    <input type="button" value="Activar Campo" onclick="switchCampos('apmat')"></div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha de nacimiento:</span>
                    </div> 
                    <input readOnly="true" type="date" id="fecha_nac" name="fecha_nac" onchange="return esFecha(this)" value="<%=fecha_n%>"> 
                    <input type="button" value="Activar Campo" onclick="switchCampos('fecha_nac')"></div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono fijo:</span>
                    </div>
                    <input readOnly="true" type="number" id="tel" name="tel" onkeypress="return quieroTeclearNumerosEnteros(event)" onchange="return quieroNumerosEnteros(this)" value="<%=tel%>"> 
                    <input type="button" value="Activar Campo" onclick="switchCampos('tel')"></div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono celular:</span>
                    </div>
                    <input readOnly="true" type="number" id="cel" name="cel" onkeypress="return quieroTeclearNumerosEnteros(event)" onchange="return quieroNumerosEnteros(this)" value="<%=cel%>">
                    <input type="button" value="Activar Campo" onclick="switchCampos('cel')"></div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de usuario:</span>
                    </div>
                    <input readOnly="true" type="text" id="username" name="username" onkeypress="return quieroTeclearNumeros(event,false)" onchange="return quieroNumeros(this,false)" value="<%=username%>"> 
                    <input type="button" value="Activar Campo" onclick="switchCampos('username')"></div>
                    <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div>
                    <input readOnly="true" type="password" id="pass" name="pass" onkeypress="return quieroTeclearNumeros(event,false)" onchange="return quieroNumeros(this,false)" value="<%=pass%>">
                    <input type="button" value="Activar Campo" onclick="switchCampos('pass')">
                </div>
                    <br>
                
                <div class="btn-group"><input type="submit" class="btn-primary" value="Actualizar Datos"> || <a href="borrarCuenta?causa='manual'" class="btn btn-danger">Eliminar Cuenta</a> || <a href="index.jsp" class="btn btn-info">Regresar al index.</a></div>
                
            </form>
        </main>
        <footer class="container-fluid bg-secondary text-center fixed-bottom footer">
            <small class="contanier font-italic text-white-50 ">
                Carrito de compras elaborado por Jarillo Hernández Armando Damián y Tenorio Aspiros Luis Fernándo del grupo 4IV9.&copy
            </small>
        </footer>
    </body>
</html>
