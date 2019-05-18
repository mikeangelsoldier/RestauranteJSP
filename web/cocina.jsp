<%-- 
    Document   : cocina
    Created on : 9/04/2019, 08:40:59 PM
    Author     : Personal
--%>

<%@page import="java.util.Collection"%>
<%@page import="modelo.Platillo"%>
<%@page import="modelo.GestorPlatilloBD"%>
<%@page import="modelo.DetalleOrden"%>
<%@page import="modelo.GestorDetalleOrdenBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Orden"%>
<%@page import="java.util.List"%>
<%@page import="modelo.GestorOrdenBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="css/styles-cocina.css">
    <link rel="stylesheet" 
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
  </head>
  <body class="kitchen">
    <div class="row" style="margin: 40px">
      <%
        GestorOrdenBD gestorOrden = new GestorOrdenBD();
        List<Orden> ordenes = gestorOrden.getTopOrdenesSolicitadasEnCocina();
        List<Orden> ordenesDesc = new ArrayList<>();
        Collection<Platillo> platillosDeLaOrdenSeleccionada = null;
        platillosDeLaOrdenSeleccionada = (Collection<Platillo>) request.getAttribute("PlatillosDeOrdenSeleccionada");
        int idOrdenSeleccionadaRespuesta = 0;
        idOrdenSeleccionadaRespuesta = (int) request.getAttribute("idOrdenSeleccionadaRespuesta");

        int numBotonSeleccionado = (int) request.getAttribute("numBotonSeleccionado");

        int idUltimaOrden = 0;
      %>
      <div class="col-md-4 content">
        <h2>Órdenes en espera</h2>
        <div class="list-group">
          <%
            for (int i = (ordenes.size() - 1); i >= 0; i--) {
              ordenesDesc.add(ordenes.get(i));
            }

            int numeroTopOrden = ordenesDesc.size();

            for (Orden orden : ordenesDesc) {
          %>
          <a href="listarPlatillosPorOrdenEnCocina?idOrdenSeleccionada=<%= orden.getId()%>&numBotonSeleccionado=<%= numeroTopOrden%>" 
             class="list-group-item <% if (((platillosDeLaOrdenSeleccionada.size() == 0) && (numeroTopOrden == 1)) || (orden.getId() == idOrdenSeleccionadaRespuesta)) {
                 out.print(" active ");
               }%> list-group-item-action">
            <%= numeroTopOrden%> - orden  <%= orden.getId()%>
            <%
              if (orden.getEstadoOrden().equals("PREPARANDO")) {
            %>
            <span style="float: right; color: <% if (((platillosDeLaOrdenSeleccionada.size() == 0) && (numeroTopOrden == 1)) || (orden.getId() == idOrdenSeleccionadaRespuesta)) {
                out.print(" #fff");
              } else {
                out.print(" #0a0");
              }%>">Preparando...</span>
            <%
              }
            %>
          </a>
          <%
              if (numeroTopOrden == 1) { //guardar el id real de la orden mostrda en ese boton
                idUltimaOrden = orden.getId();
              }
              numeroTopOrden--;
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
          if (platillosDeLaOrdenSeleccionada.size() > 0) {

        %>
        <h2 class="orden-titulo">
          <%= numBotonSeleccionado%> - orden <%= idOrdenSeleccionadaRespuesta%> 
          <%
            GestorOrdenBD ordenTitulo = new GestorOrdenBD();
            Orden orden1 = ordenTitulo.getOrdenPorID(idOrdenSeleccionadaRespuesta);
            if (orden1.getEstadoOrden().equals("PREPARANDO")) {
          %>
          <span style="float: right; color: #0a0; font-size: 16px; position: absolute; right: 22px; top: 18px">Preparando...</span>
          <%
            }
          %>
        </h2> <!--  - mesa - mesero -->

        <%
        } else {
          if (ordenesDesc.size() > 0) {
            // Mostrar la última orden
        %>
        <h2 class="orden-titulo">
          1 - orden <%= idUltimaOrden%>
          <%
            GestorOrdenBD ordenTitulo = new GestorOrdenBD();
            Orden orden2 = ordenTitulo.getOrdenPorID(idUltimaOrden);
            if (orden2.getEstadoOrden().equals("PREPARANDO")) {
          %>
          <span style="float: right; color: #0a0; font-size: 16px; position: absolute; right: 22px; top: 18px">Preparando...</span>
          <%
            }
          %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script>
      $(document).ready(function () {
        
        setTimeout(refrescar, 30000);
      });
      function refrescar() {
        //Actualiza la página
        location.reload();
      }
    </script>
  </body>
</html>
