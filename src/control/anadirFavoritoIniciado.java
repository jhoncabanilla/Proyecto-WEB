/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
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
import ulearn.datos.dao.SeccionDB;
import ulearn.datos.dao.UserDB;
import ulearn.model.Curso;
import ulearn.model.Seccion;
import ulearn.model.User;

/**
 *
 * @author migchav
 */
@WebServlet(name = "anadirFavoritoIniciado", urlPatterns = {"/anadirFavoritoIniciado"})
public class anadirFavoritoIniciado extends HttpServlet {

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
            out.println("<title>Servlet anadirFavoritoIniciado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet anadirFavoritoIniciado at " + request.getContextPath() + "</h1>");
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
        
        int idCurso = Integer.parseInt(request.getParameter("idCurso"));
        boolean favorito=Boolean.parseBoolean(request.getParameter("valor"));
        int idSeccion=Integer.parseInt(request.getParameter("idSeccion"));
        
        ArrayList<Seccion> listaSecciones = null;
        Curso curso=null;
        User creador=null;
        double valoracion=0;
        
        if(favorito){
            try {
            CursoDB.anadirfavorito(user.getId(),idCurso);
            listaSecciones = SeccionDB.getListaSecciones(idCurso);
            curso = CursoDB.getInfoCurso(idCurso);
            creador=UserDB.getInfoCreador(idCurso);
            valoracion=CursoDB.getValoracion(idCurso);
            } catch (SQLException ex) {
                Logger.getLogger(anadirFavorito.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            try {
                CursoDB.eliminarfavorito(user.getId(),idCurso);
                listaSecciones = SeccionDB.getListaSecciones(idCurso);
                curso = CursoDB.getInfoCurso(idCurso);
                creador=UserDB.getInfoCreador(idCurso);
                valoracion=CursoDB.getValoracion(idCurso);
            } catch (SQLException ex) {
                Logger.getLogger(anadirFavorito.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        request.setAttribute("listSecciones",listaSecciones);
        request.setAttribute("infoCurso",curso);
        request.setAttribute("infoCreador",creador);
        request.setAttribute("valoracion",valoracion);
        request.setAttribute("favorito",favorito); 
        
        String url = "/InfoCursos.jsp?idCurso="+idCurso+"&seccion="+idSeccion;
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
