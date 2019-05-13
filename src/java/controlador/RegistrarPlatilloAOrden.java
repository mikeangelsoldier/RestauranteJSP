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
import modelo.DetalleOrden;
import modelo.GestorDetalleOrdenBD;
import modelo.GestorOrdenBD;
import modelo.Orden;

/**
 *
 * @author Personal
 */
@WebServlet(name = "RegistrarPlatilloAOrden", urlPatterns = {"/RegistrarPlatilloAOrden"})
public class RegistrarPlatilloAOrden extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                //Datos recibidos desde la pagina jsp
                int idPlatillo = Integer.parseInt(request.getParameter("idPlatillo"));
                int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                int idOrden = Integer.parseInt(request.getParameter("idOrden"));
                
                // Objeto sesion
                DetalleOrden detalleOrden = new DetalleOrden();
                detalleOrden.setFk_orden(idOrden);
                detalleOrden.setFk_platillo(idPlatillo);
                detalleOrden.setCantidad(cantidad);
                
                //Se utiliza el gestor de sesión servicio para realizar la inserción de este objeto en la BD:
                GestorDetalleOrdenBD gestor = new GestorDetalleOrdenBD();
                gestor.addDetalleOrden(detalleOrden);

                // request.setAttribute("resInsert", "¡Felicidades! Se ha creado tu usuario");
                request.getRequestDispatcher("/ListarPlatillosSesion").forward(request, response);
            } finally {
                out.close();
            }
    }

}
