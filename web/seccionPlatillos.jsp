<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" style="margin: 60px 10px; z-index: 0;">
    <aside class="menuAdmin" style="z-index: 8;">
        <div class="logo"></div>
        <nav class="row navbar navbar-light">
            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." aria-label="Search">
                <button class="btn btn-dark my-2 my-sm-0" type="submit">Buscar</button>
            </form>
        </nav>
        <div id="menuCliente" class="nav flex-column menuI" >
            <button class="nav-link item active" onclick="console.log('inicio')">Todos</button>
            <button class="nav-link item" onclick="console.log('bebidas')">Bebidas</button>
            <button class="nav-link item" onclick="console.log('postres')">Postres</button>
            <button class="nav-link item" onclick="console.log('desayunos')">Desayunos</button>

        </div>
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
        <div class="row" style="margin-left: 6px;">
            <%
                Collection<Platillo> platillos = null;
                platillos = (Collection<Platillo>) request.getAttribute("Platillos");
            %>
            <%
                for (Platillo platillo : platillos) {
            %> 
            <div class="card platillo" style="display: flex; padding: 2px">
                <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                    <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="120px" height="75px">
                </div>
                <div class="card-body" style="text-align: center">
                    <h5 class="card-title font-smallN"><%=platillo.getNombre()%></h5>
                    <p class="card-text font-small"><%=platillo.getDescripcion()%></p>                                
                    <div>
                        <a href="modificarPlatillo.jsp?id=<%=platillo.getId()%>" 
                          class="btn btn-sm btn-primary btn-block">
                          Editar
                        </a>
                        <a class="btn btn-sm btn-danger btn-block"
                          onclick="return confirm('¿Estás seguro de eliminar este platillo?')"
                          href="EliminarPlatillo?id=<%=platillo.getId()%>">
                          Eliminar
                        </a>
                    </div>
                </div>

            </div>
            <% }%>
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
                            <option value="Comida">Comida</option>
                            <option value="Bebida">Bebida</option>
                            <option value="Postre">Postre</option>
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