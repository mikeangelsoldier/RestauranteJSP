<%-- 
    Document   : cocina
    Created on : 9/04/2019, 08:40:59 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles-cocina.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    </head>
    <body>
        <div class="row" style="margin: 40px">
            <div class="col-md-4 content">
                <h2>Órdenes en espera</h2>
                <div class="list-group">
                    <a href="#" class="list-group-item list-group-item-action">Órden 4</a>
                    <a href="#" class="list-group-item list-group-item-action">Órden 5</a>
                    <a href="#" class="list-group-item list-group-item-action">Órden 1</a>
                    <a href="#" class="list-group-item list-group-item-action">Órden 7</a>
                    <a href="#" class="list-group-item list-group-item-action active">Órden 2</a>
                </div> <br>

                <div style="text-align: center">
                    <button class="btn btn-lg btn-primary">Anterior</button>
                    <button class="btn btn-lg btn-primary">Siguiente</button>
                </div>
            </div>
            <div class="col-md-8 content">
                <h2>Órden 2 - mesa - mesero</h2>
                <div class="content-2">

                    <h4>Carne</h4>
                    <div>
                        <img src="css/imagenes/platillo1.jpg" width="200px" height="150px"> <br>
                    </div>

                    <h4>Enchiladas</h4>
                    <img src="css/imagenes/platillo2.jpg" width="200px" height="150px"> <br>

                    <h4>Pastel</h4>
                    <img src="css/imagenes/postre1.jpg" width="200px" height="150px">
                    
                    <h4>Pastel</h4>
                    <img src="css/imagenes/postre1.jpg" width="200px" height="150px">
                </div> <br>
                
                <div style="text-align: center">
                    <button class="btn btn-lg btn-success">Órden lista</button>
                </div>
            </div>

        </div>
    </body>
</html>
