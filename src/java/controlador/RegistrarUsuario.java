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
import modelo.GestorClienteBD;
import modelo.Cliente;

/**
 *
 * @author Personal
 */
@WebServlet(name = "RegistrarUsuario", urlPatterns = {"/RegistrarUsuario"})
public class RegistrarUsuario extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //Datos recibidos desde la pagina jsp
            String name = request.getParameter("name");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            //Se crea el objeto y se colocan sus atributos de acuerdo a lo recibido desde la página jsp
            Cliente user = new Cliente(0, name, lastname, email, username, password, "2",1);
            
            //Se utiliza el gestor de usuarios para realizar la inserción de este objeto en la BD:
            GestorClienteBD gestor = new GestorClienteBD();
            gestor.addCliente(user);

            request.setAttribute("resInsert", "¡Felicidades! Se ha creado tu usuario");
            request.getRequestDispatcher("/loginClientes.jsp").forward(request, response);
        } finally {
            out.close();
        }
    }

}
