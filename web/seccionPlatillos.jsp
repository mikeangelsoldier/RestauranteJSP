<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" style="margin: 60px 10px; z-index: 0;">
    <aside class="menuAdmin" style="z-index: 8;">
        <div class="logo"></div>
        <nav class="row navbar navbar-light">
            <%
                String search = (String)request.getAttribute("search");
            %>
            <form action="ListarPlatillos" method="post" class="form-inline">
                <input class="form-control mr-sm-2" type="search" 
                    placeholder="Buscar..." aria-label="Search" id="searchInput" name="search"
                    value="<% if(search != null) out.print(search); %>">
                <button class="btn btn-dark my-2 my-sm-0" id="searchButton" type="submit">Buscar</button>
            </form>
        </nav>
        
        <%
            // Parámetro del filtro
            String filterParameter = request.getParameter("filter");
            GestorPlatilloDelDiaBD gestorPlatilloDelDiaBD = new GestorPlatilloDelDiaBD();
            List<PlatilloDelDia> listaPlatillosDelDia = gestorPlatilloDelDiaBD.getPlatillosDelDia();
        %>
        
        
        <!-- Categorías -->
        <div id="menuCliente" class="nav flex-column menuI maxCategorias" >
            <a class="btn btn-primary" href="ListarCategoriasPlatillos">
                <i class="fas fa-cogs"></i>
                <span>Gestionar Categorías</span>
            </a>
            <a class="nav-link item <% if (filterParameter == null) out.print(" active"); %>"
                href="ListarPlatillos">Todos</a>
            <a class="nav-link item <% if ((filterParameter != null) && (filterParameter.equals("platillosDelDia"))) out.print(" active"); %>"
                href="ListarPlatillos?filter=platillosDelDia">Platillos del día</a>
            <%
                Collection <CategoriaPlatillo> categorias = new ArrayList<CategoriaPlatillo>();
                GestorCategoriaPlatilloBD gestorCategoriaPlatilloBD = new GestorCategoriaPlatilloBD();
                categorias = gestorCategoriaPlatilloBD.getCategoriasPlatillos();
                for (CategoriaPlatillo categoria : categorias) {                    
            %>
            <a class="nav-link item <% if (categoria.getCategoria().equals(filterParameter)) out.print(" active"); %>"
                    href="ListarPlatillos?filter=<%=categoria.getCategoria()%>"><%=categoria.getCategoria()%></a>
            <% 
                }
            %>    
        </div>
        <!-- / Categorías -->
        
    </aside>

    <div class="col-md-3">

    </div>


    <!-------------------- SECCION PLATILLOS -------------------------->
    <div class="col-md-9 platillos">

        <!-- ******* AGREGAR PLATILLO ********* -->
        <div class="agregarPlatillo" 
             data-toggle="modal" 
             data-target="#modalAgregarPlatillo">
            <img src="css/imagenes/plus.png" height="60px" style="position: fixed; top: 75px; right: 60px">
        </div>
        <!-- ******* / AGREGAR PLATILLO ********* -->

        <div>
            <h2>Platillos</h2>
        </div>                
        <div class="row" style="margin-left: 6px; margin-right: 70px;">
            <%
                Collection<Platillo> platillos = null;
                platillos = (Collection<Platillo>) request.getAttribute("Platillos");
            %>
            <%
                int idRegistroPlatilloDelDia = 0;
                for (Platillo platillo : platillos) {
                    if ((request.getParameter("filter") != null) && (request.getParameter("filter").equals("platillosDelDia"))) {
                        
                        for (PlatilloDelDia platilloDelDia : listaPlatillosDelDia) {
                            if (platilloDelDia.getIdPlatillo() == platillo.getId()) {
                                idRegistroPlatilloDelDia = platilloDelDia.getIdRegistro();
                            }
                        }
                        
            %> 
            <div class="card platillo" style="display: flex; padding: 2px; position: relative">
                <div style="position: absolute; top: 0; left: 0">
                    <span class="badge badge-secondary"><%=platillo.getId()%></span>
                </div>
                
                
                <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                    <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="120px" height="75px">
                </div>
                <div class="card-body" style="text-align: center">
                    <h5 class="card-title font-smallN"><%=platillo.getNombre()%></h5>
                    <%  //Limitar texto descripción
                        String desc = "";
                        if (platillo.getDescripcion().length() > 35) {
                            desc = platillo.getDescripcion().substring(0, 35);
                            desc += "...";
                        } else {
                            desc = platillo.getDescripcion();
                        }
                    %>
                    <p class="card-text font-small"><%=desc%></p>                                
                    <div>
                        <a href="eliminarDePlatillosDelDia?idPlatillo=<%= idRegistroPlatilloDelDia %>" 
                           onclick="return confirm('¿Estás seguro de eliminar de platillos del día?');"
                          class="btn btn-sm btn-danger btn-block">
                          - Platillos del día
                        </a>
                        
                    </div>
                </div>

            </div>
            <%  
                } else {
            %>
            <div class="card platillo" style="display: flex; padding: 2px; position: relative">
                <div style="position: absolute; top: 0; left: 0">
                    <span class="badge badge-secondary"><%=platillo.getId()%></span>
                </div>
                <div class="div-delete-platillo">
                    <a 
                        onclick="return confirm('¿Estás seguro de eliminar este platillo?')"
                        href="EliminarPlatillo?id=<%=platillo.getId()%>">
                        <img src="css/imagenes/delete2.png" height="25px">
                    </a>
                </div>
                
                <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                    <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="120px" height="75px">
                </div>
                <div class="card-body" style="text-align: center">
                    <h5 class="card-title font-smallN"><%=platillo.getNombre()%></h5>
                    <%  //Limitar texto descripción
                        String desc = "";
                        if (platillo.getDescripcion().length() > 35) {
                            desc = platillo.getDescripcion().substring(0, 35);
                            desc += "...";
                        } else {
                            desc = platillo.getDescripcion();
                        }
                    %>
                    <p class="card-text font-small"><%=desc%></p>                                
                    <div>
                        <a href="modificarPlatillo.jsp?id=<%=platillo.getId()%>" 
                          class="btn btn-sm btn-primary btn-block">
                          Editar
                        </a>
                        <%
                            boolean existeIdPlatilloEnPlatillosDelDia = false;
                            for (PlatilloDelDia platilloDelDia : listaPlatillosDelDia) {
                            if (platilloDelDia.getIdPlatillo() == platillo.getId()) {
                                existeIdPlatilloEnPlatillosDelDia = true;
                            }
                        }
                            if (listaPlatillosDelDia.size() < 9 && !existeIdPlatilloEnPlatillosDelDia) {
                                // Mostrar platillos del día
                        %>
                        <a class="btn btn-sm btn-success btn-block"
                           onclick="return confirm('¿Deseas agregar este platillo a los 9 platillos del día?');"
                           href="AgregarPlatilloDeldia?idPlatillo=<%= platillo.getId() %>">
                            <!--onclick="return confirm('¿Estás seguro de eliminar este platillo?')"
                          href="EliminarPlatillo?id=< %=platillo.getId()%>"-->
                            <span style="font-size: 13px"><i class="fas fa-plus"></i> Platillos del día</span>
                        </a>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div>
            <%
                }
                }
            %>
        </div>
    </div>
</div>

<!-- MODAL AGREGAR PRODUCTO -->
<div class="modal fade" id="modalAgregarPlatillo" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
        <%@ page import="modelo.*" %>
        <form action="RegistrarPlatillo" method="post" enctype="multipart/form-data" class="modal-content">
            <div class="modal-header" >
                <h4 class="modal-title" id="exampleModalCenterTitle">
                    <span style="position: relative">
                        Registrar platillo 
                        <div style="position: absolute; top: 0; right: -50px">
                            <span style="margin-top: 0px" class="badge badge-secondary">1</span>
                        </div>
                    </span>

                </h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row" style="padding: 5px 10px">
                    <div class="col-md-12" style="position: relative">
                        <label>Imagen </label> <br>
                        <img src="css/imagenes/defaultPlatillo.png" width="150px" height="120px" id="imgg">
                        <label class="upload" for="foto">
                            <img src="css/imagenes/upload.png" height="55px">
                            Subir una foto
                        </label>
                        <input class="fileUpload" type="file" id="foto" name="foto"
                               onchange="document.getElementById('imgg').src = window.URL.createObjectURL(this.files[0])">
                    </div>
                    <div class="form-group col-md-12">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" 
                               placeholder="Nombre del platillo"
                               id="nombre"
                               name="nombre"
                               required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="nombre">Categoría</label>
                        <select class="form-control" name="categoria">
                            <%
                                for (CategoriaPlatillo categoria : categorias) {
                            %>
                            <option value="<%=categoria.getCategoria()%>"><%=categoria.getCategoria()%></option>
                            <%  }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="precio">Precio</label>
                        <input type="number" class="form-control" 
                               placeholder="Precio"
                               id="precio"
                               name="precio"
                               step="0.01"
                               min="1"
                               required>
                    </div>

                    <div class="form-group col-md-12">
                        <label for="nombre">Descripción</label>
                        <textarea class="form-control" name="descripcion" placeholder="Descripción"></textarea>
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
        
<!-- Script para el evento [ENTER] en la búsqueda por nombre -->
<script>
  var search = document.getElementById("searchInput");
  search.addEventListener("keyup", function(event) {
    // Number 13 is the "Enter" key on the keyboard
    if (event.keyCode === 13) {
      // Cancel the default action, if needed
      event.preventDefault();
      // Trigger the button element with a click
      document.getElementById("searchButton").click();
    }
  });
</script>