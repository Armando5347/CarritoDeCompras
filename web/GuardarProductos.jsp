<%-- 
    Document   : GuardarProductos
    Created on : 16/05/2020, 07:34:38 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador -Registrar Productos-</title>
        <link rel="stylesheet" href="estilos.css">
        <script src="js/validarEntradas.js"></script>
    </head>
    <body>
        <h1>Registrar un nuevo producto</h1>
        <main>
            <form method="post" action="registrarPapel">
                <div>Nombre del producto: <input type="text" name="nombre_papel" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(ev, false)"></div>
                <div>Stock inicial: <input type="number" name="stock" onchange="return quieroNumerosEntero(this)" onclick="return quieroTeclearNumerosEnteros(ev)"></div>
                <div>Precio: <input type="number" name="precio" onchange="return quieroNumeros(this, true)" onclick="return quieroTeclearNumeros(ev, true)"></div>
                
                <div>Material: <select name="material" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>CELULOSA</option>
                        <option>FIBRA VEGETAL</option>
                    </select>
                </div>
                <div>Aroma: <select name="aroma" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>SIN AROMA</option>
                        <option>ALMENDRAS</option>
                    </select>
                </div>
                <div>Tipo de papel: <select name="tipo_papel" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Residencial</option>
                        <option>Institucional</option>
                    </select>
                </div>
                
                <div>Hojas por rollo: <select name="hojasRollo" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>180</option>
                        <option>200</option>
                        <option>240</option>
                        <option>320</option>
                        <option>400</option>
                        <option>500</option>
                    </select>
                </div>
                <div>Tipo de hojas: <select name="tipo_hojas" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Doble</option>
                        <option>Triple</option>
                        <option>Cuadruple</option>
                    </select>
                </div>
                <div>Rolos incluidos: <select name="rollos" onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>4</option>
                        <option>12</option>
                        <option>18</option>
                        <option>24</option>
                        <option>32</option>
                    </select>
                </div>
                <div><input type="submit" value="Registrar producto"> || <input type="reset" value="Reiniciar campos"></div>
            </form>
        </main>
        <footer>
            
        </footer>
    </body>
</html>
