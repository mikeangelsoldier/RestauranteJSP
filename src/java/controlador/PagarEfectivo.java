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
import javax.servlet.http.HttpSession;
import modelo.GestorSesionServicioBD;
import modelo.Platillo;
import modelo.SesionServicio;

/**
 *
 * @author Personal
 */
@WebServlet(name = "PagarEfectivo", urlPatterns = {"/PagarEfectivo"})
public class PagarEfectivo extends HttpServlet {

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
            String totalSesion = null;
            //String metodoPago = null;
            
            int idSesion = (int)request.getSession().getAttribute("idSesion_http");
            
            // List<Platillo> listaPlatillosDeLaSesion = null;
            System.out.println("Total en servlet pagarEfectivo: " + request.getParameter("totalSesion"));
            if (request.getParameter("totalSesion") != null) {
                // totalSesion = Double.parseDouble(request.getParameter("totalSesion"));
                totalSesion = request.getParameter("totalSesion");
                // metodoPago = request.getParameter("metodoPago");
                
                
                GestorSesionServicioBD gestorSesionServicioBD = new GestorSesionServicioBD();
                SesionServicio sesionServicio = new SesionServicio();
                sesionServicio.setId(idSesion);
                sesionServicio.setTotalVenta(Double.parseDouble(totalSesion));
                sesionServicio.setTipoPago("EFECTIVO");
                
                gestorSesionServicioBD.updateTotalVentaYTipoPagoSesion(sesionServicio);
                gestorSesionServicioBD.colocarFechaActualPagoSesionServicio(idSesion);
                
            } 

            HttpSession session = request.getSession();
            session.invalidate();
            request.getRequestDispatcher("/index.jsp").forward(request, response);//Se envia                
           
        } finally {
            out.close();
        }
    }

}
