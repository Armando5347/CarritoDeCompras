<%-- 
    Document   : InicioSesion
    Created on : 16/05/2020, 07:34:08 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
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
        <!--Nav o lo que se va a poner que aún no c-->
        <main class="container justify-content-center w-50">
            <h1 class="text-center">Inicio de sesión</h1>
            <hr>
            <form name="formularioInicioSesión" method="post" action="IniciarSesion" class="text-center">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre de Usuario:</span>
                    </div>  
                    <input class="form-control" type="text" name="nombre_usuario" onchange="return soloNumerosYletras(this)">
                </div> 
                <br>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Contraseña:</span>
                    </div>
                    <input class="form-control" type="password" name="pass" onchange="return soloNumerosYletras(this)">
                </div>
                <hr>
                <input type="submit" value="Iniciar Sesión" class="btn-primary"> <input type="reset" value="Vaciar Campos" class="btn-secondary">
                <br>
                Si no tiene una cuenta, cree una pulsando <a href="Registro.jsp"><strong>aquí</strong></a>
            </form>
        </main>
    </body>
</html>
