<%@page import="ulearn.model.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ulearn.model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%
    User usuario= (User) request.getAttribute("user");
    ArrayList<Curso> creados = (ArrayList<Curso>)request.getAttribute("creados");
    ArrayList<Double> valoraciones = (ArrayList<Double>)request.getAttribute("valoraciones");
%>

<html lang="es">
<head>
    <link rel="icon" href="/favicon.ico">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="theme-color" content="#000000">
    <meta name="description" content="Web site created using create-react-app">
    <link rel="manifest" href="/manifest.json">
    <title>ULearn</title>
    <script type="text/javascript" id="www-widgetapi-script"
        src="https://www.youtube.com/s/player/bd67d609/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
    <script defer="defer" src="main.95c52374.js"></script>
    <link href="main.81e26b4c.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/style.css">
    <script type="text/javascript" charset="utf-8"
        src="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/page_context.js"></script>
    <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>
    <link type="text/css" rel="stylesheet" href="./rating.css">
</head>


<body>
    <div id="general">
        <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
        <div id="cabecera">
            <%@include file="./header_logged.jsp" %>
        </div>
        <div class="pt-5 pb-5">
            <div class="container">
                <div class="mt-0 mt-md-4 row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="mb-6 row">
                            <div class="col-md-12">
                                <div class="bg-transparent shadow-none  card">
                                    <div class="border-0 p-0 bg-transparent card-header">
                                        <div class="nav-lb-tab nav card-header-undefined" role="tablist">
                                            <div class="ms-0 nav-item"><a role="tab" data-rr-ui-event-key="bookmarked"
                                                    id="react-aria6366272441-395-tab-bookmarked"
                                                    aria-controls="react-aria6366272441-395-tabpane-bookmarked"
                                                    class="mb-sm-3 mb-md-0 nav-link active"
                                                    aria-selected="true">Cursos creados</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="p-0 card-body">
                                        <div class="tab-content">
                                            <!--==================== Creeados  ====================-->
                                            
                                            <div role="tabpanel" id="react-aria6366272441-395-tabpane-bookmarked"
                                                aria-labelledby="react-aria6366272441-395-tab-bookmarked"
                                                class="fade pb-4 p-4 ps-0 pe-0 tab-pane active show">
                                                <div class="row">
                                                    <c:if test="<%=creados.isEmpty()%>">
                                                        <h4>No has subido ningún curso.</h4>
                                                        <%@include file="./header_creador.jsp" %>
                                                    </c:if>
                                                        
                                                    <c:if test="<%=!creados.isEmpty()%>">      
                                                    <%
                                                    for(int i = 0; i<creados.size();i++){
                                                    %>
                                                    
                                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                                        <div class="mb-4 card-hover  card"><a
                                                                href="comprobarCurso?idCurso=<%=creados.get(i).getId()%>"><img
                                                                    src="imagenCurso?id=<%=creados.get(i).getId()%>" alt=""
                                                                    class="card-img-top rounded-top-md" style="max-height: 250px;"></a>
                                                            <div class="card-body">
                                                                <h3 class="h4 mb-2 text-truncate-line-2 "><a
                                                                        class="text-inherit"
                                                                        href="comprobarCurso?idCurso=<%=creados.get(i).getId()%>"> <%=creados.get(i).getNombre()%> </a></h3>
                                                                <ul class="mb-3 list-inline">
                                                                    <li class="list-inline-item"><i
                                                                            class="far fa-clock me-1"></i><%=creados.get(i).getDuracionConFormato()%></li>
                                                                </ul>
                                                                <div class="lh-1 d-flex align-items-center "><span
                                                                        class="text-warning me-1 mb-1"> 
                                                                                                                      <input
    class="rating"
    max="5"
    readonly
    step="0.01"
    style="--fill:#ffd700;--value:<%=valoraciones.get(i)%>"
    type="range">
                                                                        <span class="text-warning me-1">
                                                                        <%=valoraciones.get(i)%></span><span class="fs-6 text-muted">
                                                                    </span>
                                                                </div>
                                                                <div class="lh-1 mt-3 "><span
                                                                        class="text-dark fw-bold"><%=creados.get(i).getPrecio()%>€</span></div>
                                                            </div>
                                                            <div class="card-footer">
                                                                <div class="align-items-center g-0 row">
                                                                    <div class="col-auto col"><img
                                                                            src="imagenUsuario?idUsuario=<%=creados.get(i).getCreador().getId()%>"
                                                                            alt="" class="rounded-circle avatar-xs" onerror="this.src='./Imagenes/avatar_ini.png'">
                                                                    </div>
                                                                    <div class="col ms-2 col"><span><%=creados.get(i).getCreador().getNombreUsuario()%></span>
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

</body>


</html>