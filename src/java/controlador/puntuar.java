/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.DetalleOrden;
import modelo.GestorDetalleOrdenBD;
import modelo.GestorOrdenBD;
import modelo.GestorPlatilloBD;
import modelo.Orden;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "puntuar", urlPatterns = {"/puntuar"})
public class puntuar extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            // Id de la orden seleccionada
            Double totalSesion = 0.0;
            System.out.println("ENTRANDO AL SERVLET PUNTUAR");
            int idSesion = (int)request.getSession().getAttribute("idSesion_http");
            // int idMesero = (int)request.getSession().getAttribute("sesionIdMesero");
            // Cliente cliente = (Cliente)request.getSession().getAttribute("usr");
            List<Platillo> listaPlatillosDeLaSesion = null;
            
            if (request.getParameter("totalSesion") != null) {
                totalSesion = Double.parseDouble(request.getParameter("totalSesion"));

                GestorPlatilloBD gestorPlatillo = new GestorPlatilloBD();
                listaPlatillosDeLaSesion = gestorPlatillo.getPlatillosDeUnaSesion(idSesion);
                
            } 

            
            request.setAttribute("totalSesion",totalSesion); //Se coloca el total de la sesión
            request.setAttribute("listaPlatillosDeLaSesion",listaPlatillosDeLaSesion); //Se manda la lista de los platillos sin repetir

            request.getRequestDispatcher("/puntuar.jsp").forward(request, response);//Se envia                
           
        } finally {
            out.close();
        }
    }

}
