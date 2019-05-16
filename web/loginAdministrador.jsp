<%-- 
    Documento   : index
    Creado      : 3/03/2019, 12:46:35 PM
    Autores     : Aguado Guaní Jorge Enrique
                  Cervera Barbosa José Guadalupe de Jesús
                  Ramírez Lira Miguel Ángel
                  Valdivia Barajas Alfredo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" 
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
  </head>
  <body class="login animated fadeInDown">


    <div class="login-container ">
      <div class="title row" style="display: inline">
        <h2 style="color: snow">Bienvenido</h2>
      </div>
      <div style="width: 100%; text-align: center">
        <img src="css/imagenes/admin.PNG" class="image-admin" width="200px" height="200px">
      </div> 

      <div class="card-body">
        <%@ page import="controlador.LoginAdministrador" %>
        <h5 class="card-title" style="color: snow; text-align: center"> 
          Introduce tu contraseña</h5>
        <form action="LoginAdministrador" method="post" id="formLoginAdmin"> <!---->
          <table cellspacing="3" cellpadding="3" class="form-login">
            <tr>
              <td><input class="form-control" type="text" id="password"
                         name="usuario" required placeholder="Usuario">
              </td>
            </tr>
            <tr>
              <td><input class="form-control" type="password" id="password"
                         name="password" required placeholder="Contraseña">
              </td>
            </tr>

          </table>     
          <input name="tipoLogin" type="hidden" value="loginAdministrador">
          <input style="margin-top: 10px;" class="btn btn-primary btn-block" 
                 type="submit" value="Ingresar" id="signin">
        </form>

      </div> 
    </div>


    <script>
      var pass = document.getElementById("password");

      /*function aceptar() {
       var text1, text2;
       text1 = document.getElementById("username").value;
       text2 = document.getElementById("password").value;
       console.log('Username: ', text1);
       console.log('Password ', text2);
       }*/

      pass.addEventListener("keyup", function (event) {
        // Number 13 is the "Enter" key on the keyboard
        if (event.keyCode === 13) {
          // Cancel the default action, if needed
          event.preventDefault();
          // Trigger the button element with a click
          document.getElementById("signin").click();
        }
      });
      
      //Enviar tipo de Login al validador
      //$('#formLoginAdmin').append('<input type="hidden" name="tipoLogin" value="" />');

    </script>
  </body>
</html>
