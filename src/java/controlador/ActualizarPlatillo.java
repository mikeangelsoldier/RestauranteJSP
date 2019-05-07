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
public class ActualizarPlatillo extends HttpServlet {

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
            
            
            //Part foto;
            //InputStream imagen = null;

            //foto = request.getPart("foto2");
            //imagen = foto.getInputStream();
            
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre2");
            String categoria = request.getParameter("categoria2");
            Double precio = Double.parseDouble(request.getParameter("precio2"));
            String descripcion = request.getParameter("descripcion2");
            System.out.println("Nombre:" + nombre);
            System.out.println("Descripcion:" + descripcion);
            GestorPlatilloBD gestor = new GestorPlatilloBD();
            
            // Se crea el objeto y se colocan sus atributos de acuerdo a lo recibido desde la página jsp
            // Editar con imagen
            /*if (imagen != null) {
                Platillo platillo = new Platillo(id, imagen, nombre, descripcion, precio, categoria, 5, 1, 1);
                gestor.updatePlatillo(platillo);
            } else {*/
                Platillo platillo = new Platillo(id, nombre, descripcion, precio, categoria);
                gestor.updatePlatilloNoImage(platillo);
            //}
            
            request.setAttribute("resInsert", "¡Felicidades! Se ha actualizado el platillo");
            request.getRequestDispatcher("/ListarPlatillos").forward(request, response);

        } finally {
            out.close();
        }
    }

}
