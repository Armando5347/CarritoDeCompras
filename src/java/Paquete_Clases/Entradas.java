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
        
        String expresion_regular = "/[0-9]/";
        String intConvertido = String.valueOf(enteroTestear);
        Pattern patron_enteros = Pattern.compile(expresion_regular);
        Matcher esEntero = patron_enteros.matcher(intConvertido);
        
        return esEntero.matches();
    }
    
    public static boolean esDouble(double doubleTestear){
        try{
            if(doubleTestear < 0 ) return false;
            Pattern verDouble = Pattern.compile("/^(0|[1-9]\\d*)(\\.\\d+)?$/");
            String double_convertido = String.valueOf(doubleTestear);
            if (double_convertido.isEmpty()) return false;
            Matcher esdoble = verDouble.matcher(double_convertido);
            return esdoble.matches();
        }catch(Exception e){
            return false;
        }
    }
        
    public static boolean esString (String stringTestear){
        
        Pattern patronStrings = Pattern.compile("/[A-Za-z]/");
        
        Matcher esStr = patronStrings.matcher(stringTestear);
        
        return esStr.matches();
    }
    
    public static boolean formatoUser (String formatoTestear){
        
        String er = "/[A-Za-z0-9]/";
        
        Pattern patronUser = Pattern.compile(er);
        
        Matcher estaCorrecto = patronUser.matcher(formatoTestear);
        
        return estaCorrecto.matches();
        
    }
}
