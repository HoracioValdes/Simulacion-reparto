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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script>
            $.getJSON('https://mindicador.cl/api', function (data) {
                var dailyIndicators = data;
                $("<p/>", {
                    html: '$ ' + dailyIndicators.uf.valor
                }).appendTo("#uf");
            }).fail(function () {
                console.log('Error al consumir la API!');
            });
        </script>
        <script>
            function obtenerValor() {
                var ufHtml = document.getElementById("uf").innerText;
                var ufLimpia = ufHtml.substring(2);
                // alert(ufLimpia);
                document.getElementById("hiddenField").value = ufLimpia;
                ufLimpia = ufLimpia.replace(".",",");
                ufLimpia = ufLimpia.substring(0, 2)+"."+ufLimpia.substring(2, 8);
                document.getElementById("uf").innerText = "$ " + ufLimpia;
            }
        </script>
        <title>Simulador de pensiones</title>
    </head>
    <body onload="obtenerValor()">
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
                </div>
            </div>

            <div class="row">
                <form class="col s10 offset-s1" method="post" name="form1" action="calculo.do">
                    
                    <input type="hidden" id="hiddenField" name="hiddenField"/> 
                    
                    <p class="flow-text" align="justify">Seleccione su sexo.</p>
                    <label>Sexo</label>
                    <div class="row">

                        <div class="input-field col s6">
                            <input name="optSexo" type="radio" id="test1" value="mujer"/>
                            <label for="test1">Mujer</label>
                        </div>
                        <div class="input-field col s6">
                            <input name="optSexo" type="radio" id="test2" value="hombre"/>
                            <label for="test2">Hombre</label>
                        </div>
                    </div>


                    <br/>
                    <p class="flow-text" align="justify">Indique cuantos años cotizó, o espera cotizar.</p>
                    <div class="input-field col s12">
                        <select name="cboAniosCotizacion" id="cboAniosCotizacion">
                            <option value="" disabled selected>Elija los años</option>
                            <option value="1">1 año</option>
                            <option value="2">2 años</option>
                            <option value="3">3 años</option>
                            <option value="4">4 años</option>
                            <option value="5">5 años</option>
                            <option value="6">6 años</option>
                            <option value="7">7 años</option>
                            <option value="8">8 años</option>
                            <option value="9">9 años</option>
                            <option value="10">10 años</option>
                            <option value="11">11 años</option>
                            <option value="12">12 años</option>
                            <option value="13">13 años</option>
                            <option value="14">14 años</option>
                            <option value="15">15 años</option>
                            <option value="16">16 años</option>
                            <option value="17">17 años</option>
                            <option value="18">18 años</option>
                            <option value="19">19 años</option>
                            <option value="20">20 años</option>
                            <option value="21">21 años</option>
                            <option value="22">22 años</option>
                            <option value="23">23 años</option>
                            <option value="24">24 años</option>
                            <option value="25">25 años</option>
                            <option value="26">26 años</option>
                            <option value="27">27 años</option>
                            <option value="28">28 años</option>
                            <option value="29">29 años</option>
                            <option value="30">30 años</option>
                            <option value="31">31 años</option>
                            <option value="32">32 años</option>
                            <option value="33">33 años</option>
                            <option value="34">34 años</option>
                            <option value="35">35 años</option>
                            <option value="36">36 años</option>
                            <option value="37">37 años</option>
                            <option value="38">38 años</option>
                            <option value="39">39 años</option>
                            <option value="40">40 años</option>
                            <option value="41">41 años</option>
                            <option value="41">42 años</option>
                            <option value="41">43 años</option>
                            <option value="41">44 años</option>
                            <option value="41">45 años</option>
                            <option value="41">46 años</option>
                            <option value="41">47 años</option>
                            <option value="41">48 años</option>
                            <option value="41">49 años</option>
                            <option value="41">50 años</option>
                            <option value="41">51 años</option>
                            <option value="41">52 años</option>
                            <option value="41">53 años</option>
                            <option value="41">54 años</option>
                            <option value="41">55 años</option>
                            <option value="41">56 años</option>
                            <option value="41">57 años</option>
                            <option value="41">58 años</option>
                            <option value="41">59 años</option>
                            <option value="41">60 años</option>
                        </select>
                        <label for="cboAniosCotizacion">Años de cotización</label>
                    </div>

                    <p class="flow-text">&nbsp;</p>
                    <br/>
                    <p class="flow-text" align="justify">Indique cual sería su sueldo imponible en promedio durante los últimos 10 años de cotización. Si usted cotizaría menos de 10 años, inserte el promedio de esos años trabajados.</p>
                    <label>Sueldo imponible</label>
                    <div class="row">
                        <div class="input-field col s12">
                            <input name="txtSueldoImponible" id="sueldo_imponible" type="text" class="validate">
                        </div>
                    </div>

                    <br/>
                    <p class="flow-text" align="justify">Su pensión será calculada según el valor correspondiente al sueldo mínimo y al valor de la UF actual.</p>
                    <label>Sueldo Mínimo</label>
                    <div class="row">
                        <div class="input-field col s12">
                            <p class="flow-text"><b>$ 301.000</b></p>
                        </div>
                    </div>
                    <label>UF</label>
                    <div class="row">
                        <div class="input-field col s12">
                            <p class="flow-text"><b name="uf" id="uf"></b></p>
                        </div>
                    </div>

                    <br/>
                    <div class="row">
                        <button class="btn waves-effect waves-light" type="submit" name="action" onclick="return probando();">Calcular
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
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
                        <a class="grey-text text-lighten-4 right" href="pdf/PROPUESTA-PREVISIONAL.pdf" download="PROPUESTA-PREVISIONAL" target="_blank"><b>Pdf de Propuesta Previsional</b></a><br/><br/>
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
                            function probando() {
                                var opcionesSexo = document.getElementsByName("optSexo");
                                var indiceAnioCotizacion = document.getElementById("cboAniosCotizacion").selectedIndex;
                                var sueldo = document.getElementById("sueldo_imponible").value;

                                var seleccionadoSexo = false;
                                for (var i = 0; i < opcionesSexo.length; i++) {
                                    if (opcionesSexo[i].checked) {
                                        seleccionadoSexo = true;
                                        break;
                                    }
                                }


                                if (!seleccionadoSexo) {
                                    Materialize.toast('Debe seleccionar el sexo', 4000);
                                    return false;
                                } else if (indiceAnioCotizacion === null || indiceAnioCotizacion === 0) {
                                    Materialize.toast('Debe seleccionar cuantos años espera cotizar', 4000);
                                    return false;
                                } else if (sueldo == null || sueldo.length == 0 || /^\s+$/.test(sueldo)) {
                                    Materialize.toast('El campo del sueldo imponible no puede estar vacío', 4000);
                                    return false;
                                } else if (isNaN(sueldo)) {
                                    Materialize.toast('En el campo del sueldo imponible solo puede ingresar dígitos', 4000);
                                    return false;
                                } else if (sueldo < 301000) {
                                    Materialize.toast('No puede ingresar un sueldo imponible menor a $301.000', 4000);
                                    return false;
                                }
                                return true;
                            }
        </script>
    </body>
</html>
