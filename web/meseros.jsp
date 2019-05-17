<%@page import="modelo.Mesero"%>
<%@page import="modelo.GestorMeseroBD"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Meseros</title>
  <link rel="stylesheet" href="css/stylesAdmin.css">
  <link rel="stylesheet" href="css/modal-styles.css">
  <link rel="stylesheet" href="css/stylesMesero.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
    crossorigin="anonymous">
</head>
<body style="background-color: #ddd">
  <!-- Menú principial -->
  <ul class="nav nav-tabs navbarAdmin">
    <li class="nav-item dropdown" style="float: right">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
        <img src="css/imagenes/mesero.jpg" height="20px" style="border-radius: 50%">
        <span>Mesero: <%= request.getSession().getAttribute("nombreMostrar") %></span>
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">
          <!--i class="fas fa-arrow-circle-right"></i-->
          <img src="css/imagenes/gear.png" height="15px"> Configuración
        </a>
        <a class="dropdown-item" href="#">
          <img src="css/imagenes/star.png" height="15px"> Algo más
        </a>
        <a class="dropdown-item" href="#">
          <img src="css/imagenes/plus.png" height="15px"> Ver algo
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="index_negocio.jsp">
          <img src="css/imagenes/logout.png" height="15px"> Cerrar sesión
        </a>
      </div>
    </li>
    <!--li class="nav-item" style="float: right">
      <button type="button" class="btn btn-primary" style="margin-top: 8px; margin-right: 20px">
        Notificaciones <span class="badge badge-light">4</span>
      </button>
    </li-->
    <li class="nav-item" style="float: right; position: relative;">
      <div class="notification" style="margin-right: 22px;">
        <img src="css/imagenes/notification.png" height="30px" class="notification-icon">
        <span class="badge badge-danger notification-number">4</span>
      </div>
    </li>
  </ul>
  <!-- /Menú principal -->

  <%  
    Mesero meseroSesion = (Mesero) request.getSession().getAttribute("mesero");
    GestorMeseroBD gestorMeseros = new GestorMeseroBD();
    List<Integer> listaMesas = new ArrayList<>();
    listaMesas = gestorMeseros.getMesasMesero(meseroSesion.getId());
  %>
  
  <!-- Lista de mesas -->
  <div class="row" style="margin-top: 60px">
    <div class="col-md-4 container-meseros">
      <h2 class="title">Mesas asignadas</h2>
      <div class="list-group">
        <% 
          for (int numMesa : listaMesas) {
        %>
        <a href="#" class="list-group-item list-group-item-action active">
          Mesa <%= numMesa %>
        </a>
        <% } %>
        
      </div>
    </div>
    <!-- / Lista de mesas -->

    <!-- Mesa seleccionada -->
    <div class="col-md-8 container-meseros">
      <h2>Orden <span class="badge badge-primary">Mesa 1</h2> <br>
        <?php 
          for ($i = 0; $i < 3; $i++) {
        ?>
        <div class="orden-mesero">
          <h4>Orden <?= ($i+1) ?></h4>
          <!-- Platillos en-->
          <?php 
            for ($j = 0; $j < 3; $j++) {
          ?>
          <div class="input-group flex-nowrap" style="margin-bottom: 5px">
            <div class="input-group-prepend">
              <span class="input-group-text" style="background-color: black; color: white" id="addon-wrapping"><?= ($i+1) ?></span>
            </div>
            <label class="platillo-name"> Platillo <?= ($j+1) ?></label>
          </div>
          <?php
            }
          ?>
        </div>
        <?php
          }
        ?>
    </div>
    <!-- / Mesa seleccionada -->
  </div>


  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>
</html>