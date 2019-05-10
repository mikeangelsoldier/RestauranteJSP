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
import modelo.GestorPlatilloBD;

/**
 *
 * @author Personal
 */
@WebServlet(name = "EliminarCategoriaPlatillo", urlPatterns = {"/EliminarCategoriaPlatillo"})
public class EliminarCategoriaPlatillo extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            GestorCategoriaPlatilloBD gestor = new GestorCategoriaPlatilloBD();
            gestor.deleteCategoriaPlatillo(id);

            request.setAttribute("resInsert", "Se ha eliminado el platillo");
            request.getRequestDispatcher("/ListarCategoriasPlatillos").forward(request, response);
        }
    }

}
