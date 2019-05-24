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

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void service(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
      Collection<Platillo> listaPlatillos = new ArrayList<Platillo>();
      GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();

      // Id de la orden seleccionada
      String fechaInicio="";
      String fechaFinal="";
      String categoria="";

      if (request.getParameter("fechaInicial") != null) {
        fechaInicio=request.getParameter("fechaInicial");
       fechaFinal=request.getParameter("fechaFinal");
       categoria=request.getParameter("categoria");

        
        
        listaPlatillos = gestorPlatilloBD.getFiltroReportePlatillosMasConsumidosEnGeneralEnRangoFechas(fechaInicio,fechaFinal,categoria);
      }

      if (listaPlatillos != null) {
       request.setAttribute("listaPlatillos", listaPlatillos); //Se coloca el num del boton seleccionado

        request.getRequestDispatcher("/meseros.jsp").forward(request, response);//Se envia                
      } else {
        // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
      }
    } finally {
      out.close();
    }
  }

}
