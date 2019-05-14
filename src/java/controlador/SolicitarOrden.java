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
import modelo.GestorOrdenBD;
import modelo.Orden;

/**
 *
 * @author Personal
 */
@WebServlet(name = "SolicitarOrden", urlPatterns = {"/SolicitarOrden"})
public class SolicitarOrden extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try {
                //Datos recibidos desde la pagina jsp
                int idOrden = Integer.parseInt(request.getParameter("idOrden"));

                //Se utiliza el gestor de sesión servicio para realizar la inserción de este objeto en la BD:
                GestorOrdenBD gestor = new GestorOrdenBD();
                gestor.indicarSolicitarOrden(idOrden);

                // request.setAttribute("resInsert", "¡Felicidades! Se ha creado tu usuario");
                request.getRequestDispatcher("/ListarPlatillosSesion").forward(request, response);
            } finally {
                out.close();
            }
    }

}
