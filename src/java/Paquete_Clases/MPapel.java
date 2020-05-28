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
import java.util.logging.Level;
import java.util.logging.Logger;

public class MPapel {
    
    static Connection con;
    static PreparedStatement ps;
    static String q ;
    static ResultSet rs;

    static boolean retirarDelPapel(int id_maestra) {
        boolean retiro_exitoso = false;
        if(DPapel.eliminarDetalle(id_maestra)) return false;
        try{
            con = Conexion.obtenerConexion();
            q = "DELETE FROM MPapel WHERE ID_mp = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_maestra);
            if(ps.executeUpdate()==1){
                System.out.println("C borro MPapel");
                retiro_exitoso = true;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            retiro_exitoso = false;
        }finally{
            q = "";
            try{
                ps.close();
                con.close();
            }catch(SQLException e){
                System.out.println("Error al cerrar");
            }
        }
        return retiro_exitoso;
    }

    public int getId_dp() {
        return id_dp;
    }

    public void setId_dp(int id_dp) {
        this.id_dp = id_dp;
    }
    
    
    private int id_MPapel, id_dp;
    
    private String nombre_pap;

    public int getId_MPapel() {
        return id_MPapel;
    }

    public void setId_MPapel(int id_MPapel) {
        this.id_MPapel = id_MPapel;
    }
    
    MPapel(){}

    public MPapel(int id_MPapel, int id_dp, String nombre_pap) {
        this.id_MPapel = id_MPapel;
        this.id_dp = id_dp;
        this.nombre_pap = nombre_pap;
    }
    
    
    
    //Metodo para solo obtener los parametros de MPapel
    public static ArrayList<MPapel> obtenerPapelesVista(){
        ArrayList <MPapel> listaPapeles = new ArrayList<>();
        try{
            con = Conexion.obtenerConexion();
            //Para esto sería buenp un procedimiento almacenado
            q = "Select * from MPapel";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while(rs.next()){
                MPapel papelito;
                papelito = new MPapel(rs.getInt("ID_mp"),rs.getInt("id_DPapel"),rs.getString("Nombre_producto"));
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
    
    public static MPapel obtenerPapelPorId(int id_mp){
        MPapel papel_mostrar = null;
        try{
            con = Conexion.obtenerConexion();
            //Para esto sería buenp un procedimiento almacenado
            q = "Select * from MPapel WHERE ID_mp = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_mp);
            rs = ps.executeQuery();
            while(rs.next()){
                papel_mostrar = new MPapel(rs.getInt("ID_mp"),rs.getInt("id_DPapel"),rs.getString("Nombre_producto"));
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            papel_mostrar = null;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                
            }
        }if(papel_mostrar == null) System.out.println("No se ejecuto la query"); 
        return papel_mostrar;
    }
    
    
    public static boolean guardarNuevoPapel(String nombrePapel, DPapel detalle_respectivo){
        boolean guardadoExitoso = false;
        try{
            con = Conexion.obtenerConexion();
            //Sacamos na nueva instancia
            q = "SELECT MAX(ID_mp) AS ultimo_menos_uno FROM MPapel";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            if(rs.next()){
                int ide_ultimo = rs.getInt("ultimo_menos_uno") + 1;
                q = "INSERT INTO MPapel (Nombre_producto , id_DPapel) values(?,?)";
                ps = con.prepareStatement(q);
                ps.setString(1, nombrePapel);
                ps.setInt(2, ide_ultimo);
                detalle_respectivo.setId_papel(ide_ultimo);
                if(ps.executeUpdate()==1){
                    guardadoExitoso =  DPapel.guardarNuevoDetallePapel(detalle_respectivo);;
                }
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            guardadoExitoso = false;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
        return guardadoExitoso;
    }
    
    public static boolean borrarPapel(int id_mp_delete){
        boolean borro = false;
        try{
            con = Conexion.obtenerConexion();
        }catch(SQLException ex){
            ex.printStackTrace();
            borro = false;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                
            }
        }
        return borro;
    }
    
    
    public String getNombre_pap() {
        return nombre_pap;
    }

    public void setNombre_pap(String nombre_pap) {
        this.nombre_pap = nombre_pap;
    }
    
    
    
    
}
