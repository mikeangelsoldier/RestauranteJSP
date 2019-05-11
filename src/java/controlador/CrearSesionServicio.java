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
import modelo.Cliente;
import modelo.GestorSesionServicioBD;
import modelo.SesionServicio;

/**
 *
 * @author Personal
 */
@WebServlet(name = "CrearSesionServicio", urlPatterns = {"/CrearSesionServicio"})
public class CrearSesionServicio extends HttpServlet {

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
            int mesa = 0;
            int idMesero = 0;
            if (request.getParameter("mesa") != null) {
                mesa = Integer.parseInt(request.getParameter("mesa"));
            }
            if (request.getParameter("idMesero") != null) {
                idMesero = Integer.parseInt(request.getParameter("idMesero"));
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("sesionNoMesa", mesa);
            session.setAttribute("sesionIdMesero", idMesero);
            
            
            GestorSesionServicioBD gestorServicio = new GestorSesionServicioBD();
            SesionServicio sesionServicio = new SesionServicio();
            
            Cliente cliente = (Cliente)session.getAttribute("usr");
            
            sesionServicio.setFk_cliente(cliente.getClientId());
            sesionServicio.setFk_mesero(idMesero);
            sesionServicio.setNumMesa(mesa);
            
            gestorServicio.addSesionServicio(sesionServicio);
            
            request.getRequestDispatcher("ListarPlatillosSesion").forward(request, response);
        }
    }

    
}
