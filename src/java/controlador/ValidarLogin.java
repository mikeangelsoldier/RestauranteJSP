/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Administrador;
import modelo.GestorAdministradorBD;

/**
 *
 * @author alfredo
 */
@WebServlet(name = "ValidarLogin", urlPatterns = {"/ValidarLogin"})
public class ValidarLogin extends HttpServlet {

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
      /* TODO output your page here. You may use following sample code. */
      switch(request.getParameter("tipoLogin")){
        case "loginAdministrador": 
          GestorAdministradorBD gestor = new GestorAdministradorBD();
          Administrador administrador = gestor.getAdministradorLogin(request.getParameter("usuario"), request.getParameter("password"));
          if(administrador.getUsuario() != null){
            
            
            
            request.getSession().setAttribute("usuario", administrador.getUsuario());
            request.getSession().setAttribute("nombreMostrar", administrador.getNombre());
            request.getSession().setAttribute("rol", "Administrador");
            request.getRequestDispatcher("ListarPlatillos").forward(request, response);
          }else{
            request.getRequestDispatcher("/loginAdministrador.jsp").forward(request, response);
          }
          break;
      }
    }
  }


  

}
