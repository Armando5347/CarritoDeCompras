/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete_Clases;

import static Paquete_Clases.MPapel.con;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Map.Entry;

/**
 *
 * @author Luis Fernando 
 */
public class Tendencias {
    private static Connection con;
    private static PreparedStatement ps;
    private static String q ;
    private static ResultSet rs;

    public static Connection getCon() {
        return con;
    }

    public static void setCon(Connection aCon) {
        con = aCon;
    }

    public static PreparedStatement getPs() {
        return ps;
    }

    public static void setPs(PreparedStatement aPs) {
        ps = aPs;
    }

    public static String getQ() {
        return q;
    }

    public static void setQ(String aQ) {
        q = aQ;
    }

    public static ResultSet getRs() {
        return rs;
    }

    public static void setRs(ResultSet aRs) {
        rs = aRs;
    }
    private static Map<Object,Object> map = null;
    private static Hashtable<Date, Double> fechas_totales = new Hashtable<Date, Double>();
    private static List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

    public Tendencias(){}
    
    public static List<Map<Object,Object>> obtenerTendenciaBy(String tipo, String marca){
        
        try{
            con = Conexion.obtenerConexion();
            //Para esto sería buenp un procedimiento almacenado
            switch (tipo){
                case "semana":
                    q = "CALL obtenerTablasTendenciasSemana(?)";
                    break;
                case "mes":
                    q = "CALL obtenerTablasTendenciasMes(?)";
                    break;
                case "quincena":
                    q = "CALL obtenerTablasTendenciasQuincena(?)";
                    break;
            }
            ps = con.prepareStatement(q);
            ps.setString(1, marca);
            rs = ps.executeQuery();
            while (rs.next()){
                double total = rs.getDouble("total");
                String nombre = rs.getString("Nombre_producto");
                System.out.println(nombre);
                Date fecha = rs.getDate("fecha");
                /*Al diablo mejor hago un diccionario
                for(Date date : fechas_marca){
                    if(!date.equals(fecha)){
                        //total += rs.getDouble("total");
                        fechas_marca.add(date);
                    }else{
                        //Aqui se acoplan las fechas
                        fechas_marca.add(date);
                    }
                }
                */
                //Ahora si viene lo chido
                for (Entry<Date, Double> entry : fechas_totales.entrySet()) {
                    System.out.println(entry.getKey()+ " " + entry.getValue() + "$");
                    if(!entry.getKey().equals(fecha)){
                        fechas_totales.put(fecha, total);
                        break;
                    }else{
                        fechas_totales.put(entry.getKey(), entry.getValue()+total);
                        break;
                    }
                }
            }
            for (Entry<Date, Double> entry : fechas_totales.entrySet()) {
                System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(entry.getKey()));
                String f =  new SimpleDateFormat("dd-MM-yyyy").format(entry.getKey());
                map = new HashMap<Object,Object>(); map.put("x", f);  map.put("y", entry.getValue());list.add(map);                
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
            System.out.println(ex.getLocalizedMessage());
            ex.printStackTrace();
            list = null;
        }finally{
            q = "";
            try{
                rs.close();
                ps.close();
                con.close();
            }catch(SQLException e){
                
            }
        }if(list == null) System.out.println("No se ejecuto la query"); 
        return list;        
    }

    public Map<Object,Object> getMap() {
        return map;
    }

    public void setMap(Map<Object,Object> map) {
        this.map = map;
    }

    public Hashtable<Date, Double> getFechas_totales() {
        return fechas_totales;
    }

    public void setFechas_totales(Hashtable<Date, Double> fechas_totales) {
        this.fechas_totales = fechas_totales;
    }

    public List<Map<Object,Object>> getList() {
        return list;
    }

    public void setList(List<Map<Object,Object>> list) {
        this.list = list;
    }

}
