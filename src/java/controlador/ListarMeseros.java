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
import modelo.GestorMeseroBD;
import modelo.Mesero;

/** 
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "ListarMeseros", urlPatterns = {"/ListarMeseros"})
public class ListarMeseros extends HttpServlet {

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
       
          if(request.getSession().getAttribute("rol") == null)
      if(request.getSession().getAttribute("rol") == null || !request.getSession().getAttribute("rol").equals("Administrador")){
        request.setAttribute("seccion", "Administrador");
        request.getRequestDispatcher("accesoDenegado.jsp").forward(request, response);//Se envia                
        return;
      }
    
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    try {
        
        GestorMeseroBD gestor = new GestorMeseroBD();
        Collection<Mesero> meseros = new ArrayList<>();
        
           // Filtro por nombre
      if (request.getParameter("search") != null) {
        meseros = gestor.getFiltroMesero(request.getParameter("search"));
      
      } else {
        // Sin filtros
        meseros = gestor.getMeseros();
      }

      System.out.println("search: " + request.getParameter("search"));

      if (meseros != null) {
        request.setAttribute("Meseros", meseros);//Se coloca la lista de platillos con el nombre de parámetro "Platillos"
        request.setAttribute("seccion", "meseros");
        request.getRequestDispatcher("/seccionMeseros.jsp").forward(request, response);//Se envia                
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
        processRequest(request, response);
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
