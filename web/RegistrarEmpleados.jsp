}
<%-- 
    Document   : RegistrarEmpleados
    Created on : 24/05/2020, 02:42:26 AM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true" language="java"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de empleados del sistema</title>
        
    </head>
    <body>
        <script src="js/validarEntradas.js"></script>
        <h1>Registrar nuevo empleado</h1>
        <main>
            <form method="post" action="Registrar_empleado">
                <div>Nombre:<input name="nombre" type="text" onclick="return quieroTeclearNumeros(this, false)"></div>
            </form>
        </main>
    </body>
</html>
