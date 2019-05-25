<%@page import="modelo.CategoriaPlatillo"%>
<%@page import="modelo.GestorCategoriaPlatilloBD"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.Platillo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="modelo.GestorPlatilloBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes de platillos por puntaje</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" href="css/styles-reportes.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: #ddd">
        <!--  menú principal -->
        <jsp:include page="menuAdministrador.jsp" />

        <!--  Contenido -->
        <%
            GestorCategoriaPlatilloBD gestorCategoriaPlatilloBD = new GestorCategoriaPlatilloBD();
            List<CategoriaPlatillo> listaCategorias = gestorCategoriaPlatilloBD.getCategoriasPlatillos();

            GestorPlatilloBD gestorPlatilloBD = new GestorPlatilloBD();
            List<String> listaPuntaje = new ArrayList<>(Arrays.asList("5", "4", "3", "2", "1"));

            ArrayList<Platillo> listaPlatillos = new ArrayList<>();

            boolean hayLista = false;
            if (request.getAttribute("listaPlatillos") != null) {
                listaPlatillos = (ArrayList<Platillo>) request.getAttribute("listaPlatillos");
                hayLista = true;
            }

            String puntaje = "Todos";
            String categoria = "Todas";

            if (request.getAttribute("puntaje") != null) {
                puntaje = (String) request.getAttribute("puntaje");
            }

            if (request.getAttribute("categoria") != null) {
                categoria = (String) request.getAttribute("categoria");
            }

        %>
        <div class="container-reportes" style="margin-top: 70px">
            <h3>Reportes Platillos por puntaje</h3>

            <form action="listarReportePlatillosPorPuntaje" method="post" class="form-row">

                <div class="form-group col-md">
                    <label for="inputPassword4">Puntaje</label>
                    <select class="form-control" name="puntaje">
                        <option value="todos" <% if (puntaje.equals("Todos")) {
                                out.print(" selected");
                            } %>>Todos</option>
                        <%   for (String puntuacion : listaPuntaje) {
                                // Mostrar el nombre de la categoría y en value
%>
                        <option value="<%= puntuacion%>" 
                                <% if (puntuacion.equals(puntaje)) {
                                    out.print(" selected");
                                }%>>
                            <%= puntuacion%>
                        </option>
                        <%
                            }
                        %>
                        <!--For de todos los clientes para cada option-->
                    </select>
                </div>

                <div class="form-group col-md">
                    <label for="inputPassword4">Categoria</label>
                    <select class="form-control" name="categoria">
                        <option value="todos" <% if (categoria.equals("Todas")) {
                                out.print(" selected");
                            } %>>Todas</option>
                        <%
                            for (CategoriaPlatillo categoriaDeLaLista : listaCategorias) {
                                // Mostrar el nombre de la categoría y en value
%>
                        <option value="<%= categoriaDeLaLista.getCategoria()%>" 
                                <% if (categoria.equals(categoriaDeLaLista.getCategoria())) {
                                    out.print(" selected");
                                }%>>
                            <%= categoriaDeLaLista.getCategoria()%>
                        </option>
                        <%
                            }
                        %>
                        <!--For de todos los clientes para cada option-->
                    </select>
                </div>

                <div class="form-group col-md">
                    <br>
                    <button class="btn btn-secondary" type="submit">Filtrar</button>
                </div>
            </form>

            <!-- Tabla -->
            <div >
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Clave</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Categoria</th>
                            <th>Puntaje</th>
                            <th>Votaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (hayLista) {
                                for (Platillo platillo : listaPlatillos) {
                                    // Desplegar cada platillo del reporte en la tabla
%>
                        <tr>
                            <td><%= platillo.getId()%></td>
                            <td><%= platillo.getNombre()%></td>
                            <td>$<%= platillo.getPrecio()%></td>
                            <td><%= platillo.getCategoria()%></td>
                            <td>
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

                            </td>
                            <td><%= platillo.getNumeroPuntuaciones()%></td>
                        </tr>
                        <%
                                }
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
        <!--  / Contenido -->

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>

</html>
