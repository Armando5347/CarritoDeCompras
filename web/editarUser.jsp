

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
    </head>
    <body>
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
                
                <div class="btn-group"><input type="submit" class="btn-primary" value="Actualizar Datos"> || <a href="borrarCuenta" class="btn btn-danger">Eliminar Cuenta</a> || <a href="index.jsp" class="btn btn-info">Regresar al index.</a></div>
                
            </form>
        </main>
    </body>
</html>
