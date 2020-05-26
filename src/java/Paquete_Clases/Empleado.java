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
public class Empleado {
    
    public static Connection con;
    public static PreparedStatement pr;
    public static ResultSet rs;
    public static String q;
    
    private int id_emp, tel_emp, Cprivilegio_id;
    private long cel_emp;
    private String nombre_emp, appat_emp, apmat_emp, fecha_nac_emp, username_emo, password_emp;

    public static ArrayList<Empleado> mostrarEmpleados(int id_priv){
        ArrayList empleados = new ArrayList();
        if(id_priv == 1) return null;
        try{
            con = Conexion.obtenerConexion();
            q = "SELECT * FORM Empleado where CPrivilegio_Empleado_ID <= ?";
            pr = con.prepareStatement(q);
            pr.setInt(1, id_priv);
            rs = pr.executeQuery();
            while(rs.next()){
                Empleado emp = new Empleado(
                        rs.getInt("ID_em"),
                        rs.getLong("cel_em"),
                        rs.getInt("tel_em"),
                        rs.getInt("CPrivilegio_Empleado_ID"),
                        rs.getString("nombre_em"),
                        rs.getString("appat_em"),
                        rs.getString("apmat_em"),
                        rs.getString("fecha_nacimiento_em"),
                        rs.getString("username_em"),
                        rs.getString("password_em"));
                empleados.add(emp);
            }
        }catch(SQLException ex){
            empleados = null;
        }finally{
            q = "";
            try{
                rs.close();
                pr.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo que cerrar por parte de Empleado");
            }
        }
        return empleados;
    }
    
    public static boolean contratarEmpleado(Empleado nuevo_em){
        boolean contratado = false;
        try{
            con = Conexion.obtenerConexion();
            q = "INSERT INTO Empleado (nombre_em, appat_em, apmat_em, fecha_nacimiento_em, tel_em, cel_em, CPrivilegioEmpleado_ID, username_em, password_em)"+
                    "VALUES (?,?,?,?,?,?,?,?,?)";
            pr = con.prepareStatement(q);
            pr.setString(1,nuevo_em.getNombre_emp());
            pr.setString(2,nuevo_em.getAppat_emp());
            pr.setString(3,nuevo_em.getApmat_emp());
            pr.setString(4,nuevo_em.getFecha_nac_emp());
            pr.setInt(5,nuevo_em.getTel_emp());
            pr.setLong(6,nuevo_em.getCel_emp());
            pr.setInt(7,nuevo_em.getCprivilegio_id());
            pr.setString(8,nuevo_em.getUsername_emo());
            pr.setString(9,nuevo_em.getPassword_emp());
            if(pr.executeUpdate()==1){
                contratado = true;
            }
        }catch(SQLException ex){
            contratado = false;
        }finally{
            q = "";
            try{
                pr.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo que cerrar por parte de Empleado");
            }
        }
        return contratado;
    }
    
    public static boolean actualizarEmpleado(Empleado con_nuevos_datos) {
        boolean actualizacion = false;
        try{
            con = Conexion.obtenerConexion();
            q = "UPDATE CLIENTE SET tel_em = ?, cel_em = ?, CPrivilegioEmpleado_ID = ?, nombre_em = ?, appat_em = ?, apmat_em = ?, fecha_nacimiento_em, username_em = ?, password_em = ? WHERE ID_em = ?";
            pr = con.prepareStatement(q);
            pr.setInt(1, con_nuevos_datos.getTel_emp());
            pr.setLong(2, con_nuevos_datos.getCel_emp());
            pr.setInt(3, con_nuevos_datos.getCprivilegio_id());
            pr.setString(4, con_nuevos_datos.getNombre_emp());
            pr.setString(5, con_nuevos_datos.getAppat_emp());
            pr.setString(6, con_nuevos_datos.getAppat_emp());
            pr.setString(7, con_nuevos_datos.getFecha_nac_emp());
            pr.setString(8, con_nuevos_datos.getUsername_emo());
            pr.setString(9, con_nuevos_datos.getPassword_emp());
            pr.setInt(10, con_nuevos_datos.getId_emp());
            if(pr.executeUpdate()==1){
                actualizacion = true;
            }
        }catch(SQLException ex){
            actualizacion = false;
        }finally{
            q = "";
            try{
                pr.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo qeu cerrar por parte de Empleado");
            }
        }
        return actualizacion;
    }
    
