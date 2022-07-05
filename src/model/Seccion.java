/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.model;
import java.io.Serializable;
/**
 * Clase que implementa una seccion.
 * @author angel
 */
public class Seccion implements Serializable{
    private int id;
    private String nombre;
    private String descripcion;
    private String video;
    private float duracion;
    private int idcurso;
    
    /**
     * Constructor sin parametros.
     */
    public Seccion(){
        id=0;
        nombre="";
        descripcion="";
        video="";
        duracion=0;
        idcurso=0;
    }
    
    /**
     * Constructor con parametros.
     * @param id
     * @param nombre
     * @param descripcion
     * @param video
     * @param duracion
     * @param idcurso 
     */
    public Seccion(int id, String nombre, String descripcion, String video, float duracion, int idcurso){
        this.id=id;
        this.nombre=nombre;
        this.descripcion=descripcion;
        this.video=video;
        this.duracion=duracion;
        this.idcurso=idcurso;
    }
    
    //Getters

    public int getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getVideo() {
        return video;
    }

    public float getDuracion() {
        return duracion;
    }

    public int getIdcurso() {
        return idcurso;
    }
    
    //Setters

    public void setId(int id) {
        this.id = id;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public void setDuracion(float duracion) {
        this.duracion = duracion;
    }

    public void setIdcurso(int idcurso) {
        this.idcurso = idcurso;
    }
    
}
