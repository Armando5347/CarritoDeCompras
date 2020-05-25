<%-- 
    Document   : editarUser
    Created on : 16/05/2020, 08:54:34 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar información Cuenta</title>
    </head>
    <body>
        <script src="js/validarEntradas.js"></script>
        <h1>Editar cuenta del usuario</h1>
        <main>
            <form method="post" action="actualizar_Cliente">
                <div>Nombre: <input type="text" id="nombre" name="nombre" onclick="return quieroTeclearNumeros(this,false)" onchange="return quieroNumeros(this,false)" value="">  <input type="button" value="Activar Campo" onclick="switchCampos('nombre')"></div>
                <div>Apellido paterno: <input type="text"  id="appat"  name="appat" onclick="return quieroTeclearNumeros(this,false)" onchange="return quieroNumeros(this,false)" value=""> <input type="button" value="Activar Campo" onclick="switchCampos('appat')"></div>
                <div>Apellido materno: <input type="text" id="apmat" name="apmat" onclick="return quieroTeclearNumeros(this,false)" onchange="return quieroNumeros(this,false)" value=""> <input type="button" value="Activar Campo" onclick="switchCampos('apmat')"></div>
                <div>Fecha Nacimiento: <input type="text" id="fecha_nac" name="fecha_nac" onchange="return esFecha(this)" value=""> <input type="button" value="Activar Campo" onclick="switchCampos('fecha_nac')"></div>
                <div>Nombre de usuario: <input type="text" id="username" name="username" onclick="return quieroTeclearNumeros(this,false)" onchange="return quieroNumeros(this,false)" value=""> <input type="button" value="Activar Campo" onclick="switchCampos('username')"></div>
                <div>Contraseña: <input type="password" id="pass" name="pass" onclick="return quieroTeclearNumeros(this,false)" onchange="return quieroNumeros(this,false)" value=""> <input type="button" value="Activar Campo" onclick="switchCampos('pass')"></div>
                <div><input type="submit" value="Actualizar Datos"> || <a href="borrarCuenta">Eliminar Cuenta</a></div>
            </form>
        </main>
    </body>
</html>
