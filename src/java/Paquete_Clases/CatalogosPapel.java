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
    
   
    public static ArrayList obtenerValores(int id_mat, int id_tip, int id_ar, int id_roll, int id_th,int id_hr){
        ArrayList valores = new ArrayList();
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String q = "";
        try{
            con = Conexion.obtenerConexion();
            q = "{CALL traducirIdesCatalogosCarrito(?,?,?,?,?,?)}";
            cs = con.prepareCall(q);
            cs.setInt(1, id_mat);
            cs.setInt(2, id_tip);
            cs.setInt(3, id_ar);
            cs.setInt(4, id_roll);
            cs.setInt(5, id_th);
            cs.setInt(6, id_hr);
            rs = cs.executeQuery();
            if(rs.next()){
                valores.add(rs.getString("material"));
                valores.add(rs.getString("Tipos"));
                valores.add(rs.getString("Aroma"));
                valores.add(rs.getString("rollos"));
                valores.add(rs.getString("tipo_hojas"));
                valores.add(rs.getString("no_hojas"));
            }
            else System.out.println("No encontre nada");
            while(rs.next()){
                System.out.println("Aquí hay algo:"+ rs.getString("material"));
                break;
            }
        } catch (SQLException ex) {
            System.out.println("Nulo por el esecuele");
            ex.printStackTrace();
            return null;
        }finally{
            q="";
            try{
                rs.close();
                cs.close();
                con.close();
            } catch (SQLException ex) {
                System.out.println("No se cerraron bien");
            }
        }
        System.out.println(valores);
        return valores;
    }
    
    public static int[] obtenerIdes(ArrayList valores){
        int ides[] = new int[6];
        if(valores.size()!=6){
            return null;
        }
        Connection con = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        String q = "";
        try{
            con = Conexion.obtenerConexion();
                q = "{CALL traducirValoresCatalogosCarrito(?,?,?,?,?,?)}";
            cs = con.prepareCall(q);
            cs.setString(1, (String)valores.get(0));
            cs.setString(2, (String)valores.get(1));
            cs.setString(3, (String)valores.get(2));
            cs.setInt(4, (int)valores.get(3));
            cs.setString(5, (String)valores.get(4));
            cs.setInt(6, (int)valores.get(5));
            
            rs = cs.executeQuery();
            if(rs.next()){
                System.out.println("Mira, unsas ides");
                ides[0] = rs.getInt(1);
                ides[1] = rs.getInt(2);
                ides[2] = rs.getInt(3);
                ides[3] = rs.getInt(4);
                ides[4] = rs.getInt(5);
                ides[5] = rs.getInt(6);
                System.out.println(ides);
            }else{
                System.out.println("No tengo nada que darte");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            ides=null;
        }finally{
            q = "";
            try{
                rs.close();
                cs.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                System.out.println("No se cerraron bien");
            }catch(NullPointerException ed){
                     ed.printStackTrace();
                     System.out.println("efe el rs");
            }       
        }if(ides == null) System.out.println("No hay ides");
        return ides;
    }
    
}
