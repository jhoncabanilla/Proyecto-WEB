/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ulearn.datos.dao.CursoDB;
import ulearn.datos.dao.UserDB;
import ulearn.model.Curso;
import ulearn.model.DesarrolloCurso;
import ulearn.model.User;

/**
 *
 * @author angel
 */
@WebServlet(name = "cursosUsuario", urlPatterns = {"/cursosUsuario"})
public class cursosUsuario extends HttpServlet {

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
            out.println("<title>Servlet cursosUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cursosUsuario at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        User user= (User) session.getAttribute("user");
        ArrayList<Curso> favoritos = UserDB.getFavoritosUsuario(user.getId());
        ArrayList<Double> valoracionesFav = new ArrayList<Double>();
        for(int i=0; i<favoritos.size();i++){
            try {
                valoracionesFav.add(CursoDB.getValoracion(favoritos.get(i).getId()));
            } catch (SQLException ex) {
                Logger.getLogger(cursosUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        ArrayList<DesarrolloCurso> enDesarrollo = UserDB.getCursosUsuario(user.getId());
        ArrayList<Double> valoracionesDes = new ArrayList<Double>();
        ArrayList<Double> porcentajeDesarrollo = new ArrayList<Double>();
        for(int i=0; i<enDesarrollo.size();i++){
            try {
                valoracionesDes.add(CursoDB.getValoracion(enDesarrollo.get(i).getCurso().getId()));
                porcentajeDesarrollo.add(CursoDB.getPorcentajeDesarrollo(enDesarrollo.get(i).getCurso().getId(), user.getId()));
            } catch (SQLException ex) {
                Logger.getLogger(cursosUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        request.setAttribute("favoritos",favoritos);
        request.setAttribute("valoracionesFav",valoracionesFav);
        request.setAttribute("enDesarrollo", enDesarrollo);
        request.setAttribute("valoracionesDes",valoracionesDes);
        request.setAttribute("porcentajeDesarrollo", porcentajeDesarrollo);
        String url = "/cursos.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
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
