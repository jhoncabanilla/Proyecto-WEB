/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
 * @author Jhon
 */
@WebServlet(name = "Buscador", urlPatterns = {"/Buscador"})
public class Buscador extends HttpServlet {

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

        //HttpSession session = request.getSession();

        //String buscador = request.getParameter("searcher");
        /*String buscador = "Python";
        //ArrayList<Integer> cursosBuscados = new ArrayList<>();
        ArrayList<Integer> cursosBuscados = new ArrayList<Integer>();

        try {
            cursosBuscados = CursoDB.getCursosBuscados(buscador);
        } catch (SQLException ex) {
                Logger.getLogger(Buscador.class.getName()).log(Level.SEVERE, null, ex);
        }

        out.println(buscador);
        out.println("holaa");
        out.println(cursosBuscados);
        

        request.setAttribute("cursosBuscados", cursosBuscados);
        String url = "/cursosBuscados.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);*/
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

        //HttpSession session = request.getSession();


        String buscador = request.getParameter("searcher");
        //String buscador = "Python";
        //ArrayList<Integer> cursosBuscados = new ArrayList<>();
        ArrayList<Curso> cursosBuscados = new ArrayList<Curso>();
        ArrayList<Double> valoraciones = new ArrayList<Double>();

        try {
            cursosBuscados = CursoDB.getCursosBuscados(buscador);
        } catch (SQLException ex) {
                Logger.getLogger(Buscador.class.getName()).log(Level.SEVERE, null, ex);
        }

        for(int i=0; i<cursosBuscados.size();i++){
            try {
                valoraciones.add(CursoDB.getValoracion(cursosBuscados.get(i).getId()));
            } catch (SQLException ex) {
                Logger.getLogger(cursosUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        //out.println(buscador);
        //out.println("holaa");
        //out.println(cursosBuscados);
        

        request.setAttribute("cursosBuscados", cursosBuscados);
        request.setAttribute("valoraciones",valoraciones);
        String url = "/cursosBuscados.jsp";
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
