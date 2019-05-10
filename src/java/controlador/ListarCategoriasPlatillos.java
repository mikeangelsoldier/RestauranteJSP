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
import modelo.CategoriaPlatillo;
import modelo.GestorCategoriaPlatilloBD;
import modelo.GestorPlatilloBD;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ListarCategoriasPlatillos", urlPatterns = {"/ListarCategoriasPlatillos"})
public class ListarCategoriasPlatillos extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Collection <CategoriaPlatillo> categorias = new ArrayList<CategoriaPlatillo>();
            GestorCategoriaPlatilloBD gestorCategoriaPlatilloBD = new GestorCategoriaPlatilloBD();

            categorias = gestorCategoriaPlatilloBD.getCategoriasPlatillos();
            
            if (categorias != null){
                request.setAttribute("Categorias",categorias);//Se coloca la lista de platillos con el nombre de parámetro "Platillos"
                request.getRequestDispatcher("/seccionCategoriaPlatillos.jsp").forward(request, response);//Se envia                
            }else{
                // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

}
