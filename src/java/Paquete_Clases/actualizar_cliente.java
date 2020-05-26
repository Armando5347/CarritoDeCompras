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
public class actualizar_cliente extends HttpServlet {

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
            boolean progreso_alterado = false;
            String redirect = "";
            boolean validaciones[] =  new boolean[8];
            String nombre = request.getParameter("nombre");
            String appat = request.getParameter("appat");
            String apmat = request.getParameter("apmat");
            String fecha_naci = request.getParameter("fecha_nac");
            int tel = 0;
            long cel = 0;
            try{
                tel = Integer.parseInt(request.getParameter("tel"));
            }catch(Exception e){
                validaciones[4] = false;
            }
            try{
                 cel = Integer.parseInt(request.getParameter("cel"));
            }catch(Exception e){
                validaciones[5] = false;
            }
            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            
            validaciones[0] = Entradas.esString(nombre);
            validaciones[1] = Entradas.esString(appat);
            validaciones[2] = Entradas.esString(apmat);
            validaciones[3] = Entradas.esDate(fecha_naci);
            validaciones[4] = Entradas.esNumeroEntero(tel);
            validaciones[5] = Entradas.esNumeroEntero(cel);
            validaciones[6] = Entradas.formatoUser(username);
            validaciones[7] = Entradas.formatoUser(pass);
            int i = 0;
            for (boolean bool:validaciones){
                i ++;
                if(!bool){
                    System.out.println("Boolean "+i+bool);
                    redirect = "editarUser.jsp";
                    progreso_alterado = true;
                }
            }
            if(!progreso_alterado){
                HttpSession sesion_a_cambiar = request.getSession();
                String tipo_user = (String)sesion_a_cambiar.getAttribute("tipo_user");
                if(tipo_user.equals("cliente")){
                   Cliente  cliente_como_estaba = (Cliente)sesion_a_cambiar.getAttribute("usuario");
                   int id = cliente_como_estaba.getId_cli();
                   Cliente cliente_alterado = new Cliente(id, tel, cel, nombre, appat, apmat, fecha_naci, username, pass);
                   if(Cliente.actualizarCliente(cliente_alterado)){
                       sesion_a_cambiar.setAttribute("usuario", cliente_alterado);
                       redirect = "editarUser.jsp";
                   }else{
                       redirect = "error.jsp";
                   }
                }else{
                     Empleado empleado_como_estaba = (Empleado)sesion_a_cambiar.getAttribute("usuario");
                   int id = empleado_como_estaba.getId_emp();
                   int privilegio = empleado_como_estaba.getCprivilegio_id();
                   Empleado empleado_alterado = new Empleado(id, cel, tel, privilegio, nombre, appat, apmat, fecha_naci, username, pass);
                   if(Empleado.actualizarEmpleado(empleado_alterado)){
                       sesion_a_cambiar.setAttribute("usuario", empleado_alterado);
                       redirect = "editarUser.jsp";
                   }else{
                       redirect = "error.jsp";
                   }
                }
            }
            response.sendRedirect(redirect);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet actualizar_cliente</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet actualizar_cliente at " + request.getContextPath() + "</h1>");
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
