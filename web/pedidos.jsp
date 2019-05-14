<%-- 
    Document   : pedidos
    Created on : 5/03/2019, 08:51:05 PM
    Author     : Personal
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.*"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    int ultimoIdHttpSesion = (int) request.getSession().getAttribute("idSesion_http");
    
    GestorOrdenBD gestorOrden = new GestorOrdenBD();
                        
    // Para validar el estado de la última orden para saber si habilitar boton de añadir o pagar
    int idUltimaOrden = gestorOrden.getIdUltimaOrdenPorIdSesion(ultimoIdHttpSesion);
    Orden ultimaOrden = gestorOrden.getOrdenPorID(idUltimaOrden);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/stylesPlatillosSesion.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: black; overflow-y: hidden">
        <div class="heead">
            <div style="float: left">
                <button class="none"  id="side-open"  onclick="openAside()">
                    &#9776; Mostrar panel de navegación
                </button>
            </div>
            <div class="username" style="padding: 14px 8px">
                <img src="css/imagenes/shutdown.png" height="22px" class="shutdown">
            </div>
            <div class="username" style="margin-right: 12px">
                ${usr.username}
            </div>
        </div>
        <div class="row" style="margin: 60px 10px; z-index: 0;">

            <aside class="menu" id="sidebarCategorias">
                <div class="logo">
                    <a href="javascript:void(0)" class="close-aside" onclick="closeAside()">
                        <img src="css/imagenes/side-back.PNG" height="30px" style="border-radius: 4px">
                    </a>
                </div>
                <nav class="row navbar navbar-light">
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." aria-label="Search">
                        <button class="btn btn-light my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </nav>
                <!-- Categorías -->
                <div id="menuCliente" class="nav flex-column menuI" >
                    <a class="nav-link item"
                       href="ListarPlatillosSesion">Todos</a>
                    <a class="nav-link item"
                       href="ListarPlatillosSesion">Platillos del día</a>
                    <a class="nav-link item"
                       href="ListarPlatillosSesion">Recomendados</a>
                    <%
                        Collection<CategoriaPlatillo> categorias = new ArrayList<CategoriaPlatillo>();
                        GestorCategoriaPlatilloBD gestorCategoriaPlatilloBD = new GestorCategoriaPlatilloBD();
                        categorias = gestorCategoriaPlatilloBD.getCategoriasPlatillos();
                        for (CategoriaPlatillo categoria : categorias) {
                    %>
                    <a class="nav-link item"
                       href="ListarPlatillosSesion?filter=<%=categoria.getCategoria()%>"><%=categoria.getCategoria()%></a>
                    <%
                        }
                    %>    
                </div>
                <!-- / Categorías -->
            </aside>

            <div class="col-md-3" id="collapse">

            </div>


            <!-------------------- SECCION PLATILLOS -------------------------->
            <div class="col-md-6 platillos" id="seccionPlatillos">

                <div class="display-platillos">
                    <h1 style="margin-bottom: 30px">Platillos</h1>
                    <!--------------------PLATILLOS DEL DIA------------------------>
                    <div>
                        <h4 class="submenu">Platillos del día</h4>
                        <div class="row" style="margin-left: 6px">
                            <%
                                for (int i = 0; i < 4; i++) {%>

                            <div class="card platillo" style="display: flex; padding: 2px">
                                <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                    <img src="css/imagenes/platillo1.jpg" width="120px" height="75px">
                                </div>
                                <div class="card-body" style="text-align: center">
                                    <h5 class="card-title font-smallN">Platillo <%=i + 1%></h5>
                                    <p class="card-text font-small">Algo de contenido</p>                                
                                    <button class="btn btn-sm btn-dark" 
                                            data-toggle="modal" 
                                            data-target="#modalAgregarPlatillo">
                                        Agregar
                                    </button>
                                </div>

                            </div>
                            <%    }
                            %>
                        </div>
                    </div>
                    <!-----------------/PLATILLOS DEL DIA-------------------------->

                    <!------------------------ TODOS ---------------------------->
                    <%
                        Collection<Platillo> platillos = null;
                        platillos = (Collection<Platillo>) request.getAttribute("PlatillosSesion");
                    %>
                    <h4 class="submenu">Todos</h4>
                    <div class="row" style="margin-left: 6px;">
                        <%
                            int n = 1;
                            for (Platillo platillo : platillos) {
                        %> 
                        <div class="card platillo" style="display: flex; padding: 2px; position: relative; height: 270px; width: 200px;">
                            <div class="precio-platillo badge badge-primary">
                                $<%=platillo.getPrecio()%>
                            </div>
                            <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                <img src="ObtenerImagenes?id=<%=platillo.getId()%>" height="100px" width="170px">
                            </div>
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title title-platillo" style="margin-top: -12px"><%= platillo.getNombre()%></h5>
                                <%  //Limitar texto descripción
                                    String desc = "";
                                    if (platillo.getDescripcion().length() > 50) {
                                        desc = platillo.getDescripcion().substring(0, 50);
                                        desc += "...";
                                    } else {
                                        desc = platillo.getDescripcion();
                                    }
                                %>
                                <div class="puntuaciones">
                                    <%
                                        int puntuacion = (int) platillo.getPuntuacionTotal();
                                        boolean tieneDecimal = false;
                                        for (int i = 0; i < puntuacion; i++) {
                                    %>
                                    <img src="css/imagenes/star.png" height="20px" style="display: inline">
                                    <%
                                        }
                                    %>
                                    <%
                                        if (platillo.getPuntuacionTotal() % 1 != 0) {
                                            tieneDecimal = true;
                                    %>
                                    <img src="css/imagenes/star-mitad.png" height="20px" style="display: inline">
                                    <%
                                        }
                                    %>
                                    <%
                                        int estrellasGrises = 0;
                                        if (tieneDecimal) {
                                            estrellasGrises = 5 - puntuacion - 1;
                                        } else {
                                            estrellasGrises = 5 - puntuacion;
                                        }
                                        for (int i = 0; i < estrellasGrises; i++) {
                                    %>
                                    <img src="css/imagenes/star-gris.png" height="20px" style="display: inline">
                                    <%
                                        }
                                    %>
                                </div>
                                <p class="card-text font-small"><%=desc%></p> 
                                <%
                                    if (ultimaOrden.getEstadoOrden().equals("REGISTRADA")) {
                                %>
                                <a class="btn btn-sm btn-dark btn-platillo-sesion"
                                   data-toggle="modal" 
                                   data-target="#modalAgregarPlatillo<%=n%>" data-sfid="<%= platillo.getId()%>">
                                    Agregar
                                </a>
                                <%
                                    }
                                %>
                            </div>
                        </div>


                        <!-- MODAL AGREGAR PRODUCTO -->
                        <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
                        <%@ page import="modelo.*" %>
                        <div class="modal fade" id="modalAgregarPlatillo<%=n%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <form action="RegistrarPlatilloAOrden" class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title" id="exampleModalCenterTitle">
                                            <%= platillo.getNombre()%>
                                        </h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <table>
                                            <tr>
                                                <td class="tabla-agregar-platillo">
                                                    <img src="ObtenerImagenes?id=<%= platillo.getId()%>" width="240" height="150"> <br>
                                                    <div>
                                                        <%
                                                            for (int i = 0; i < puntuacion; i++) {
                                                        %>
                                                        <img src="css/imagenes/star.png" height="22px" style="display: inline">
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            if (tieneDecimal) {
                                                        %>
                                                        <img src="css/imagenes/star-mitad.png" height="22px" style="display: inline">
                                                        <%
                                                            }
                                                        %>
                                                        <%
                                                            for (int i = 0; i < estrellasGrises; i++) {
                                                        %>
                                                        <img src="css/imagenes/star-gris.png" height="22px" style="display: inline">
                                                        <%
                                                            }
                                                        %>
                                                        <span class="puntajePlatillo"> (<%= platillo.getNumeroPuntuaciones()%>)</span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group cantidad">
                                                        <label><b>Cantidad: </b></label>
                                                        <input type="hidden" name="idPlatillo" value="<%= platillo.getId() %>">
                                                        <input type="hidden" name="idOrden" value="<%= idUltimaOrden %>">
                                                        <input type="number" class="form-control" style="width: 50%"
                                                               value="1" min="1" max="5" name="cantidad"> <br>

                                                        <label><b>Precio: </b></label>
                                                        <label class="precio">$<%= platillo.getPrecio()%> </label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label style="margin-top: 10px"><b>Descripción: </b></label> <br>
                                                    <label> <%= platillo.getDescripcion()%> </label>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="sumbit" class="btn btn-primary">Añadir</button>
                                    </div>
                                </form>
                            </div>
                        </div>        


                        <%
                                n++;
                            }
                        %>
                    </div>
                    <!------------------------ /TODOS --------------------------->
                    <!-------------------- /SECCION PLATILLOS ------------------------->
                </div>

            </div>

            <!--------------- SECCION MIS PEDIDOS Y FACTURA ------------------->                
            <div class="col-md-3 pedidos" style="position: relative"> <!--style="position: fixed; right: 15px"-->
                <!--------------------- MIS PEDIDOS --------------------------->
                <h3>Mis órdenes</h3>
                <div class="row" style="width: 100%; max-height: 350px; overflow-y: auto; ">
                    <%
                        if (!ultimaOrden.getEstadoOrden().equals("REGISTRADA")) {
                    %>
                    <a class="btn-agregar-orden" href="RegistrarNuevaOrden?idSesionOrden=<%= ultimoIdHttpSesion %>">
                        <img src="css/imagenes/plus.png" height="30px">
                    </a>
                    <%
                        } else {
                    %>
                    <button class="btn-agregar-orden-deshabilitado" disabled>
                        <img src="css/imagenes/plus-off.png" height="30px">
                    </button>
                    <%
                        }
                    %>
                    <ul class="list-group" style="width: 100%">
                        <%
                            int ultimoId = (int) request.getSession().getAttribute("idSesion_http");
                            System.out.println("ultimoId desde pedidos.jsp = " + ultimoId);
                            List<Orden> ordenes = gestorOrden.getOrdenesPorIdSesion(ultimoId);
                            System.out.println("ordenes size: " + ordenes.size());

                            int numeroDeOrdenes = 1;
                            double totalFinal = 0;
                            for (Orden orden : ordenes) {
                        %>
                        <li style="margin-bottom: 5px">
                            <a class="btn btn-primary" data-toggle="collapse" href="#pedidoDesplegable<%= numeroDeOrdenes %>" 
                               role="button" aria-expanded="false" aria-controls="pedidoDesplegable<%= numeroDeOrdenes %>">
                                Orden <%= numeroDeOrdenes%>
                            </a>
                            <%
                                if (orden.getEstadoOrden().equals("SOLICITADA")) {
                            %>
                            <img src="css/imagenes/check.png" height="25px">
                            <%
                                }
                            %>
                        </li>
                        <li>
                            <div class="collapse multi-collapse" id="pedidoDesplegable<%= numeroDeOrdenes %>" style="font-size: 13px">
                                <div class="card card-body" style="padding: 0px">
                                    <table class="table table-condensed">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Nombre</th>
                                                <th>#</th>
                                                <th>$</th>
                                                <th>Total</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                                GestorDetalleOrdenBD gestorDetalleOrden = new GestorDetalleOrdenBD();
                                                GestorPlatilloBD gestorPlatillo = new GestorPlatilloBD();
                                                
                                                List<DetalleOrden> detalleOrdenes = gestorDetalleOrden.getDetallesDeUnaOrden(orden.getId());
                                                
                                                double totalPorOrden = 0;
                                                
                                                for (DetalleOrden detalleOrden: detalleOrdenes) {
                                                    Platillo platillo = gestorPlatillo.getPlatillo(detalleOrden.getFk_platillo());
                                                    double total = detalleOrden.getCantidad() * platillo.getPrecio();
                                                    totalPorOrden += total;
                                            %>
                                            <tr style="background-color: white; font-size: 12px">
                                                <td><%= platillo.getNombre() %></td>
                                                <td><%= detalleOrden.getCantidad() %></td>
                                                <td><%= platillo.getPrecio() %></td>
                                                <td><%= total %></td>
                                                <td style="font-size: 15px; padding: .25rem;">
                                                    <div>
                                                        <a href="" style="margin-right: 8px">
                                                            <i class="fas fa-eye" class="icon-view" style="color: #333;"></i> 
                                                        </a>
                                                        <%
                                                            if (orden.getEstadoOrden().equals("REGISTRADA")) {
                                                        %>
                                                        <a href="EliminarPlatilloDeOrdenActual?idDetalleOrden=<%= detalleOrden.getId() %>"
                                                           onclick="return confirm('¿Estás seguro de eliminar el platillo tu orden actual?');">
                                                            <i class="fas fa-minus-circle" style="color: red"></i> 
                                                        </a>
                                                        <%
                                                            }
                                                        %>
                                                    </div>

                                                </td>
                                            </tr>
                                            
                                            <%
                                                }
                                                
                                                totalFinal += totalPorOrden;
                                            %>

                                            <tr style="background-color: white; font-size: 14px">
                                                <td colspan="2"></td>
                                                <td colspan="3" style="text-align: right; font-weight: 600">
                                                    Total: $<%= totalPorOrden %>
                                                </td>
                                            </tr>
                                            <%
                                                if (orden.getEstadoOrden().equals("REGISTRADA") && 
                                                    detalleOrdenes.size() > 0) {
                                            %>
                                            <tr>
                                                <td colspan="3"></td>
                                                <td colspan="2" align="right">
                                                    <button class="btn btn-sm btn-primary"
                                                            style="width: 100%"
                                                            data-toggle="modal" 
                                                            data-target="#exampleModalCenter">
                                                        Pedir
                                                    </button>
                                                </td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </li>

                        <%
                                numeroDeOrdenes++;
                            }
                        %>
                    </ul>
                </div>
                <!--------------------- /MIS PEDIDOS ------------------------->

                
                <div style="width: 100%; text-align: right; margin-top: 15px; margin-left: -15px">
                    <b>TOTAL A PAGAR: $<%= totalFinal %></b>
                </div>
                <div style="text-align: center; width: 100%; margin-top: 40px;">

                    <button id="btnPagar" name="btnPagar" class="btn btn-lg btn-danger" disabled>Pagar</button>
                </div>
            </div>
        </div>

        <!-- MODAL AGREGAR PRODUCTO -->
        <div class="modal fade" id="modalAgregarPlatillo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="" method="post" class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalCenterTitle">
                            Carne con papas 
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td class="tabla-agregar-platillo">
                                    <img src="css/imagenes/platillo1.jpg" width="240" height="150"> <br>
                                    <div>
                                        <img src="css/imagenes/star.png" width="22px" height="22px">
                                        <img src="css/imagenes/star.png" width="22px" height="22px">
                                        <img src="css/imagenes/star.png" width="22px" height="22px">
                                        <img src="css/imagenes/star.png" width="22px" height="22px">
                                        <img src="css/imagenes/star-middle.png" width="22px" height="22px">
                                        <span class="puntajePlatillo"> (4.4)</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="form-group cantidad">
                                        <label><b>Cantidad: </b></label>
                                        
                                        <input type="number" class="form-control" style="width: 50%"
                                               value="1" min="1" max="5" name="cantidad"> <br>

                                        <label><b>Precio: </b></label>
                                        <label class="precio">$150 </label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <label style="margin-top: 10px"><b>Descripción: </b></label> <br>
                                    <label>En este apartado se muestra la descripción del platillo. <br>
                                        Puede llevar ingredientes, país de origen, y demás información adecuada y no tan larga</label>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Añadir</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            var header = document.getElementById("menuCliente");
            var btns = header.getElementsByClassName("item");
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function () {
                    var current = document.getElementsByClassName("active");
                    if (current.length > 0) {
                        current[0].className = current[0].className.replace(" active", "");
                    }
                    this.className += " active";
                });
            }

            function openAside() {
                document.getElementById("sidebarCategorias").style.width = "23%";
                document.getElementById("sidebarCategorias").style.marginLeft = "-175px";
                var sp = document.getElementById("seccionPlatillos");
                sp.className = "col-md-6 platillos";
                var coll = document.getElementById("collapse");
                coll.className = "col-md-3";
                var ss = document.getElementById("side-open");
                ss.className = "none";
            }

            function closeAside() {
                document.getElementById("sidebarCategorias").style.width = "0";
                document.getElementById("sidebarCategorias").style.marginLeft = "-1000px";
                var sp = document.getElementById("seccionPlatillos");
                sp.className = "col-md-9 platillos";
                var coll = document.getElementById("collapse");
                coll.className = "col-md-4";
                var ss = document.getElementById("side-open");
                ss.className = "btn-collapse";
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