    public static boolean despedirEmpleado(int id_em){
        boolean borro_adecuado = false;
        try{
            con = Conexion.obtenerConexion();
            q = "DELETE FROM Empleado WHERE ID_em = ?";
            pr = con.prepareStatement(q);
            pr.setInt(1, id_em);
            if(pr.executeUpdate()==1){
                borro_adecuado = true;
            }
        }catch(SQLException ex){
            borro_adecuado = false;
        }finally{
            q = "";
            try{
                pr.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo qeu cerrar por parte de Empleado");
            }
        }
        return borro_adecuado;
    
    }
    
    

    public Empleado(){}

    public static Empleado IniciarSesionEmpleado(String username, String password){
        Empleado em = null;
        try{
            con =Conexion.obtenerConexion();
            q = "SELECT * FROM Empleado WHERE username_em = ? AND password_em = ?";
            pr = con.prepareStatement(q);
            pr.setString(1, username);
            pr.setString(2, password);
            rs = pr.executeQuery();
            while(rs.next()){
                em = new Empleado(
                        rs.getInt("id_em"), 
                        rs.getLong("cel_em"), 
                        rs.getInt("tel_em"), 
                        rs.getInt("CPrivilegio_Empleado_ID"), 
                        rs.getString("nombre_em"), 
                        rs.getString("Appat_em"), 
                        rs.getString("Apmat_em"), 
                        rs.getString("fecha_nacimiento_em"), 
                        rs.getString("username_em"), 
                        rs.getString("password_em"));
                break;
            }
        }catch(SQLException ex){
            System.out.println("valio efe");
            ex.printStackTrace();
            em = null;
        }finally{
            q = "";
            try{
                rs.close();
                pr.close();
                con.close();
            }catch(SQLException e){
                e.printStackTrace();
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo que cerrar por parte de Empleado");
            }
        }

    return em;
   }
    
   

    public Empleado(long cel_emp, int tel_emp, int Cprivilegio_id, String nombre_emp, String appat_emp, String apmat_emp, String fecha_nac_emp, String username_emo, String password_emp) {
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

    public Empleado(int id_emp, long cel_emp, int tel_emp, int Cprivilegio_id, String nombre_emp, String appat_emp, String apmat_emp, String fecha_nac_emp, String username_emp, String password_emp) {
        this.id_emp = id_emp;
        this.cel_emp = cel_emp;
        this.tel_emp = tel_emp;
        this.Cprivilegio_id = Cprivilegio_id;
        this.nombre_emp = nombre_emp;
        this.appat_emp = appat_emp;
        this.apmat_emp = apmat_emp;
        this.fecha_nac_emp = fecha_nac_emp;
        this.username_emo = username_emp;
        this.password_emp = password_emp;
    }
    
    public static String traducirIdePriv(int id_traducir){
        String privilegio = "";
        try{
            con = Conexion.obtenerConexion();
            q = "Select tipo_privilegio FROM CPrivilegio_Empleado WHERE ID = ?";
            pr = con.prepareStatement(q);
            pr.setInt(1, id_traducir);
            rs = pr.executeQuery();
            while(rs.next()){
                privilegio = rs.getString("tipo_privilegio");
                break;
            }
        }catch(SQLException ex){
            ex.printStackTrace();
            privilegio = null;
        }finally{
            q = "";
            try{
                rs.close();
                pr.close();
                con.close();
            }catch(SQLException e){
                
                e.getMessage();
            }catch(NullPointerException en){
                System.out.println("Error al cerrar o no hay algo qeu cerrar por parte de Empleado");
            }
        }

    return privilegio;
    }
    
    
    public int getId_emp() {
        return id_emp;
    }

    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
    }

    public long getCel_emp() {
        return cel_emp;
    }

    public void setCel_emp(long cel_emp) {
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

