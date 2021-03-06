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
import javax.servlet.http.HttpSession;

/**
 *
 * @author maste
 */
public class IniciarSesion extends HttpServlet {

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
            String username = request.getParameter("nombre_usuario");
            String password = request.getParameter("pass");
            String redirect = "";
            boolean proceso_alterado = false;
            if((!Entradas.formatoUser(password))||(!Entradas.formatoUser(username))){
                redirect = "error.jsp";
                proceso_alterado = true;
            }
            if(!proceso_alterado){
                Cliente posible_cliente = Cliente.IniciarSesionCliente(username, password); //Esto se reemplazara por el usuario
                if(null != posible_cliente){
                    HttpSession sesion_usuario_creada = request.getSession(true);
                    sesion_usuario_creada.setAttribute("tipo_user", "cliente");
                    sesion_usuario_creada.setAttribute("usuario", posible_cliente);
                    redirect = "index.jsp";
                }
                Empleado posible_empleado = Empleado.IniciarSesionEmpleado(username, password);
                if (posible_empleado != null){
                    HttpSession sesion_usuario_creada = request.getSession(true);
                    sesion_usuario_creada.setAttribute("tipo_user", "empleado");
                    sesion_usuario_creada.setAttribute("usuario", posible_empleado);
                    redirect = "index.jsp";
                }

                if(posible_cliente == null && posible_empleado == null){
                    redirect= "InicioSesion.jsp";
                }
            }
            response.sendRedirect(redirect);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet IniciarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1> Un saludo </h1>");
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
        return "Servlet encargado de iniciar la sesión del usuario";
    }// </editor-fold>

}
