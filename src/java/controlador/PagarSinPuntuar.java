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

/**
 *
 * @author Personal
 */
@WebServlet(name = "PagarSinPuntuar", urlPatterns = {"/PagarSinPuntuar"})
public class PagarSinPuntuar extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String totalSesionForm = request.getParameter("totalSesionForm");
            request.setAttribute("totalSesion", totalSesionForm);
            request.getRequestDispatcher("pagar.jsp").forward(request, response);
        }
    }

}
