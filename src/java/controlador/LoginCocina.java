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
@WebServlet(name = "LoginCocina", urlPatterns = {"/LoginCocina"})
public class LoginCocina extends HttpServlet {

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
            String clave = request.getParameter("clave");
            
            // GestorCocinaBD cocina = new GestorCocinaBD();
            // claveBD = cocina.getClaveAcceso(clave);
            if (clave.equals("claveBD")) {
                request.getRequestDispatcher("/cocina.jsp").forward(request, response);
            } else {
                request.setAttribute("resClave", "¡Error, clave incorrecta!");
            }
            
        }
    }

}
