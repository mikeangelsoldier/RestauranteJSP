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
import modelo.Cliente;
import modelo.GestorClienteBD;
import modelo.GestorPlatilloBD;
import modelo.Platillo;

@WebServlet(name = "RegistrarPlatillo", urlPatterns = {"/RegistrarPlatillo"})
@MultipartConfig(maxFileSize = 16177216) // 16 MB
public class RegistrarPlatillo extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //Datos recibidos desde la pagina jsp
            Part foto = request.getPart("foto");
            String nombre = request.getParameter("nombre");
            String categoria = request.getParameter("categoria");
            Double precio = Double.parseDouble(request.getParameter("precio"));
            String descripcion = request.getParameter("descripcion");
            
            InputStream imagen = foto.getInputStream();
            // Se crea el objeto y se colocan sus atributos de acuerdo a lo recibido desde la página jsp
            Platillo platillo = new Platillo(0, imagen, nombre, descripcion, precio, categoria, 5, 1, 1);
            
            //Se utiliza el gestor de usuarios para realizar la inserción de este objeto en la BD:
            GestorPlatilloBD gestor = new GestorPlatilloBD();
            gestor.addPlatillo(platillo);

            request.setAttribute("resInsert", "¡Felicidades! Se ha registrado el platillo");
            request.getRequestDispatcher("/ListarPlatillos").forward(request, response);
        } finally {
            out.close();
        }
    }
    
    
}
