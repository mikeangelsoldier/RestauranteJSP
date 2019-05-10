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
@WebServlet(name = "LoginClientesInvitados", urlPatterns = {"/LoginClientesInvitados"})
public class LoginClientesInvitados extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            GestorClienteBD gestor = new GestorClienteBD();
            Cliente user = gestor.getCliente(1);
            
            HttpSession session = request.getSession();
            session.setAttribute("usr", user);
            response.sendRedirect(request.getContextPath() + "/ListarPlatillosSesion");
        }
    }
}
