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
@WebServlet(name = "listarReporteVentas", urlPatterns = {"/listarReporteVentas"})
public class listarReporteVentas extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Collection<SesionServicio> listaSesionServicio = new ArrayList<>();
            GestorSesionServicioBD gestorSesionServicioBD = new GestorSesionServicioBD();

            // Id de la orden seleccionada
            String fechaInicio = "";
            String fechaFinal = "";
            String idCliente = "";
            String idMesero = "";

            if (request.getParameter("fechaInicio") != null && request.getParameter("fechaFinal") != null) {
                fechaInicio = request.getParameter("fechaInicio");
                fechaFinal = request.getParameter("fechaFinal");
                idCliente = request.getParameter("idCliente");
                idMesero = request.getParameter("idMesero");
                
                if(idCliente.equals("todos")) {
                    idCliente = "";
                }
                if(idMesero.equals("todos")) {
                    idMesero = "";
                }

                listaSesionServicio = gestorSesionServicioBD.getFiltroReporteVentaConNombres(fechaInicio, fechaFinal, idMesero, idCliente);
            }

            if (listaSesionServicio != null) {
                request.setAttribute("listaSesiones", listaSesionServicio); //Se coloca el num del boton seleccionado
                request.setAttribute("fechaInicio", fechaInicio); //Se coloca el num del boton seleccionado
                request.setAttribute("fechaFinal", fechaFinal); //Se coloca el num del boton seleccionado

                request.getRequestDispatcher("/seccionReportesVentas.jsp").forward(request, response);//Se envia                
            } else {
                // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

}
