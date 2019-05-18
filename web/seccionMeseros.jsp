<%@page import="modelo.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meseros</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: #ddd">
        <jsp:include page="menuAdministrador.jsp" />
        
        <% List<Mesero> meseros = (List<Mesero>) request.getAttribute("Meseros");   %>
        
     
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
  <div class="agregarItem" data-toggle="modal" data-target="#modalAgregarMesero">
    <img src="css/imagenes/plus.png" height="60px" style="position: fixed; top: 75px; right: 60px; z-index: 5;">
  </div>
  <!-- ******* AGREGAR CLIENTE ********* -->

  <div class="container col-md-9" style="background-color: #eee; width: 90% !important; border-radius: 15px; padding: 20px 20px; padding-top: 80px; ">



    <div class="col-md-12">
      <h2>Meseros</h2>
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
            <th>Puntacion total</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
           <%          for (Mesero mesero : meseros) {
               
           double puntuacion = mesero.getPuntuacionTotal();    
           boolean tieneDecimal = false;
           
       
           
          %>
          <tr>
               <td>
              <%= mesero.getId()  %>
            </td>
              <td>
              <%= mesero.getNombre()%>
            </td>
              <td>
              <%= mesero.getApellidos()  %>
            </td>
              <td>
              <%= mesero.getCorreo()%>
            </td>
                <td>
              <%= mesero.getUsuario()%>
            </td>
             <td>
                 <%
                     for (int i=0; i<puntuacion; i++){
               %>
             <img src="css/imagenes/star.png" height="20px" style="display: inline">
               <%
                }
                 %>
           
            </td>
           
            <td > 
              <div >
                  <a href="modificarMesero.jsp?id=<%= mesero.getId()%>" class="btn btn-sm btn-primary btn-block d-inline">Editar</a>
                &nbsp;
                <a class="btn btn-sm btn-danger btn-block d-inline"
                   onclick="return confirm('¿Estás seguro de eliminar este mesero?')"
                   href="EliminarMesero?id=<%= mesero.getId()  %>">
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
<!--Agregar modificar meseros-->

<div class="modal fade" id="modalAgregarMesero" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <form action="RegistrarMesero" method="post" class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalCenterTitle">
            <span style="position: relative">
              Registrar nuevo mesero
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
              <input type="text" class="form-control" placeholder="Correo electrónico" id="nombre" name="email" required>
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
        
        
       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
