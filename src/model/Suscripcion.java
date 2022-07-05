/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.model;
import java.io.Serializable;

/**
 *Clase que implementa una suscripcion.
 * @author angel
 */
public class Suscripcion implements Serializable{
    private int id;
    private String tipo;
    private float precio;
    private int idautor;
    
    /**
     * Constructor sin parametros.
     */
    private Suscripcion(){
        id=0;
        tipo="";
        precio=0;
        idautor=0;
    }
    
    /**
     * Constructor con parametros.
     * @param id
     * @param tipo
     * @param precio
     * @param idautor 
     */
    public Suscripcion(int id, String tipo, float precio, int idautor){
        this.id=id;
        this.tipo=tipo;
        this.precio=precio;
        this.idautor=idautor;
    }
    
    public Suscripcion(int id, String tipo){
        this.id=id;
        this.tipo=tipo;
        this.precio=-1;
        this.idautor=-1;
    }
    
    //Getters

    public int getId() {
        return id;
    }

    public String getTipo() {
        return tipo;
    }

    public float getPrecio() {
        return precio;
    }

    public int getIdautor() {
        return idautor;
    }
    
    //Setters

    public void setId(int id) {
        this.id = id;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public void setIdautor(int idautor) {
        this.idautor = idautor;
    }
    
}

