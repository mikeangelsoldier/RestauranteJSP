<%@page import="modelo.GestorOrdenBD"%>
<%@page import="modelo.Orden"%>
<%@page import="java.util.Collection"%>
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
          <span>Mesero: <%= request.getSession().getAttribute("nombreMostrar")%></span>
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
      /*Mesero meseroSesion = (Mesero) request.getSession().getAttribute("mesero");
      GestorMeseroBD gestorMeseros = new GestorMeseroBD();
      List<Integer> listaMesas = new ArrayList<>();
      listaMesas = gestorMeseros.getMesasMesero(meseroSesion.getId());

      int idMesaSeleccionada = Integer.parseInt(request.getAttribute("idMesaSeleccionada").toString());
       */
    %> 

    <!-- Lista de mesas -->
    <div class="row" style="margin: 40px">
      <%
        Mesero meseroSesion = (Mesero) request.getSession().getAttribute("mesero");//Mesero que inició sesión
        GestorMeseroBD gestorMeseros = new GestorMeseroBD();
        List<Integer> listaMesas = gestorMeseros.getMesasMesero(meseroSesion.getId());

        int idMesaSeleccionada = Integer.parseInt(request.getAttribute("numMesaSeleccionada").toString());
        /*GestorOrdenBD gestorOrden = new GestorOrdenBD();
        List<Orden> ordenes = gestorOrden.getTopOrdenesSolicitadasEnCocina();
        List<Orden> ordenesDesc = new ArrayList<>();
         */

        Collection<Orden> ordenesDeMesaSeleccionada = null;
        ordenesDeMesaSeleccionada = (Collection<Orden>) request.getAttribute("ordenesDeMesaSeleccionada");
        int numMesaSeleccionada = 0;
        numMesaSeleccionada = (int) request.getAttribute("numMesaSeleccionada");
        int numBotonSeleccionado = (int) request.getAttribute("numBotonSeleccionado");
        int numPrimerMesa = 0;
        /*
        Collection<Platillo> platillosDeLaOrdenSeleccionada = null;
        platillosDeLaOrdenSeleccionada = (Collection<Platillo>) request.getAttribute("PlatillosDeOrdenSeleccionada");
        int idOrdenSeleccionadaRespuesta = 0;
        idOrdenSeleccionadaRespuesta = (int) request.getAttribute("idOrdenSeleccionadaRespuesta");
        int numBotonSeleccionado = (int) request.getAttribute("numBotonSeleccionado");
        int idUltimaOrden = 0;
         */


      %>
      <div class="col-md-4 content">
        <h2>Mesas asignadas</h2>
        <div class="list-group">
          <%            for (int numMesa : listaMesas) {
              /*for (int i = (ordenes.size() - 1); i >= 0; i--) {
              ordenesDesc.add(ordenes.get(i));
            }

            int numeroTopOrden = ordenesDesc.size();

            for (Orden orden : ordenesDesc) {
               */
          %>
          <a href="listarMesasPorMesero?numMesaSeleccionada=<%= numMesa%>" 
             class="list-group-item <% if (((ordenesDeMesaSeleccionada.size() == 0)) || (numMesa == numMesaSeleccionada)) {
                 out.print(" active ");
               }%> list-group-item-action">
            Mesa <%= numMesa%>
           
          </a>
          <%
              /*if (numeroTopOrden == 1) { //guardar el id real de la orden mostrda en ese boton
                idUltimaOrden = orden.getId();
              }
              numeroTopOrden--;
               */
            }
          %>
        </div> <br>
        <!--
        <div style="text-align: center">
            <button class="btn btn-lg btn-primary">Anterior</button>
            <button class="btn btn-lg btn-primary">Siguiente</button>
        </div>
        -->
      </div>
      <div class="col-md-8 content">
        <%
          if (ordenesDeMesaSeleccionada.size() > 0) {//Título para cuando se selecciona una mesa

        %>
        <h2 class="orden-titulo">
          Mesa <%= numMesaSeleccionada %> 
          
        </h2> <!--  - mesa - mesero -->

        <%
        } else {//Título para cuando carga la página (sin aún seleccionar mesa)
          if (listaMesas.size() > 0) {
            // Mostrar la última orden
        %>
        <h2 class="orden-titulo">
          Mesa <%= listaMesas.get(0) %>
          
        </h2> <!--  - mesa - mesero -->
        <%
            }
          }

          List<Platillo> platillosDeLaUltimaOrden = null;
          if (ordenesDesc.size() > 0) {
            GestorPlatilloBD gestorPlatillo = new GestorPlatilloBD();

            for (int i = 0; i < ordenesDesc.size(); i++) {
              if (i == ordenesDesc.size() - 1) {
                platillosDeLaUltimaOrden = gestorPlatillo.getPlatillosDeUnaOrden(ordenesDesc.get(i).getId());
              }
            }
          }

          if (platillosDeLaOrdenSeleccionada.size() > 0) {
            // Mostrar platillos de orden seleccionada

            for (Platillo platillo : platillosDeLaOrdenSeleccionada) {
        %>          
        <div class="row content-2">
          <div class="col-md-4">
            <h4><%= platillo.getNombre()%></h4>
            <div>
              <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="230px" height="140px"> <br>
            </div>
          </div>
          <div class="col-md-5">
            <h5>Descripción</h5>
            <%
              String descripcion = "";
              if (platillo.getDescripcion().length() >= 150) {
                descripcion = descripcion.substring(0, 150);
                descripcion += "...";
              } else {
                descripcion = platillo.getDescripcion();
              }
            %>
            <%= descripcion%>
          </div>
          <div class="col-md-3 cantidad-platillo-cocina">
            X <%= platillo.getCantidadPlatillos()%>
          </div>
        </div> <br>
        <%
          }
        } else {
          if (ordenesDesc.size() > 0) {
            // Mostrar los platillos de la última orden
            System.out.println("No seleccion+o nada y es la prioritaria, " + platillosDeLaUltimaOrden.get(0).getNombre());
            for (Platillo platillo : platillosDeLaUltimaOrden) {
        %>          
        <div class="row content-2">
          <div class="col-md-4">
            <h4><%= platillo.getNombre()%></h4>
            <div>
              <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="230px" height="140px"> <br>
            </div>
          </div>
          <div class="col-md-5">
            <h5>Descripción</h5>
            <%
              String descripcion = "";
              if (platillo.getDescripcion().length() >= 150) {
                descripcion = descripcion.substring(0, 150);
                descripcion += "...";
              } else {
                descripcion = platillo.getDescripcion();
              }
            %>
            <%= descripcion%>
          </div>
          <div class="col-md-3 cantidad-platillo-cocina">
            X <%= platillo.getCantidadPlatillos()%>
          </div>
        </div> <br>
        <%
          }
        } else {
          // NO mostrar nada
        %>          
        <div class="row content-2">

        </div> <br>
        <%
            }
          }
        %>


        <div style="text-align: center">
          <%
            if (ordenesDesc.size() > 0) {

              GestorOrdenBD gestorOrdenParaBoton = new GestorOrdenBD();
              if (idOrdenSeleccionadaRespuesta == 0) {
                Orden orden = gestorOrdenParaBoton.getOrdenPorID(idUltimaOrden);

                if (orden.getEstadoOrden().equals("SOLICITADA")) {
                  // Habilitar botón prepando y deshabilita botón preparada
          %>
          <a class="btn btn-lg btn-success" href="IndicarOrdenPreparando?idOrdenSeleccionada=<%= idUltimaOrden%>&numBotonSeleccionado=1">Preparando</a>
          <button class="btn btn-lg btn-success" disabled>Orden preparada</button>
          <%
          } else if (orden.getEstadoOrden().equals("PREPARANDO")) {
            // Deshabilitar botón prepando y habilita botón preparada
          %>
          <button class="btn btn-lg btn-success" disabled>Preparando</button>
          <a class="btn btn-lg btn-success" href="IndicarOrdenPreparada?idOrdenSeleccionada=<%= idUltimaOrden%>&numBotonSeleccionado=1">Orden preparada</a>
          <%
            }
          } else {

            Orden ordenParaSeleccionarBoton = gestorOrdenParaBoton.getOrdenPorID(idOrdenSeleccionadaRespuesta);

            if (ordenParaSeleccionarBoton.getEstadoOrden().equals("SOLICITADA")) {
              // Habilitar botón prepando y deshabilita botón preparada
          %>
          <a class="btn btn-lg btn-success" href="IndicarOrdenPreparando?idOrdenSeleccionada=<%= idOrdenSeleccionadaRespuesta%>&numBotonSeleccionado=<%= numBotonSeleccionado%>">Preparando</a>
          <button class="btn btn-lg btn-success" disabled>Orden preparada</button>
          <%
          } else if (ordenParaSeleccionarBoton.getEstadoOrden().equals("PREPARANDO")) {
            // Deshabilitar botón prepando y habilita botón preparada
          %>
          <button class="btn btn-lg btn-success" disabled>Preparando</button>
          <a class="btn btn-lg btn-success" href="IndicarOrdenPreparada?idOrdenSeleccionada=<%= idOrdenSeleccionadaRespuesta%>&numBotonSeleccionado=<%= numBotonSeleccionado%>">Orden preparada</a>
          <%
              }
            }
          } else {
          %>
          <h4>En espera de nuevas órdenes...</h4>
          <%
            }
          %>


        </div>

      </div>

    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
  </body>
</html>