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
            boolean proceso_alterado = false;
            String redirect = "";
            HttpSession  sesion_usuario_a_borrar = request.getSession();
            String tipo_usuario = (String)sesion_usuario_a_borrar.getAttribute("tipo_user");
            System.out.println(tipo_usuario);
            if (tipo_usuario == null || tipo_usuario.isEmpty()){
                redirect = "error.jsp";
                proceso_alterado = true;
            }
            String origen = request.getParameter("causa");
            if(origen == null){
                redirect = "error.jsp";
                proceso_alterado = true;
            }
            if(!proceso_alterado){
                if(tipo_usuario.equals("cliente")){
                    Cliente cli = (Cliente)sesion_usuario_a_borrar.getAttribute("usuario");
                    int id = cli.getId_cli();
                    if(Cliente.BorrarCliente(id)){
                        sesion_usuario_a_borrar.setAttribute("usuario", null);
                        sesion_usuario_a_borrar.setAttribute("tipo_user", null);
                        sesion_usuario_a_borrar.invalidate();
                        redirect = "InicioSesion.jsp";
                    }else{
                        redirect = "error.jsp";
                    }

                }else if(tipo_usuario.equals("empleado") && origen.equals("despido")){
                    Empleado emp = (Empleado)sesion_usuario_a_borrar.getAttribute("usuario");
                    int id_priv = emp.getCprivilegio_id();
                    if((id_priv != 2) && (id_priv != 3)){
                        System.out.println("No tiene permisos");
                        redirect = "error.jsp";
                        proceso_alterado = true;
                    }
                    int id_borrar = 0;
                    try{
                        id_borrar = Integer.parseInt(request.getParameter("id_b")); //Aquí esto por que el gerente v apulsar un link para hacer estó
                        System.out.println(id_borrar);
                    }catch(Exception e){
                        System.out.println("id rompeprocesos");
                        redirect = "error.jsp";
                        proceso_alterado = true;
                    }
                    if(!proceso_alterado){
                        if(Empleado.despedirEmpleado(id_borrar)){
                            sesion_usuario_a_borrar.setAttribute("usuario", null);
                            sesion_usuario_a_borrar.setAttribute("tipo_user", null);
                            sesion_usuario_a_borrar.invalidate();
                            redirect = "listaEmpleados.jsp";
                        }else{
                            redirect = "error.jsp";
                        }
                    }
                }else if(tipo_usuario.equals("empleado") && origen.equals("manual")){
                    Empleado emp = (Empleado)sesion_usuario_a_borrar.getAttribute("usuario");
                    
                    int id_borrar = emp.getId_emp();
                    if(Empleado.despedirEmpleado(id_borrar)){
                        redirect = "listaEmpleados.jsp";
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
