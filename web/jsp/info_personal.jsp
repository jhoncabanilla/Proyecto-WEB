<%@page import="ulearn.model.DesarrolloCurso"%>
<%@page import="ulearn.model.ObtencionSuscripcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ulearn.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%
    //HttpSession session2 = request.getSession();
    User usuario= (User) request.getAttribute("user");
    ArrayList<ObtencionSuscripcion> obtenciones = (ArrayList<ObtencionSuscripcion>)request.getAttribute("suscripciones");
    ArrayList<DesarrolloCurso> cursos = (ArrayList<DesarrolloCurso>)request.getAttribute("cursos");
    ArrayList<String> nombres = (ArrayList<String>)request.getAttribute("nombresAutores");
%>
    
<html lang="es">

<head>
    <title>ULearn</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="main.81e26b4c.css">
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="style.css">

    <!-- Cursos completos-->
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
</head>

<body>
    <div id="root">
        <div class="App">
            <%@include file="./header_logged.jsp" %>
            <section class="py-5 my-5">
                <div class="container">
                    <h1 class="mb-5">Ajustes Perfil</h1>
                    <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                        <div class="profile-tab-nav border-right">
                            <div class="p-4">
                                <div class="img-circle text-center mb-3">
                                    <img src="imagenUsuario?idUsuario=<%=usuario.getId()%>" alt="Image" class="shadow" onerror="this.src='./Imagenes/avatar_ini.png'">
                                </div>
                                <h4 class="text-center">@<%=usuario.getNombreUsuario()%></h4>
                            </div>
                            
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
                                aria-orientation="vertical">

                                <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account"
                                    role="tab" aria-controls="account" aria-selected="true">
                                    <i class="fa fa-user text-center mr-1"></i>
                                    Edición Perfil
                                </a>
                                
                                <a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab"
                                    aria-controls="password" aria-selected="false">
                                    <i class="fa fa-key text-center mr-1"></i>
                                    Seguridad
                                </a>

                                <a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab"
                                    aria-controls="security" aria-selected="false">
                                    <i class="fa-solid fa-money-check-dollar"></i>
                                    Suscripciones
                                </a>

                                <a class="nav-link" id="application-tab" data-toggle="pill" href="#application"
                                    role="tab" aria-controls="application" aria-selected="false">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    Tus Compras
                                </a>
                            </div>
                        </div>

                        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                            <div class="tab-pane fade show active" id="account" role="tabpanel"
                                aria-labelledby="account-tab">
                                <h3 class="mb-4">Información Personal</h3>
                                <form class="" id="form1"><%-- NEW PARA FORM--%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nombre</label>
                                            <input type="text" class="form-control" value="<%=usuario.getNombre()%>" name="nombre" id="nombre">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Apellidos</label>
                                            <input type="text" class="form-control" value="<%=usuario.getApellidos()%>" name="apellidos" id="apellidos">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" id ="email1"class="form-control" value="<%=usuario.getCorreo()%>" name="email" id="email">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Teléfono</label>
                                            <input type="text" class="form-control" value="<%=usuario.getTelefono()%>" name="telefono" id="telefono">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Dirección</label>
                                            <input type="text" class="form-control" value="<%=usuario.getDireccion()%>" name="direccion" id="direccion">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Ocupación</label>
                                            <input type="text" class="form-control" value="<%=usuario.getOcupacion()%>" name="ocupacion" id="ocupacion">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>País</label>
                                            <input type="text" class="form-control" value="<%=usuario.getPais()%>" name="pais" id="pais">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Ciudad</label>
                                            <input type="text" class="form-control" value="<%=usuario.getCiudad()%>" name="ciudad" id="ciudad">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Fecha de Nacimiento</label>
                                            <input type="date" class="form-control" name="dateofbirth" id="dateofbirth" value="<%=usuario.getFechaNacimiento()%>" >
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Bio</label>
                                            <textarea class="form-control"
                                                rows="4" name="biografia" id="biografia"><%=usuario.getBiografia()%></textarea>
                                        </div>
                                    </div>
                                </div>
                                
                                        
                                <div>
                                    <button class="btn btn-primary" onclick="comprobarEmail()">Actualizar</button>
                                    <button class="btn btn-light">Cancelar</button>
                                </div>
                                <div class="mt-3"><h4 class="" id="erro1"style="background-color: #98FB98; color:#006400;font-size: 20px; display:none">Suscrito con éxito.</h4></div>

                                </form>
                            </div>
                            <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                                <h3 class="mb-4">Ajustes Seguridad</h3>
                                <form class="" id="formContra" >
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Antigua Contraseña</label>
                                            <input type="text" class="form-control" style="pointer-events: none;" value="<%=usuario.getContraseña()%>" name="antiguaContra">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nueva Contraseña</label>
                                            <input required="" type="password" class="form-control" id ="nuevaContra" name="nuevaContra">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Confirma la nueva contraseña</label>
                                            <input required="" type="password" class="form-control" id="confirmarContra" name="confirmarContra">
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3 mb-3"><h4 class="" id="erroCont" style="background-color: #F08080; color:#7d061e;font-size: 20px; display:none">Contraseñas no coinciden.</h4></div>

                                <div>
                                    <button class="btn btn-primary" type="submit" onclick="cambiarContrasena()">Actualizar</button>
                                    <button class="btn btn-light">Cancelar</button>
                                </div>
                                </form>
                            </div>


                            <div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">


                                <div class="col-lg-0 col-md-0 col-sm-0">
                                    <div class="border-0 card">
                                        <div class="d-lg-flex justify-content-between align-items-center card-header">
                                            <div class="mb-3 mb-lg-0">
                                                <h3 class="mb-0">Mis Suscripciones</h3>
                                                <p class="mb-0">
                                                    Aquí tienes la lista de productos a los que estas suscrito.
                                                </p>
                                            </div>
                                            <div>
                                                <a class="btn btn-success btn-sm" href="accederSuscripciones">Añadir plan</a>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <c:if test="<%=obtenciones.isEmpty()%>">
                                                <h6>No tiene ninguna suscripción.</h6>
                                            </c:if>

                                            <c:if test="<%=!obtenciones.isEmpty()%>">
                                            <%
                                            for(int i=0; i<obtenciones.size(); i++){
                                            %>
                                            <div class="border-bottom pt-0 pb-5">
                                                <div class="mb-4 row">
                                                    <div class="mb-2 mb-lg-0 col-lg-6 col-md-8 col-sm-7">
                                                        <span class="d-block"><span class="h4"><%=obtenciones.get(i).getSuscripcion().getTipo()%></span>
                                                            <span class="ms-2 badge bg-success">Activa</span></span>
                                                        <c:if test="obtenciones.get(i).getSuscripcion().getIdautor()!= null">
                                                                <p class="mb-0 fs-6"><%=nombres.get(i)%></p>
                                                        </c:if>
                                                    </div>
                                                    <%--<div class="mb-2 mb-lg-0 col-lg-3 col-md-4 col-sm-5">
                                                        <span>Autorenovación</span>
                                                        <form class="">
                                                            <div class="form-switch">
                                                                <input name="radios" type="checkbox"
                                                                    class="form-check-input" checked="" />
                                                            </div>
                                                        </form>
                                                    </div>--%>
                                                    <div
                                                        class="d-lg-flex align-items-start justify-content-end col-lg-3 col-md-12 col-sm-12">
                                                        <a class="btn btn-outline-primary btn-sm"
                                                            href="eliminarSuscripcion?id=<%=obtenciones.get(i).getSuscripcion().getId()%>">Deshabilitar plan</a>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="mb-2 mb-lg-0 col-lg-3 col-md-3 col-sm-6">
                                                        <span class="fs-6">Inicio Plan</span>
                                                        <h6 class="mb-0"><%=obtenciones.get(i).getFechaInicio().toString()%></h6>
                                                    </div>
                                                    <div class="mb-2 mb-lg-0 col-lg-3 col-md-3 col-sm-6">
                                                        <span class="fs-6">Precio</span>
                                                        <h6 class="mb-0"><%=obtenciones.get(i).getCobro()%></h6>
                                                    </div>
                                                    <div class="mb-2 mb-lg-0 col-lg-3 col-md-3 col-sm-6">
                                                        <span class="fs-6">Acceso</span>
                                                        <%if(obtenciones.get(i).getSuscripcion().getTipo().equals("GRATIS")){%>
                                                                <h6 class="mb-0">Acceso a todos los cursos gratuitos</h6>
                                                        <%}%>
                                                        <%if(obtenciones.get(i).getSuscripcion().getTipo().equals("TOTAL")){%>
                                                                <h6 class="mb-0">Acceso a todos los cursos</h6>
                                                        <%}%>
                                                        <%if(obtenciones.get(i).getSuscripcion().getTipo().equals("ESTUDIANTE")){%>
                                                                <h6 class="mb-0">Acceso a todos los cursos</h6>
                                                        <%}%>
                                                        <%if(obtenciones.get(i).getSuscripcion().getTipo().equals("AUTOR")){%>
                                                                <h6 class="mb-0">Acceso a todos los cursos del autor</h6>
                                                        <%}%>
                                                        
                                                    </div>
                                                    <%--<div class="mb-2 mb-lg-0 col-lg-3 col-md-3 col-sm-6">
                                                        <span class="fs-6">Próximo Cargo</span>
                                                        <h6 class="mb-0">Nov 1, 2022</h6>
                                                    </div>--%>
                                                </div>
                                            </div>
                                            <%}%>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="application" role="tabpanel"
                                aria-labelledby="application-tab">
                                <div id="test-list">

                                    <div class="row">
                                        <c:if test="<%=cursos.isEmpty()%>">
                                                <h6>No tiene ningún curso comprado.</h6>
                                            </c:if>

                                            
                                        <ul class="list">
                                            <%
                                                for(int i=0; i<cursos.size();i=i+2){
                                            %>
                                            <li>
                                                <div class="col-sm-6 col-md-6 col-lg-6">
                                                    <div>
                                                        <div class="justify-content-between mb-0">
                                                            <div class="blog-card">
                                                                <a href="comenzarCurso?idCurso=<%=cursos.get(i).getCurso().getId()%>"><img src="imagenCurso?id=<%=cursos.get(i).getCurso().getId()%>" alt=""
                                                                    class="blog-thumbnail"></a>
                                                                <div class="blog-container">
                                                                    <a 
                                                                        class="blog-category text-uppercase dark-link"><%=cursos.get(i).getCurso().getCategoria()%></a>
                                                                    <h4 class="mt-2 font-weight-bold"><a href="comenzarCurso?idCurso=<%=cursos.get(i).getCurso().getId()%>"
                                                                            class="dark-link"><%=cursos.get(i).getCurso().getNombre()%></a></h4>
                                                                    <p class="blog-desc"><%=cursos.get(i).getCurso().getDescripcion()%></p>
                                                                    <div class="blog-footer">
                                                                        <div><img
                                                                                src="imagenUsuario?idUsuario=<%=cursos.get(i).getCurso().getCreador().getId()%>"
                                                                                alt="" class="blog-author" onerror="this.src='./Imagenes/avatar_ini.png'"> <a
                                                                                ><%=cursos.get(i).getCurso().getCreador().getNombreUsuario()%></a> </div>
                                                                        <small><%=cursos.get(i).getFechaInicio().toString()%></small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                    if(i+1<cursos.size()){
                                                %>
                                                <div class="col-sm-6 col-md-6 col-lg-6">
                                                    <div>
                                                        <div class="justify-content-between mb-0">
                                                            <div class="blog-card">
                                                                <a href="comenzarCurso?idCurso=<%=cursos.get(i+1).getCurso().getId()%>"><img src="imagenCurso?id=<%=cursos.get(i+1).getCurso().getId()%>" alt=""
                                                                    class="blog-thumbnail"></a>
                                                                <div class="blog-container">
                                                                    <a href="#!"
                                                                        class="blog-category text-uppercase dark-link"><%=cursos.get(i+1).getCurso().getCategoria()%></a>
                                                                    <h4 class="mt-2 font-weight-bold"><a href=""comenzarCurso?idCurso=<%=cursos.get(i+1).getCurso().getId()%>""
                                                                            class="dark-link"><%=cursos.get(i+1).getCurso().getNombre()%></a></h4>
                                                                    <p class="blog-desc"><%=cursos.get(i+1).getCurso().getDescripcion()%></p>
                                                                    <div class="blog-footer">
                                                                        <div><img
                                                                                src="imagenUsuario?idUsuario=<%=cursos.get(i+1).getCurso().getCreador().getId()%>"
                                                                                alt="" class="blog-author" onerror="this.src='./Imagenes/avatar_ini.png'"> <a
                                                                                href="#!"><%=cursos.get(i+1).getCurso().getCreador().getNombreUsuario()%>
                                                                                </a> </div>
                                                                        <small><%=cursos.get(i+1).getFechaInicio().toString()%></small>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </li>
                                            <%}%>
                                    </div>
                                 
                                    </ul>
                                </div>
                                <ul class="justify-content-center mb-0 pagination">
                                </ul>


                            </div>
                        </div>
                    </div>
            </section>
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

            <!-- PAGINACION -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.5.0/list.min.js"></script>

            <script
                src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

            <script type="text/javascript">
                $( document ).ready(function() {
                    correoUsuario=document.getElementById("email1").value;
                    var form = $('#form1');
                    console.log(datosPrev);
                    datosPrev=form.serialize();
                    
                });
                var monkeyList = new List('application', {
                    valueNames: ['col-sm-6 col-md-6 col-lg-6'],
                    page: 3,
                    pagination: true,

                })
                var correoUsuario;
                var datosPrev;
                
                
function cambiarContrasena(){
     var form = $('#formContra');
     var nuevaContra=document.getElementById("nuevaContra");
     var confirmarContra=document.getElementById("confirmarContra");
     if(nuevaContra.value==confirmarContra.value && nuevaContra.value!="" ){
         $.ajax({
            type: 'POST',
            url: 'http://localhost:8080/practica_ssw2/cambiarContrasena',
            async: false,
            data: form.serialize(),
                success: function( datos ) {
        return datos;

    }
        })
        return false;
     }
     else if(nuevaContra.value=="" ||confirmarContra.value==""  ){
         document.getElementById('erroCont').style.display="block";
         document.getElementById('erroCont').innerHTML="La nueva contraseña no puede ser vacía."; 
         event.preventDefault();
         //alert("jsdf");
         return false;
     }
     else{
         document.getElementById('erroCont').style.display="block";
         document.getElementById('erroCont').innerHTML="Contraseñas no coinciden."; 
         event.preventDefault();
         //alert("jsdf");
         return false;
     }
    
    
}        
function comprobarEmail(){
                         var form = $('#form1');
                         //var datosPrev=form.serialize();
                         var resultado=new XMLHttpRequest();
                         var email = $("#email1").val();
                         var telefono=$("#telefono").val();
                         
                         var formUser=document.getElementById('form1');
                           
    // Ajax POST request.
if(!isNaN(telefono) &&  formUser.checkValidity()){
resultado= $.ajax({
    type: 'POST',
    url: 'http://localhost:8080/practica_ssw2/almacenarInfoPersonal',
    data: form.serialize(),
    dataType: "text",
    async: false,
    success: function( datos ) {
        /*console.log(username);
        console.log(password);
        console.log(email);
        console.log(datos);
        resultado=datos;
        console.log(resultado);
        console.log(resultado=="Revisa tus creedenciales");*/
        //$( "#username1" ).html(datos);
       // console.log(form.serialize());
       // alert(form.serialize());
       /*console.log(resultado);
        console.log(resultado.responseText);
        console.log(resultado.responseText=="Este correo ya está registrado\r\n");
        alert("vcxjkd")*/
        return datos;

    }
});
/*event.preventDefault();
console.log(resultado);
console.log(resultado.responseText);
var prueba=resultado.responseText;
console.log(resultado.responseText=='Revisa tus creedenciales');
console.log(typeof resultado.responseText);
alert(prueba=="Revisa tus creedenciales\r\n");
console.log(resultado);
console.log(resultado.responseText);
console.log(resultado.responseText=="Este correo ya está registrado\r\n");
alert("dsfdsdsf");
return false;
//"background-color: #F08080; color:#7d061e;resultado.responseText=="Este correo ya está registrado\r\n"
return false;*/

if(resultado.responseText=="Este correo ya está registrado\r\n") {document.getElementById('erro1').style.display="block";document.getElementById('erro1').style.color="#7d061e";document.getElementById('erro1').style.background="#F08080";document.getElementById('erro1').innerHTML="Este correo ya está registrado."; event.preventDefault();return false;}
else if(datosPrev!=form.serialize()) {datosPrev=form.serialize();document.getElementById('erro1').style.display="block";document.getElementById('erro1').style.color="#006400";document.getElementById('erro1').style.background="#98FB98";document.getElementById('erro1').innerHTML="Cambios realizados con éxito."; event.preventDefault();return false;}
else{document.getElementById('erro1').style.display="block";document.getElementById('erro1').style.color="#7d061e";document.getElementById('erro1').style.background="#F08080";document.getElementById('erro1').innerHTML="No ha habido cambios en los datos."; event.preventDefault();return false;}
}

else{
    if(formUser.checkValidity()){document.getElementById('erro1').style.display="block";document.getElementById('erro1').style.color="#7d061e";document.getElementById('erro1').style.background="#F08080";document.getElementById('erro1').innerHTML="Algún campo no es correcto."; event.preventDefault();return false;}}
}             //});
            </script>
</body>
