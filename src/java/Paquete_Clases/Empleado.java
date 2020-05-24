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

public class Empleado {
    
    public static Connection con;
    public static PreparedStatement pr;
    public static ResultSet rs;
    public static String q;
    
    private int id_emp, cel_emp, tel_emp, Cprivilegio_id;
    private String nombre_emp, appat_emp, apmat_emp, fecha_nac_emp, username_emo, password_emp;

    public Empleado(){}

    public static Empleado IniciarSesionEmpleado(String username, String password){
        Empleado em = null;
        try{
            con =Conexion.obtenerConexion();
            q = "SELECT * FROM Empleado WHERE username_emp = ?  AND pasword_emp = ?";
            pr = con.prepareStatement(q);
            pr.setString(1, username);
            pr.setString(2, password);
            rs = pr.executeQuery();
            while(rs.next()){
                em = new Empleado(rs.getInt("id_emp"), rs.getInt("cel_emp"), rs.getInt("tel_emp"), rs.getInt("CPrivilegioEmpleado"), rs.getString("nombre_emp"), rs.getString("appat_emp"), rs.getString("apmat_emp"), rs.getString("fecha_nacimiento_emp"), rs.getString("username_emp"), rs.getString("password_emp"));
            break;
           }
        }catch(SQLException ex){
            em = null;
        }finally{
            q = "";
            try{
                rs.close();
                pr.close();
                con.close();
            }catch(SQLException e){
                
            }
        }

    return em;
   }
    
    public static boolean borrarEmpleado (int id_empleado){
        boolean procesoAdecuado = false;
        try{
            con = Conexion.obtenerConexion();
            q = "DELETE FROM Empleado WHERE id_emp = ?";
            pr = con.prepareStatement(q);
            if(pr.executeUpdate()==1){
                procesoAdecuado = true;
            }else{
                procesoAdecuado = false;
            }
        }catch(SQLException ex){
            ex.printStackTrace();;
            procesoAdecuado = false;
        }finally{
            q = "";
            try{
                pr.close();
                con.close();
            }catch(SQLException e){
                
            }
        }
        return procesoAdecuado;
    }

    public Empleado(int cel_emp, int tel_emp, int Cprivilegio_id, String nombre_emp, String appat_emp, String apmat_emp, String fecha_nac_emp, String username_emo, String password_emp) {
        this.cel_emp = cel_emp;
        this.tel_emp = tel_emp;
        this.Cprivilegio_id = Cprivilegio_id;
        this.nombre_emp = nombre_emp;
        this.appat_emp = appat_emp;
        this.apmat_emp = apmat_emp;
        this.fecha_nac_emp = fecha_nac_emp;
        this.username_emo = username_emo;
        this.password_emp = password_emp;
    }

    public Empleado(int id_emp, int cel_emp, int tel_emp, int Cprivilegio_id, String nombre_emp, String appat_emp, String apmat_emp, String fecha_nac_emp, String username_emo, String password_emp) {
        this.id_emp = id_emp;
        this.cel_emp = cel_emp;
        this.tel_emp = tel_emp;
        this.Cprivilegio_id = Cprivilegio_id;
        this.nombre_emp = nombre_emp;
        this.appat_emp = appat_emp;
        this.apmat_emp = apmat_emp;
        this.fecha_nac_emp = fecha_nac_emp;
        this.username_emo = username_emo;
        this.password_emp = password_emp;
    }
    
    
    public int getId_emp() {
        return id_emp;
    }

    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
    }

    public int getCel_emp() {
        return cel_emp;
    }

    public void setCel_emp(int cel_emp) {
        this.cel_emp = cel_emp;
    }

    public int getTel_emp() {
        return tel_emp;
    }

    public void setTel_emp(int tel_emp) {
        this.tel_emp = tel_emp;
    }

    public int getCprivilegio_id() {
       
        return Cprivilegio_id;
    }

    public void setCprivilegio_id(int Cprivilegio_id) {
        this.Cprivilegio_id = Cprivilegio_id;
    }

    public String getFecha_nac_emp() {
        return fecha_nac_emp;
    }

    public void setFecha_nac_emp(String fecha_nac_emp) {
        this.fecha_nac_emp = fecha_nac_emp;
    }

    public String getNombre_emp() {
        return nombre_emp;
    }

    public void setNombre_emp(String nombre_emp) {
        this.nombre_emp = nombre_emp;
    }

    public String getAppat_emp() {
        return appat_emp;
    }

    public void setAppat_emp(String appat_emp) {
        this.appat_emp = appat_emp;
    }

    public String getApmat_emp() {
        return apmat_emp;
    }

    public void setApmat_emp(String apmat_emp) {
        this.apmat_emp = apmat_emp;
    }

    public String getUsername_emo() {
        return username_emo;
    }

    public void setUsername_emo(String username_emo) {
        this.username_emo = username_emo;
    }

    public String getPassword_emp() {
        return password_emp;
    }

    public void setPassword_emp(String password_emp) {
        this.password_emp = password_emp;
    }
    
    
}

