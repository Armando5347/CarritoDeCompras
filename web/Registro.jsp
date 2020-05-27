<%-- 
    Document   : Registro
    Created on : 16/05/2020, 07:33:53 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"  session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
        <script src="js/validarEntradas.js"></script>
    </head>
    <body>
        <main class="container  w-75">
            <h1 class="text-center">Ingrese los datos solicitados para crear su cuenta</h1>
            <hr>
            <form name="formulario_Registro" method="post" action="Registrar_Usuario" class="justify-content-center">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div>
                    <input class="form-control" type="text" name="nombre">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido Paterno:</span>
                    </div>
                    <input class="form-control" type="text" name="appat" onclick="return quieroTeclearNumeros(ev,false)" onchange="return quieroNumeros(this,false)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido Materno:</span>
                    </div>
                    <input class="form-control" type="text" name="apmat" onclick="return quieroTeclearNumeros(ev,false)" onchange="return quieroNumeros(this,false)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Fecha nacimiento:</span>
                    </div>
                    <input class="form-control" type="date" name="fecha_nac">
                </div>
                <br>    
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono fijo:</span>
                    </div>
                    <input class="form-control" type="number" name="telefono" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br>  
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Telefono Celular:</span>
                    </div>    
                    <input  class="form-control" type="number" name="celular" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)">
                </div>
                <br> 
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div>    
                    <input  class="form-control" type="text" name="username"  onchange="return soloNumerosYletras(this)">
                </div>
                <br> 
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div> 
                    <input class="form-control" type="password" name="pass" onchange="return soloNumerosYletras(this)">
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Verificar Contraseña: </span>
                    </div>    
                    <input class="form-control" type="password" name="ver_pass" onchange="return soloNumerosYletras(this)">
                </div>
                <hr>
                <div class="">
                    <input class="btn-primary"  type="submit" value="Registrarse"> | | <input type="reset" value="Vaciar Campos." class="btn-secondary">
                </div>
            </form>
        </main>
    </body>
</html>
