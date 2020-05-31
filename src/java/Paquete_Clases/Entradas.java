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
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Entradas {
    
    public static boolean esNumeroEntero(int enteroTestear){
        if(enteroTestear < 0) return false;
        
        String verPorIteracion = "0123456789";
        String intConvertido = String.valueOf(enteroTestear);
        for (int i = 0; i < intConvertido.length(); i++) {
            char numero_validar = intConvertido.charAt(i);
            boolean validado = false;
            for(int j = 0; j < verPorIteracion.length(); j++){
                char validador = verPorIteracion.charAt(j);
                if(validador == numero_validar){
                    validado = true;
                    break;
                }
            }
            if(!validado){
                return false;
            }
        }
        return true;
    }
    
    public static boolean esDouble(double doubleTestear){
        if(doubleTestear < 0) return false;
        
        String verPorIteracion = "0123456789.";
        int puntitos = 0;
        String doubleConvertido = String.valueOf(doubleTestear);
        for (int i = 0; i < doubleConvertido.length(); i++) {
            char numero_validar = doubleConvertido.charAt(i);
            boolean validado = false;
            for(int j = 0; j < verPorIteracion.length(); j++){
                char validador = verPorIteracion.charAt(j);
                if(validador == numero_validar){
                    if(validador == '.'){
                        puntitos ++;
                    }
                    validado = true;
                    break;
                }
            }
            if(!validado || puntitos>1){
                return false;
            }
        }
        return true;
    }
        
    public static boolean esString (String stringTestear){
        
        String verPorIteracion = "QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnmáéíóúÁÉÍÚÓ ";
        
        boolean esString = true;
        
        for(int i = 0; i< stringTestear.length(); i++){
            char verCaracter = stringTestear.charAt(i);
            boolean caracterAprobado = false;
            for(int j = 0; j <verPorIteracion.length(); j ++){
                char verValidez = verPorIteracion.charAt(j);
                if(verCaracter == verValidez){
                    caracterAprobado = true;
                    break;
                }
            }
            if(!caracterAprobado){
                return false;
            }
        }
        
        return true;
    }
    
    public static boolean formatoUser (String formatoTestear){
        
        String er = "QWERTYUIOPASDFGHJKLÑZXCVBNMqwertyuiopasdfghjklñzxcvbnmáéíóúÁÉÍÚÓ 0123456789_.";
        
        for(int i = 0; i< formatoTestear.length(); i++){
            char verCaracter = formatoTestear.charAt(i);
            boolean caracterAprobado = false;
            for(int j = 0; j <er.length(); j ++){
                char verValidez = er.charAt(j);
                if(verCaracter == verValidez){
                    caracterAprobado = true;
                    break;
                }
            }
            if(!caracterAprobado){
                return false;
            }
        }
        
        return true;
        
    }

    static boolean esNumeroEntero(long long_testear) {
        if(long_testear < 0) return false;
        
        String verPorIteracion = "0123456789";
        String intConvertido = String.valueOf(long_testear);
        for (int i = 0; i < intConvertido.length(); i++) {
            char numero_validar = intConvertido.charAt(i);
            boolean validado = false;
            for(int j = 0; j < verPorIteracion.length(); j++){
                char validador = verPorIteracion.charAt(j);
                if(validador == numero_validar){
                    validado = true;
                    break;
                }
            }
            if(!validado){
                return false;
            }
        }
        return true;
    }
    public static boolean esDate(String fecha_nac_testear) {
        
        if(fecha_nac_testear.isEmpty()) return false;
        Pattern patron_fecha = Pattern.compile("^\\d{4}([\\-/.])(0?[1-9]|1[1-2])\\1(3[01]|[12][0-9]|0?[1-9])$");
        Matcher esDate = patron_fecha.matcher(fecha_nac_testear);
        return esDate.matches();
        
    }

    public static boolean esEmail(String email_testear) {
        if(email_testear.isEmpty()) return false;
        Pattern patron_email = Pattern.compile("^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
        Matcher esEmail = patron_email.matcher(email_testear);
        
        return esEmail.matches();
    }

    static boolean esNumeroEntero(int enteroTestear, int max) {
        if(enteroTestear < 0) return false;
        
        String verPorIteracion = "0123456789";
        String intConvertido = String.valueOf(enteroTestear);
        if(intConvertido.length()>max) return false;
        for (int i = 0; i < intConvertido.length(); i++) {
            char numero_validar = intConvertido.charAt(i);
            boolean validado = false;
            for(int j = 0; j < verPorIteracion.length(); j++){
                char validador = verPorIteracion.charAt(j);
                if(validador == numero_validar){
                    validado = true;
                    break;
                }
            }
            if(!validado){
                return false;
            }
        }
        return true;
    }

    static boolean exepcionDireccion(String direccion) {
        if(direccion.isEmpty()) return false;
        String todo_lo_que_puede_tener = "QWERTYUIOPASDFGHJKLÑZXCVBNMÁÉÍÓÚqwertyuiopasdfghjklñzxcvbnmáéíóú °.0123456789";
        for (int i = 0; i < direccion.length(); i++) {
            char numero_validar = direccion.charAt(i);
            boolean validado = false;
            for(int j = 0; j < todo_lo_que_puede_tener.length(); j++){
                char validador = todo_lo_que_puede_tener.charAt(j);
                if(validador == numero_validar){
                    validado = true;
                    break;
                }
            }
            if(!validado){
                return false;
            }
        }
        return true;
    }
    
}
