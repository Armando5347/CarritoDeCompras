/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete_Clases;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author maste
 */
public class registrarPapel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean procesoAdecuado = false;
        boolean validaciones[] = new boolean[9];
        String nombre_pap, aroma, tipo_papel, tipo_hojas, material;
        int hojasXrollos =0, rollos = 0;
        int id_aroma, stock_ini = 0, id_tipo_pal, id_tipo_hojas, id_hojas_rollos, id_rollos, id_material;
        double precio = 0;
        //Primero obtenemos los parametros
        nombre_pap = request.getParameter("nombre_papel");
        try{
            stock_ini = Integer.parseInt(request.getParameter("stock"));
        }catch(NumberFormatException ex){
            validaciones[1] = false;
        }
        try{
            precio = Double.parseDouble(request.getParameter("precio"));
        }catch(NumberFormatException ex){
            validaciones[2] = false;
        }
        tipo_papel = request.getParameter("tipo_papel");
        aroma = request.getParameter("aroma");
        tipo_hojas = request.getParameter("tipo_hojas");
        try{
            hojasXrollos = Integer.parseInt(request.getParameter("hojasRollo"));
        }catch(NumberFormatException ex){
            validaciones[5] = false;
        }
        try{
            rollos = Integer.parseInt(request.getParameter("rollos"));
        }catch(NumberFormatException ex){
            validaciones[6] = false;
        }
        material = request.getParameter("material");
        //Ahora validamos por si perosnas feas hacen cosas feas
        validaciones[0] = Entradas.esString(nombre_pap);
        validaciones[1] = Entradas.esNumeroEntero(stock_ini);
        validaciones[2] = Entradas.esDouble(precio);
        validaciones[3] = Entradas.esString(aroma);
        validaciones[4] = Entradas.esString(material);
        validaciones[5] = Entradas.esNumeroEntero(hojasXrollos);
        validaciones[6] = Entradas.esNumeroEntero(rollos);
        validaciones[7] = Entradas.esString(tipo_papel);
        validaciones[8] = Entradas.esString(tipo_hojas);
        for(boolean bool:validaciones){
            if(!bool){
                System.out.println("Ingreso no valido detectado");
                procesoAdecuado = false;
                response.sendRedirect("error.jsp");
                break;
            }
        }
        id_aroma = CatalogosPapel.devolverIdParaGuardar(aroma, "CAroma");
        id_material = CatalogosPapel.devolverIdParaGuardar(material, "CMaterial");
        id_tipo_pal = CatalogosPapel.devolverIdParaGuardar(tipo_papel, "CTipos");
        id_tipo_hojas = CatalogosPapel.devolverIdParaGuardar(tipo_hojas, "CTipoHojas");
        id_hojas_rollos = CatalogosPapel.devolverIdParaGuardar(String.valueOf(hojasXrollos), "CHojasxrollo");
        id_rollos = CatalogosPapel.devolverIdParaGuardar(String.valueOf(rollos), "C");
        
        DPapel dpap = new DPapel(stock_ini, id_aroma, id_material, id_tipo_pal, id_rollos, id_tipo_hojas, id_hojas_rollos, id_rollos);
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registrarPapel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registrarPapel at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
