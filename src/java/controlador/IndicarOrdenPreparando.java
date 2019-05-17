/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.GestorOrdenBD;
import modelo.GestorPlatilloBD;
import modelo.Orden;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "IndicarOrdenPreparando", urlPatterns = {"/IndicarOrdenPreparando"})
public class IndicarOrdenPreparando extends HttpServlet {

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
            String idOrdenSeleccionada = null;

            int idOrden = 0;
            int numBotonSeleccionado=0;
            if (request.getParameter("idOrdenSeleccionada") != null) {
                idOrden = Integer.parseInt(request.getParameter("idOrdenSeleccionada"));
                numBotonSeleccionado=Integer.parseInt(request.getParameter("numBotonSeleccionado"));
                
                GestorOrdenBD gestorOrden = new GestorOrdenBD();
                gestorOrden.indicarOrdenEnPreparacion(idOrden);
            } 

            
            //request.setAttribute("idOrdenSeleccionadaRespuesta",idOrden); //Se coloca el id de la orden seleccionada
            //request.setAttribute("numBotonSeleccionado",numBotonSeleccionado); //Se coloca el num del boton seleccionado

            request.getRequestDispatcher("/listarPlatillosPorOrdenEnCocina?idOrdenSeleccionada="+idOrden+"&numBotonSeleccionado="+numBotonSeleccionado).forward(request, response);//Se envia                
           
        } finally {
            out.close();
        }
    }

}
