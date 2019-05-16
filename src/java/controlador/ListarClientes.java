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
import modelo.Cliente;
import modelo.GestorCategoriaPlatilloBD;
import modelo.GestorClienteBD;
import modelo.GestorPlatilloBD;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ListarClientes", urlPatterns = {"/ListarClientes"})
public class ListarClientes extends HttpServlet {

  protected void service(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
    if(request.getSession().getAttribute("rol") == null)
      if(request.getSession().getAttribute("rol") == null || !request.getSession().getAttribute("rol").equals("Administrador")){
        request.setAttribute("seccion", "Administrador");
        request.getRequestDispatcher("accesoDenegado.jsp").forward(request, response);//Se envia                
        return;
      }
    
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
      
      GestorClienteBD gestor = new GestorClienteBD();
      Collection<Cliente> clientes = new ArrayList<>();

      // Filtro por nombre
      if (request.getParameter("search") != null) {
        clientes = gestor.getFiltroCliente(request.getParameter("search"));
      
      } else {
        // Sin filtros
        clientes = gestor.getClientes();
      }

      System.out.println("search: " + request.getParameter("search"));

      if (clientes != null) {
        request.setAttribute("Clientes", clientes);//Se coloca la lista de platillos con el nombre de parámetro "Platillos"
        request.setAttribute("seccion", "clientes");
        request.getRequestDispatcher("/moduloAdministrador.jsp").forward(request, response);//Se envia                
      } else {
         request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
      }
    } finally {
      out.close();
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
    // Obtenemos los valor que vienen de la URL
    /*String section = request.getParameter("section");
        String subsection = request.getParameter("subsection");
        request.setAttribute("Section",section); //Se coloca la sección con el nombre de parámetro "Section"
        request.setAttribute("Subsection",section); //Se coloca la subsección con el nombre de parámetro "Subsection"*/
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
