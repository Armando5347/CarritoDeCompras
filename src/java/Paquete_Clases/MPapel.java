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
                MPapel papelito = new MPapel(rs.getInt("ID_mp"),rs.getInt("id_dp"),rs.getString("Nombre_producto"));
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
            q = "Select * from DPapel";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while(rs.next()){
                papel_mostrar = new MPapel(rs.getInt("ID_mp"),rs.getInt("id_dp"),rs.getString("Nombre_producto"));
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
        }
        return papel_mostrar;
    }
    
    
    public static boolean guardarNuevoPapel(String nombrePapel, DPapel detalle_respectivo){
        boolean guardadoExitoso = false;
        try{
            int id_dp = 0;
            con = Conexion.obtenerConexion();
            id_dp = DPapel.guardarNuevoDetallePapel(detalle_respectivo);
            if(id_dp ==0) return false; //Por que significa que no se guardo, a´si que no podemos proseguir
            q = "INSERT INTO MPapel (Nombre_producto , id_DPapel) values(?,?)";
            ps = con.prepareStatement(q);
            ps.setString(1, nombrePapel);
            ps.setInt(2, id_dp);
            if(ps.executeUpdate()==1){
                guardadoExitoso = true;
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
                
            }
        }
        return guardadoExitoso;
    }
    

    public String getNombre_pap() {
        return nombre_pap;
    }

    public void setNombre_pap(String nombre_pap) {
        this.nombre_pap = nombre_pap;
    }
    
    
    
    
}
