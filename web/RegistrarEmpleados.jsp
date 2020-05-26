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
        
    </head>
    <body>
        <script src="js/validarEntradas.js"></script>
        <h1>Registrar nuevo empleado</h1>
        <main>
            <form method="post" action="Registrar_Usuario">
                <div>Nombre: <input name="nombre" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"></div>
                <div>Apelido Paterno: <input name="appat" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"></div>
                <div>Apelido Materno: <input name="apmat" type="text" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(this, false)"></div>
                <div>Fecha nacimiento: <input type="date" name="fecha_nac" onchange="return esDate(this)"></div>
                <div>Telefono fijo: <input type="number" name="telefono" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"></div>
                <div>Telefono Celular: <input type="number" name="celular" onclick="return quieroTeclearNumeros(ev,true)" onchange="return quieroNumeros(this,true)"></div>
                <div>Usuario: <input type="text" name="username"  onchange="return soloNumerosYletras(this)"></div>
                <div>Contraseña: <input type="password" name="pass" onchange="return soloNumerosYletras(this)"></div>
                    <div>Verificar Contraseña: <input type="password" name="ver_pass" onchange="return soloNumerosYletras(this)"></div>
                
                <div>Asignar puesto: <select name="puesto" readOnly="readonly">
                            <option>Puestos a seleccionar<option>
                            <option>Empleado</option>
                            <option>Gerente</option>
                            <option>Admin</option>
                        </select>
                </div>
                
                    <div><input type="submit" value="Regitrar"> <input type="reset" value="Reiniciar campos"></div>
            
            </form>
        </main>
    </body>
</html>
