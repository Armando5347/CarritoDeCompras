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
public class Historial {
    private int id_h, id_cli, id_detalle;
    private double precio;
    private String fecha;
    
    Historial(){}

    public static ArrayList<Historial> obtenerHistorialCliente(int id_cliente){
        ArrayList<Historial> historial_cliente = new ArrayList<Historial>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String q = "";
        try{
            con = Conexion.obtenerConexion();
            q = "SELECT Dcompracliente.ID,Dcompracliente.DCarritoDeCompras_ID, Dcompracliente.cliente_ID, Dcompracliente.fecha, dcarritodecompras.total"
                    + " FROM Dcompracliente JOIN dcarritodecompras ON Dcompracliente.DCarritoDeCompras_ID = dcarritodecompras.ID"
                    + " WHERE Dcompracliente.cliente_ID = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, id_cliente);
            rs = ps.executeQuery();
            while(rs.next()){
                Historial ingreso = new Historial(
                        rs.getInt("ID"),
                        rs.getInt("cliente_ID"),
                        rs.getInt("DCarritoDeCompras_ID"),
                        rs.getDouble("total"),
                        rs.getString("fecha")
                );
                historial_cliente.add(ingreso);
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            historial_cliente = null;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo que cerrar por parte del historial");
            }
        }
        if(historial_cliente == null) System.out.println("Mira, nada, no regreso nada");
        return historial_cliente;
    }

    public Historial(int id_h, int id_cli, int id_detalle, double precio, String fecha) {
        this.id_h = id_h;
        this.id_cli = id_cli;
        this.id_detalle = id_detalle;
        this.precio = precio;
        this.fecha = fecha;
    }
    
    
    public int getId_h() {
        return id_h;
    }

    public void setId_h(int id_h) {
        this.id_h = id_h;
    }

    public int getId_cli() {
        return id_cli;
    }

    public void setId_cli(int id_cli) {
        this.id_cli = id_cli;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}
