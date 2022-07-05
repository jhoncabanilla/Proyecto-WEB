/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.model;

import java.time.LocalDate;
import ulearn.model.Suscripcion;
import ulearn.model.User;

/**
 *
 * @author angel
 */
public class ObtencionSuscripcion {
    
    private LocalDate fechaInicio;
    private String cobro;
    private boolean autorenovar;
    private Suscripcion suscripcion;
    private User user;
    
    public ObtencionSuscripcion(LocalDate fechaInicio, String cobro, boolean autorenovar, Suscripcion suscripcion){
        this.fechaInicio = fechaInicio;
        this.cobro = cobro;
        this.autorenovar = autorenovar;
        this.suscripcion = suscripcion;
    }  

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public String getCobro() {
        return cobro;
    }

    public boolean isAutorenovar() {
        return autorenovar;
    }

    public Suscripcion getSuscripcion() {
        return suscripcion;
    }

    public User getUser() {
        return user;
    }
}
