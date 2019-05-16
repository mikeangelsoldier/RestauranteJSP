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
import modelo.GestorClienteBD;
import modelo.Cliente;

/**
 *
 * @author Personal
 */
@WebServlet(name = "ActualizarCliente", urlPatterns = {"/ActualizarCliente"})
@MultipartConfig(maxFileSize = 16177216) // 16 MB
public class ActualizarCliente extends HttpServlet {

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
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            
            
            GestorClienteBD gestor = new GestorClienteBD();


            Cliente cliente = new Cliente(id, name, lastname, email, username, password, "Registrado", 1);
            gestor.updateCliente(cliente);
            
            
            request.setAttribute("resInsert", "¡Felicidades! Se ha actualizado el cliente");
            request.getRequestDispatcher("/ListarClientes").forward(request, response);

        } finally {
            out.close();
        }
    }

}
