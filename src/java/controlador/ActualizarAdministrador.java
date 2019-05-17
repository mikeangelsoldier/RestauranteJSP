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
import modelo.GestorAdministradorBD;
import modelo.Administrador;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ActualizarAdministrador", urlPatterns = {"/ActualizarAdministrador"})
@MultipartConfig(maxFileSize = 16177216) // 16 MB
public class ActualizarAdministrador extends HttpServlet {

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
            
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            
            GestorAdministradorBD gestor = new GestorAdministradorBD();


            Administrador administrador = new Administrador(id, name, email, username, password, 1);
            gestor.updateAdministrador(administrador);
            
            
            request.setAttribute("resInsert", "¡Felicidades! Se ha actualizado el administrador");
            request.getRequestDispatcher("/ListarAdministradores").forward(request, response);

        } finally {
            out.close();
        }
    }

}
