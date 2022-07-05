/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ulearn.model;

import java.time.LocalDate;

/**
 *
 * @author angel
 */
public class DesarrolloCurso {
    private LocalDate fechaInicio;
    private Curso curso;
    private User user;
    private float valoracion;
    
    public DesarrolloCurso(){
        fechaInicio = null;
        curso = null;
        user = null;
        valoracion = 0;
    }
    
    public DesarrolloCurso(LocalDate fechaInicio, Curso curso, User user){
        this.fechaInicio = fechaInicio;
        this.curso = curso;
        this.user = user;
        this.valoracion = 0;
    }

    public LocalDate getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public float getValoracion() {
        return valoracion;
    }

    public void setValoracion(float valoracion) {
        this.valoracion = valoracion;
    }
}
