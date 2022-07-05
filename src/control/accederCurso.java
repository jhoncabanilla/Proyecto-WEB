package ulearn.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
import ulearn.datos.dao.SuscripcionesDB;
import ulearn.datos.dao.UserDB;
import ulearn.model.Curso;
import ulearn.model.Seccion;
import ulearn.model.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author angel
 */

@WebServlet(name = "accederCurso", urlPatterns = {"/accederCurso"})
public class accederCurso extends HttpServlet{
    
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
            out.println("<title>Servlet añadirSuscripcion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet añadirSuscripcion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
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
        
        String idCurso = request.getParameter("idCurso");
        ArrayList<Seccion> listaSecciones = null;
        Curso curso=null;
        User creador=null;
        double valoracion=0;
        Boolean[] suscripciones = new Boolean[4];
        Arrays.fill(suscripciones, Boolean.FALSE);
        ArrayList<Integer> autoresSuscritos=new ArrayList<Integer>();
        int seccion=1;
        boolean favorito=false;
        try {
            listaSecciones = SeccionDB.getListaSecciones(Integer.parseInt(idCurso));
            curso = CursoDB.getInfoCurso(Integer.parseInt(idCurso));
            creador=UserDB.getInfoCreador(Integer.parseInt(idCurso));
            valoracion=CursoDB.getValoracion(Integer.parseInt(idCurso));
            if(user!=null){
                suscripciones=SuscripcionesDB.getSuscripciones(user.getId());
                autoresSuscritos=SuscripcionesDB.getSuscripcionesDeAutor(user.getId());
                seccion=SeccionDB.getLastSeccion(Integer.parseInt(idCurso), user.getId());  
                favorito=CursoDB.esFavorito(user.getId(), Integer.parseInt(idCurso));
            }
        } catch (SQLException ex) {
            Logger.getLogger(paginaPrincipal.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("listSecciones",listaSecciones);
        request.setAttribute("infoCurso",curso);
        request.setAttribute("infoCreador",creador);
        request.setAttribute("valoracion",valoracion);
        request.setAttribute("suscripciones",suscripciones);
        request.setAttribute("autoresSuscritos",autoresSuscritos); 
        request.setAttribute("seccion",seccion); 
        request.setAttribute("favorito",favorito); 
        

        String url = "/Info_cursos_0.jsp?idCurso="+idCurso;
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

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
