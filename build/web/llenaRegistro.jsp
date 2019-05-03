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
        <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
        <%@ page import="modelo.*" %>
  
        <div style="margin:10px; margin-bottom: -10px">
            <form action="index.jsp" method="post">
                <button class="back" type="submit"></button>
            </form>
        </div>
        <div class="formulario col-md-7">
            <h3> Registra tus datos</h3><br>
            <form action="RegistrarUsuario" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Nombre</label>
                        <input type="text" class="form-control" id="inputName" 
                               placeholder="Nombre(s)" 
                               name="name"
                               autofocus required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputLastName">Apellidos</label>
                        <input type="text" class="form-control" id="inputLastName" 
                               placeholder="Apellidos" 
                               name="lastname"
                               required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail">Correo</label>
                        <input type="email" class="form-control" id="inputEmail" 
                               placeholder="Correo electrónico"
                               name="email"
                               required>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputUsername">Nombre de usuario</label>
                        <input type="text" class="form-control" id="inputUsername" 
                               placeholder="Nombre de usuario"
                               name="username"
                               required>                        
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Contraseña</label>
                        <input type="password" class="form-control" 
                               id="inputPassword4" placeholder="Contraseña"
                               name="password"
                               required>
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
    <%
        if (request.getAttribute("resInsert") != null) {
            out.print("<script>alert(\"" + request.getAttribute("resInsert").toString() + "\")</script>");
        }
    %>
</html>