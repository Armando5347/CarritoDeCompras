package Paquete_Clases;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Fernando Tenorio Aspiros
 */
@WebServlet(urlPatterns = {"/AgregarAlCarrito"})
public class AgregarAlCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean verificarExistenciaCookie(String name, Cookie[] cookies){
        Cookie cookie = null;
        for (int i = 0; i < cookies.length; i++) {
            cookie = cookies[i];
            if (cookie.getName().equals(name)){
               return true;
            }
        }
        return false;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String dp = request.getParameter("id");
            Cookie cookie = null;
            Cookie[] cookies = null;
            // Obtenemos 
            try {
                cookies = request.getCookies();
                if( cookies != null ) {
                   for (int i = 0; i < cookies.length; i++) {
                      cookie = cookies[i];
                      if (cookie.getName().equals("ListaProductos")){
                        //Cuando necesitamos añadir un producto al carro y ya esta la cookie
                        System.out.println(cookie.getValue());
                        Object a = cookie.getValue();
                        ArrayList<String> lista_dp = (ArrayList<String>)a;
                        lista_dp.add(dp);
                        //matamos a la cookie para actualizarla
                        cookies[i].setMaxAge(0);
                        
                        // Cremaos una nueva cookie
                        Cookie cookie2 = new Cookie("ListaProductos", lista_dp.toString());
                        cookie2.setMaxAge(60*60*60);

                        // La volvemos a settear
                        response.addCookie(cookie2);
                        //Lo rompemos por que ya tenemos lo que mas necesitamos
                        break;
                      }else{
                             //La creamos en el caso en que no exista
                            System.out.println(cookie.getValue());
                            if(verificarExistenciaCookie("ListaProductos", cookies)){
                                Object a = cookie.getValue();
                            ArrayList<String> lista_dp = (ArrayList<String>)a;
                            lista_dp.add(dp);
                            //matamos a la cookie para actualizarla
                            cookies[i].setMaxAge(0);

                            // Cremaos una nueva cookie
                            Cookie cookie2 = new Cookie("ListaProductos", lista_dp.toString());
                            cookie2.setMaxAge(60*60*60);

                            // La volvemos a settear
                            response.addCookie(cookie2);
                            break;
                        }else{
                            ArrayList<String> lista_dp = new ArrayList<String>();
                            lista_dp.add(dp);
                            Cookie co = new Cookie("ListaProductos", lista_dp.toString());
                            co.setMaxAge(60*60*60);
                            //Aqui es posible que se cree una paradoja
                            response.addCookie(co);
                            break;                            
                        }
                      }
                    }
                } else if (cookies != null && !verificarExistenciaCookie("ListaProductos", cookies)) {
                    //Esto en caso de que hayan cookies pero no la lista
                    System.out.println("No se encontraron cokies");
                    ArrayList<String> lista_dp = new ArrayList<String>();
                    lista_dp.add(dp);
                    Cookie co = new Cookie("ListaProductos", lista_dp.toString());
                    co.setMaxAge(60*60*60);
                    //Aqui es posible que se cree una paradoja
                    response.addCookie(co);
                }else {
                   //En este puento creo que es una buena idea crear las cookies
                   System.out.println("No se encontraron cokies");
                   ArrayList<String> lista_dp = new ArrayList<String>();
                   lista_dp.add(dp);
                   Cookie co = new Cookie("ListaProductos", lista_dp.toString());
                   co.setMaxAge(60*60*60);
                   //Aqui es posible que se cree una paradoja
                   response.addCookie(co);
                }                
            } catch (Exception e) {
                System.out.println("posiblemente todavia no hay cookies registradas");
                System.out.println(e.getMessage());
                System.out.println(e.getLocalizedMessage());
                e.printStackTrace();
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
            System.out.println(e.getLocalizedMessage());
            e.printStackTrace();
        }finally{
            response.sendRedirect(request.getContextPath() + "carritoDeCompras.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}

