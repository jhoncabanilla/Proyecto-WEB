    <%@page import="ulearn.model.User"%>
<%@page import="java.util.ArrayList"%>
<%-- 
    Document   : Pricipal
    Created on : 20 abr. 2022, 11:18:59
    Author     : angel
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%
    HttpSession session2 = request.getSession();
    User registrado= (User) session2.getAttribute("user");
    boolean estaIniciado=false;
    if (registrado!=null) estaIniciado=true;

    %>
    

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html lang="es">
    <head>
        <title>ULearn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <link rel="stylesheet" href="./main.81e26b4c.css">
        <link rel="stylesheet" type="text/css"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <link rel="stylesheet" type="text/css"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    </head>
    
    
    <body>
        <div id="general">
            <!--Div de la cabecera donde se encuentra el logo, buscador y demas opciones. Implementado mediante 2 menus-->
            <div id="cabecera">
                <!--Cabecera de la pagina-->
                <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                <c:if test="${registrado}">
                    <%@include file="./header_logged.jsp" %>
                </c:if>
                <c:if test="${!registrado}">
                    <%@include file="./header.jsp" %>
                </c:if>
            </div>
            <c:set var = "registrado" value = "<%=estaIniciado%>"/>
                <c:if test="${registrado}">
                    <%@include file="./header_creador.jsp" %>
                </c:if>



            <!--Etiqueta para representar el contenido principal del body-->
            <main style="margin-top: 50px;">
                <!--Los div por defecto tienen la propiedad de display:block, es decir, los elementos ocupan el 100% del ancho-->
                <div class="cursos">
                    <h2>Cursos gratuitos</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="cursosGratuitosTrack">
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button>
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos más demandados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="cursosDemandadosTrack">
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button>
                    </div>
                </div>

                <div class="cursos">
                    <h2>Cursos mejores valorados</h2>
                    <div class="slick-list" id="slick-list">
                        <button class="slick-arrow slick-prev" id="button-prev" data-button="button-prev" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"/></svg>
                        </button>
                        <div class="slick-track" id="cursosFavoritosTrack">                             
                        </div>
                        <button class="slick-arrow slick-next" id="button-next" data-button="button-next" onclick="app.processingButton(event)">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"/></svg>
                        </button>
                    </div>
                </div>
                <script defer src="carrusel.js"></script>
            </main>

            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="footer-col">
                            <h4>company</h4>
                            <ul>
                                <li><a href="#">about us</a></li>
                                <li><a href="#">our services</a></li>
                                <li><a href="#">privacy policy</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>get help</h4>
                            <ul>
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">shipping</a></li>
                                <li><a href="#">returns</a></li>
                                <li><a href="#">order status</a></li>
                                <li><a href="#">payment options</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>follow us</h4>
                            <div class="social-links">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
           </footer>

        </div>
    
        <script>
            $(document).ready(function(){ 
                jQuery.getJSON("http://localhost:8080/practica_ssw2/paginaPrincipal",
                function(cursos){
                    const containers = [$("#cursosGratuitosTrack"),$("#cursosDemandadosTrack"), $("#cursosFavoritosTrack")];
                    for(var i=0;i<cursos.length;i++){
                        for(var j=0;j<cursos[i].length;j++){
                            elemento='<div class="slick">'
                            elemento+='<div>'
                            elemento+='<a href="comprobarCurso?idCurso='+cursos[i][j]+'">'
                            elemento+='<picture>'
                            elemento+='<img alt="Imagen" src="imagenCurso?id='+cursos[i][j]+'">'
                            elemento+='</picture>'            
                            elemento+='</a>'
                            elemento+='</div>'
                            elemento+='</div>'
                            containers[i].append(elemento);
                        }
                    }
                });
        }); 
        </script>
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
