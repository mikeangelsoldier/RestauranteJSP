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
import modelo.GestorPlatilloBD;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ListarPlatillos", urlPatterns = {"/ListarPlatillos"})
public class ListarPlatillos extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Collection <Platillo> platillos = new ArrayList<Platillo>();
            GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();
            
            // Para los filtros
            if (request.getParameter("filter") != null) {
                
                String filter = request.getParameter("filter");
                switch (filter) {
                    case "Comida":
                        platillos = gestorPlatilloBD.getPlatillosPorCategoria("Comida");
                        System.out.println("Comidas");
                        break;
                    case "Bebida":
                        platillos = gestorPlatilloBD.getPlatillosPorCategoria("Bebida");
                        System.out.println("Bebidas");
                        break;
                    case "Postre":
                        platillos = gestorPlatilloBD.getPlatillosPorCategoria("Postre");
                        System.out.println("Postres");
                        break;
                    default:
                        System.out.println("Todos");
                        platillos = gestorPlatilloBD.getPlatillos();
                }
            } else {
                System.out.println("Todos");
                platillos = gestorPlatilloBD.getPlatillos();
            }
            
            if (platillos != null){
                request.setAttribute("Platillos",platillos);//Se coloca la lista de platillos con el nombre de parámetro "Platillos"
                request.getRequestDispatcher("/moduloAdministrador.jsp").forward(request, response);//Se envia
            }else{
                // request.getRequestDispatcher("/noHayRegistros.jsp").forward(request, response);
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los valor que vienen de la URL
        /*String section = request.getParameter("section");
        String subsection = request.getParameter("subsection");
        request.setAttribute("Section",section); //Se coloca la sección con el nombre de parámetro "Section"
        request.setAttribute("Subsection",section); //Se coloca la subsección con el nombre de parámetro "Subsection"*/
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
