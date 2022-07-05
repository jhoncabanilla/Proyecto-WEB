/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.datos.dao;
import java.io.InputStream;
import java.io.OutputStream;
import ulearn.datos.ConnectionPool;
import ulearn.model.User;
import java.sql.*;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import ulearn.model.Curso;
import ulearn.model.DesarrolloCurso;
import ulearn.model.ObtencionSuscripcion;
import ulearn.model.Suscripcion;

/**
 *
 * @author migchav
 */
public class UserDB {
    public static int insert(User usuario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();

        PreparedStatement ps = null;

        String query = "INSERT INTO USUARIO ( NOMBREUSUARIO, CONTRASEÑA, CORREO, NOMBRE, APELLIDO, TELEFONO,INSTRUCTOR,DIRECCION,OCUPACION,PAIS,CIUDAD,FECHANACIMIENTO,BIOGRAFIA) VALUES ( ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usuario.getNombreUsuario());         
            ps.setString(2, usuario.getContraseña());
            ps.setString(3, usuario.getCorreo());
            ps.setString(4, usuario.getNombre());
            ps.setString(5, usuario.getApellidos());
            ps.setInt(6, usuario.getTelefono());
            ps.setBoolean(7, usuario.getInstructor());
            ps.setString(8, usuario.getDireccion());
            ps.setString(9, usuario.getOcupacion());
            ps.setString(10, usuario.getPais());
            ps.setString(11, usuario.getCiudad());
            ps.setObject(12, usuario.getFechaNacimiento());
            ps.setString(13, usuario.getBiografia());
            //ps.setPart(15, null);

            int res = 0;
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                res = rs.getInt(1);
            }
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return 0;
            }
        
    }
    public static boolean userNameExists(String userName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT NOMBREUSUARIO FROM Usuario "
        + "WHERE NOMBREUSUARIO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return false;
            }
        }
    
    
    public static boolean emailExists(String correo) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT CORREO FROM Usuario "
        + "WHERE CORREO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            boolean res = rs.next();
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return false;
            }
        }

    public static int comprobarUsuario(String correo, String userName, String password) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT NOMBREUSUARIO,CONTRASEÑA,ID FROM Usuario "
        + "WHERE CORREO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, correo);
            rs = ps.executeQuery();
            int res=-1;
            if(rs.next()){
                if(userName.equals(rs.getString("NOMBREUSUARIO")) && password.equals(rs.getString("CONTRASEÑA")))
                    res=rs.getInt("ID");
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
            } catch (SQLException e) {
            e.printStackTrace();
            return -1;
            }
    }

    public static int getIdAutor(String usuarioAutor) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT ID FROM Usuario "
        + "WHERE NOMBREUSUARIO = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, usuarioAutor);
            rs = ps.executeQuery();
            
            int res=-1;
            if (rs.next()) {
                res = rs.getInt("ID");
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    
        public static boolean esCreador(String usuarioAutor) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT ID FROM Usuario "
        + "WHERE NOMBREUSUARIO = ? "+"AND INSTRUCTOR=TRUE";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, usuarioAutor);
            rs = ps.executeQuery();
            
            boolean res=rs.next();
           
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return res;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public static User getInfoCreador(int idCurso){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user=new User();
        String query = "SELECT U.NOMBREUSUARIO, U.NOMBRE,U.APELLIDO,U.ID FROM CURSO C, USUARIO U WHERE C.ID = ? AND U.ID=C.CREADOR;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idCurso);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellidos(rs.getString("APELLIDO"));
                user.setID(rs.getInt("ID"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static User getInfoUsuario(int idUsuario){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user=new User();
        String query = "SELECT * FROM Usuario U WHERE U.ID = ?;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                user.setNombreUsuario(rs.getString("NOMBREUSUARIO"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setContraseña(rs.getString("CONTRASEÑA"));
                user.setApellidos(rs.getString("APELLIDO"));
                user.setID(rs.getInt("ID"));
                user.setCorreo(rs.getString("CORREO"));
                user.setTelefono(rs.getInt("TELEFONO"));
                user.setDireccion(rs.getString("DIRECCION"));
                user.setOcupacion(rs.getString("OCUPACION"));
                user.setPais(rs.getString("PAIS"));
                user.setCiudad(rs.getString("CIUDAD"));
                Date fecha = rs.getDate("FECHANACIMIENTO");
                LocalDate localDate=null;
                if(fecha != null)
                    localDate = new java.sql.Date(fecha.getTime()).toLocalDate();
                user.setFechaNacimiento(localDate);
                user.setBiografia(rs.getString("BIOGRAFIA"));
                //user.setFoto((Part) rs.getBlob("FOTO"));
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<ObtencionSuscripcion> getSuscripcionesUsuario(int idUsuario){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<ObtencionSuscripcion> obtenciones = new ArrayList<ObtencionSuscripcion>();
        String query = "SELECT * FROM OBTENCIONSUSCRIPCION OS, SUSCRIPCION S WHERE OS.IDUSUARIO = ? and S.ID = OS.IDSUSCRIPCION;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while(rs.next()) {
                Date fecha = rs.getDate("FECHAINICIO");
                LocalDate fechaInicio=new java.sql.Date(fecha.getTime()).toLocalDate();
                String tipo = rs.getString("TIPO");
                int id = rs.getInt("IDSUSCRIPCION");
                String cobro = rs.getString("COBRO");
                boolean autorrenovar = rs.getBoolean("AUTORENOVAR");
                int idAutor = rs.getInt("IDAUTOR");
                //boolean activa = rs.getBoolean("ACTIVA");
                Suscripcion suscripcion = new Suscripcion(id, tipo);
                suscripcion.setIdautor(idAutor);
                ObtencionSuscripcion obtencionSuscripcion = new ObtencionSuscripcion(fechaInicio, cobro, autorrenovar, suscripcion);
                obtenciones.add(obtencionSuscripcion);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return obtenciones;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<DesarrolloCurso> getCursosUsuario(int idUsuario){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<DesarrolloCurso> cursos = new ArrayList<DesarrolloCurso>();
        String query = "SELECT * FROM DESARROLLOCURSO DC, CURSO C, USUARIO U WHERE DC.IDUSUARIO=? and DC.IDCURSO=C.ID and U.ID=C.CREADOR;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while(rs.next()) {
                int id = rs.getInt("IDCURSO");
                String nombre = rs.getString("NOMBRECURSO");
                String descripcion = rs.getString("DESCRIPCION");
                float precio = rs.getFloat("PRECIO");
                float duracion = rs.getFloat("DURACION");
                String categoria = rs.getString("CATEGORIA");            
                String nombreAutor = rs.getString("NOMBREUSUARIO");
                int idAutor = rs.getInt("CREADOR");
                Date fecha = rs.getDate("FECHAINICIO");
                LocalDate fechaInicio=new java.sql.Date(fecha.getTime()).toLocalDate();
                User autor = new User();
                autor.setNombreUsuario(nombreAutor);
                autor.setID(idAutor);
                Curso curso = new Curso(id,nombre,descripcion,precio,null,duracion,categoria,autor);
                DesarrolloCurso desarrollo = new DesarrolloCurso();
                desarrollo.setFechaInicio(fechaInicio);
                desarrollo.setCurso(curso);
                cursos.add(desarrollo);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<Curso> getFavoritosUsuario(int idUsuario){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Curso> cursos = new ArrayList<Curso>();
        String query = "SELECT * FROM CURSOFAVORITO CF, CURSO C, USUARIO U WHERE CF.IDUSUARIO=? and CF.IDCURSO=C.ID and U.ID=C.CREADOR;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while(rs.next()) {
                int id = rs.getInt("IDCURSO");
                String nombre = rs.getString("NOMBRECURSO");
                String descripcion = rs.getString("DESCRIPCION");
                float precio = rs.getFloat("PRECIO");
                float duracion = rs.getFloat("DURACION");
                String categoria = rs.getString("CATEGORIA");            
                String nombreAutor = rs.getString("NOMBREUSUARIO");
                int idAutor = rs.getInt("CREADOR");
                User autor = new User();
                autor.setNombreUsuario(nombreAutor);
                autor.setID(idAutor);
                Curso curso = new Curso(id,nombre,descripcion,precio,null,duracion,categoria,autor);
                cursos.add(curso);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<Curso> getCursosCreados(int idUsuario){
       ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Curso> cursos = new ArrayList<Curso>();
        String query = "SELECT * FROM CURSO C, USUARIO U WHERE C.CREADOR = ? AND C.CREADOR = U.ID;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while(rs.next()) {
                int id = rs.getInt("ID");
                String nombre = rs.getString("NOMBRECURSO");
                String descripcion = rs.getString("DESCRIPCION");
                float precio = rs.getFloat("PRECIO");
                float duracion = rs.getFloat("DURACION");
                String categoria = rs.getString("CATEGORIA");            
                String nombreAutor = rs.getString("NOMBREUSUARIO");
                int idAutor = rs.getInt("CREADOR");
                User autor = new User();
                autor.setNombreUsuario(nombreAutor);
                autor.setID(idAutor);
                Curso curso = new Curso(id,nombre,descripcion,precio,null,duracion,categoria,autor);
                cursos.add(curso);
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return cursos;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static void getImagen(int id, OutputStream respuesta){
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("SELECT FOTO FROM usuario WHERE id=? ");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                Blob blob = result.getBlob("FOTO");
                if (!result.wasNull() && blob.length() > 1) {
                    InputStream imagen = blob.getBinaryStream();
                    byte[] buffer = new byte[1000];
                    int len = imagen.read(buffer);
                    while (len != -1) {
                        respuesta.write(buffer, 0, len);
                        len = imagen.read(buffer);
                    }
                    imagen.close();
                } 
            }
        pool.freeConnection(connection);
        } catch (Exception e) {
        e.printStackTrace();
        } 
    }
    
    public static void updateInfoUsuario(User usuario){
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("UPDATE USUARIO U SET CORREO = ?, NOMBRE = ?, APELLIDO = ?, TELEFONO = ?, DIRECCION = ?, OCUPACION = ?, PAIS = ?, CIUDAD = ?, FECHANACIMIENTO = ?, BIOGRAFIA = ? WHERE U.ID=?");
            statement.setString(1,usuario.getCorreo());
            statement.setString(2, usuario.getNombre());
            statement.setString(3, usuario.getApellidos());
            statement.setInt(4, usuario.getTelefono());
            statement.setString(5, usuario.getDireccion());
            statement.setString(6, usuario.getOcupacion());
            statement.setString(7, usuario.getPais());
            statement.setString(8, usuario.getCiudad());
            LocalDate fecha = usuario.getFechaNacimiento();
            Date fechaNacimiento = null;
            if(fecha != null){
                fechaNacimiento= Date.valueOf(fecha);
            }
            statement.setDate(9, fechaNacimiento);
            statement.setString(10, usuario.getBiografia());
            statement.setInt(11, usuario.getId());
            statement.executeUpdate();
        pool.freeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    public static void updateCreador(int idUsuario){
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("UPDATE USUARIO U SET INSTRUCTOR =TRUE WHERE U.ID=?");
            statement.setInt(1, idUsuario);
            statement.executeUpdate();
            pool.freeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    public static void cambiarContrasena(int idUsuario, String nuevaContrasena){
        try {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null;
            statement = connection.prepareStatement("UPDATE USUARIO U SET CONTRASEÑA = ? WHERE U.ID=?");
            statement.setString(1,nuevaContrasena);
            statement.setInt(2, idUsuario);
            statement.executeUpdate();
        pool.freeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        } 
    }
    
    public static String getNombre(int idUsuario){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String nombre = "";
        String query = "SELECT NOMBREUSUARIO FROM USUARIO U WHERE U.ID = ?;  ";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();

            while(rs.next()) {
                nombre = rs.getString("NOMBREUSUARIO");
            }
            rs.close();
            ps.close();
            pool.freeConnection(connection);
            return nombre;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
