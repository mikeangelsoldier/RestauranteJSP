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
import modelo.GestorPlatilloBD;

/**
 *
 * @author Personal
 */
@WebServlet(name = "EliminarPlatillo", urlPatterns = {"/EliminarPlatillo"})
public class EliminarPlatillo extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            GestorPlatilloBD gestor = new GestorPlatilloBD();
            gestor.DeletePlatillo(id);

            request.setAttribute("resInsert", "¡Felicidades! Se ha eliminado el platillo");
            request.getRequestDispatcher("/ListarPlatillos").forward(request, response);
        } finally {
            out.close();
        }
    }
}
