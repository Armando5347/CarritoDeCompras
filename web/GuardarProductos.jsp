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
                
                <div>Material: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Celulosa</option>
                        <option>Fibra vegetal</option>
                    </select>
                </div>
                <div>Aroma: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Sin Aroma</option>
                        <option>Almendras</option>
                    </select>
                </div>
                <div>Tipo de papel: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Residencial o Convencional</option>
                        <option>Institucional o Industrial</option>
                    </select>
                </div>
                <div>Material: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Celulosa</option>
                        <option>Fibra vegetal</option>
                    </select>
                </div>
                <div>Hojas por rollo: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>180</option>
                        <option>200</option>
                        <option>240</option>
                        <option>320</option>
                        <option>400</option>
                        <option>500</option>
                    </select>
                </div>
                <div>Tipo de hojas: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>Hoja doble</option>
                        <option>Hoja triple</option>
                        <option>Hoja cuadruple</option>
                    </select>
                </div>
                <div>Rolos incluidos: <select  onchange="return noDefault(this)">
                        <option>Seleccione alguna opción</option>
                        <option>4 Rollos</option>
                        <option>12 Rollos</option>
                        <option>18 Rollos</option>
                        <option>24 Rollos</option>
                        <option>32 Rollos</option>
                    </select>
                </div>
                <div><input type="submit" value="Registrar pdocuto"> || <input type="reset" value="Reiniciar campos"></div>
            </form>
        </main>
        <footer>
            
        </footer>
    </body>
</html>
