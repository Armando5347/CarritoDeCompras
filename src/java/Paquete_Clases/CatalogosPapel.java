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
public class CatalogosPapel {
    
    public static String obtenerValorIdCatalogo(int id_catalogo, String catalogo_buscado){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String retorno = "";
        try{
            con = Conexion.obtenerConexion();
            String q = "SELECT * FROM ? WHERE id=?";
            ps = con.prepareStatement(q);
            ps.setInt(2, id_catalogo);
            ps.setString(1, catalogo_buscado);
            rs = ps.executeQuery();
            switch(catalogo_buscado){
                case "CMaterial":
                    retorno = rs.getString("Material");
                    break;
                case "CTipos":
                    retorno = rs.getString("Tipos");
                    break;
                case "CAromas":
                    retorno = rs.getString("aroma");
                    break;
                case "CCaracteristicas":
                    retorno = rs.getString("caraceristicas");
                    break;
                case "CTipo_hojas":
                    retorno = rs.getString("tipo_hojas");
                    break;
                case "CHojasxRollo":
                    retorno = rs.getString("no_hojas");
                    break;
                default:
                    retorno = "No encontrado";
                    break;
            }
        } catch (SQLException ex) {
            retorno = "No encontrado";
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                System.out.println("No se cerraron bien");
            }
        }
        return retorno;
    }
    
    public static int devolverIdParaGuardar(String valor, String catalogo){
        int id=0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.obtenerConexion();
            String q = "SELECT ID FROM ? WHERE id=?";
            switch(catalogo){
                case "CMaterial":
                    q += "Material = ?";
                    break;
                case "CTipos":
                    q += "Tipos = ?";
                    break;
                case "CAromas":
                     q += "aroma = ?";
                    break;
                case "CCaracteristicas":
                     q += "caraceristicas = ?";
                    break;
                case "CTipo_hojas":
                     q += "tipo_hojas = ?";
                    break;
                case "CHojasxRollo":
                     q += "no_hojas = ?";
                    break;
                default:
                    id = 0;
                    break;
            }
            ps = con.prepareStatement(q);
            ps.setString(1,catalogo);
            ps.setString(2, valor);
            rs = ps.executeQuery();
            while(rs.next()){
                id = rs.getInt("ID");
                break;
            }
        } catch (SQLException ex) {
            id=0;
        }finally{
            try{
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                System.out.println("No se cerraron bien");
            }
        }
        return id;
    }
}
