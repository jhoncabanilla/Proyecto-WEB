<%-- 
    Document   : header_logged
    Created on : 26 abr. 2022, 14:22:26
    Author     : migchav
--%>

<%@page import="ulearn.model.User"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    User userX = (User)session.getAttribute("user");
%>
<!DOCTYPE html>
<nav class="bg-white navbar p-2 navbar-default py-2 navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <div class="d-flex align-items-center"><a class="navbar-brand py-1 mr-auto" href="Pricipal.jsp"><img
                    src="./Imagenes/icons8-e-learning-64.png" alt="ULearn logo"></a>
            <a aria-expanded="false" role="button" class="nav-link mr-3" tabindex="0"
                style="font-weight: bold; color: black; font: size 100px;">ULearn</a>
            <form class="form-inline d-none d-sm-flex"  action="Buscador">
                <span class="position-absolute ps-3 search-icon " for="search_search"><i
                        class="fa fa-search"></i></span><input placeholder="Search Courses" type="Search"
                    id="search" name="searcher" class="ps-6 form-control" />
            </form>
        </div>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false"
            aria-label="Toggle navigation" onclick="showMenu()"><i class="fa fa-bars"></i></button>
        <!-- Navbar Collapse  // añadir show y esta-->
        <div class="collapse navbar-collapse " id="navbarCollapse">


            <form class="form-inline mt-4 mb-2 d-sm-none" action="#" id="searchcollapsed">
                <div class="input-label-absolute input-label-absolute-left w-100">
                    <span class="position-absolute mt-2 ps-3 search-icon" for="search_search"><i
                            class="fa fa-search"></i></span><input placeholder="Search Courses"
                        type="Search" id="formSearch" class="ps-6 form-control" />
                </div>
            </form>

            <ul class="navbar-nav ms-auto ">

                <li class="nav-item mr-2"><a class="nav-link" style="font-size: 1.1em;" id="homeDropdownMenuLink"
                        href="Pricipal.jsp">
                        Home</a>

                </li>
                <li class="nav-item mr-2 "><a class="nav-link " style="font-size: 1.1em;" href="accederSuscripciones">Suscripciones</a>

                </li>
                <li class="nav-item mr-2"><a aria-expanded="false" style="font-size: 1.1em;" role="button"
                        tabindex="0" class="nav-link" href="./cursosCreador">Creador</a>
                </li>
                <li class="nav-item mr-2"><a class="nav-link " style="font-size: 1.1em;"
                        id="docsDropdownMenuLink" href="./cursosUsuario" aria-haspopup="true"
                        aria-expanded="false">
                        Mis Cursos</a>
                </li>

                <li class="nav-item dropdown ms-lg-3"><a id="userDropdownMenuLink" href="#"
                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar avatar-md avatar-indicators avatar-online">
                            <img alt="avatar" src="imagenUsuario?idUsuario=<%=userX.getId()%>" class="rounded-circle" onerror="this.src='./Imagenes/avatar_ini.png'" />
                        </div>
                    </a>

                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdownMenuLink"><a
                            class="dropdown-item" href="./datosUsuario">Configuración usuario</a>
                        <div class="dropdown-divider"></div><a class="dropdown-item"
                            href="cerrarSesion"><i class="fas fa-sign-out-alt me-2 text-muted"></i>
                            Cerrar Sesión</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
        <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

        <script>
        function showMenu(){
            var elemento=document.getElementById("navbarCollapse");
            if(elemento.className==='navbar-collapse collapse show'){
                $(elemento).collapse('toggle');
            }
            else{
                $(elemento).collapse('show');
            }
        }
    
    </script>
</nav>