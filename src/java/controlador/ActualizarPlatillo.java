/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.GestorPlatilloBD;
import modelo.Platillo;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ActualizarPlatillo", urlPatterns = {"/ActualizarPlatillo"})
@MultipartConfig(maxFileSize = 16177216) // 16 MB
public class ActualizarPlatillo extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (request.getParameter("guardar") != null) {
            System.out.println("ENTRO GUARDAR");
        } else {
            System.out.println("No entro");
        }
        try {

            //Datos recibidos desde la pagina jsp
            Part foto = request.getPart("foto");
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String categoria = request.getParameter("categoria");
            Double precio = Double.parseDouble(request.getParameter("precio"));
            String descripcion = request.getParameter("descripcion");
            
            InputStream imagen = null;
            if (foto != null) {
                imagen = foto.getInputStream();
            }
            
            GestorPlatilloBD gestor = new GestorPlatilloBD();

            // Se crea el objeto y se colocan sus atributos de acuerdo a lo recibido desde la página jsp
            // Editar con imagen
            String file = imagen+"";

            if (!file.contains("ByteArray")) {
                System.out.println("Con imagen");
                Platillo platillo = new Platillo(id, imagen, nombre, descripcion, precio, categoria);
                gestor.updatePlatillo(platillo);
            } else {
                System.out.println("Sin imagen");
                Platillo platillo = new Platillo(id, nombre, descripcion, precio, categoria);
                gestor.updatePlatilloNoImage(platillo);
            }
            
            request.setAttribute("resInsert", "¡Felicidades! Se ha actualizado el platillo");
            request.getRequestDispatcher("/ListarPlatillos").forward(request, response);

        } finally {
            out.close();
        }
    }

}
