<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clave acceso cocina</title>
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
        <!--  menú principal-->
        <jsp:include page="menuAdministrador.jsp" />
        
        <!--  Contenido -->
        <div style="margin-top: 120px">
            <div class="container contClave">
              <img src="css/imagenes/chef-hat.png" height="100px" class="chef-hat">
              <h1>Clave de acceso cocina</h1>
              <h5 style="text-align:center; margin: 15px">Cambiar clave</h5>
              <%@ page import="controlador.CambiarPasswordCocina" %>
              <form action="CambiarPasswordCocina" method="post" class="col-md-12">

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">
                      <img src="css/imagenes/candado.png" height="24px">
                    </span>
                  </div>
                  <input type="password" class="form-control" aria-label="Sizing example input" name="clave" id="password"
                    aria-describedby="inputGroup-sizing-default" placeholder="Escribe la nueva clave">
                  <button class="btn btn-primary" type="submit" id="change">Cambiar</button>
                </div>



              </form>
            </div>
        </div>
        <!--  / Contenido -->
       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
            var pass = document.getElementById("password");

            pass.addEventListener("keyup", function(event) {
                // Number 13 is the "Enter" key on the keyboard
                if (event.keyCode === 13) {
                    // Cancel the default action, if needed
                    event.preventDefault();
                    // Trigger the button element with a click
                    document.getElementById("change").click();
                }
            });
        </script>
    </body>
    <%
        if (request.getAttribute("resClave") != null) {
            out.print("<script>alert(\"" + request.getAttribute("resClave").toString() + "\")</script>");
        }
    %>
</html>
