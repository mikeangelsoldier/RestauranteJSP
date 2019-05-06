<%-- 
    Document   : pedidos
    Created on : 5/03/2019, 08:51:05 PM
    Author     : Personal
--%>

<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
    </head>
    <body style="background-color: #ddd">
        <!--div class="heead">
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Separated link</a>
                </div>
              </div>
            <!--select>
                <option selected disabled>Catálogos</option>
                <option>Platillos</option>
                <option>Clientes</option>
                <option>Meseros</option>
            </select>
            <a href="">Reportes</a>
            <a href="">Clave de acceso cocina</a>
            <div class="username">
                Aministrador
            </div>
        </div-->
            <ul class="nav nav-tabs navbarAdmin">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Catálogos</a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Platillos</a>
                    <a class="dropdown-item" href="#">Clientes</a>
                    <a class="dropdown-item" href="#">Meseros</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Otro</a>
                  </div>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Reportes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Clave de acceso cocina</a>
                </li>
                <li class="nav-item dropdown" style="float: right">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                      <img src="css/imagenes/admin.PNG" height="20px" style="border-radius: 50%">
                      <span>Administrador</span>
                  </a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">
                        <!--i class="fas fa-arrow-circle-right"></i-->
                        <img src="css/imagenes/gear.png" height="15px">
                        Configuración
                    </a>
                    <a class="dropdown-item" href="#">
                        <img src="css/imagenes/star.png" height="15px">
                        Algo más
                    </a>
                    <a class="dropdown-item" href="#">
                        <img src="css/imagenes/plus.png" height="15px">
                        Ver algo
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="index_negocio.jsp">
                        <img src="css/imagenes/logout.png" height="15px">
                        Cerrar sesión
                    </a>
                  </div>
                </li>
            </ul>
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
                        for(Platillo platillo:platillos) {
                    %> 
                        <div class="card platillo" style="display: flex; padding: 2px">
                            <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                <img src="ObtenerImagenes?id=<%=platillo.getId()%>" width="120px" height="75px">
                            </div>
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title font-smallN"><%=platillo.getNombre()%></h5>
                                <p class="card-text font-small"><%=platillo.getDescripcion()%></p>                                
                                <button class="btn btn-sm btn-primary btn-block" >
                                    Editar
                                </button>
                                <button class="btn btn-sm btn-danger btn-block" >
                                    Eliminar
                                </button>
                            </div>

                        </div>
                    <% }%>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
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
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
    <%
        if (request.getAttribute("resInsert") != null) {
            out.print("<script>alert(\"" + request.getAttribute("resInsert").toString() + "\")</script>");
        }
    %>
</html>
