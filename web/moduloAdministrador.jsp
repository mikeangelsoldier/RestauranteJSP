<%-- 
    Document   : pedidos
    Created on : 5/03/2019, 08:51:05 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">       
    </head>
    <body style="background-color: #ddd">
        <div class="heead">
            <!--a href="">Catálogos</a-->
            <!--div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Catálogos
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="z-index: 12;"> 
                  <a class="dropdown-item" href="#">Action</a>
                  <a class="dropdown-item" href="#">Another action</a>
                  <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </div-->
            <a href="">Catálogos</a>
            <a href="">Repotes</a>
            <a href="">Clave de acceso cocina</a>
            <div class="username">
                Aministrador
            </div>
        </div>
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
                <h2>Platillos</h2>
                <div class="row" style="margin-left: 6px">
                    <%
                        for (int i = 0; i < 17; i++) {%>

                    <div class="card platillo" style="display: flex; padding: 2px">
                        <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                            <img src="css/imagenes/platillo1.jpg" width="120px" height="75px">
                        </div>
                        <div class="card-body" style="text-align: center">
                            <h5 class="card-title font-smallN">Platillo <%=i + 1%></h5>
                            <p class="card-text font-small">Algo de contenido</p>                                
                            <button class="btn btn-sm btn-primary btn-block" 
                                    data-toggle="modal" 
                                    data-target="#modalAgregarPlatillo">
                                Editar
                            </button>
                            <button class="btn btn-sm btn-danger btn-block" >
                                Eliminar
                            </button>
                        </div>

                    </div>
                    <%    }
                    %>
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
                <div class="modal-content">
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
                                               value="1" min="1" max="5"> <br>

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
                        <button type="button" class="btn btn-primary">Añadir</button>
                    </div>
                </div>
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
</html>
