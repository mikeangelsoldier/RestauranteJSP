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
import modelo.Cliente;
import modelo.GestorClienteBD;
import modelo.GestorOrdenBD;
import modelo.GestorSesionServicioBD;
import modelo.Orden;
import modelo.SesionServicio;

/**
 *
 * @author Personal
 */
@WebServlet(name = "RegistrarNuevaOrden", urlPatterns = {"/RegistrarNuevaOrden"})
public class RegistrarNuevaOrden extends HttpServlet {

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
                int idSesionServicio = Integer.parseInt(request.getParameter("idSesionOrden"));

                // Objeto sesion
                Orden orden = new Orden();
                orden.setFk_sesionServicio(idSesionServicio);
                
                //Se utiliza el gestor de sesión servicio para realizar la inserción de este objeto en la BD:
                GestorOrdenBD gestor = new GestorOrdenBD();
                gestor.addNuevaOrden(orden);

                // request.setAttribute("resInsert", "¡Felicidades! Se ha creado tu usuario");
                request.getRequestDispatcher("/ListarPlatillosSesion").forward(request, response);
            } finally {
                out.close();
            }
        }

}
