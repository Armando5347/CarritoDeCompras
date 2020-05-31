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
public class ejecutar_compra extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String redirect = "";
        String pago = request.getParameter("metodo");
        switch(pago){
            case "paypal":
                String user = request.getParameter("username");
                String pass = request.getParameter("pass");
                try{
                    boolean bien1;
                    boolean bien2;
                    bien1 = Entradas.esEmail(user);
                    bien2 = Entradas.formatoUser(pass);
                    if(bien1 && bien2){
                        redirect="ticket.jsp";
                    }else{
                        redirect="formaDePago.jsp";
                    }
                }catch(NullPointerException e){
                    redirect = "formaDePago.jsp";
                }
                break;
            case "tarjeta":
                try{
                    String tarjeta = request.getParameter("select_targeta");
                    int fecha_vencimiento_mes = Integer.parseInt(request.getParameter("fecha_vencimiento_mes"));
                    long codigo = Long.parseLong(request.getParameter("codigo"));
                    int fecha_vencimiento_ano = Integer.parseInt(request.getParameter("fecha_vencimiento_ano"));
                    int cvv = Integer.parseInt(request.getParameter("cvv"));
                    boolean validaciones[] = new boolean[6];

                    validaciones[0] = Entradas.esString(tarjeta);
                    validaciones[1] = Entradas.esNumeroEntero(codigo);
                    validaciones[2] = Entradas.esNumeroEntero(fecha_vencimiento_mes,2);
                    validaciones[3] = Entradas.esNumeroEnteroMaxExtricto(fecha_vencimiento_ano,4);
                    validaciones[4] = Entradas.esNumeroEnteroMaxExtricto(cvv, 3);
                    
                    if(fecha_vencimiento_ano >2100
                            || fecha_vencimiento_ano < 2019
                            || fecha_vencimiento_mes > 12
                            || fecha_vencimiento_mes < 0
                            || (fecha_vencimiento_ano == 2020 && fecha_vencimiento_mes <5)
                            ){
                        validaciones[5] = false;
                    }
                    for(boolean bool:validaciones){
                        if(!bool){
                            redirect = "formaDePago.jsp";
                            break;
                        }else{
                            redirect = "ticket.jsp";
                        }
                    }
                    
                }catch(Exception e){
                    redirect = "formaDePago.jsp";
                }
                break;
            case "efectivo":
                try{
                    String sucursal = request.getParameter("sucursal");
                    String direccion = request.getParameter("direccion_sucursal");
                    if(!Entradas.esString(sucursal) || sucursal.equalsIgnoreCase("--Tiendas compatibles--") || !Entradas.exepcionDireccion(direccion)){
                        redirect = "formaDePago.jsp";
                    }else{
                        redirect = "ticket.jsp";
                    }
                }catch(Exception e){
                    redirect ="formaDePago.jsp";
                }
                break;
            default:
                redirect = "error.jsp";
                break;
        }
        response.sendRedirect(redirect);
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ejecutar_compra</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ejecutar_compra at " + request.getContextPath() + "</h1>");
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
