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

public class MPapel {
    
    static Connection con;
    static PreparedStatement ps;
    static String q ;
    static ResultSet rs;
    
    
    private int id_MPapel;
    
    private String nombre_pap;

    public int getId_MPapel() {
        return id_MPapel;
    }

    public void setId_MPapel(int id_MPapel) {
        this.id_MPapel = id_MPapel;
    }
    
    MPapel(){}
    
    
    
    public static ArrayList<MPapel> obtenerTodosPapeles(){
        ArrayList <MPapel> listaPapeles = new ArrayList<>();
        try{
            con = Conexion.obtenerConexion();
            //Para esto sería buenp un procedimiento almacenado
            q = "nombre_procedimiento_amcacendado";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while(rs.next()){
                MPapel papelito = new MPapel();
                listaPapeles.add(papelito);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            listaPapeles = null;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                
            }
        }
        return listaPapeles;
    }

    public String getNombre_pap() {
        return nombre_pap;
    }

    public void setNombre_pap(String nombre_pap) {
        this.nombre_pap = nombre_pap;
    }
    
    
    
    
}
