<%-- 
    Document   : cursosBuscados
    Created on : 19-may-2022, 13:21:47
    Author     : Jhon
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="ulearn.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ulearn.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%
    //HttpSession session2 = request.getSession();
    //User usuario= (User) request.getAttribute("user");
    ArrayList<Curso> cursosBuscados = (ArrayList<Curso>)request.getAttribute("cursosBuscados");
    ArrayList<Double> valoraciones = (ArrayList<Double>)request.getAttribute("valoraciones");
    
    HttpSession session2 = request.getSession();
    User registrado= (User) session2.getAttribute("user");
    boolean estaIniciado=false;
    if (registrado!=null) estaIniciado=true;
%>

<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="theme-color" content="#000000">
    <meta name="description" content="Web site created using create-react-app">
    <title>ULearn</title>
    <script type="text/javascript" id="www-widgetapi-script"
        src="https://www.youtube.com/s/player/bd67d609/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
    <link href="./main.81e26b4c.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/style.css">
    <script type="text/javascript" charset="utf-8"
        src="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/page_context.js"></script>
    <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>

        
               
     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
     
    <link type="text/css" rel="stylesheet" href="./rating.css">

</head>


<body>
    <div id="general">
        <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
        <div id="cabecera">
            <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                <c:if test="${registrado}">
                    <%@include file="./header_logged.jsp" %>
                </c:if>
                <c:if test="${!registrado}">
                    <link rel="stylesheet" type="text/css"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
                    <%@include file="./header.jsp"  %>
                </c:if>
            </div>
        </div>
        
<link href="./main.81e26b4c.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/style.css">
        <div class="pt-5 pb-5">
            <div class="container">
                <div class="mt-0 mt-md-4 row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="mb-6 row">
                            <div class="col-md-12">
                                <div class="bg-transparent shadow-none  ">
                                    <div class="border-0 p-0 bg-transparent card-header">
                                        <div class="nav-lb-tab nav card-header-undefined" role="tablist">
                                            <div class="ms-0 nav-item"><a role="tab" data-rr-ui-event-key="bookmarked"
                                                    id="react-aria6366272441-395-tab-bookmarked"
                                                    aria-controls="react-aria6366272441-395-tabpane-bookmarked"
                                                    class="mb-sm-3 mb-md-0 nav-link active" aria-selected="true">Resultados</a>
                                            </div>
                                            <div class="nav-item"><a role="tab" data-rr-ui-event-key="learning"
                                                    id="react-aria6366272441-395-tab-learning"
                                                    aria-controls="react-aria6366272441-395-tabpane-learning"
                                                    class="mb-sm-3 mb-md-0 nav-link" tabindex="-1"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-0 card-body">
                                        <div class="tab-content">
                                            <!--==================== Favoritos  ====================-->
                                            <div role="tabpanel" id="react-aria6366272441-395-tabpane-bookmarked"
                                                aria-labelledby="react-aria6366272441-395-tab-bookmarked"
                                                class="fade pb-4 p-4 ps-0 pe-0 tab-pane active show">
                                          
                                                <div class="row">
                                                    <!-- C if -->
                                                   
                                                    <c:if test="<%=cursosBuscados.isEmpty()%>">
                                                        <h4>No se han encontrado resultados para esta búsqueda</h4>
                                                    </c:if>
                                                        
                                                    <c:if test="<%=!cursosBuscados.isEmpty()%>">                             
                                                    <%
                                                    for(int i=0; i<cursosBuscados.size();i++){
                                                    %>
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="comprobarCurso?idCurso=<%=cursosBuscados.get(i).getId()%>"><img
                                                                    src="imagenCurso?id=<%=cursosBuscados.get(i).getId()%>" alt=""
                                                                    class="card-img-top rounded-top-md" style="max-height: 250px;"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="comprobarCurso?idCurso=<%=cursosBuscados.get(i).getId()%>"> <%=cursosBuscados.get(i).getNombre()%> </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i><%=cursosBuscados.get(i).getDuracionConFormato()%></li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> 
                                                                        <!--Estrellas para representar la puntuacion media???-->
                                              <input
    class="rating"
    max="5"
    readonly
    step="0.01"
    style="--fill:#ffd700;--value:<%=valoraciones.get(i)%>"
    type="range">
                                                                        <span class="text-warning me-1 ">
                                                                        Valoración: <%=valoraciones.get(i)%></span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold"><%=cursosBuscados.get(i).getPrecio()%>€</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="imagenUsuario?idUsuario=<%=cursosBuscados.get(i).getCreador().getId()%>"
                                                                            alt="" class="rounded-circle avatar-xs" onerror="this.src='./Imagenes/avatar_ini.png'">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span><%=cursosBuscados.get(i).getCreador().getNombreUsuario()%></span>
                                                                    </div>
                                                                    
                                                                </div><span class="d-none">
                                                                    <div class="mt-3 progress" style="height: 5px;">
                                                                        <div role="progressbar"
                                                                            class="progress-bar bg-success"
                                                                            aria-valuenow="45" aria-valuemin="0"
                                                                            aria-valuemax="100" style="width: 45%;">
                                                                        </div>
                                                                    </div>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%}%>
                                                    <!-- Fin c if -->
                                                    </c:if>
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
        <!-- Popper JS -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
        <!-- Bootstrap JS -->
        <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
        <script>
            function cambiarLogin(a,b) {
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
          </script>

</body>


</html>
