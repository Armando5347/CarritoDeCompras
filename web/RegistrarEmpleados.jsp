<%-- 
    Document   : RegistrarEmpleados
    Created on : 24/05/2020, 02:42:26 AM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de empleados del sistema</title>
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
        <h1 class="text-center">Registrar nuevo empleado</h1>
        <main class="container-fluid">
            <form method="post" action="Registrar_Usuario" class="container">
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div>
                    <input name="nombre" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido paterno:</span>
                    </div>
                    <input name="appat" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido materno:</span>
                    </div>
                    <input name="apmat" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha nacimiento:</span>
                    </div>
                    <input type="date" name="fecha_nac" onchange="return esDate(this)"></div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono fijo:</span>
                    </div>
                    <input type="number" name="telefono" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono celular:</span>
                    </div>
                    <input type="number" name="celular" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div> 
                    <input type="text" name="username"  onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div>
                    <input type="password" name="pass" onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Verificar Contraseña:</span>
                    </div>
                    <input type="password" name="ver_pass" onchange="return soloNumerosYletras(this)"> </div>
                
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Puesto de trabajo:</span>
                    </div>
                    <select name="puesto" readOnly="readonly" class="custom-select">
                            <option>Puestos a seleccionar</option>
                            <option>Empleado</option>
                            <option>Gerente</option>
                            <option>Admin</option>
                        </select>
                </div>
                
                    <div class="btn-group"><input type="submit" value="Registrar" class="btn-primary"> <input type="reset" value="Reiniciar campos" class="btn-secondary"></div>
            
            </form>
            <div><a href='index.jsp'>Regresar al index</a></div>
        </main>
    </body>
</html>
