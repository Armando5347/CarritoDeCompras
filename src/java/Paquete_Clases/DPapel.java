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

public class DPapel {
    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static String q = "";
    
    private int id_papel, stock, cAroma_id, cMaterial_id, cCaracteristicas_id, cTipos_id, mPapel_Id, cTipo_hojas_id, cHojasxRollo_id;
    private double precio; 
    
    DPapel(){}
    
    public static boolean guardarNuevoDetallePapel(DPapel new_detallePapel){
        boolean guardado = false;
        try{
            con = Conexion.obtenerConexion();
            q = "INSERT INTO DPapel (Precio, Stock, CMaterial_ID, CTipos_ID, MPapel_ID, Aromas_ID, CCaracteristicas_ID, CTipo_Hojas_ID, CHojasxRollo_ID";
            q += " VALUES(?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setDouble(1, new_detallePapel.getPrecio());
            ps.setInt(2, new_detallePapel.getStock());
            ps.setInt(3, new_detallePapel.getcMaterial_id());
            ps.setInt(4, new_detallePapel.getcTipos_id());
            ps.setInt(5, new_detallePapel.getmPapel_Id());
            ps.setInt(6, new_detallePapel.getcAroma_id());
            ps.setInt(7, new_detallePapel.getcCaracteristicas_id());
            ps.setInt(8, new_detallePapel.getcTipo_hojas_id());
            ps.setInt(9, new_detallePapel.getcHojasxRollo_id());
            if(ps.executeUpdate()==1){
                guardado = true;
            }
   
        }catch(Exception ex){
            guardado = false;
        }finally{
            try{
                ps.close();
                q="";
                con.close();
            } catch (SQLException ex) {
               ex.printStackTrace();
            }
        }
        return guardado;
    }
    
    public static ArrayList<DPapel> obtenerTodosDetallesPapel(){
        ArrayList<DPapel> detallesPapel = new ArrayList<>();
        try{
            con = Conexion.obtenerConexion();
            q = "SELECT * FROM DPapel";
            ps = con.prepareStatement(q);
            rs = ps.executeQuery();
            while(rs.next()){
                DPapel papel = new DPapel(
                rs.getInt("ID"),
                rs.getInt("Stock"),
                rs.getInt("Aromas_ID"),
                rs.getInt("CCaracteristicas_ID"),
                rs.getInt("CTipos_ID"),
                rs.getInt("MPapel_ID"),        
                rs.getInt("CTipo_hojas_ID"),
                rs.getInt("CHojasxRollo_ID"),
                rs.getDouble("Precio")
                );
                detallesPapel.add(papel);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();;
                
            }
        }
        return detallesPapel;
    }
    public static boolean actualizarPrecioStock(double precio, int stock, int mPapel_id){
        boolean actualizo = false;
        try{
            con = Conexion.obtenerConexion();
            q = "UPDATE DPapel SET Precio = ?, Stock = ? WHERE MPapel_ID = ?";
            ps = con.prepareStatement(q);
            ps.setDouble(1,precio);
            ps.setInt(2, stock);
            ps.setInt(3, mPapel_id);
            if(ps.executeUpdate()==1){
                actualizo = true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            actualizo = false;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();  
            }
        }
        return actualizo;
     }
    public static DPapel obtenerPapelPorMaestra(int mPapel_id){
        DPapel papel = null;
        try{
            con = Conexion.obtenerConexion();
            q = "SELECT * FROM DPapel WHERE MPapel_ID = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, mPapel_id);
            rs = ps.executeQuery();
            while(rs.next()){
                papel = new DPapel(
                rs.getInt("ID"),
                rs.getInt("Stock"),
                rs.getInt("Aromas_ID"),
                rs.getInt("CCaracteristicas_ID"),
                rs.getInt("CTipos_ID"),
                rs.getInt("MPapel_ID"),        
                rs.getInt("CTipo_hojas_ID"),
                rs.getInt("CHojasxRollo_ID"),
                rs.getDouble("Precio")
                );
                break;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            papel = null;
        }finally{
            try {
                rs.close();
                ps.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();;
                
            }
        }
        return papel;
    }
    

    public DPapel(int id_papel, int stock, int cAroma_id, int cCaracteristicas_id, int cTipos_id, int mPapel_Id, int cTipo_hojas_id, int cHojasxRollo_id, double precio) {
        this.id_papel = id_papel;
        this.stock = stock;
        this.cAroma_id = cAroma_id;
        this.cCaracteristicas_id = cCaracteristicas_id;
        this.cTipos_id = cTipos_id;
        this.mPapel_Id = mPapel_Id;
        this.cTipo_hojas_id = cTipo_hojas_id;
        this.cHojasxRollo_id = cHojasxRollo_id;
        this.precio = precio;
    }
    
    

    public DPapel(int stock, int cAroma_id, int cCaracteristicas_id, int cTipos_id, int mPapel_Id, int cTipo_hojas_id, int cHojasxRollo_id, double precio) {
        this.stock = stock;
        this.cAroma_id = cAroma_id;
        this.cCaracteristicas_id = cCaracteristicas_id;
        this.cTipos_id = cTipos_id;
        this.mPapel_Id = mPapel_Id;
        this.cTipo_hojas_id = cTipo_hojas_id;
        this.cHojasxRollo_id = cHojasxRollo_id;
        this.precio = precio;
    }

    public int getId_papel() {
        return id_papel;
    }

    public void setId_papel(int id_papel) {
        this.id_papel = id_papel;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getcAroma_id() {
        return cAroma_id;
    }

    public void setcAroma_id(int cAroma_id) {
        this.cAroma_id = cAroma_id;
    }

    public int getcCaracteristicas_id() {
        return cCaracteristicas_id;
    }

    public void setcCaracteristicas_id(int cCaracteristicas_id) {
        this.cCaracteristicas_id = cCaracteristicas_id;
    }

    public int getcTipos_id() {
        return cTipos_id;
    }

    public void setcTipos_id(int cTipos_id) {
        this.cTipos_id = cTipos_id;
    }

    public int getmPapel_Id() {
        return mPapel_Id;
    }

    public void setmPapel_Id(int mPapel_Id) {
        this.mPapel_Id = mPapel_Id;
    }

    public int getcTipo_hojas_id() {
        return cTipo_hojas_id;
    }

    public void setcTipo_hojas_id(int cTipo_hojas_id) {
        this.cTipo_hojas_id = cTipo_hojas_id;
    }

    public int getcHojasxRollo_id() {
        return cHojasxRollo_id;
    }

    public void setcHojasxRollo_id(int cHojasxRollo_id) {
        this.cHojasxRollo_id = cHojasxRollo_id;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getcMaterial_id() {
        return cMaterial_id;
    }

    public void setcMaterial_id(int cMaterial_id) {
        this.cMaterial_id = cMaterial_id;
    }
    
}
