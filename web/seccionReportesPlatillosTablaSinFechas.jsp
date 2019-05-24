<%@page import="java.util.List"%>
<%@page import="modelo.GestorCategoriaPlatilloBD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.CategoriaPlatillo"%>
<%@page import="modelo.Platillo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reportes de platillos sin fecha</title>
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

            ArrayList<Platillo> listaPlatillos = new ArrayList<>();
            
            boolean hayLista = false;
            System.out.println("listPlatillos = " + request.getAttribute("listaPlatillos"));
            if (request.getAttribute("listaPlatillos") != null) {
                listaPlatillos = (ArrayList<Platillo>) request.getAttribute("listaPlatillos");
                hayLista = true;
            }
            
            Date fechaActual = new Date();
            DateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
            String fechaFormateada = formatoFecha.format(fechaActual);
            
            String fechaInicial = "2010-01-01"; 
            if (request.getAttribute("fechaInicio") != null && request.getAttribute("fechaFinal") != null) {
                fechaInicial = (String) request.getAttribute("fechaInicio");
                fechaFormateada = (String) request.getAttribute("fechaFinal");
            }
        %>
        <div class="container-reportes" style="margin-top: 70px">
            <h3>Reportes Platillos más vendidos</h3>

            <form action="listarReporteCantidadPlatillosSinFechaEnTabla" method="post" class="form-row">
                <div class="form-group col-md">
                    <label for="inputEmail4">Fecha inicio</label>
                    <input type="date" class="form-control" id="inputEmail4" name="fechaInicio"
                           min="2000-01-01" max="2030-12-31" value="<%= fechaInicial %>" required>
                </div>
                <div class="form-group col-md">
                    <label for="inputPassword4">Fecha fin</label>
                    <input type="date" class="form-control" id="inputPassword4" name="fechaFinal"
                           min="2000-01-01" max="2030-12-31" value="<%= fechaFormateada %>" required>
                </div>
                <div class="form-group col-md">
                    <label for="inputPassword4">Categoria</label>
                    <select class="form-control" name="categoria">
                        <option value="todos" selected>Todas</option>
                        <%
                            for (CategoriaPlatillo categoriaPlatillo : listaCategorias) {
                                // Mostrar el nombre de la categoría y en value
%>
                        <option value="<%= categoriaPlatillo.getCategoria()%>">
                            <%= categoriaPlatillo.getCategoria()%>
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
                <table class="table">
                    <thead>
                        <tr>
                            <th>Cantidad Vendidos</th>
                            <th>ID Platillo</th>
                            <th>Nombre platillo</th>
                            <th>Categoria</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (hayLista) {
                                for (Platillo platillo : listaPlatillos) {
                                    // Desplegar cada platillo del reporte en la tabla
                        %>
                        <tr>
                            <td><%= platillo.getCantidadDeVecesComsumido()%></td>
                            <td><%= platillo.getId()%></td>
                            <td><%= platillo.getNombre()%></td>
                            <td><%= platillo.getCategoria()%></td>
                            <td><%= platillo.getPrecio()%></td>
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
