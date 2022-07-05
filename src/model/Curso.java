/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.model;

import java.io.Serializable;
import javax.servlet.http.Part;

/**
 * Clase que implementa un curso.
 * @author angel
 */
public class Curso implements Serializable{
    private int id;
    private String nombre;
    private String descripcion;
    private float precio;
    private Part imagen;
    private float duracion;
    private String categoria;
    private User creador;
    
    /**
     * Constructor sin parametros.
     */
    public Curso(){
    id=0;
    nombre="";
    descripcion="";
    precio=0;
    imagen=null;
    duracion=0;
    categoria="";
    creador=null;
    }
    
    /**
     * Constructor con parametros.
     * @param id
     * @param nombre
     * @param descripcion
     * @param precio
     * @param imagen
     * @param duracion
     * @param cateogria
     * @param creador 
     */
    public Curso(int id, String nombre, String descripcion, float precio, Part imagen, float duracion, String categoria, User creador){
    this.id=id;
    this.nombre=nombre;
    this.descripcion=descripcion;
    this.precio=precio;
    this.imagen=imagen;
    this.duracion=duracion;
    this.categoria=categoria;
    this.creador=creador;
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

    public float getPrecio() {
        return precio;
    }

    public Part getImagen() {
        return imagen;
    }

    public float getDuracion() {
        return duracion;
    }

    public String getCategoria() {
        return categoria;
    }

    public User getCreador() {
        return creador;
    }
    
    public String getDuracionConFormato(){
        int horas = (int) this.duracion;
        double tmp = this.duracion-(double)horas;
        int minutos = (int) (tmp*60);
        String duracion;
        if(minutos != 0)
            duracion = horas + "h " + minutos + "m";
        else
            duracion = horas + "h";
        return duracion;
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

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setImagen(Part imagen) {
        this.imagen = imagen;
    }

    public void setDuracion(float duracion) {
        this.duracion = duracion;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public void setCreador(User creador) {
        this.creador = creador;
    }
    
    
}




