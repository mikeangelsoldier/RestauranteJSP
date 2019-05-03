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
import modelo.GestorClienteBD;
import modelo.Cliente;

/**
 *
 * @author Personal
 */
@WebServlet(name = "LoginClientes", urlPatterns = {"/LoginClientes"})
public class LoginClientes extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            GestorClienteBD gestor = new GestorClienteBD();
            Cliente user = gestor.getClienteLogin(username, password);
            
            if (user.getClientId() > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("usr", user);
                response.sendRedirect(request.getContextPath() + "/pedidos.jsp");
            } else {
                request.setAttribute("resLogin", "El usuario y contraseña no coinciden");
                // response.sendRedirect(request.getContextPath() + "/loginClientes.jsp");
                request.getRequestDispatcher("/loginClientes.jsp").forward(request, response);
            }
            
        }
    }
}
