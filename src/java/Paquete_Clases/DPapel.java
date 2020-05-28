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

public class DPapel {
    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static String q = "";

    static boolean eliminarDetalle(int id_maestra) {
        boolean retiro_exitoso = false;
        try{
            con = Conexion.obtenerConexion();
            q = "DELTE FROM DPapel WHERE ID_dp = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_maestra);
            if(ps.executeUpdate()==1){
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
    
    private int id_papel, stock, cAroma_id, cMaterial_id, cRollosIncluidos_id, cTipos_id, cTipo_hojas_id, cHojasxRollo_id;
    private double precio; 

    public int getcRollosIncluidos_id() {
        return cRollosIncluidos_id;
    }

    public void setcRollosIncluidos_id(int cRollosIncluidos_id) {
        this.cRollosIncluidos_id = cRollosIncluidos_id;
    }
    
    DPapel(){}
    
    public static boolean guardarNuevoDetallePapel(DPapel new_detallePapel){
        boolean detalle_gud = false;
        try{
            con = Conexion.obtenerConexion();
            q = "INSERT INTO DPapel (ID_dp, Precio, Stock, CMaterial_ID, CTipos_ID, Aromas_ID, CRollosIncluidos_ID, CTipo_Hojas_ID, CHojasxRollo_ID)";
            q += " VALUES(?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setInt(1,new_detallePapel.getId_papel());
            ps.setDouble(2, new_detallePapel.getPrecio());
            ps.setInt(3, new_detallePapel.getStock());
            ps.setInt(4, new_detallePapel.getcMaterial_id());
            ps.setInt(5, new_detallePapel.getcTipos_id());
            ps.setInt(6, new_detallePapel.getcAroma_id());
            ps.setInt(7, new_detallePapel.getcRollosIncluidos_id());
            ps.setInt(8, new_detallePapel.getcTipo_hojas_id());
            ps.setInt(9, new_detallePapel.getcHojasxRollo_id());
            if(ps.executeUpdate()==1){
                detalle_gud = true;
            }
   
        }catch(Exception ex){
            ex.printStackTrace();
            detalle_gud = false;
        }finally{
            try{
                rs.close();
                ps.close();
                q= "";
                con.close();
            } catch (SQLException ex) {
               ex.printStackTrace();
            }
        }
        return detalle_gud;
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
                rs.getInt("ID_dp"),
                rs.getInt("Stock"),
                rs.getInt("CMaterial_ID"),
                rs.getInt("Aromas_ID"),
                rs.getInt("CRollosIncluidos_ID"),
                rs.getInt("CTipos_ID"),       
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
    
    public static DPapel obtenerDetallePapel(int id_dp){
        DPapel detalleMostrar = null;
        try{
            con = Conexion.obtenerConexion();
            q = "SELECT * FROM DPapel WHERE ID_dp = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_dp);
            rs = ps.executeQuery();
            while(rs.next()){
                detalleMostrar = new DPapel(
                rs.getInt("ID_dp"),
                rs.getInt("Stock"),
                rs.getInt("CMaterial_ID"),
                rs.getInt("Aromas_ID"),
                rs.getInt("CRollosIncluidos_ID"),
                rs.getInt("CTipos_ID"),       
                rs.getInt("CTipo_hojas_ID"),
                rs.getInt("CHojasxRollo_ID"),
                rs.getDouble("Precio")
                );
                break;
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
        if(detalleMostrar == null) System.out.println("No se ejecuto la query"); 
        return detalleMostrar;
    }
    
    public static boolean actualizarPrecioStock(double precio, int stock, int mPapel_id){
        boolean actualizo = false;
        try{
            con = Conexion.obtenerConexion();
            q = "UPDATE DPapel JOIN MPapel ON id_DPapel = ID_dp SET Precio = ?, Stock = ?  WHERE ID_mp = ?;";
            ps = con.prepareStatement(q);
            ps.setDouble(1,precio);
            ps.setInt(2, stock);
            ps.setInt(3, mPapel_id);
            if(ps.executeUpdate()==1){
                actualizo = true;
            }else{
                System.out.println("No se ejecuto el update");
            }
                    
        } catch (SQLException ex) {
            ex.printStackTrace();
            actualizo = false;
        }finally{
            try {
                ps.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();  
            }
        }
        return actualizo;
     }
    

    public DPapel(int id_papel, int stock, int cMaterial_id, int cAroma_id, int cRollosIncluidos_id, int cTipos_id, int cTipo_hojas_id, int cHojasxRollo_id, double precio) {
        this.id_papel = id_papel;
        this.stock = stock;
        this.cMaterial_id = cMaterial_id;
        this.cAroma_id = cAroma_id;
        this.cRollosIncluidos_id = cRollosIncluidos_id;
        this.cTipos_id = cTipos_id;
        this.cTipo_hojas_id = cTipo_hojas_id;
        this.cHojasxRollo_id = cHojasxRollo_id;
        this.precio = precio;
    }
    
    

    public DPapel(int stock, int cMaterial_id, int cAroma_id, int cRollosIncluidos_id, int cTipos_id, int cTipo_hojas_id, int cHojasxRollo_id, double precio) {
        this.stock = stock;
        this.cMaterial_id = cMaterial_id;
        this.cAroma_id = cAroma_id;
        this.cRollosIncluidos_id = cRollosIncluidos_id;
        this.cTipos_id = cTipos_id;
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


    public int getcTipos_id() {
        return cTipos_id;
    }

    public void setcTipos_id(int cTipos_id) {
        this.cTipos_id = cTipos_id;
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
