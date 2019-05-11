<%-- 
    Document   : accesoDenegado
    Created on : 10-may-2019, 20:29:06
    Author     : alfredo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html class="no-js">
  <!--<![endif]-->

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  </head>
  <% 
    String ruta = "";
    if(request.getAttribute("seccion").equals("Cliente")){
      ruta = "index.jsp";
    }else{
      ruta = "index_negocio.jsp";
    }
  %>
  <body>

    <!-- Modal -->
    <div class="modal fade" id="modalDenegado" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <img class="card-img-top" src="css/imagenes/accesoDenegado.png" alt="Card image cap">

            <h4 class="modal-title">Acceso denegado</h4>
          </div>
          <div class="modal-body">
            <p>No tienes permiso para ver esta página. Por favor inicia sesión</p>
          </div>
          <div class="modal-footer">
            <a href="<% out.print(ruta); %>" class="btn btn-primary">Iniciar sesión</a>
          </div>
        </div>

      </div>
    </div>
  </body>
  <script>
    window.onload = function () {
      $('#modalDenegado').modal('show');
    }


  </script>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
  crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
  crossorigin="anonymous"></script>

</html>
