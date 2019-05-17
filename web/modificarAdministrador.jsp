<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar administrador</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
          crossorigin="anonymous">
    </head>
    <body style="background-color: #444">
        <%
            GestorAdministradorBD gestor = new GestorAdministradorBD();

            Administrador administrador = gestor.getAdministrador(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="container">
            <div>
                <form action="ActualizarAdministrador" 
                      method="post" class="modal-content"> <!--enctype="multipart/form-data" -->
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <span style="position: relative">
                                Editar administrador
                                <div style="position: absolute; top: 0; right: -50px">
                                    <input type="hidden" name="id" value="<%= administrador.getId()%>">
                                    <span style="margin-top: 0px" class="badge badge-secondary">
                                        <%= administrador.getId()%> </span>
                                </div>
                            </span>

                        </h4>
                    </div>

                    <div class="modal-body">
                        <div class="row" style="padding: 5px 10px">
                            
                            <div class="form-group col-md-6">
                                <label for="name">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="name" 
                                       name="name" value="<%= administrador.getNombre()%>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="email">Correo electrónico</label>
                                <input type="email" class="form-control" placeholder="Correo electrónico" id="email" 
                                       name="email"  value="<%= administrador.getCorreo() %>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="username">Usuario</label>
                                <input type="text" class="form-control" placeholder="Usuario" id="username" 
                                       name="username" value="<%= administrador.getUsuario()%>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="password">Contraseña</label>
                                <input type="text" class="form-control" placeholder="Contraseña" id="password" 
                                       name="password"  value="<%= administrador.getPassword()%>" required>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <a href="ListarAdministradores" 
                           class="btn btn-secondary">Cancelar</a>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
