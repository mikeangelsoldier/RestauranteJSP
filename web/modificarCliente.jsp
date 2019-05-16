<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar cliente</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
          crossorigin="anonymous">
    </head>
    <body style="background-color: #444">
        <%
            GestorClienteBD gestor = new GestorClienteBD();

            Cliente cliente = gestor.getCliente(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="container">
            <div>
                <form action="ActualizarCliente" 
                      method="post" class="modal-content"> <!--enctype="multipart/form-data" -->
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <span style="position: relative">
                                Editar cliente
                                <div style="position: absolute; top: 0; right: -50px">
                                    <input type="hidden" name="id" value="<%= cliente.getClientId()%>">
                                    <span style="margin-top: 0px" class="badge badge-secondary">
                                        <%= cliente.getClientId()%> </span>
                                </div>
                            </span>

                        </h4>
                    </div>

                    <div class="modal-body">
                        <div class="row" style="padding: 5px 10px">
                            
                            <div class="form-group col-md-6">
                                <label for="name">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre" id="name" 
                                       name="name" value="<%= cliente.getName()%>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="lastname">Apellidos</label>
                                <input type="text" class="form-control" placeholder="Apellidos" id="lastname" 
                                       name="lastname"  value="<%= cliente.getLastname()%>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="email">Correo electrónico</label>
                                <input type="email" class="form-control" placeholder="Correo electrónico" id="email" 
                                       name="email"  value="<%= cliente.getEmail() %>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="username">Usuario</label>
                                <input type="text" class="form-control" placeholder="Usuario" id="username" 
                                       name="username" value="<%= cliente.getUsername()%>" required>
                            </div>
                            
                            <div class="form-group col-md-6">
                                <label for="password">Contraseña</label>
                                <input type="text" class="form-control" placeholder="Contraseña" id="password" 
                                       name="password"  value="<%= cliente.getPassword()%>" required>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <a href="ListarClientes" 
                           class="btn btn-secondary">Cancelar</a>
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
