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
            boolean registro_exitosoCli = false;
            boolean esEmpleado = false;
            String privilegio = "";
            try{
                privilegio = request.getParameter("puesto");
                if(privilegio.isEmpty()||privilegio.equalsIgnoreCase("Puestos a seleccionar")){
                    esEmpleado = false;
                }else{
                    esEmpleado = true;
                }
            }catch(NullPointerException noEsta){
                esEmpleado = false;
            }
            boolean validaciones[] = new boolean[10];
            String nombre = request.getParameter("nombre");
            String appat = request.getParameter("apmat");
            String apmat = request.getParameter("appat");
            String fecha_nac = request.getParameter("fecha_nac");
            int telefono = 0;
            long celular = 0;
            try{
                telefono = Integer.parseInt(request.getParameter("telefono"));
            }catch(Exception e){
                validaciones[4] = false;
            }
            try{
                celular = Long.parseLong(request.getParameter("celular"));
            }catch(Exception e){
                validaciones[5] = false;
            }
            String username = request.getParameter("username");
            String password = request.getParameter("pass");
            String ver_pass = request.getParameter("ver_pass");
            //Ahova validamos
            validaciones[0] = Entradas.esString(nombre);
            validaciones[1] = Entradas.esString(appat);
            validaciones[2] = Entradas.esString(apmat);
            validaciones[3] = Entradas.esDate(fecha_nac);
            validaciones[4] = Entradas.esNumeroEntero(telefono);
            validaciones[5] = Entradas.esNumeroEntero(celular);
            validaciones[6] = Entradas.formatoUser(username);
            validaciones[7] = Entradas.formatoUser(password);
            validaciones[8] = Entradas.formatoUser(ver_pass);
            if(password.equals(ver_pass)) validaciones[10]= true;
            else validaciones[10] = false;
            
            for(boolean bool: validaciones){
                if(!bool){
                    response.sendRedirect("registro.jsp");
                }
            }
            if(esEmpleado){
                int priv = 0;
                switch(privilegio){
                    case "Empleado":
                        priv = 1;
                        break;
                    case "Gerente":
                        priv = 2;
                        break;
                    case "Admin":
                        priv = 3;
                        break;
                }
                Empleado newEmp = new Empleado(celular, telefono, priv, nombre, appat, apmat, fecha_nac, username, password);
                registro_exitosoCli = Empleado.contratarEmpleado(newEmp);
                if(registro_exitosoCli){
                response.sendRedirect("InicioSesion.jsp");
            }else{
                response.sendRedirect("RegistrarEmpleados.jsp");
            }
            }
            Cliente nuevo_cliente = new Cliente(telefono, celular, nombre, appat, apmat, username, password,fecha_nac);
            registro_exitosoCli = Cliente.registrarCliente(nuevo_cliente); 
            if(registro_exitosoCli){
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
