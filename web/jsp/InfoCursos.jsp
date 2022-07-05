<%-- 
    Document   : InfoCursos
    Created on : 20-abr-2022, 11:33:53
    Author     : Jhon
--%>



<%@page import="ulearn.model.Seccion"%>
<%@page import="ulearn.model.Curso"%>
<%@page import="ulearn.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    //int idCurso = 1;
    //int idseccion = 1;
    int i=1;
    int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    int idseccion = Integer.parseInt(request.getParameter("seccion"));
    User user=(User)request.getAttribute("infoCreador");
    double valoracion=(double)request.getAttribute("valoracion");
    Curso curso=(Curso)request.getAttribute("infoCurso");
    ArrayList<Seccion> listSecciones=(ArrayList<Seccion>) request.getAttribute("listSecciones");
    int numSecciones=listSecciones.get(0).getId();
    boolean favorito=(boolean)request.getAttribute("favorito");
    
    ArrayList<Integer> autoresSuscritos = (ArrayList<Integer>) request.getAttribute("autoresSuscritos");
    boolean suscritoAAutor=false;
    if(autoresSuscritos!=null){
        if(autoresSuscritos.contains(user.getId())) suscritoAAutor=true;
    }
    

%>

       
    
<!DOCTYPE html>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html lang="es">
    <head>
        <meta charset="utf-8">
        <link rel="icon" href="/favicon.ico">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="theme-color" content="#000000">
        <meta name="description" content="Web site created using create-react-app">
        <title>ULearn</title>
        <script type="text/javascript" id="www-widgetapi-script" src="https://www.youtube.com/s/player/2fd2ad45/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
        <script defer="defer" src="app.js"></script>

        <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>  
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script><!-- comment -->
        
        <link href="main.81e26b4c.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        
        
    <link type="text/css" rel="stylesheet" href="./rating.css">
    </head>
    
    
    <body>
        <!--Cabecera de la pagina-->
        <%@include file="./header_logged.jsp" %>

        <div class="py-lg-5 py-5">
            <div class="container">
                <!--Este div es para el video del curso-->
                <div class="row">
                    <div class="mb-5 col-lg-12 col-md-12 col-sm-12">
                        <div class="rounded-3 position-relative w-100 d-block overflow-hidden p-0" style="height: 600px;">
                            <div class="">

                                <iframe class="position-absolute top-0 end-0 start-0 end-0 bottom-0 h-100 w-100"
                                    frameborder="0" allowfullscreen="1" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    title="YouTube video player" width="100%" height="360"
                                    src=<%=listSecciones.get(idseccion-numSecciones).getVideo()%> id="widget2">
                                </iframe>
                                
                            </div>
                        </div>
                    </div>
                </div>

                <!--Este div es para el resto de la pagina-->
                <div class="row">
                    <div class="mb-4 mb-xl-0 col-xl-8 col-lg-12 col-md-12 col-sm-12">
                        <div class="mb-5 card">

                            <!--Div con el nombre del curso, puntuacion media, nombre del autor, etc...-->
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h1 class="fw-semi-bold mb-2"><%=curso.getNombre()%></h1>
                                </div>

                                <div class="d-flex mb-5"><span><span class="text-warning">
                                            
                                            <!--Estrellas para representar la puntuacion media???-->
                                            <!--Estrellas para representar la puntuacion media???-->
                                              <input
    class="rating"
    max="5"
    readonly
    step="0.01"
    style="--fill:#ffd700;--value:<%=valoracion%>"
    type="range">
                                            
                                            <span class="fw-medium">Valoración: (<%=valoracion%>)</span></span>
                                        </span>
                                        
                                    </div>

                                
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2 lh-1">
                                            <form>
                                                <c:set var = "favorito" value = "<%=favorito%>"/>
                                                <c:if test="${favorito}">
                                                    <input type="checkbox" id="favorito" name="favorito" value="favorito" onclick=anadirFavorito(<%=idCurso%>,document.getElementById('favorito').checked) checked>

                                                </c:if>
                                                <c:if test="${!favorito}">
                                                    <input type="checkbox" id="favorito" name="favorito" value="favorito" onclick=anadirFavorito(<%=idCurso%>,document.getElementById('favorito').checked)>
                                                </c:if>
                                                <label for="favorito"> Añadir a favoritos</label><br>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                    
                                <br>

                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2 lh-1">
                                            <h4 class="mb-1"><%=user.getNombre()%> <%=user.getApellidos()%></h4>
                                            <p class="fs-6 mb-0">@<%=user.getNombreUsuario()%></p>
                                        </div>
                                    </div>

                                    <div>
                                        <c:set var = "suscritoAAutor" value = "<%=suscritoAAutor%>"/>
                                        <c:if test="${suscritoAAutor}">
                                            <a class="btn btn-outline-white btn-sm" id="etiquetaAutor" style="pointer-events: none;">Suscrito al autor</a>
                                        </c:if>
                                        <c:if test="${!suscritoAAutor}">
                                            <a class="btn btn-outline-white btn-sm" id="etiquetaAutor" onclick=anadirSuscripcion('AUTOR','<%=user.getNombreUsuario()%>')>Suscribirse</a>
                                        </c:if>
                                    </div>
                                </div>

                            </div>


                            <!--METEMOS EL CONTENIDO EN EL MISMO DIV-->
                            <div class="p-0 card-body">
                                <div class="tab-content">

                                    <div role="tabpanel" id="react-aria791735076-37-tabpane-description"
                                        aria-labelledby="react-aria791735076-37-tab-description"
                                        class="fade pb-4 p-4 tab-pane active show">
                                        <div class="mb-4">
                                            <h3 class="mb-2">Descripción de sección</h3>
                                            <p> <%=listSecciones.get(idseccion-numSecciones).getDescripcion()%></p>
                                            
                                        </div>

                                    </div>

                                </div>

               
                            </div>
                                        
                                            
                            

                        </div>
                    </div>
                    
                    <!--SECCIONES DEL CURSO-->
                    <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card accordion">
                                <ul class="list-group list-group-flush">
                                    <c:set var = "listSecciones" value = "<%=listSecciones%>"/>
                                    <c:set var = "idseccion" value = "<%=idseccion%>"/>
                                    <c:set var = "numSecciones" value = "<%=numSecciones%>"/>
                                    <c:forEach var="seccion" items="${listSecciones}">
                                        <c:set var = "i" value = "<%=i%>"/>
                                        <!--DESPLEGABLE DE SECCIONES-->
                                        <li class="p-0 list-group-item"><a aria-expanded="false"
                                                class="h4 mb-0 d-flex align-items-center text-inherit text-decoration-none py-3 px-4 collapsed "
                                                data-bs-toggle="collapse" role="button" aria-controls="courseTwo">
                                                <div class="me-auto" onclick="location.href='cambioSeccion?idSeccion=${seccion.id}&idCurso='+<%=idCurso%>" >Sección <%=i%>: ${seccion.nombre}<p
                                                        class="mb-0 text-muted fs-6 mt-1 fw-normal">(${seccion.duracion} horas)</p>
                                                </div>
                                                
                                            </a>
                                            <c:if test="${(idseccion-numSecciones+1)==i}">
                                                <div class="accordion-collapse collapse show">
                                            </c:if>
                                            <c:if test="${(idseccion-numSecciones+1)!=i}">
                                                <div class="accordion-collapse collapse">
                                            </c:if>
                                                <div class="list-group list-group-flush">

                                                    <!--Lista de videos de cada seccion indicando el minuto al que te lleva-->
                                                    <div class="list-group-item"><a
                                                            class="d-flex justify-content-between align-items-center text-inherit text-decoration-none"
                                                            href="#">
                                                            <div class="text-truncate "><span
                                                                    class="icon-shape bg-success text-white icon-sm rounded-circle me-2"><svg
                                                                        viewBox="0 0 24 24" role="presentation"
                                                                        style="width: 1.2rem; height: 1.2rem;">
                                                                        <path d="M8,5.14V19.14L19,12.14L8,5.14Z"
                                                                            style="fill: currentcolor;"></path>
                                                                    </svg> </span><span class="fs-5">Desarrollo</span>
                                                            </div>
                                                            <div class="text-truncate fs-5"><span>${seccion.duracion} horas</span></div>
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>
                                        </li>
                                    <%
                                        i = i+1;
                                    %>
                                    </c:forEach>
                                    
                                </ul>
                                   
                                <div class="intermedio">      
                                    <a data-toggle="modal" data-target="#puntuar"class="button" style="text-align: center;">Puntuar Curso</a>
                                </div>
                                <div class="modal fade" id="puntuar" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header border-bottom-0">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="card">
                                                        <div class="p-6 card-body">
                                                            <div class="mb-4"><a href="/"><img
                                                                        src="Imagenes/icons8-e-learning-64.png" alt=""
                                                                        class="mb-4"></a>
                                                                <h1 class="mb-1 fw-bold">Valora el curso</h1>
                                                            </div>

                                                            <div class="row">
                                                                <div class="rating_controls___HGvb" style="justify-content:center;margin-bottom:  20px;"><label class="d-flex justify-content-center align-items-center">Puntuación: <input style="margin-left:10px;align-items: center;" id="ruletaValoracion" type="number"  value="" step="0.25" min="0" max="5"></label></div>
                                                                <button 
                                                                        type="submit"
                                                                        class="btn btn-primary"  onclick="enviarValoracion()">Enviar valoración</button></div>
                                                                        <p id="mensajeValoracion" style="text-align: center;margin-top:  20px;display: none;">Valoración enviada con éxito.</p>
                                                                <p  style="text-align: center;margin-top:  20px;">Tus valoraciones hacen que los usuarios puedan elegir mejor los cursos.</p><p  style="text-align: center;">Tu valoración podrá modificarse las veces que quieras en este mismo botón una vez realizada.Gracias!</p>  

                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                    


                </div>
            </div>
        </div>
        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        
                <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
                <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
        
        <script>
            var peticion = new XMLHttpRequest();
            function anadirFavorito(idCurso,checked){           
                peticion.open("GET",'anadirFavorito?idCurso='+idCurso+'&valor='+checked);
                //peticion.onreadystatechange=procesarPeticion;
                peticion.send(null);
            }

            var peticionSuscri = new XMLHttpRequest();
            function anadirSuscripcion(tipo,nombreAutor){ 
                console.log('anadirSuscripcionIniciado?suscripcion='+tipo+'&nombre='+nombreAutor);
                peticionSuscri.open("GET",'anadirSuscripcionIniciado?suscripcion='+tipo+'&nombre='+nombreAutor);
                peticionSuscri.onreadystatechange=procesarPeticion;
                peticionSuscri.send(null);
            }
            
            function procesarPeticion() {
                //console.log("cositas");
                if (peticionSuscri.readyState==4) {
                    if (peticionSuscri.status == 200) {
                        var etiqueta=document.getElementById("etiquetaAutor");
                        var etiquetaNueva='<a class="btn btn-outline-white btn-sm" id="etiquetaAutor" style="pointer-events: none;">Suscrito al autor</a>';
                        $("#etiquetaAutor").after(etiquetaNueva);
                        etiqueta.remove();
                        
                    }
                }
            }
            
            
            
           var peticionValoracion=new XMLHttpRequest();
           var valoracionAntigua;
           $( document ).ready(function() {
               var idCurso=<%=idCurso%>;
               
                peticionValoracion.open("GET",'valorarCurso?idCurso='+idCurso);
                peticionValoracion.onreadystatechange=procesarPeticionValoracion;
                peticionValoracion.send(null);
            });
            
            function procesarPeticionValoracion() {
                //console.log("cositas");
                if (peticionValoracion.readyState==4) {
                    if (peticionValoracion.status == 200) {
                        document.getElementById("ruletaValoracion").value=parseFloat(peticionValoracion.responseText);
                        valoracionAntigua=document.getElementById("ruletaValoracion").value;
                    }
                }
            }
            
            
            var envioValoracion=new XMLHttpRequest();
            function enviarValoracion(){
                var idCurso=<%=idCurso%>;
                var nuevaValoracion=document.getElementById("ruletaValoracion").value
                if(nuevaValoracion!=valoracionAntigua && !isNaN(nuevaValoracion) && nuevaValoracion!="" && nuevaValoracion<=5 && nuevaValoracion>=0){
                    valoracionAntigua=nuevaValoracion;
                    envioValoracion.open("POST",'valorarCurso?idCurso='+idCurso+'&nuevaValoracion='+nuevaValoracion);
                    envioValoracion.send(null);
                    document.getElementById("mensajeValoracion").style.display="block";
                    document.getElementById('mensajeValoracion').style.display="block";
                    document.getElementById('mensajeValoracion').style.color="#006400";
                    document.getElementById('mensajeValoracion').style.background="#98FB98";
                    document.getElementById('mensajeValoracion').innerHTML="Valoración enviada con éxito.";
                }
                else if(nuevaValoracion!=valoracionAntigua){
                    document.getElementById('mensajeValoracion').style.display="block";
                    document.getElementById('mensajeValoracion').style.color="#7d061e";
                    document.getElementById('mensajeValoracion').style.background="#F08080";
                    document.getElementById('mensajeValoracion').innerHTML="Valor introducido no válido(Numérica entre 0 y 5).";
                }
                else{
                    document.getElementById('mensajeValoracion').style.display="block";
                    document.getElementById('mensajeValoracion').style.color="#7d061e";
                    document.getElementById('mensajeValoracion').style.background="#F08080";
                    document.getElementById('mensajeValoracion').innerHTML="Modifica la valoración para enviarla.";
                }
                
            }
            
            
            
        </script>                           
                                    
                                    
                                    
    </body>


</html>