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
import modelo.CategoriaPlatillo;
import modelo.GestorCategoriaPlatilloBD;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ActualizarCategoriaPlatillo", urlPatterns = {"/ActualizarCategoriaPlatillo"})
public class ActualizarCategoriaPlatillo extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int id = Integer.parseInt(request.getParameter("id"));
            String categoria = request.getParameter("categoria");
            
            CategoriaPlatillo categoriaPlatillo = new CategoriaPlatillo(id, categoria, 1);
            
            GestorCategoriaPlatilloBD gestor = new GestorCategoriaPlatilloBD();
            gestor.updateCategoriaPlatillo(categoriaPlatillo);
            request.setAttribute("resInsert", "¡Felicidades! Se ha modificado la categoría");
            request.getRequestDispatcher("/ListarCategoriasPlatillos").forward(request, response);
        }
    }

}
