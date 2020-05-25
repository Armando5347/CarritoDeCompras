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
public class borrarCuenta extends HttpServlet {

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
            boolean proceso_adecuado = false;
            HttpSession  sesion_usuario_a_borrar = request.getSession();
            String tipo_usuario = (String)sesion_usuario_a_borrar.getAttribute("tipo_usuario");
            if (tipo_usuario == null || tipo_usuario.isEmpty()) response.sendRedirect("error.jsp");
            else if(tipo_usuario.equals("cliente")){
                Cliente cli = (Cliente)sesion_usuario_a_borrar.getAttribute("usuario");
                int id = cli.getId_cli();
                proceso_adecuado = Cliente.BorrarCliente(id);
                if(proceso_adecuado){
                    sesion_usuario_a_borrar.setAttribute("usuario", null);
                    sesion_usuario_a_borrar.setAttribute("tipo_user", null);
                    sesion_usuario_a_borrar.invalidate();
                    response.sendRedirect("IncioSesion.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
            }
            else if(tipo_usuario.equals("empleado")){
                Empleado emp = (Empleado)sesion_usuario_a_borrar.getAttribute("usuario");
                int id_priv = emp.getCprivilegio_id();
                if((id_priv != 2) && (id_priv != 3)) response.sendRedirect("error.jsp");
                int id_borrar = 0;
                try{
                    id_borrar = Integer.parseInt(request.getParameter("id")); //Aquí esto por que el gerente v apulsar un link para hacer estó
                }catch(Exception e){
                    response.sendRedirect("error.jsp");
                }
                proceso_adecuado = Empleado.despedirEmpleado(id_borrar);
                if(proceso_adecuado){
                    sesion_usuario_a_borrar.setAttribute("usuario", null);
                    sesion_usuario_a_borrar.setAttribute("tipo_user", null);
                    sesion_usuario_a_borrar.invalidate();
                    response.sendRedirect("ListaEmpleado.jsp");
                }else{
                    response.sendRedirect("error.jsp");
                }
            }
            if(proceso_adecuado){
                sesion_usuario_a_borrar.setAttribute("usuario", null);
                sesion_usuario_a_borrar.setAttribute("tipo_user", null);
                sesion_usuario_a_borrar.invalidate();
                response.sendRedirect("IncioSesion.jsp");
            }else{
                response.sendRedirect("error.jsp");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet borrarCuenta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet borrarCuenta at " + request.getContextPath() + "</h1>");
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
