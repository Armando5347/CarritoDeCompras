<%-- 
    Document   : GuardarProductos
    Created on : 16/05/2020, 07:34:38 PM
    Author     : maste
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador -Registrar Productos-</title>
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
        <h1>Registrar un nuevo producto</h1>
        <main class="container-fluid">
            <form method="post" action="registrarPapel" class="container">
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre:</span>
                    </div><input type="text" name="nombre_papel" onchange="return quieroNumeros(this, false)" onclick="return quieroTeclearNumeros(ev, false)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Stock Inicial:</span>
                    </div><input type="number" name="stock" onchange="return quieroNumerosEntero(this)" onclick="return quieroTeclearNumerosEnteros(ev)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Precio:</span>
                    </div><input type="number" name="precio" onchange="return quieroNumeros(this, true)" onclick="return quieroTeclearNumeros(ev, true)"></div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Material:</span>
                    </div>
                    <select name="material" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>CELULOSA</option>
                        <option>FIBRA VEGETAL</option>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Aroma</span>
                    </div>
                    <select name="aroma" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>SIN AROMA</option>
                        <option>ALMENDRAS</option>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Tipo de papel:</span>
                    </div>
                    <select name="tipo_papel" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>Residencial</option>
                        <option>Institucional</option>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Hojas por rollo:</span>
                    </div>
                    <select name="hojasRollo" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>180</option>
                        <option>200</option>
                        <option>240</option>
                        <option>320</option>
                        <option>400</option>
                        <option>500</option>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Tipo de Hojas:</span>
                    </div>
                    <select name="tipo_hojas" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>Doble</option>
                        <option>Triple</option>
                        <option>Cuadruple</option>
                    </select>
                </div>
                <br>
                <div class="input-group">    
                    <div class="input-group-prepend">
                        <span class="input-group-text">Rollos incluidos:</span>
                    </div>
                    <select name="rollos" onchange="return noDefault(this)" class="custom-select">
                        <option>Seleccione alguna opción</option>
                        <option>4</option>
                        <option>12</option>
                        <option>18</option>
                        <option>24</option>
                        <option>32</option>
                    </select>
                </div>
                <div class="btn-group"><input type="submit" value="Registrar producto" class="btn-primary"> || <input type="reset" value="Reiniciar campos" class="btn-secondary"></div>
                
            </form>
            <a href="listaProductosAdmin.jsp">Volver</a>
        </main>
        <footer>
            
        </footer>
    </body>
</html>
