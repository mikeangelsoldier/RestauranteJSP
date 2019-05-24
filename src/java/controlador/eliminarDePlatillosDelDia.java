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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.CategoriaPlatillo;
import modelo.GestorCategoriaPlatilloBD;
import modelo.GestorPlatilloBD;
import modelo.GestorPlatilloDelDiaBD;
import modelo.Platillo;
import modelo.PlatilloDelDia;

/**
 *
 * @author Personal
 */
@WebServlet(name = "eliminarDePlatillosDelDia", urlPatterns = {"/eliminarDePlatillosDelDia"})
public class eliminarDePlatillosDelDia extends HttpServlet {

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
            //Datos recibidos desde la pagina jsp
            int idRegistro = Integer.parseInt(request.getParameter("idPlatillo"));

            //Se utiliza el gestor de usuarios para realizar la inserción de este objeto en la BD:
            GestorPlatilloDelDiaBD gestorPlatilloDelDiaBD = new GestorPlatilloDelDiaBD();
            gestorPlatilloDelDiaBD.deletePlatillosDelDia(idRegistro);
            
           
            // request.setAttribute("resInsert", "¡Felicidades! Se ha registrado el platillo");
            request.getRequestDispatcher("/ListarPlatillos?filter=platillosDelDia").forward(request, response);
        } finally {
            out.close();
        }
    }

}
