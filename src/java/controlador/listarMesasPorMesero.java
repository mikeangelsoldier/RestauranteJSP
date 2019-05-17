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
@WebServlet(name = "listarMesasPorMesero", urlPatterns = {"/listarMesasPorMesero"})
public class listarMesasPorMesero extends HttpServlet {

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
      Collection<Orden> ordenes = new ArrayList<Orden>();
      GestorOrdenBD gestorOrden = new GestorOrdenBD();

      GestorSesionServicioBD gestorSesionServicioBD = new GestorSesionServicioBD();

      // Id de la orden seleccionada
      int numMesaSeleccionada = 0;

      int idSesionDeMesaSeleccionada = 0;
      int numBotonSeleccionado = 0;

      if (request.getParameter("numMesaSeleccionada") != null) {
        numMesaSeleccionada = Integer.parseInt(request.getParameter("numMesaSeleccionada"));
        numBotonSeleccionado = Integer.parseInt(request.getParameter("numBotonSeleccionado"));

        SesionServicio sesionServicio = gestorSesionServicioBD.getIdSesionDeUnaMesa(numMesaSeleccionada);
        idSesionDeMesaSeleccionada = sesionServicio.getId();
        
        ordenes = gestorOrden.getOrdenesPorIdSesion(idSesionDeMesaSeleccionada);
      }

      if (ordenes != null) {
        request.setAttribute("ordenesDeMesaSeleccionada",ordenes); //Se coloca la lista de platillos con el nombre de parámetro "Platillos"
        request.setAttribute("numMesaSeleccionada", numMesaSeleccionada); //Se coloca el id de la orden seleccionada
        request.setAttribute("numBotonSeleccionado", numBotonSeleccionado); //Se coloca el num del boton seleccionado

        request.getRequestDispatcher("/meseros.jsp").forward(request, response);//Se envia                
      } else {
        // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
      }
    } finally {
      out.close();
    }
  }

}
