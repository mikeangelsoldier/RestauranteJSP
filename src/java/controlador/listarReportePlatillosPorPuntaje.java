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
@WebServlet(name = "listarReportePlatillosPorPuntaje", urlPatterns = {"/listarReportePlatillosPorPuntaje"})
public class listarReportePlatillosPorPuntaje extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Collection<Platillo> listaPlatillos = new ArrayList<Platillo>();
            GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();

            // Id de la orden seleccionada
            String puntaje = "";
            String categoria = "";

            
                puntaje = request.getParameter("puntaje");
                categoria = request.getParameter("categoria");
                if(puntaje.equals("todos")) {
                    puntaje = "";
                }
                if(categoria.equals("todos")) {
                    categoria = "";
                }

                listaPlatillos = gestorPlatilloBD.getListaPlatillosPuntaje(puntaje, categoria);
           

            if (listaPlatillos != null) {
                request.setAttribute("listaPlatillos", listaPlatillos); //Se coloca el num del boton seleccionado
                request.setAttribute("puntaje", puntaje); //Se coloca el puntaje
                request.setAttribute("categoria", categoria); //Se coloca el puntaje

                request.getRequestDispatcher("/seccionReportesPlatillosPorPuntaje.jsp").forward(request, response);//Se envia                
            } else {
                // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

}
