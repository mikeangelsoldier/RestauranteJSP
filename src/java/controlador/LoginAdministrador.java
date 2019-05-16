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
import modelo.GestorClienteBD;
import modelo.Cliente;
import modelo.GestorAdministradorBD;

/**
 *
 * @author Personal
 */
@WebServlet(name = "LoginAdministrador", urlPatterns = {"/LoginAdministrador"})
public class LoginAdministrador extends HttpServlet {

  protected void service(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      /* TODO output your page here. You may use following sample code. */
      String username = request.getParameter("usuario");
      String password = request.getParameter("password");
      GestorAdministradorBD gestor = new GestorAdministradorBD();
      Administrador administrador = gestor.getAdministradorLogin(username, password);

      if (administrador.getId() > 0) {
        request.getSession().setAttribute("usuario", administrador.getUsuario());
        request.getSession().setAttribute("nombreMostrar", administrador.getNombre());
        request.getSession().setAttribute("rol", "Administrador");
        request.getRequestDispatcher("ListarPlatillos").forward(request, response);
      } else {
        request.setAttribute("resLogin", "El usuario y contraseña no coinciden");
        // response.sendRedirect(request.getContextPath() + "/loginClientes.jsp");
        request.getRequestDispatcher("/loginAdministrador.jsp").forward(request, response);
      }

    }
  }
}
