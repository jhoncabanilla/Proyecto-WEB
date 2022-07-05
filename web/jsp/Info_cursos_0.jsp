<%@page import="ulearn.model.Curso"%>
<%@page import="ulearn.model.Seccion"%>
<%@page import="ulearn.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    int i = 1;
    User user = (User) request.getAttribute("infoCreador");
    double valoracion = (double) request.getAttribute("valoracion");
    Curso curso = (Curso) request.getAttribute("infoCurso");
    ArrayList<Seccion> listSecciones = (ArrayList<Seccion>) request.getAttribute("listSecciones");
    Boolean suscripciones[]=(Boolean [])request.getAttribute("suscripciones");
    ArrayList<Integer> autoresSuscritos = (ArrayList<Integer>) request.getAttribute("autoresSuscritos");
    HttpSession session2 = request.getSession();
    User registrado= (User) session2.getAttribute("user");
    boolean estaIniciado=false;
    if (registrado!=null) estaIniciado=true;
    boolean suscritoAAutor=false;
    if(autoresSuscritos!=null){
        if(autoresSuscritos.contains(user.getId())) suscritoAAutor=true;
    }
    int lastSeccion=(int)request.getAttribute("seccion");
    boolean favorito=(boolean)request.getAttribute("favorito");
    //int idCurso = Integer.parseInt(request.getParameter("idCurso"));
    //int idseccion = Integer.parseInt(request.getParameter("seccion"));
