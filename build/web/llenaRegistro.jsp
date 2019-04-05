<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Llena Registro</title>
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">        
    </head>
    <body class="login">
        <!--%@ page import="Controller.registro" %-->
        <div style="margin:10px; margin-bottom: -10px">
            <form action="index.jsp" method="post">
                <button class="back" type="submit"></button>
            </form>
        </div>
        <div class="formulario col-md-7">
            <h3> Registra tus datos</h3><br>
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Nombre</label>
                        <input type="text" class="form-control" id="inputName" 
                               placeholder="Nombre(s)" autofocus required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Apellidos</label>
                        <input type="text" class="form-control" id="inputLastName" 
                               placeholder="Apellidos" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail4">Correo</label>
                        <input type="email" class="form-control" id="inputEmail4" 
                               placeholder="Correo electrónico" required>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputAddress">Nombre de usuario</label>
                        <input type="text" class="form-control" id="inputUsername" 
                               placeholder="Nombre de usuario" required>                        
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Contraseña</label>
                        <input type="password" class="form-control" 
                               id="inputPassword4" placeholder="Contraseña" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="form-check" style="margin-left: 8px" >
                        <input style="margin-top: 5px" 
                            class="form-check-input checkboxtext" type="checkbox" 
                            id="gridCheck" required>
                        <label class="form-check-label" for="gridCheck">
                            Acepto términos y condiciones
                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-success">Registrar</button>
            </form>
        </div>
        
    </body>
</html>