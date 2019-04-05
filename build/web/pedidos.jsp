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
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">       
    </head>
    <body style="background-color: orange">
        <div class="row" style="margin: 20px 10px;">

            <aside class="menu">
                <div class="logo"></div>
                <nav class="row navbar navbar-light">
                    <form class="form-inline">
                      <input class="form-control mr-sm-2" type="search" placeholder="Buscar..." aria-label="Search">
                      <button class="btn btn-light my-2 my-sm-0" type="submit">Buscar</button>
                    </form>
                </nav>
                <div id="menuCliente" class="nav flex-column menuI" >
                    <button class="nav-link item active" onclick="console.log('inicio')">Inicio</button>
                    <button class="nav-link item" onclick="console.log('bebidas')">Bebidas</button>
                    <button class="nav-link item" onclick="console.log('postres')">Postres</button>
                    <button class="nav-link item" onclick="console.log('desayunos')">Desayunos</button>
                    
                </div>
            </aside>
            
            <div class="col-md-3">
                
            </div>

            
            <!-------------------- SECCION PLATILLOS -------------------------->
            <div class="col-md-6 platillos">
                <h1 style="margin-bottom: 30px">Platillos</h1>
                
                <!--------------------PLATILLOS DEL DIA------------------------>
                <h4 class="submenu">Platillos del día</h4>
                <div class="row" style="margin-left: 6px">
                    <% 
                    for (int i=0; i<4; i++) { %>
                        
                        <div class="card platillo" style="display: flex; padding: 2px">
                            <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                <img src="css/imagenes/platillo1.jpg" width="120px" height="75px">
                            </div>
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title font-smallN">Platillo <%=i+1%></h5>
                                <p class="card-text font-small">Algo de contenido</p>                                
                                <button class="btn btn-sm btn-success">
                                    Agregar
                                </button>
                            </div>
                            
                        </div>
                <%    } 
                %>
                </div>
                <!-----------------/PLATILLOS DEL DIA-------------------------->
                
                <!------------------------ POSTRES ---------------------------->
                <h4 class="submenu">Postres</h4>
                <div class="row" style="margin-left: 6px;">
                    <% 
                    for (int i=0; i<8; i++) { %>
                        
                        <div class="card platillo" style="display: flex; padding: 2px">
                            <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                <img src="css/imagenes/postre1.jpg" width="120px" height="75px">
                            </div>
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title font-smallN">Platillo <%=i+1%></h5>
                                <p class="card-text font-small">Algo de contenido</p>                                
                                <button class="btn btn-sm btn-success">Agregar</button>
                            </div>
                            
                        </div>
                <%    } 
                %>
                </div>
                <!------------------------ /POSTRES --------------------------->
                
                <!------------------------ POSTRES ---------------------------->
                <h4 class="submenu">Postres</h4>
                <div class="row" style="margin-left: 6px">
                    <% 
                    for (int i=0; i<4; i++) { %>
                        
                        <div class="card platillo" style="display: flex; padding: 2px">
                            <div class="card-img-top" style="text-align: center; padding: 10px 2px 2px 2px;">
                                <img src="css/imagenes/platillo2.jpg" width="120px" height="75px">
                            </div>
                            <div class="card-body" style="text-align: center">
                                <h5 class="card-title font-smallN">Platillo <%=i+1%></h5>
                                <p class="card-text font-small">Algo de contenido</p>                                
                                <button class="btn btn-sm btn-success">Agregar</button>
                            </div>
                            
                        </div>
                <%    } 
                %>
                </div>
                <!------------------------ /POSTRES --------------------------->
                
            <!-------------------- /SECCION PLATILLOS ------------------------->
            </div>

            <!--------------- SECCION MIS PEDIDOS Y FACTURA ------------------->                
            <div class="col-md-3 pedidos">
                <!--------------------- MIS PEDIDOS --------------------------->
                <h3>Mis pedidos</h3>
                <div class="row" >
                    <% 
                    for (int i=0; i<6; i++) { %>
                        <div class="card col-sm-3 misPedidos">
                            Pedido <%=i+1%>
                        </div>
                    <%} 
                    %>
                </div>
                <!--------------------- /MIS PEDIDOS ------------------------->
                
                <!----------------------- FACTURA ----------------------------->
                <div class="row" style="max-height: 300px; overflow-y: auto">
                    <h3>Factura</h3>
                    <table class="table table-borderless table-light table-striped contentTable" >
                        <tr>
                            <th style="background-color: #4CAF50; color: white">Nombre</th>
                            <th style="background-color: #4CAF50; color: white">Cantidad</th>
                            <th style="background-color: #4CAF50; color: white">Precio</th>
                            <th style="background-color: #4CAF50; color: white">Total</th>
                        </tr>
                        <tr>
                            <td>Chilaquiles</td>
                            <td>3</td>
                            <td>35.00</td>
                            <td>105.00</td>
                        </tr>
                        <tr>
                            <td>Pastel</td>
                            <td>2</td>
                            <td>150.00</td>
                            <td>350.00</td>
                        </tr>
                        <tr>
                            <td>Quesadillas</td>
                            <td>7</td>
                            <td>10.00</td>
                            <td>70.00</td>
                        </tr>
                    </table>
                    
                    
                    
                </div>
                <div style="width: 100%; text-align: right">
                        <b>TOTAL A PAGAR: $525.00</b>
                    </div>
                <div style="text-align: center; width: 100%; margin-top: 40px;">
                    <button class="btn btn-lg btn-success" 
                            data-toggle="modal" 
                            data-target="#exampleModalCenter">
                        Pedir
                    </button>
                    <button class="btn btn-lg btn-danger" disabled>Pagar</button>
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
            
        <script>
            var header = document.getElementById("menuCliente");
            var btns = header.getElementsByClassName("item");
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function() {
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
