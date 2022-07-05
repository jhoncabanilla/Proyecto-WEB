/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;
import ulearn.datos.ConnectionPool;
import ulearn.model.Seccion;

/**
 *
 * @author migchav
 */
public class SeccionDB {
    public static int insert(int idUsuario,int idSeccion) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;

        String desarrolloCurso = "INSERT INTO DESARROLLOSECCION ( IDSECCION, IDUSUARIO,COMPLETADA) VALUES ( ?,?, ?)";
       
        
        try {
            ps = connection.prepareStatement(desarrolloCurso);
            ps.setInt(1,idSeccion );          
            ps.setInt(2, idUsuario);
            ps.setBoolean(3, true);

            int res=ps.executeUpdate();
            ps.close();
            
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    public static boolean existe(int idUsuario,int idSeccion) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps=null;
        ResultSet rs = null;

        String desarrolloCurso = "SELECT IDSECCION FROM desarrolloseccion WHERE IDSECCION=? AND IDUSUARIO=?;";
       
        
        try {
            ps = connection.prepareStatement(desarrolloCurso);
            ps.setInt(1,idSeccion );          
            ps.setInt(2, idUsuario);

            rs = ps.executeQuery();
            boolean res = rs.next();
            ps.close();
            
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Seccion> getListaSecciones(int idCurso) throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Seccion> secciones = new ArrayList<Seccion>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String listSecciones = "SELECT ID, NOMBRE, DESCRIPCION, VIDEO, DURACION FROM SECCION WHERE IDCURSO = ?  ORDER BY ID; ";
       
        
        try {
            ps = connection.prepareStatement(listSecciones);
            ps.setInt(1,idCurso );         
            rs=ps.executeQuery();
            while(rs.next()){
                Seccion seccion=new Seccion(rs.getInt("ID"),rs.getString("NOMBRE"),rs.getString("DESCRIPCION"),rs.getString("VIDEO"),rs.getFloat("DURACION"),idCurso);
                secciones.add(seccion); 
            }
           
            ps.close();
            pool.freeConnection(connection);
            return secciones;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
    /*
    Obtener ultima seccion del curso realizada por un usuario
    returno: 0- no esta suscrito a ese curso // x- siendo x el nº de la ultima seccion consultada
    */
     public static int getLastSeccion(int idCurso,int idUser) throws SQLException{
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Integer> secciones = new ArrayList<Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String listSecciones = "SELECT DS.IDSECCION FROM SECCION S,DESARROLLOSECCION DS WHERE S.IDCURSO = ? AND DS.IDSECCION=S.ID AND DS.IDUSUARIO=?  ";
       
        int seccion=0;
        
        try {
            ps = connection.prepareStatement(listSecciones);
            ps.setInt(1,idCurso );  
            ps.setInt(2,idUser ); 
            rs=ps.executeQuery();
            while(rs.next()){
                secciones.add(rs.getInt("IDSECCION")); 
            }
           
            ps.close();
            pool.freeConnection(connection);
            if(!secciones.isEmpty()) seccion=Collections.max(secciones);
            return seccion;
        } catch (SQLException e) {
            e.printStackTrace();
            return 1;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }
    }
}
