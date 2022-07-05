/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ulearn.datos.dao.UserDB;
import ulearn.model.User;

/**
 *
 * @author angel
 */
@WebServlet(name = "almacenarInfoPersonal", urlPatterns = {"/almacenarInfoPersonal"})
public class almacenarInfoPersonal extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet almacenarInfoPersonal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet almacenarInfoPersonal at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("user");
        String url = "";
        User usuario = new User();
        String email = (String) request.getParameter("email");
        if(!UserDB.emailExists(email) || (UserDB.emailExists(email) && email.equals(user.getCorreo())) ){
            usuario.setID(user.getId());
            usuario.setNombre((String) request.getParameter("nombre"));
            usuario.setApellidos((String) request.getParameter("apellidos"));
            usuario.setCorreo((String) request.getParameter("email"));
            usuario.setTelefono(Integer.parseInt((String)request.getParameter("telefono")));
            usuario.setDireccion((String) request.getParameter("direccion"));
            usuario.setOcupacion((String) request.getParameter("ocupacion"));
            usuario.setPais((String) request.getParameter("pais"));
            usuario.setCiudad((String) request.getParameter("ciudad"));
            String fechaNacimiento = (String) request.getParameter("dateofbirth");
            if(fechaNacimiento!="")usuario.setFechaNacimiento(LocalDate.parse(fechaNacimiento));  
            usuario.setBiografia((String) request.getParameter("biografia"));
            UserDB.updateInfoUsuario(usuario);
            url = "/datosUsuario";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }else{
            PrintWriter out=response.getWriter();
            out.println("Este correo ya está registrado");
        }
        
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
