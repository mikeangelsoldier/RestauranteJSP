<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:include page="menuAdministrador.jsp" />
<%
  List<Cliente> clientes = (List<Cliente>) request.getAttribute("Clientes");

%>

<div class="row" style="margin: 60px 10px; z-index: 0;">
  <aside class="menuAdmin" style="z-index: 8;">
    <div class="logo"></div>
    <nav class="row navbar navbar-light">
      <form action="ListarClientes" class="form-inline" method="post"> 
        <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." 
               aria-label="Search" id="searchInput" name="search" value="<% if (request.getParameter("search") != null) out.print(request.getParameter("search")); %>">
        <button class="btn btn-dark my-2 my-sm-0" id="searchButton" type="submit">Buscar</button>
      </form>
    </nav>

  </aside>
  <div class="col-md-3">
  </div>
  <!-- ******* AGREGAR CLIENTE ********* -->
  <div class="agregarItem" data-toggle="modal" data-target="#modalAgregarCliente">
    <img src="css/imagenes/plus.png" height="60px" style="position: fixed; top: 75px; right: 60px; z-index: 5;">
  </div>
  <!-- ******* AGREGAR CLIENTE ********* -->

  <div class="container col-md-9" style="background-color: #eee; width: 90% !important; border-radius: 15px; padding: 20px 20px; padding-top: 80px; ">



    <div class="col-md-12">
      <h2>Clientes</h2>
      <br>
    </div>

    <div class="container-fluid col-md-12 ">
      <table class="table table-responsive" >
        <thead class="thead-dark">
          <tr>
            <th>ID</th>
            <th>Nombre(s)</th>
            <th>Apellidos</th>
            <th>Correo</th>
            <th>Usuario</th>
            <th>Tipo</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <%          for (Cliente cliente : clientes) {
          %>
          <tr>
            <td>
              <%= cliente.getClientId()%>
            </td>
            <td>
              <%= cliente.getName()%>
            </td>
            <td>
              <%= cliente.getLastname()%>
            </td>
            <td>
              <%= cliente.getEmail()%>
            </td>
            <td>
              <%= cliente.getUsername()%>
            </td>
            <td>
              <%= cliente.getType().equals("2") ? "Invitado" : "Registrado"%>
            </td>
            <td >
              <div > 
                <a href="modificarCliente.jsp?id=<%= cliente.getClientId()%>" 
                   class="btn btn-sm btn-primary btn-block d-inline  <%= cliente.getClientId() == 1 ? "disabled" : ""%>" >
                  Editar
                </a>
                &nbsp;
                <a class="btn btn-sm btn-danger btn-block d-inline <%= cliente.getClientId() == 1 ? "disabled" : ""%>" 
                   onclick="return confirm('¿Estás seguro de eliminar este platillo?')"
                   href="EliminarCliente?id=<%= cliente.getClientId()%>">
                  Eliminar
                </a>
              </div>
            </td>
          </tr>
          <% }%>
        </tbody>
      </table>
    </div>
  </div>
  <!-- MODAL AGREGAR-MODIFICAR CLIENTE -->
  <div class="modal fade" id="modalAgregarCliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <form action="RegistrarCliente" method="post" class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalCenterTitle">
            <span style="position: relative">
              Registrar nuevo cliente
              <div style="position: absolute; top: 0; right: -50px">
                <span style="margin-top: 0px" class="badge badge-secondary">
                  1</span>
              </div>
            </span>

          </h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">
          <div class="row" style="padding: 5px 10px">

            <div class="form-group col-md-6">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" placeholder="Nombre" id="nombre" name="name" required>
            </div>

            <div class="form-group col-md-6">
              <label for="nombre">Apellidos</label>
              <input type="text" class="form-control" placeholder="Apellidos" id="nombre" name="lastname" required>
            </div>

            <div class="form-group col-md-6">
              <label for="nombre">Correo electrónico</label>
              <input type="email" class="form-control" placeholder="Correo electrónico" id="nombre" name="email" required>
            </div>

            <div class="form-group col-md-6">
              <label for="nombre">Usuario</label>
              <input type="text" class="form-control" placeholder="Usuario" id="nombre" name="username" required>
            </div>

            <div class="form-group col-md-6">
              <label for="nombre">Contraseña</label>
              <input type="text" class="form-control" placeholder="Contraseña" id="nombre" name="password" required>
            </div>


          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary">Añadir</button>
        </div>
      </form>
    </div>
  </div>
  <!-- / MODAL AGREGAR CLIENTE -->
