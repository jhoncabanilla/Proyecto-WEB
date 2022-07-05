<%-- 
    Document   : hazte_creador
    Created on : 23 may. 2022, 14:59:11
    Author     : migchav
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<html lang="es">

<head>
    <meta charset="utf-8">
    <!--<link rel="icon" href="/favicon.ico">-->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="theme-color" content="#000000">
    <meta name="description" content="Web site created using create-react-app">
    <!--<link rel="manifest" href="/manifest.json">-->
    <title>ULearn</title>
    <script type="text/javascript" id="www-widgetapi-script"
        src="https://www.youtube.com/s/player/bd67d609/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
    <link rel="stylesheet" type="text/css" href="main.81e26b4c.css">
    <link type="text/css" rel="stylesheet" href="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/style.css">
    <script type="text/javascript" charset="utf-8"
        src="chrome-extension://dagdlcijhfbmgkjokkjicnnfimlebcll/page_context.js"></script>
    <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>

</head>

<body>
    <div id="root">
        <div class="App">
            <%@include file="./header_logged.jsp" %>
            <div class="py-4 py-lg-6 bg-primary">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-md-12 col-sm-12 offset-lg-1">
                            <div class="d-lg-flex align-items-center justify-content-between">
                                <div class="mb-4 mb-lg-0">
                                    <h1 class="text-white mb-1">Añade un nuevo Curso</h1>
                                    <p class="mb-0 text-white lead">Tan solo rellene este formulario y empiece a crear cursos.</p>
                                </div>
                                <div><a class="btn btn-white " href="cursosCreador">Vuelve a tus cursos</a> <a class="btn btn-success "
                                        href="Pricipal.jsp">Guardar</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pb-12">
                <div class="container">
                    <div class="stepper">
                        <div class="row">
                            <div class="col-lg-10 col-md-12 col-sm-12 offset-lg-1">
                                <div class="stepper">
                                    <div class="stepper-content mt-5 ">
                                        <div class="stepper-pane fade active">
                                            <form class="">
                                                <div class="mb-3  card">
                                                    <div class="border-bottom px-4 py-3 card-header">
                                                        <h4 class="mb-0">Infomación Básica</h4>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="mb-3"><label class="form-label"
                                                                for="courseTitle">Título del Curso</label><input
                                                                placeholder="Título" name="course_title"
                                                                type="text" id="course_title"
                                                                class="form-control"><small
                                                                class="text-muted form-text">Escriba un título para el curso de máximo 60 letras.</small></div>
                                                                <div class="mb-3"><label class="form-label"
                                                                    for="courseTitle">Precio Curso</label><input
                                                                    placeholder="Precio" name="course_title"
                                                                    type="text" id="course_price"
                                                                    class="form-control"><small
                                                                    class="text-muted form-text">Precio en euros.</small></div>
                                                                    <div class="mb-3"><label class="form-label"
                                                                        for="courseTitle">Duración Curso</label><input
                                                                        placeholder="Minutos de duración" name="course_title"
                                                                        type="text" id="course_time"
                                                                        class="form-control"><small
                                                                        class="text-muted form-text">Tiempo en minutos.</small></div>
                                                        <div class="mb-3"><label class="form-label">Categoría</label><select name="category_category"
                                                                class="form-select" id="category_category">
                                                                <option value="" class="text-muted" selected="">Seleccione Categoría</option>
                                                                <option value="React">React</option>
                                                                <option value="Javascript">Javascript</option>
                                                                <option value="HTML">HTML</option>
                                                                <option value="Vuejs">Vue js</option>
                                                                <option value="Gulpjs">Gulp js</option>
                                                            </select><small class="text-muted form-text">Ayuda a la gente a encontrar tus cursos elegiendo una categoría que los represente.</small></div>
                                                        <div class="mb-3"><label class="form-label">Descripción del curso</label><div class="quill" id="editor">

                                                            <div class="ql-editor" data-gramm="false" contenteditable="true"><p>Inserte la descripción del curso</p><p><br></p><p>Algo de texto en <strong>negrita</strong></p><p><br></p><p><br></p></div>     </div>
<small class="text-muted form-text">Un pequeño resumen del curso.</small>
                                                        </div>
                                                        <div class="mb-3"><label class="form-label">Secciones y contenido curso
                                                            </label><div class="quill" id="editorSeccion">
                                                                <div class="ql-editor" contenteditable="true"><p>Inserte las secciones del curso de forma ordenada.</p><p><br></p><ol><li>Sección uno</li><li>Sección dos</li></ol><p class="ql-indent-1">Texto de ejemplo para esta sección.	</p><pre spellcheck="false" class="ql-indent-1">// Código Asociado
                                                                </pre><p><br></p></div>                                                       
                                                            </div>
<small class="text-muted form-text">Descripción de cada una de las lecciones (Divida sus secciones con enumeraciones)</small>
                                                    </div>
                                                    </div>
                                            </form>
                                        </div>
                                        <div class="stepper-pane fade active">
                                            <form class="">
                                                <div class="mb-3  border-0 card">
                                                    <div class="border-bottom px-4 py-3 card-header">
                                                        <h4 class="mb-0">Portada Curso</h4>
                                                    </div>
                                                    <div class="card-body"><label class="form-label">Imágen de portada</label>
                                                        <div class="mb-1 input-group"><input type="file" id="inputfavicon" class="form-control form-control"><label class="input-group-text mb-0 form-label" for="inputfavicon">Upload</label><small class="text-muted form-text">Sube tu imágen del curso aquí. Debe cumplir los estándares de calidad para ser aceptada.Importante:750x440 pixels; .jpg,
                                                            .jpeg,. gif, or .png.</small>
                                                    </div>
                                                        <div class="mb-3 mt-3"><input placeholder="Video URL"
                                                                type="text" id="VideoURL" class="form-control"><small
                                                                class="text-muted form-text">Introduzca una URL de vídeo válida.
                                                                Aquellos estudiantes que ven una promo del curso en vídeo suelen inscribirse al curso.</small></div>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-between"><button type="button"
                                                        class="btn btn-secondary">Cancelar</button><button type="button"
                                                        class="btn btn-primary">Envie para revisión</button></div>
                                            </form>
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
    <link href="https://cdn.quilljs.com/1.0.0/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.0.0/quill.min.js"></script>
<script>
var toolbarOptions = [
  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
  ['blockquote', 'code-block'],

  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
  [{ 'direction': 'rtl' }],                         // text direction

  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
  [{ 'font': [] }],
  [{ 'align': [] }],
  [ 'link', 'image', 'video', 'formula' ],

  ['clean']                                         // remove formatting button
];

var quill = new Quill('#editor', {
  modules: {
    toolbar: toolbarOptions
  },
  theme: 'snow'
});
var quill = new Quill('#editorSeccion', {
  modules: {
    toolbar: toolbarOptions
  },
  theme: 'snow'
});
</script>
</body>
