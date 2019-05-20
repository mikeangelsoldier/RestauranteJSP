/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;

/**
 *
 * @author alfredo
 */
@WebServlet(name = "ProcesarPuntuaciones", urlPatterns = {"/ProcesarPuntuaciones"})
public class ProcesarPuntuaciones extends HttpServlet {

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
    try (PrintWriter out = response.getWriter()) {

      ArrayList<Platillo> listaPlatillosSinRepetir = (ArrayList<Platillo>)request.getSession().getAttribute("listaPlatillosSinRepetir");
      String totalSesionForm = request.getParameter("totalSesionForm");

      int idMesero = (int) request.getSession().getAttribute("sesionIdMesero");
      GestorMeseroBD gestorMesero = new GestorMeseroBD();
      Mesero mesero = gestorMesero.getMesero(idMesero);
      Mesero mesero2 = new Mesero();
      int idSesion = (int) request.getSession().getAttribute("idSesion_http");
      double puntajeMesero = 0;

      if (request.getParameter("puntaje1") != null) {
        puntajeMesero = Double.parseDouble(request.getParameter("puntaje1"));
        GestorSesionServicioBD gestorSesionServicioBD = new GestorSesionServicioBD();
        SesionServicio sesionServicio = gestorSesionServicioBD.getSesionPorID(idSesion);
        sesionServicio.setPuntajeMeseroServicio(puntajeMesero);

        /*Actualizar el promedio de puntaje del mesero de la sesión*/
        double puntuacionAnterior = mesero.getPuntuacionTotal();
        int cantidadPuntuaciones = mesero.getNumPuntuaciones();
        double puntuacionTotalNueva = ((puntuacionAnterior * cantidadPuntuaciones) + puntajeMesero) / (cantidadPuntuaciones + 1);
        mesero2.setId(idMesero);
        mesero2.setPuntuacionTotal(puntuacionTotalNueva);
        mesero2.setNumPuntuaciones(cantidadPuntuaciones + 1);
          
        gestorMesero.updatePuntaje(mesero2);

      }
      /*Fin de puntuar Mesero*/

 /*Actualizar el promedio de puntaje los platillos sin repetir*/
      GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();
      double puntajePlatillo = 0;
      for (int i = 0; i < listaPlatillosSinRepetir.size(); i++) {
        if (request.getParameter("puntaje" + (i + 2)) != null) {
          puntajePlatillo = Double.parseDouble(request.getParameter("puntaje" + (i + 2)));

          double puntuacionAnteriorPlatillo = listaPlatillosSinRepetir.get(i).getPuntuacionTotal();
          int cantidadPuntuacionesPlatillo = listaPlatillosSinRepetir.get(i).getNumeroPuntuaciones();
          double puntuacionTotalNuevaPlatillo = ((puntuacionAnteriorPlatillo * cantidadPuntuacionesPlatillo) + puntajePlatillo) / (cantidadPuntuacionesPlatillo + 1);
          Platillo platillo = new Platillo();
          platillo.setId(listaPlatillosSinRepetir.get(i).getId());
          platillo.setPuntuacionTotal(puntuacionTotalNuevaPlatillo);
          platillo.setNumeroPuntuaciones(cantidadPuntuacionesPlatillo + 1);

          gestorPlatilloBD.updatePuntaje(platillo);

        }

      }
      
      request.setAttribute("totalSesion", totalSesionForm);
      request.getRequestDispatcher("pagar.jsp").forward(request, response);
    }
  }

}
