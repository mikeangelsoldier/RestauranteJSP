
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagar</title>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/stylesPlatillosSesion.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
              crossorigin="anonymous">
    </head>
    <body style="background-color: #444">
        <%
            String totalSesion = (String)request.getAttribute("totalSesion");
            System.out.println("total sesion en pagar jsp" + totalSesion);
        %>
        <div class="container" style="background-color: white">
            <div>
                <div class="modal-header">
                    <h4 class="modal-title" id="exampleModalCenterTitle">
                        Selecciona tu método de pago
                    </h4>
                    <!--button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button-->
                </div>
                <form>
                    <div class="modal-body" style="padding: 20px">
                        <input 
                            type="radio" name="metodoPago" checked onclick="actualizarValor('EFECTIVO')"
                            id="efectivo" class="input-hidden" value="EFECTIVO"/>
                        <label for="efectivo">
                            <img src="css/imagenes/cash.png" height="60px" />
                            <span>Efectivo</span>
                        </label> <br>

                        <input 
                            type="radio" name="metodoPago" onclick="actualizarValor('TARJETA')"
                            id="tarjeta" class="input-hidden" value="TARJETA"/>
                        <label for="tarjeta">
                            <img src="css/imagenes/credit.png" height="60px" />
                            <span>Tarjeta de crédito/débito</span>
                        </label> <br>

                        <input 
                            type="radio" name="metodoPago" onclick="actualizarValor('PAYPAL')"
                            id="paypal" class="input-hidden" value="PAYPAL" />
                        <label for="paypal">
                            <img src="css/imagenes/paypal.png" height="60px" />
                            <span>Paypal</span>
                        </label> 

                    </div>
                    <div class="modal-footer">
                        <!--button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button-->
                        <button type="button" class="btn btn-primary" onclick="mostrarModal()">
                            Siguiente
                        </button>
                    </div>
                </form>
            </div>
        </div>

        
        
        <!-- MODAL PAGO EFECTIVO -->
        <div class="modal fade" id="modalPagarEfectivo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalCenterTitle">
                            Pagar Efectivo
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="PagarEfectivo" method="post">
                        <div class="modal-body" style="padding: 20px">
                            <div class="row">
                                <p>¿Estás seguro de pagar con efectivo? <br>
                                Si es así, espera a que tu mesero pase a tu mesa por el efectivo<p>
                            </div>
                            <!-- Guardar -->
                            <input type="hidden" name="totalSesion" value="<%= totalSesion %>">
                            <input type="hidden" name="metodoPago" value="EFECTIVO">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Atras</button>
                            <button type="submit" class="btn btn-primary" onclick="alert('Tu mesero en breve pasará a cobrar el pago');">Pagar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 

        <!-- MODAL PAGO TARJETA -->
        <div class="modal fade" id="modalPagarTarjeta" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalCenterTitle">
                            Pagar Tarjeta
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="PagarTarjetaPaypalYCerrarSesion" method="post">
                        <div class="modal-body" style="padding: 20px">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="nombre">Número de tarjeta</label>
                                    <input type="number" class="form-control" placeholder="XXXX XXXX XXXX XXXX" id="numeroTarjeta" name="numeroTarjeta" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="nombre">Mes de vencimiento</label>
                                    <select class="form-control" name="mes">
                                        <option value="1">01</option>
                                        <option value="2">02</option>
                                        <option value="3">03</option>
                                        <option value="4">04</option>
                                        <option value="5">05</option>
                                        <option value="6">06</option>
                                        <option value="7">07</option>
                                        <option value="8">08</option>
                                        <option value="9">09</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="nombre">Año de vencimiento</label>
                                    <input type="number" class="form-control" placeholder="AA" id="year" name="year" required>
                                </div>

                                <div class="form-group col-md-12">
                                    <label for="nombre">Nombre del titular</label>
                                    <input type="text" class="form-control" placeholder="Nombre del titular" id="nombre" name="nombre" required>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="nombre">Código de seguridad</label>
                                    <input type="number" class="form-control" placeholder="XXX" id="codigo" name="codigo" required>
                                </div>
                            </div>
                            <!-- Guardar -->
                            <input type="hidden" name="totalSesion" value="<%= totalSesion %>">
                            <input type="hidden" name="metodoPago" value="TARJETA">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Atras</button>
                            <button type="submit" class="btn btn-primary">Pagar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 

        <!-- MODAL PAGO PAYPAL -->
        <div class="modal fade" id="modalPagarPaypal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="margin-top: 60px">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalCenterTitle">
                            Pagar con Paypal
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="PagarTarjetaPaypalYCerrarSesion" method="post">
                        <div class="modal-body" style="padding: 20px">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="nombre">Usuario</label>
                                    <input type="text" class="form-control" placeholder="Usuario" id="usuario" name="usuario" required>
                                </div>
                                
                                <div class="form-group col-md-12">
                                    <label for="nombre">Contraseña</label>
                                    <input type="password" class="form-control" placeholder="Contraseña" id="password" name="password" required>
                                </div>
                                
                            </div>
                            <!-- Guardar -->
                            <input type="hidden" name="totalSesion" value="<%= totalSesion %>">
                            <input type="hidden" name="metodoPago" value="PAYPAL">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Atrás</button>
                            <button type="submit" class="btn btn-primary">Pagar con paypal</button>
                        </div>
                    </form>
                </div>
            </div>
        </div> 


    </body>
    <script>
        var metodoPago = 'EFECTIVO';

        function actualizarValor(valor) {
            metodoPago = valor;
        }

        function mostrarModal() {
            switch (metodoPago) {
                case 'EFECTIVO':
                    $("#modalPagarEfectivo").modal();
                    break;
                case 'TARJETA':
                    $("#modalPagarTarjeta").modal();
                    break;
                case 'PAYPAL':
                    $("#modalPagarPaypal").modal();
                    // console.log('Abrir paypal');
                    break;
            }
        }

    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
