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
import java.sql.*;
import java.util.ArrayList;

public class CatalogosPapel {
    
    /**
     *
     * @param ides que son los valores de las ides que se guardan en la tabla de empleado, en el orde de material, tipo, aroma, rollos, tipo_hoja y hojasxrollo
     * @return valores[], que son las traducciones de los ides de los valores, en el orden de material, tipo, aroma, rollos, tipo_hojas y hojasxrollo
     */
    public static ArrayList obtenerValores(int ides[]){
        ArrayList valores = new ArrayList();
        if(ides.length!=6){
            return null; //Ya que no se peude operar con esto
        }
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.obtenerConexion();
            String q = "CALL traducirIdesCatalogosCarrito(?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setInt(1, ides[0]);
            ps.setInt(2, ides[1]);
            ps.setInt(3, ides[2]);
            ps.setInt(4, ides[3]);
            ps.setInt(5, ides[4]);
            ps.setInt(6, ides[5]);
            rs = ps.executeQuery();
            while(rs.next()){
                valores.add(rs.getString("material"));
                valores.add(rs.getString("Tipos"));
                valores.add(rs.getString("Aroma"));
                valores.add(rs.getString("rollos"));
                valores.add(rs.getString("tipo_hojas"));
                valores.add(rs.getString("no_hojas"));
                break;
            }
        } catch (SQLException ex) {
            return null;
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                System.out.println("No se cerraron bien");
            }
        }
        return valores;
    }
    
    public static int[] obtenerIdes(ArrayList valores){
        int ides[] = new int[6];
        if(valores.size()!=6){
            return null;
        }
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.obtenerConexion();
            String q = "CALL traducirValoresCatalogosCarrito(?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setString(1, (String)valores.get(0));
            ps.setString(2, (String)valores.get(1));
            ps.setString(3, (String)valores.get(2));
            ps.setInt(4, (int)valores.get(3));
            ps.setString(5, (String)valores.get(4));
            ps.setInt(6, (int)valores.get(5));
            
            rs = ps.executeQuery();
            while(rs.next()){
                ides[0] = rs.getInt(1);
                ides[1] = rs.getInt(2);
                ides[2] = rs.getInt(3);
                ides[3] = rs.getInt(4);
                ides[4] = rs.getInt(5);
                ides[5] = rs.getInt(6);
                break;
            }
        } catch (SQLException ex) {
            ides=null;
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                System.out.println("No se cerraron bien");
            }
        }
        return ides;
    }
    
}
