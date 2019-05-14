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
import modelo.GestorCategoriaPlatilloBD;
import modelo.GestorDetalleOrdenBD;

/**
 *
 * @author Personal
 */
@WebServlet(name = "EliminarPlatilloDeOrdenActual", urlPatterns = {"/EliminarPlatilloDeOrdenActual"})
public class EliminarPlatilloDeOrdenActual extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int idDetalleOrden = Integer.parseInt(request.getParameter("idDetalleOrden"));
            GestorDetalleOrdenBD gestor = new GestorDetalleOrdenBD();
            gestor.deleteDetOrden(idDetalleOrden);

            // request.setAttribute("resInsert", "Se ha eliminado el platillo");
            request.getRequestDispatcher("/ListarPlatillosSesion").forward(request, response);
        }
    }

}
