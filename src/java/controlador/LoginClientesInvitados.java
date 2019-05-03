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
import modelo.GestorUsuarioBD;
import modelo.Usuario;

/**
 *
 * @author Personal
 */
@WebServlet(name = "LoginClientesInvitados", urlPatterns = {"/LoginClientesInvitados"})
public class LoginClientesInvitados extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            GestorUsuarioBD gestor = new GestorUsuarioBD();
            Usuario user = new Usuario(0, "", "", "", "Cliente general", "", "1");
            gestor.addUsuario(user);
            
            HttpSession session = request.getSession();
            session.setAttribute("usr", user);
            response.sendRedirect(request.getContextPath() + "/pedidos.jsp");
        }
    }
}