%>



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

        <link href="./main.81e26b4c.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
                <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link type="text/css" rel="stylesheet" href="./rating.css">
                

    </head>


    <body>
        <!--Cabecera de la pagina-->
        <c:set var = "registrado" value = "<%=estaIniciado%>"/>
        <c:if test="${registrado}">
            <%@include file="./header_logged.jsp" %>
        </c:if>
        <c:if test="${!registrado}">
            <%@include file="./header.jsp" %>
        </c:if>
        

        <div class="py-lg-5 py-5">
            <div class="container">
                <!--Este div es para el video del curso-->
                <div class="row">
                    <div class="mb-5 col-lg-12 col-md-12 col-sm-12">
                        <div class="rounded-3 position-relative w-100 d-block overflow-hidden p-0" style="height: 300px;">
                            <div class="imagen" style="display: flex; justify-content: center;">
                                <img  alt="Imagen" src="imagenCurso?id=<%=idCurso%>">
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
                                    <h1 class="fw-semi-bold mb-2">
                                        <%=curso.getNombre()%>
                                    </h1>
                                </div>

                                <div class="d-flex mb-5"><span><span class="text-warning">

                                            <!--Estrellas para representar la puntuacion media???-->
                                               <!--Estrellas para representar la puntuacion media???-->
                                              <input class="rating" max="5" readonly step="0.01" style="--fill:#ffd700;--value:<%=valoracion%>" type="range">

                                        <span class="fw-medium">Valoración: (<%=valoracion%>)</span></span>
                                    </span>

                                </div>

                                    <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                                    <c:if test="${registrado}">
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <div class="ms-2 lh-1">
                                                    <form>
                                                        <c:set var = "favorito" value = "<%=favorito%>"/>
                                                        <c:if test="${favorito}">
                                                            <input type="checkbox" id="favorito" name="favorito" value="favorito" onclick=anadirFavorito(<%=idCurso%>,document.getElementById('favorito').checked checked>

                                                        </c:if>
                                                        <c:if test="${!favorito}">
                                                            <input type="checkbox" id="favorito" name="favorito" value="favorito" onclick=anadirFavorito(<%=idCurso%>,document.getElementById('favorito').checked)>
                                                        </c:if>
                                                        <label for="favorito"> Añadir a favoritos</label><br>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                
                                                
                                <br>

                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <div class="ms-2 lh-1">
                                            <h4 class="mb-1"><%=user.getNombre()%> <%=user.getApellidos()%></h4>
                                            <p class="fs-6 mb-0">@<%=user.getNombreUsuario()%></p>
                                        </div>
                                    </div>

                                    <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                                        <c:if test="${registrado}">
                                        <div>
                                        
                                        <c:set var = "suscritoAAutor" value = "<%=suscritoAAutor%>"/>
                                        <c:if test="${suscritoAAutor}">
                                            <a class="btn btn-outline-white btn-sm" style="pointer-events: none;">Suscrito al autor</a>
                                        </c:if>
                                        <c:if test="${!suscritoAAutor}">
                                            <a class="btn btn-outline-white btn-sm" id="etiquetaAutor" onclick=anadirSuscripcion('AUTOR','<%=user.getNombreUsuario()%>')>Suscribirse</a>
                                        </c:if>
                                    </div>
                                        </c:if>
                                </div>

                            </div>


                            <!--METEMOS EL CONTENIDO EN EL MISMO DIV-->
                            <div class="p-0 card-body">
                                <div class="tab-content">

                                    <div role="tabpanel" id="react-aria791735076-37-tabpane-description"
                                         aria-labelledby="react-aria791735076-37-tab-description"
                                         class="fade pb-4 p-4 tab-pane active show">
                                        <div class="mb-4">
                                            <h3 class="mb-2">Descripción del curso</h3>
                                            <p><%=curso.getDescripcion()%></p>
                                        </div>

                                        <div class="mb-4">
                                            <h3 class="mb-2">Precio del curso</h3>
                                            <h4 class="mb-2"><b><%=curso.getPrecio()%> €</b></h4>
                                        </div>
                                        
                                        <!--Div en el que inserto el boton intermedio para la opcion de convertirse en instructor-->
                                        <div class="intermedio">
                                             <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                                             <c:set var = "suscritoAAutor" value = "<%=suscritoAAutor%>"/>
                                             
                                            <!--Insertamos el boton que nos abrira el pop-up para convertirnos en creadores-->
                                            <c:if test="${registrado}">
                                                <!--REGISTRADO PERO HAY QUE COMPROBAR LAS SUSCRIPCIONES-->
                                                <c:set var = "suscripcion" value = "<%=suscripciones%>"/>
                                                <c:set var = "lastSeccion" value = "<%=lastSeccion%>"/>
                                                <c:set var = "precio" value = "<%=curso.getPrecio()%>"/>
                                                
                                                <c:if test="${(suscripcion[0]&& precio==0.0)||suscripcion[1]||suscripcion[2]||suscritoAAutor||lastSeccion!=0}">
                                                    <a href="comenzarCurso?idCurso=<%=idCurso%>" class="button" style="text-align: center;">Comenzar Ahora</a>
                                                </c:if>
                                                <c:if test="${!((suscripcion[0]&& precio==0.0)||suscripcion[1]||suscripcion[2]||suscritoAAutor||lastSeccion!=0)}">
                                                    <a data-toggle="modal" data-target="#compra"class="button" style="text-align: center;">Comenzar Ahora</a>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${!registrado}">
                                                <a data-toggle="modal" data-target="#loginModal"class="button" style="text-align: center;">Comenzar Ahora</a>
                                            </c:if>
                                        
                                        </div>
                                        <div class="modal fade" id="compra" tabindex="-1" role="dialog"
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
                                                                <h1 class="mb-1 fw-bold">Inicia el Curso</h1>
                                                            </div>

                                                            <div class="row">
                                                                <div class="mb-0 d-grid gap-2 col-lg-12 col-md-12"
                                                                     style="display: grid!important; float:left; "><button
                                                                        type="submit"
                                                                        class="btn btn-primary"  onclick="location.href = 'comenzarCurso?idCurso='+<%=idCurso%>">Compra por <%=curso.getPrecio()%>€</button></div>
                                                                <span class="mb-3 mt-3 fw " style="text-align: center;">o mediante suscripción</span>
                                                                <div class="container">
                                                                    <div class="row">
                                                                        <div class="col-sm "><button
                                                                                type="submit"
                                                                                class="btn btn-primary" onclick="location.href ='accederSuscripciones'">Suscríbete a uno de nuestos planes</button></div>

                                                                        <div class="col-sm"
                                                                             style="display: grid!important;"><button
                                                                                type="submit"
                                                                                class="btn btn-primary" onclick="location.href ='anadirSuscripcion?suscripcion=AUTOR&nombre=<%=user.getNombreUsuario()%>'">Suscríbete al autor</button></div>
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
                    </div>



                    <!--SECCIONES DEL CURSO-->
                    <div class="col-xl-4 col-lg-12 col-md-12 col-sm-12">
                        <div class="card">
                            <div class="card accordion">
                                <ul class="list-group list-group-flush">
                                    <c:set var = "listSecciones" value = "<%=listSecciones%>"/>
                                    <c:forEach var="seccion" items="${listSecciones}">
                                        <!--DESPLEGABLE DE SECCIONES-->
                                        <li class="p-0 list-group-item"><a aria-expanded="false"
                                                                           class="h4 mb-0 d-flex align-items-center text-inherit text-decoration-none py-3 px-4 collapsed "
                                                                           data-bs-toggle="collapse" role="button" aria-controls="courseTwo">
                                                <div class="me-auto">Sección <%=i%>: ${seccion.nombre}<p
                                                        class="mb-0 text-muted fs-6 mt-1 fw-normal">(${seccion.duracion} horas)</p>
                                                </div>

                                            </a>

                                        </li>
                                        <%
                                            i = i + 1;
                                        %>
                                    </c:forEach>

                                </ul>

                            </div>
                        </div>
                    </div>



                </div>
            </div>
        </div>

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
            function cambiarLogin(a, b) {
                /*var tab=document.getElementById("loginModal");
                 tab.className="modal fade";
                 tab.style.display="none";
                 tab.setAttribute("aria-hidden", "true");

                 var tab2=document.getElementById("login2");
                 tab2.style.display="block";
                 tab2.className="modal fade show";
                 tab2.removeAttribute("aria-hidden");*/
                $(document).ready(function () {
                    $(a).modal('show');

                });
                $(document).ready(function () {
                    $(b).modal('hide');

                });

            }
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
        </script>
    </body>


</html>