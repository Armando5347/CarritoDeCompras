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
    
    private int id_papel, stock, cAroma_id, cCaracteristicas_id, cTipos_id, mPapel_Id, cTipo_hojas_id, cHojasxRollo_id;
    private double precio; 
    
    DPapel(){}
    
    public static boolean guardarNuevoDetallePapel(DPapel new_detallePapel){
        boolean guardado = false;
        try{
            con = Conexion.obtenerConexion();
            q = "INSERT INTO DPapel (Precio, Stock, CMaterial_ID, CTipos_ID, MPapel_ID, Aromas_ID, CCaracteristicas_ID, CTipo_Hojas_ID, CHojasxRollo_ID";
            q += " VALUES(?,?,?,?,?,?,?,?,?)";
        }catch(Exception ex){
            
        }finally{
            
        }
        return guardado;
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
    
}
