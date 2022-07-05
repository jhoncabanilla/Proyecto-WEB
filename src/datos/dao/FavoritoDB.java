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
import ulearn.datos.ConnectionPool;

/**
 *
 * @author Jhon
 */
public class FavoritoDB {

    public static int insert(int idUsuario,int idCurso) throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps = null;

        String cursofavorito = "INSERT INTO CURSOFAVORITO ( IDUSUARIO, IDCURSO) VALUES (?, ?)";
        
        try {
            ps = connection.prepareStatement(cursofavorito);
            ps.setInt(1, idUsuario);
            ps.setInt(2, idCurso);

            int res = ps.executeUpdate();
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

    public static ArrayList<Integer> getCursosFavoritos() throws SQLException {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        ArrayList<Integer> cursosFavoritos = new ArrayList<Integer>();
        PreparedStatement ps = null;
        ResultSet rs = null;
 
        String favoritos = "SELECT C.IDUSUARIO, C.IDCURSO FROM CURSOFAVORITO C";
    
        try {
            ps = connection.prepareStatement(favoritos);
            rs=ps.executeQuery();
            
            while(rs.next()){
                cursosFavoritos.add(rs.getInt("ID")); 
            }
            
            ps.close();
            pool.freeConnection(connection);
            return cursosFavoritos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally{
            ps.close();
            pool.freeConnection(connection);
        }

    }
    
}
