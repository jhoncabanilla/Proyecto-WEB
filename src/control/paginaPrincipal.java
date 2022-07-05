/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.control;

import com.google.gson.Gson;
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
import ulearn.model.User;

/**
 *
 * @author angel
 */
@WebServlet(name = "paginaPrincipal", urlPatterns = {"/paginaPrincipal"})
public class paginaPrincipal extends HttpServlet {

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
            out.println("<title>Servlet paginaPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet paginaPrincipal at " + request.getContextPath() + "</h1>");
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
        
        //ESTA ES LA BUENA!!!!!!!!!!!!!!!!!!!
        
        response.setContentType("application/json;charset=UTF-8");
        // Cross-origin resource sharing
        response.addHeader("Access-Control-Allow-Origin", "*");
        
        PrintWriter out = response.getWriter();   
        ArrayList<Integer> cursosGratuitos = null;
        ArrayList<Integer> cursosDemandados = null;
        ArrayList<Integer> cursosFavoritos = null;
        try {
            cursosGratuitos = CursoDB.getCursosGratuitos();
            cursosDemandados = CursoDB.getCursosDemandados();
            cursosFavoritos = CursoDB.getCursosFavoritos();
        } catch (SQLException ex) {
            Logger.getLogger(paginaPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        ArrayList<ArrayList> resultado = new ArrayList();
        resultado.add(cursosGratuitos);
        resultado.add(cursosDemandados);
        resultado.add(cursosFavoritos);
        
        Gson gson = new Gson();
        String json = gson.toJson(resultado);
        out.println(json);

        /*request.setAttribute("cursosGratuitos", cursosGratuitos);
        request.setAttribute("cursosDemandados", cursosDemandados);
        request.setAttribute("cursosFavoritos", cursosFavoritos);
        HttpSession session = request.getSession();
        User user=(User) session.getAttribute("user");
        String url="/Pricipal.jsp";
       
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);*/
        
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
        response.setContentType("application/json;charset=UTF-8");
        // Cross-origin resource sharing
        response.addHeader("Access-Control-Allow-Origin", "*");
        
        PrintWriter out = response.getWriter();   
        ArrayList<Integer> cursosGratuitos = null;
        ArrayList<Integer> cursosDemandados = null;
        ArrayList<Integer> cursosFavoritos = null;
        try {
            cursosGratuitos = CursoDB.getCursosGratuitos();
            cursosDemandados = CursoDB.getCursosDemandados();
            cursosFavoritos = CursoDB.getCursosFavoritos();
        } catch (SQLException ex) {
            Logger.getLogger(paginaPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        ArrayList<ArrayList> resultado = new ArrayList();
        resultado.add(cursosGratuitos);
        resultado.add(cursosDemandados);
        resultado.add(cursosFavoritos);
        
        Gson gson = new Gson();
        String json = gson.toJson(resultado);
        out.println(json);
        
        //request.setAttribute("cursosGratuitos", cursosGratuitos);
        //request.setAttribute("cursosDemandados", cursosDemandados);
        //request.setAttribute("cursosFavoritos", cursosFavoritos);
        //HttpSession session = request.getSession();
        //User user=(User) session.getAttribute("user");
        //String url="/Pricipal.jsp";
       // String url="/Pricipal.jsp";
        //RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        //dispatcher.forward(request, response);
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
