<%-- 
    Document   : error
    Created on : 17/05/2020, 08:13:34 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>-ERROR-</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> 
    </head>
    <body>
        <main class="container-fluid">
            <h1 class="bg-danger text-center container-fluid">Ha ocurrido un error</h1>
            <p class="container justify-content-center border-danger">Se ha producido un error al procesas algúna accion, esto se pudó haber generado por varias razónes, como son:
                <ul class="">
                    <li>Error al validar entradas</li>
                    <li>Error interno dentor de la base de datos</li>
                    <li>Se realizó una solicitud no autorizada</li>
                </ul>
            <br>
            <a href="index.html" class="btn btn-info">Regresar a la página principal</a>
            </p>
        </main>
    </body>
</html>
