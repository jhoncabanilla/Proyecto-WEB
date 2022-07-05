/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
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
 * @author migchav
 */
@WebServlet(name = "registrarUsuario", urlPatterns = {"/registrarUsuario"})
public class registrarUsuario extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addUser at " + request.getContextPath() + "</h1>");
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
        //Usuario usuario = CookiesKitchen.GetUser(request, response);
        /*if (usuario != null) {
            // Si hay usuario redirigimos a perfil !!!
            response.sendRedirect("/rerego/perfil");
        } else {*/
        User user=new User();
        request.setCharacterEncoding("UTF-8");
        // Si no hay usuario procedemos con el registro
        String userName = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        user.setCorreo(email);
        user.setNombreUsuario(userName);
        user.setContraseña(password);
        
        Boolean[] suscripciones = new Boolean[4];
        Arrays.fill(suscripciones, Boolean.FALSE);
        
        String url="";
        if (UserDB.emailExists(user.getCorreo())) {
            PrintWriter out=response.getWriter();
            out.println("Ya hay una cuenta con dicho correo");
        }
        else if(UserDB.userNameExists(user.getNombreUsuario())){
            PrintWriter out=response.getWriter();
            out.println("Ya hay una cuenta con dicho usuario");
        }else {
            url = "/suscripciones.jsp";
            response.addHeader ("REDIRECT", "REDIRECT"); // Dile a ajax que esto es una redirección
            response.addHeader ("CONTEXTPATH", url); // Dirección de redireccionamiento
            int id=UserDB.insert(user);
            user.setID(id);
            
            // store the user in the session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.setAttribute("suscripciones",suscripciones);
            // forward the request and response to the view
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
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
