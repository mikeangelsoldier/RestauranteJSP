/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CategoriaPlatillo;
import modelo.GestorCategoriaPlatilloBD;
import modelo.GestorOrdenBD;
import modelo.GestorPlatilloBD;
import modelo.GestorSesionServicioBD;
import modelo.Orden;
import modelo.Platillo;
import modelo.SesionServicio;

/**
 *
 * @author Personal
 */
@WebServlet(name = "listarReporteCantidadPlatillosVendidos", urlPatterns = {"/listarReporteCantidadPlatillosVendidos"})
public class listarReporteCantidadPlatillosVendidos extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Collection<Platillo> listaPlatillos = new ArrayList<Platillo>();
            GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();

            // Id de la orden seleccionada
            String fechaInicio = "";
            String fechaFinal = "";
            String categoria = "";

            if (request.getParameter("fechaInicio") != null && request.getParameter("fechaFinal") != null) {
                fechaInicio = request.getParameter("fechaInicio");
                fechaFinal = request.getParameter("fechaFinal");
                categoria = request.getParameter("categoria");
                if(categoria.equals("todos")) {
                    categoria = "";
                }

                listaPlatillos = gestorPlatilloBD.getFiltroReportePlatillosMasConsumidosEnGeneralEnRangoFechas(fechaInicio, fechaFinal, categoria);
            }

            if (listaPlatillos != null) {
                request.setAttribute("listaPlatillos", listaPlatillos); //Se coloca el num del boton seleccionado
                request.setAttribute("fechaInicio", fechaInicio); //Se coloca el num del boton seleccionado
                request.setAttribute("fechaFinal", fechaFinal); //Se coloca el num del boton seleccionado
                request.setAttribute("categoria", categoria); //Se coloca el puntaje

                request.getRequestDispatcher("/seccionReportesPlatillos.jsp").forward(request, response);//Se envia                
            } else {
                // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

}
