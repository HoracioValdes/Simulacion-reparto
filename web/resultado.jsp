<%-- 
    Document   : index
    Created on : 04-07-2017, 16:52:05
    Author     : Horacio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/phpThumb_generated_thumbnailico" />
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-105729079-1', 'auto');
            ga('send', 'pageview');

        </script>
        <title>Simulador de pensiones</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <nav>
                        <div class="nav-wrapper yellow accent-4">
                            <a href="index.jsp" class="brand-logo">&nbsp;<img class="responsive-img" src="img/logoSolNoMasAfp.png" width="170px" style="margin-top: 5px"></a>
                        </div>
                    </nav>
                </div>
            </div>

            <div class="row">
                <div class="col s10 offset-s1">
                    <h2><b>Simulador de Pensiones</b></h2>
                    <p class="flow-text" align="justify">¿Quieres saber cuál sería el monto de tu pensión si en nuestro país existiera un Sistema de Reparto Solidario como el que propone la Coordinadora NO+AFP?</p>
                    <p class="flow-text" align="justify"><b>Este simulador de pensiones te muestra -a través de sencillos pasos- cómo calcular tu pensión.</b></p>
                    <div class="col s12 card-panel yellow">
                        <h4><b>Resultado</b></h4>
                        <p class="flow-text">${requestScope.msg}</p>
                    </div>
                    <div class="col s12 card-panel yellow lighten-1">
                        <h5><b>Explicación de cálculo</b></h5>
                        <p class="flow-text">${requestScope.explicacion}</p>
                    </div>
                    <br/>

                    <div class="row">
                        <a class="waves-effect waves-light btn" href="index.jsp"><i class="material-icons left">replay</i>Volver</a>
                    </div>
                </div>
            </div>

            <footer class="page-footer yellow accent-4">
                <div class="container">
                    <div class="row">
                        <div class="col l6 s12">
                            <h5 class="white-text">Contáctanos</h5>
                            <p class="grey-text text-lighten-4">Envíanos tus sugerencias o comentarios a <a href="mailto:contacto@fundacionsol.cl" style="color: #e65100">contacto@fundacionsol.cl</a></p>
                        </div>
                    </div>
                </div>
                <div class="footer-copyright">
                    <div class="container">
                        © 2017 Fundación SOL
                        <a class="grey-text text-lighten-4 right" href="http://www.fundacionsol.cl" target="_blank"><b>Página de Fundación SOL</b></a><br/><br/>
                        <a class="grey-text text-lighten-4 right" href="http://www.nomasafp.cl/inicio/" target="_blank"><b>Página de Coordinadora No + AFP</b></a><br/><br/>
                        <a class="grey-text text-lighten-4 right" href="pdf/PROPUESTA-PREVISIONAL.pdf" target="_blank"><b>Pdf de Propuesta Previsional</b></a><br/><br/>
                    </div>
                </div>
            </footer>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>
            function habilita(form) {
                form.sueldo_ideal.disabled = false;
            }
            function deshabilita(form) {
                form.sueldo_ideal.disabled = true;
            }
            $(function () {
                $('select').material_select();
                $(".button-collapse").sideNav();
            });
        </script>
    </body>
</html>
