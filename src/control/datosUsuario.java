/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ulearn.datos.dao.UserDB;
import ulearn.model.DesarrolloCurso;
import ulearn.model.ObtencionSuscripcion;
import ulearn.model.User;

/**
 *
 * @author angel
 */
@WebServlet(name = "datosUsuario", urlPatterns = {"/datosUsuario"})
public class datosUsuario extends HttpServlet {

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
            out.println("<title>Servlet datosUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet datosUsuario at " + request.getContextPath() + "</h1>");
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
        User user1 = UserDB.getInfoUsuario(user.getId());
        ArrayList<ObtencionSuscripcion> obtenciones = UserDB.getSuscripcionesUsuario(user.getId());
        ArrayList<String> nombres = new ArrayList<String>();
        for(int i = 0; i<obtenciones.size(); i++){
            if(obtenciones.get(i).getSuscripcion().getIdautor() != -1){
                nombres.add(UserDB.getNombre(obtenciones.get(i).getSuscripcion().getIdautor()));
            }else
                nombres.add("");
        }
        ArrayList<DesarrolloCurso> cursos = UserDB.getCursosUsuario(user.getId());
        request.setAttribute("cursos",cursos);
        request.setAttribute("user", user1);
        request.setAttribute("suscripciones", obtenciones);
        request.setAttribute("nombresAutores", nombres);
        String url = "/info_personal.jsp";
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
                HttpSession session = request.getSession();
        User user= (User) session.getAttribute("user");
        User user1 = UserDB.getInfoUsuario(user.getId());
        ArrayList<ObtencionSuscripcion> obtenciones = UserDB.getSuscripcionesUsuario(user.getId());
        ArrayList<String> nombres = new ArrayList<String>();
        for(int i = 0; i<obtenciones.size(); i++){
            if(obtenciones.get(i).getSuscripcion().getIdautor() != -1){
                nombres.add(UserDB.getNombre(obtenciones.get(i).getSuscripcion().getIdautor()));
            }else
                nombres.add("");
        }
        ArrayList<DesarrolloCurso> cursos = UserDB.getCursosUsuario(user.getId());
        request.setAttribute("cursos",cursos);
        request.setAttribute("user", user1);
        request.setAttribute("suscripciones", obtenciones);
        request.setAttribute("nombresAutores", nombres);
        String url = "/info_personal.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
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
