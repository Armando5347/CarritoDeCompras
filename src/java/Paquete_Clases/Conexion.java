/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete_Clases;

/**
 *
 * @author maste
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    public static Connection obtenerConexion() throws SQLException{
        Connection con = null;
        try {
                    Class.forName("com.mysql.jdbc.Driver");
                    String user = "root";
                    String password = "n0m3l0";
                    String url = "jdbc:mysql://localhost:3306/carritocompras";
                    con =DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Falló la clase");
        }finally{
            return con;
        }
            
        
    }
}
