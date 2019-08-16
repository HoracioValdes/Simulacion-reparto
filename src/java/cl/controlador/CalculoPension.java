/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Horacio
 */
@WebServlet(name = "CalculoPension", urlPatterns = {"/calculo.do"})
public class CalculoPension extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CalculoPension</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CalculoPension at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        log("holi");
        
        Double ufRecogida = Double.parseDouble(request.getParameter("hiddenField"));
        
        log(ufRecogida.toString());
        
        //Variables de mensajes
        String errores = "", msg = "", explicacion = "";

        //Se recuperan los parámetros desde la petición.
        String sexo = "";
        
        if (request.getParameter("optSexo") != null) {
            sexo = request.getParameter("optSexo");
        }
        String aniosCotizacionCadena = "";
        if (request.getParameter("cboAniosCotizacion") != null) {
            aniosCotizacionCadena = request.getParameter("cboAniosCotizacion");
        }
        String sueldoImponibleCadena = request.getParameter("txtSueldoImponible");
        
        //Formato de montos
        DecimalFormatSymbols simbolo = new DecimalFormatSymbols();
        simbolo.setDecimalSeparator(',');
        simbolo.setGroupingSeparator('.');
        DecimalFormat formatea = new DecimalFormat("###,###.##");

        //Variables que recibirán los valores de cálculo
        double aniosCotizacion = 0;
        double sueldoImponible = 0;
        double sueldoMinimo = 301000;
        double porcentajeSalarioMinimo = 100;
        double tasaReemplazo = 10;
        double pensionMaximaContributiva = 0;
        double pensionMinimaGarantizada = 0;
        double pension;

        //Validación de datos de formulario
        if (sexo.isEmpty()) {
            errores = "<br/>Debes seleccionar si eres mujer u hombre. <br/>";
        }
        if (aniosCotizacionCadena.isEmpty()) {
            errores += "<br/>Debes seleccionar cuantos años de cotización tendrías a tu favor. <br />";
        } else {
            aniosCotizacion = Integer.parseInt(aniosCotizacionCadena);
        }
        if (sueldoImponibleCadena.isEmpty()) {
            errores += "<br/>Debes indicar cual sería el promedio de tu sueldo imponible durante los último 10 años de trabajo, o duante los últimos años de trabajo, en el caso de que cotices menos de 10 años. <br />";
        } else {
            //Validación de valor numérico
            boolean confirmacion;
            try {
                Integer.parseInt(sueldoImponibleCadena);
                confirmacion = true;
            } catch (Exception e) {
                confirmacion = false;
            }

            if (!confirmacion) {
                errores += "<br/>Debes ingresar un valor numérico en tu promedio de sueldo imponible. <br />";
            } else {
                sueldoImponible = Integer.parseInt(sueldoImponibleCadena);
            }

        }

        //Cálculo de años cotizados para mujeres
        if (sexo.equalsIgnoreCase("mujer") && aniosCotizacion > 4) {
            if (aniosCotizacion < 10) {
                aniosCotizacion = aniosCotizacion + 2;
                explicacion += "<br/>Por ser mujer y haber cotizado entre 5 y 9 años, se agregan 2 años extras de cotización a tu previsión. <br/>";
            } else {
                aniosCotizacion = aniosCotizacion + 5;
                explicacion += "<br/>Por ser mujer y haber cotizado 10 o más años, se agregan 5 años extras de cotización a tu previsión. <br/>";
            }
        }

        //Aclaración de máximo de cotización
        if (aniosCotizacion >= 40) {
            explicacion += "<br/>Usted, por sus años cotizados (40 años o más), ha alcanzado el máximo de tasa de reemplazo del cálculo de su pensión (80%). </br>";
        }

        //Aclaración de máximo de porcentaje de sueldo mínimo
        if (aniosCotizacion > 14) {
            explicacion += "<br/>Usted, por sus años cotizados (15 años o más), ha alcanzado el máximo porcentual del sueldo mínimo para ajustar su pensión. </br>";
        }

        //Cálculo según años cotizados
        int x = 1;
        while (x <= (int) aniosCotizacion) {
            //Incremento porcentaje salario mínimo
            if (porcentajeSalarioMinimo < 140) {
                porcentajeSalarioMinimo += 2.5;
            }
            
            if (x == 17) {
                porcentajeSalarioMinimo -= 1;
            }
            
            //Segundo incremento porcentaje salario mínimo
            if (porcentajeSalarioMinimo >= 140 && porcentajeSalarioMinimo < 164) {
                porcentajeSalarioMinimo += 1;
            }

            //Incremento tasa de reemplazo
            if (tasaReemplazo < 70) {
                tasaReemplazo += 2;
            } else {
                if (tasaReemplazo < 80) {
                    tasaReemplazo += 1;
                }
            }

            x++;
        }

        String tasaReemplazoCadena = (formatea.format(tasaReemplazo)).toString();
        String tasaReemplazoCadenaFinal = tasaReemplazoCadena.replaceAll(",", ".");
        
        explicacion += "<br/>Su tasa de reemplazo es de " + tasaReemplazoCadenaFinal + "%.<br/>";
        explicacion += "<br/>El porcentaje para la pensión mínima garantizada, respecto al sueldo mínimo es de " + porcentajeSalarioMinimo + "%.<br/>";

        //Cálculo de pensión máxima contributiva y pensión mínima garantizada
        
        //double uf = 27892.17;
        //pensionMaximaContributiva = 100 * uf * (tasaReemplazo / 100);
        pensionMaximaContributiva = 100 * ufRecogida * (tasaReemplazo / 100);
        pensionMinimaGarantizada = sueldoMinimo * (porcentajeSalarioMinimo / 100);
        
        String pensionMaximaContributivaCadena = (formatea.format(Math.round(pensionMaximaContributiva))).toString();
        String pensionMaximaContributivaCadenaFinal = pensionMaximaContributivaCadena.replaceAll(",", ".");
        String pensionMinimaGarantizadaCadena = (formatea.format(Math.round(pensionMinimaGarantizada))).toString();
        String pensionMinimaGarantizadaCadenaFinal = pensionMinimaGarantizadaCadena.replaceAll(",", ".");

        explicacion += "<br/>La pensión máxima contributiva, según la tasa de reemplazo y sus años cotizados es de $ " + pensionMaximaContributivaCadenaFinal + "<br/>";
        explicacion += "<br/>La pensión mínima garantizada, según el porcentaje de salario mínimo y sus años cotizados es de $ " + pensionMinimaGarantizadaCadenaFinal + "<br/>";

        //Cálculo de pensión
        pension = (tasaReemplazo/100) * sueldoImponible;
        String pensionCadena = (formatea.format(Math.round(pension))).toString();
        String pensionCadenaFinal = pensionCadena.replaceAll(",", ".");

        if (pension > pensionMaximaContributiva) {
            pension = pensionMaximaContributiva;
            explicacion += "<br/>El cálculo de su pensión excede la pensión máxima contributiva, por lo que su pensión será igual a esta.<br/>";
            msg += "<br/>Su pensión es de <b>$ " + pensionMaximaContributivaCadenaFinal + "</b>.<br/>";
        } else {
            if (pension < pensionMinimaGarantizada) {
                pension = pensionMinimaGarantizada;
                explicacion += "<br/>El cálculo de su pensión está por debajo de la pensión mínima garantizada, por lo que su pensión será igual a esta.<br/>";
                msg += "<br/>Su pensión es de <b>$ " + pensionMinimaGarantizadaCadenaFinal + "</b>.<br/>";
            }else{
                msg += "<br/>Su pensión es de <b>$ " + pensionCadenaFinal + "</b>.<br/>";
            }
        }

        if (errores.isEmpty()) {//Están los datos para registrar al usuario-
            request.setAttribute("msg", msg);
            request.setAttribute("explicacion", explicacion);
        } else { //Devolver la petición al formulario.
            request.setAttribute("msg", errores);
        }

        //Forwarding al index
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
