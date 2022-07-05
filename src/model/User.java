/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ulearn.model;

import java.io.Serializable;
import java.time.LocalDate;
import javax.servlet.http.Part;

/**
 *
 * @author migchav
 */
public class User implements Serializable {
    private int id;
    private String nombreUsuario;
    private String contraseña;
    private String correo;
    private String nombre;
    private String apellidos;
    private int telefono;
    private boolean instructor;
    private String direccion;
    private String ocupacion;
    private String pais;
    private String ciudad;
    private LocalDate fechaNacimiento;
    private String biografia;
    private Part foto;


    public User(){
        id=0;
        nombreUsuario="";
        contraseña="";
        correo="";
        nombre="";
        apellidos="";
        telefono=0;
        instructor=false;
        direccion="";
        ocupacion="";
        pais="";
        ciudad="";
        fechaNacimiento=null;
        biografia="";
        foto=null;
    }
    public User(int id,String nombreUsuario,String contraseña,String correo,String nombre,String apellidos,int telefono,boolean instructor,String dirección,String ocupacion,String pais,String ciudad,LocalDate fechaNacimiento,String biografia,Part foto){
        this.id=id;
        this.nombreUsuario=nombreUsuario;
        this.contraseña=contraseña;
        this.correo=correo;
        this.nombre=nombre;
        this.apellidos=apellidos;
        this.telefono=telefono;
        this.instructor=instructor;
        this.direccion="";
        this.ocupacion="";
        this.pais="";
        this.ciudad="";
        this.fechaNacimiento=null;
        this.biografia="";
        this.foto=null;
    }
    //Getters
    public int getId() {
        return id;
    }
    public String getNombreUsuario(){
        return nombreUsuario;
    }
    public String getContraseña(){
        return contraseña;
    }
    public String getCorreo(){
        return correo;
    }
    public String getNombre(){
        return nombre;
    }
    public String getApellidos(){
        return apellidos;
    }
    public int getTelefono(){
        return telefono;
    }
    public boolean getInstructor(){
        return instructor;
    }
    public String getDireccion(){
        return direccion;
    }
    public String getOcupacion(){
        return ocupacion;
    }
    public String getPais(){
        return pais;
    }
    public String getCiudad(){
        return ciudad;
    }
    public LocalDate getFechaNacimiento(){
        return fechaNacimiento;
    }
    public String getBiografia(){
        return biografia;
    }
    public Part getFoto(){
        return foto;
    }

    //Setters
    public void setNombreUsuario(String nombreUsuario){
        this.nombreUsuario = nombreUsuario;
    }
    public void setContraseña(String contraseña){
        this.contraseña = contraseña;
    }
    public void setCorreo(String correo){
        this.correo = correo;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setApellidos(String apellidos){
        this.apellidos = apellidos;
    }
    public void setTelefono(int telefono){
        this.telefono = telefono;
    }
    public void setInstructor(boolean instructor){
        this.instructor = instructor;
    }
    public void setDireccion(String direccion){
        this.direccion = direccion; 
    }
    public void setOcupacion(String ocupacion){
        this.ocupacion = ocupacion;
    }
    public void setPais(String pais){
        this.pais = pais;
    }
    public void setCiudad(String ciudad){
        this.ciudad = ciudad;
    }
    public void setFechaNacimiento(LocalDate fechaNacimiento){
        this.fechaNacimiento = fechaNacimiento;
    }
    public void setBiografia(String biografia){
        this.biografia = biografia;
    }
    public void setFoto(Part foto){
        this.foto=foto;
    }

    public void setID(int id) {
        this.id=id;
    }
}
