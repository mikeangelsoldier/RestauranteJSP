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
@WebServlet(name = "RegistrarCategoriaPlatillo", urlPatterns = {"/RegistrarCategoriaPlatillo"})
public class RegistrarCategoriaPlatillo extends HttpServlet {

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
            String categoria = request.getParameter("categoria");
            
            CategoriaPlatillo categoriaPlatillo = new CategoriaPlatillo(0, categoria, 1);
            
            GestorCategoriaPlatilloBD gestor = new GestorCategoriaPlatilloBD();
            gestor.addCategoriaPlatillo(categoriaPlatillo);
            request.setAttribute("resInsert", "¡Felicidades! Se ha registrado la categoría");
            request.getRequestDispatcher("/ListarCategoriasPlatillos").forward(request, response);
        }
    }

}
