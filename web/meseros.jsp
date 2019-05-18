<%@page import="modelo.Platillo"%>
<%@page import="modelo.GestorPlatilloBD"%>
<%@page import="modelo.SesionServicio"%>
<%@page import="modelo.GestorSesionServicioBD"%>
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
        <link rel="stylesheet" href="css/styles-cocina.css">
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
        <div class="row" style="margin: 70px 40px 40px 40px">
            <%
                Mesero meseroSesion = (Mesero) request.getSession().getAttribute("mesero");//Mesero que inició sesión
                GestorMeseroBD gestorMeseros = new GestorMeseroBD();
                List<Integer> listaMesas = gestorMeseros.getMesasMesero(meseroSesion.getId());

                GestorSesionServicioBD gestorSesionServicioBD = new GestorSesionServicioBD();
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
            <div class="col-md-4 content-mesero">
                <h2>Mesas asignadas</h2>
                <div class="list-group">
                    <% for (int numMesa : listaMesas) {
                            /*for (int i = (ordenes.size() - 1); i >= 0; i--) {
                        ordenesDesc.add(ordenes.get(i));
                      }

                      int numeroTopOrden = ordenesDesc.size();

                      for (Orden orden : ordenesDesc) {
                             */
                    %>
                    <a href="listarMesasPorMesero?numMesaSeleccionada=<%= numMesa%>" 
                       class="list-group-item <% if (((ordenesDeMesaSeleccionada.size() == 0) && numMesa == listaMesas.get(0)) || (numMesa == numMesaSeleccionada)) {
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
            <div class="col-md-8 content-mesero">
                <%
                    if (ordenesDeMesaSeleccionada.size() > 0) {//Título para cuando se selecciona una mesa

                %>
                <h2 class="orden-titulo">
                    Mesa <%= numMesaSeleccionada%> 

                </h2> <!--  - mesa - mesero -->

                <%
                } else {//Título para cuando carga la página (sin aún seleccionar mesa)
                    if (listaMesas.size() > 0) {
                        // Mostrar la última orden
                %>
                <h2 class="orden-titulo">
                    Mesa <%= listaMesas.get(0)%>

                </h2> <!--  - mesa - mesero -->
                <%
                        }
                    }

                    //Llenado de las ordenes de la primer mesa de la lista, cuando se accede pro pimera vez
                    int idSesionDeLaPrimerMesaDeLaLista = 0;
                    List<Orden> ordenesDeLaPrimeraMesaDeLaLista = null;
                    if (listaMesas.size() > 0) {
                        GestorOrdenBD gestorOrden = new GestorOrdenBD();

                        for (int i = 0; i < listaMesas.size(); i++) {
                            if (i == listaMesas.size() - 1) {
                                // Encontrar el id de sesión de la mesa
                                SesionServicio sesionServicio = gestorSesionServicioBD.getIdSesionDeUnaMesa(listaMesas.get(0));
                                idSesionDeLaPrimerMesaDeLaLista = sesionServicio.getId();

                                ordenesDeLaPrimeraMesaDeLaLista = gestorOrden.getOrdenesPorIdSesion(idSesionDeLaPrimerMesaDeLaLista);
                            }
                        }
                    }

                    if (ordenesDeMesaSeleccionada.size() > 0) {
                        // Mostrar platillos de orden seleccionada

                        for (Orden orden : ordenesDeMesaSeleccionada) {
                            /*
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
                             */
                %>          
                <div class="row content-2" style="background-color: #eee"> <!-- Div por cada orden -->
                    <div class="col-md-12" >
                        <h4>Orden <%= orden.getId()%></h4>
                        <!-- AQUI VA A HACER UN CICLO FOR PARA MOSTRAR LOS PLATILLOS DE CADA ORDEN -->
                        <%
                            GestorPlatilloBD gestorPlatillo = new GestorPlatilloBD();
                            List<Platillo> platillos = gestorPlatillo.getPlatillosDeUnaOrden(orden.getId());
                            
                        %>
                        <div class="lista-platillos-orden-mesero">
                        <%
                            for (Platillo platillo: platillos) {
                        %>
                            <div class="elemento-lista-orden-mesero">
                                <span class="cantidad-elemento-lista">X <%= platillo.getCantidadPlatillos() %></span>
                                <%= platillo.getNombre() %> <br>
                                <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="140px" height="80px">
                            </div>
                        <%
                            }
                        %>
                        </div>
                        <!--div>
                          <img src="ObtenerImagenes?id=< %=platillo.getId()%>" width="230px" height="140px"> <br>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <h5>Descripción</h5>
                        < %
                          String descripcion = "";
                          if (platillo.getDescripcion().length() >= 150) {
                            descripcion = descripcion.substring(0, 150);
                            descripcion += "...";
                          } else {
                            descripcion = platillo.getDescripcion();
                          }
                        %>
                        < %= descripcion%>
                      </div>
                      <div class="col-md-3 cantidad-platillo-cocina">
                        X < %= platillo.getCantidadPlatillos()%>
                      </div>
                        -->

                        <!-- INICIO DEL BOTÓN Y SUS VALIDACIONES -->
                        <div style="text-align: center">
                            <%
                                if (orden.getEstadoOrden().equals("PREPARADA")) {
                                    // Mostrar botón entregar orden
                            %>
                            <a class="btn btn-lg btn-success" 
                               href="">
                                Orden entregada
                            </a>
                            <%
                                }
                            %>


                        </div>
                        <!-- / FIN DEL BOTÓN Y SUS VALIDACIONES -->


                    </div>
                </div> <br>
                <%
                    } // Fin del recorrido de las órdenes
                } // Fin de comprobación  if (ordenesDeMesaSeleccionada.size() > 0) 
                else { // Primer inicio cuando no hay órdenes seleccionadas
                    if (listaMesas.size() > 0) {
                        // Mostrar las órdenes de la primera mesa
                        for (Orden orden : ordenesDeLaPrimeraMesaDeLaLista) {
                %>          
                <div class="row content-2"> <!-- Div por cada orden -->
                    <div class="col-md-12">
                        <h4>Orden <%= orden.getId()%></h4>
                        <!-- AQUI VA A HACER UN CICLO FOR PARA MOSTRAR LOS PLATILLOS DE CADA ORDEN -->
                        <%
                            GestorPlatilloBD gestorPlatillo = new GestorPlatilloBD();
                            List<Platillo> platillos = gestorPlatillo.getPlatillosDeUnaOrden(orden.getId());
                            
                        %>
                        <div class="lista-platillos-orden-mesero">
                        <%
                            for (Platillo platillo: platillos) {
                        %>
                            <div class="elemento-lista-orden-mesero">
                                <span class="cantidad-elemento-lista">X <%= platillo.getCantidadPlatillos() %></span>
                                <%= platillo.getNombre() %> <br>
                                <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="140px" height="80px">
                            </div>
                        <%
                            }
                        %>
                        </div>    

                        <!--div>
                          <img src="ObtenerImagenes?id=< %=platillo.getId()%>" width="230px" height="140px"> <br>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <h5>Descripción</h5>
                        < %
                          String descripcion = "";
                          if (platillo.getDescripcion().length() >= 150) {
                            descripcion = descripcion.substring(0, 150);
                            descripcion += "...";
                          } else {
                            descripcion = platillo.getDescripcion();
                          }
                        %>
                        < %= descripcion%>
                      </div>
                      <div class="col-md-3 cantidad-platillo-cocina">
                        X < %= platillo.getCantidadPlatillos()%>
                      </div>
                        -->

                        <!-- INICIO DEL BOTÓN Y SUS VALIDACIONES -->
                        <div style="text-align: center">
                            <%
                                if (orden.getEstadoOrden().equals("PREPARADA")) {
                                    // Mostrar botón entregar orden
                            %>
                            <a class="btn btn-lg btn-success" 
                               href="">
                                Orden entregada
                            </a>
                            <%
                                }
                            %>


                        </div>
                        <!-- / FIN DEL BOTÓN Y SUS VALIDACIONES -->
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
                        } // Fin de no hay mesas asignadas al mesero
                    } // fin del else
                %>




            </div>

        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
        
        <script>
      $(document).ready(function () {
        //Cada 10 segundos (10000 milisegundos) se ejecutará la función refrescar
        setTimeout(refrescar, 30000);
      });
      function refrescar() {
        //Actualiza la página
        location.reload();
      }
    </script>
    </body>
</html>