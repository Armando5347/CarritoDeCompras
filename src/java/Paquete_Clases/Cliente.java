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
import java.util.logging.Level;
import java.util.logging.Logger;

public class Cliente {

    public static boolean registrarCliente(Cliente nuevo_cliente) {
        boolean registro= false;
        try{
            con = Conexion.obtenerConexion();
            q = "INSERT INTO  Cliente (nombre_cli, appat_cli, apmat_cli, fecha_nacimiento_cli, tel_cli, cel_cli, username_cli, password_cli)";
            q += "VALUES (?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(q);
            ps.setString(1, nuevo_cliente.getNombre_cli());
            ps.setString(2, nuevo_cliente.getAppat_cli());
            ps.setString(3, nuevo_cliente.getApmat_cli());
            ps.setString(4, nuevo_cliente.getFecha_nacimiento_cli());
            ps.setInt(5, nuevo_cliente.getTel_cli());
            ps.setLong(6, nuevo_cliente.getCel_cli());
            ps.setString(7, nuevo_cliente.getUsername_cli());
            ps.setString(8, nuevo_cliente.getPass_cli());
            
            if(ps.executeUpdate()==1){
                registro = true;
            }
 
        } catch (SQLException ex) {
            ex.printStackTrace();
            ex.getMessage();
            registro= false;
        }finally{
            try{
                con.close();
                ps.close();
            } catch (SQLException ex) {
                ex.getMessage();
            }
            
            return registro;
        }
    }

    public Cliente(int id_cli, int tel_cli, long cel_cli, String nombre_cli, String appat_cli, String apmat_cli, String fecha_nacimiento_cli, String username_cli, String pass_cli) {
        this.id_cli = id_cli;
        this.tel_cli = tel_cli;
        this.cel_cli = cel_cli;
        this.nombre_cli = nombre_cli;
        this.appat_cli = appat_cli;
        this.apmat_cli = apmat_cli;
        this.fecha_nacimiento_cli = fecha_nacimiento_cli;
        this.username_cli = username_cli;
        this.pass_cli = pass_cli;
    }

    public static boolean actualizarCliente(Cliente nuevos_parametros){
        boolean actualizacionRealizada = false;
        try{
            con = Conexion.obtenerConexion();
            q = "UPDATE CLIENTE SET tel_cli = ?, cel_cli = ?, nombre_cli = ?, appat_cli = ?, apmat_cli = ?, username_cli = ?, password_cli = ? WHERE ID_cli = ?";
            ps = con.prepareStatement(q);
            ps.setInt(1, nuevos_parametros.getTel_cli());
            ps.setLong(2, nuevos_parametros.getCel_cli());
            ps.setString(3, nuevos_parametros.getNombre_cli());
            ps.setString(4, nuevos_parametros.getAppat_cli());
            ps.setString(5, nuevos_parametros.getApmat_cli());
            ps.setString(6, nuevos_parametros.getUsername_cli());
            ps.setString(7, nuevos_parametros.getPass_cli());
            ps.setInt(8, nuevos_parametros.getId_cli());
            if(ps.executeUpdate()==1){
                actualizacionRealizada = false;
            }
        }catch(SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error SQL");
            actualizacionRealizada = false;
        }finally{
            try{
                q= "";
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }
        }
        return actualizacionRealizada;
    }
    
    public static Cliente IniciarSesionCliente(String username, String password){
        Cliente cliente_a_ingresar = null;
        try {
            con = Conexion.obtenerConexion();
            q = "SELECT * FROM Cliente WHERE username_cli = ? AND password_cli = ? ";
            ps = con.prepareStatement(q);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()){
                cliente_a_ingresar = new Cliente(
                        rs.getInt("ID_cli"),
                        rs.getInt("tel_cli"),
                        rs.getLong("cel_cli"), 
                        rs.getString("nombre_cli"), 
                        rs.getString("appat_cli"),
                        rs.getString("apmat_cli"), 
                        rs.getString("username_cli"), 
                        rs.getString("password_cli"), 
                        rs.getString("fecha_nacimiento_cli"));
                break;
            }
        }catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error SQL");
            cliente_a_ingresar = null;
        }finally{
            try{
                q="";
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException ex){
                ex.printStackTrace();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo qeu cerrar por parte del Cliente");
            }
        }
        return cliente_a_ingresar;
    }
    
    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static String q = "";
    
    private int id_cli, tel_cli;
    private long cel_cli;
    private String nombre_cli, appat_cli, apmat_cli, fecha_nacimiento_cli, username_cli, pass_cli;

    
    public Cliente() {
    }

    public Cliente(int tel_cli, long cel_cli, String nombre_cli, String appat_cli, String apmat_cli, String username_cli, String pass_cli, String fecha_nacimiento_cli) {
        this.tel_cli = tel_cli;
        this.cel_cli = cel_cli;
        this.nombre_cli = nombre_cli;
        this.appat_cli = appat_cli;
        this.apmat_cli = apmat_cli;
        this.username_cli = username_cli;
        this.pass_cli = pass_cli;
        this.fecha_nacimiento_cli = fecha_nacimiento_cli;
    }

    public int getId_cli() {
        return id_cli;
    }

    public void setId_cli(int id_cli) {
        this.id_cli = id_cli;
    }

    public int getTel_cli() {
        return tel_cli;
    }

    public void setTel_cli(int tel_cli) {
        this.tel_cli = tel_cli;
    }

    public long getCel_cli() {
        return cel_cli;
    }

    public void setCel_cli(long cel_cli) {
        this.cel_cli = cel_cli;
    }

    public String getNombre_cli() {
        return nombre_cli;
    }

    public void setNombre_cli(String nombre_cli) {
        this.nombre_cli = nombre_cli;
    }

    public String getAppat_cli() {
        return appat_cli;
    }

    public void setAppat_cli(String appat_cli) {
        this.appat_cli = appat_cli;
    }

    public String getApmat_cli() {
        return apmat_cli;
    }

    public void setApmat_cli(String apmat_cli) {
        this.apmat_cli = apmat_cli;
    }

    public String getUsername_cli() {
        return username_cli;
    }

    public void setUsername_cli(String username_cli) {
        this.username_cli = username_cli;
    }

    public String getPass_cli() {
        return pass_cli;
    }

    public void setPass_cli(String pass_cli) {
        this.pass_cli = pass_cli;
    }

    public String getFecha_nacimiento_cli() {
        return fecha_nacimiento_cli;
    }

    public void setFecha_nacimiento_cli(String fecha_nacimiento_cli) {
        this.fecha_nacimiento_cli = fecha_nacimiento_cli;
    }
    
    
}
