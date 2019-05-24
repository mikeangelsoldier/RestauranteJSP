/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.GestorPlatilloBD;
import modelo.GestorPlatilloDelDiaBD;
import modelo.Platillo;
import modelo.PlatilloDelDia;

/**
 *
 * @author Personal
 */
@WebServlet(name = "AgregarPlatilloDeldia", urlPatterns = {"/AgregarPlatilloDeldia"})
public class AgregarPlatilloDeldia extends HttpServlet {

    
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //Datos recibidos desde la pagina jsp
            int idPlatillo = Integer.parseInt(request.getParameter("idPlatillo"));

            //Se utiliza el gestor de usuarios para realizar la inserción de este objeto en la BD:
            GestorPlatilloDelDiaBD gestorPlatilloDelDiaBD = new GestorPlatilloDelDiaBD();
            List <PlatilloDelDia> listaPlatillosDelDia = gestorPlatilloDelDiaBD.getPlatillosDelDia();
            
            boolean yaExiste = false;

            if (listaPlatillosDelDia.size() < 9) {
                for (PlatilloDelDia platillo : listaPlatillosDelDia) {
                    if (platillo.getIdPlatillo() == idPlatillo) {
                        yaExiste = true;
                    } 
                }
                
                if (!yaExiste) {
                    gestorPlatilloDelDiaBD.addPlatilloDelDia(idPlatillo);
                }
            }

            // request.setAttribute("resInsert", "¡Felicidades! Se ha registrado el platillo");
            request.getRequestDispatcher("/ListarPlatillos").forward(request, response);
        } finally {
            out.close();
        }
    }

}
