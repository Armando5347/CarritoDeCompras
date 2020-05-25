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
public class Registrar_Usuario extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            boolean registro_exitoso = false;
            String nombre_cli = request.getParameter("nombre");
            String appat_cli = request.getParameter("apmat");
            String apmat_cli = request.getParameter("appat");
            String fecha_nac_cli = request.getParameter("fecha_nac");
            //Meter validación de fecha//
            int telefono_cli = Integer.parseInt(request.getParameter("telefono"));
            long celular_cli = Long.parseLong(request.getParameter("celular"));
            String username_cli = request.getParameter("username");
            String password_cli = request.getParameter("pass");
            String ver_pass_cli = request.getParameter("ver_pass");
            
            Cliente nuevo_cliente = new Cliente(telefono_cli, celular_cli, nombre_cli, appat_cli, apmat_cli, username_cli, ver_pass_cli,fecha_nac_cli
            );
            registro_exitoso = Cliente.registrarCliente(nuevo_cliente); 
            if(registro_exitoso){
                response.sendRedirect("InicioSesion.jsp");
            }else{
                response.sendRedirect("Registro.jsp");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Registrar_Usuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Registrar_Usuario at " + request.getContextPath() + "</h1>");
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
