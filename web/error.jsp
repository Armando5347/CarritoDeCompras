<%-- 
    Document   : error
    Created on : 17/05/2020, 08:13:34 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>-ERROR-</title>
    </head>
    <body>
        <main container-fluid>
            <h1 class="bg-danger text-center container-fluid">Ha ocurrido un error</h1>
            <p class="container justify-content-center border-danger">Se ha producido un error al procesas algúna accion, esto se pudó haber generado por varias razónes, como son:
                <ul>
                    <li>Error al validar entradas</li>
                    <li>Error interno dentor de la base de datos</li>
                    <li>Se realizó una solicitud no autorizada</li>
                </ul>
            
            </p>
        </main>
    </body>
</html>
