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
        <div class="container-reportes" style="margin-top: 70px">
            <h3>Reportes de platillos por puntaje</h3>

            <div class="form-row">
                <div class="form-group col-md">
                    <label for="inputEmail4">Fecha inicio</label>
                    <input type="date" class="form-control" id="inputEmail4" min="2000-01-01" max="2030-12-31">
                </div>
                <div class="form-group col-md">
                    <label for="inputPassword4">Fecha fin</label>
                    <input type="date" class="form-control" id="inputPassword4" min="2000-01-01" max="2030-12-31">
                </div>
                <div class="form-group col-md">
                    <label for="inputPassword4">Cliente</label>
                    <select class="form-control">
                        <option value="todos">Todos</option>
                        <!--For de todos los clientes para cada option-->
                    </select>
                </div>
                <div class="form-group col-md">
                    <label for="inputPassword4">Mesero</label>
                    <select class="form-control">
                        <option value="todos">Todos</option>
                        <!--For de todos los meseros para cada option-->
                    </select>
                </div>
                <div class="form-group col-md">
                    <br>
                    <button class="btn btn-secondary">Filtrar</button>
                </div>
            </div>
            
            <!-- Tabla -->
            <div >
                <table class="table">
                    <thead>
                        <tr>
                            <th>Venta</th>
                            <th>ID Cliente</th>
                            <th>Cliente</th>
                            <th>ID Mesero</th>
                            <th>Mesero</th>
                            <th>Mesa</th>
                            <th>Tipo de pago</th>
                            <th>Total</th>
                            <th>Fecha</th>
                        </tr>
                    </thead>
                    <tbody>
                        
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
