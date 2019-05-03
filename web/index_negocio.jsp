<%-- 
    Document   : index
    Created on : 9/04/2019, 06:55:09 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/styles1.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    </head>
    <body>
        <div class="container" style="width: 70% !important; display: block">
            <h1>Bienvenido al sistema</h1><br>
            <h4>Selecciona un perfil</h4><br>
            <div class="row"> 
                <div class="col-md-4">
                    <form>
                        <button type="button" class="btn-image" onclick="loginAdmin();">
                            <img src="css/imagenes/admin.PNG" width="150px" height="150px" class="btn-content-image">
                            <label class="text-image">Administrador</label>
                        </button>
                    </form>
                </div>
                <div class="col-md-4">
                    <form>
                        <button type="button" class="btn-image" onclick="loginMesero();">
                            <img src="css/imagenes/mesero2.png" width="150px" height="150px" class="btn-content-image">
                            <label class="text-image">Mesero</label>
                        </button>
                    </form>
                </div>
                <div class="col-md-4">
                    <form>
                        <button type="button" class="btn-image" onclick="loginCocinero();">
                            <img src="css/imagenes/chef.png" width="150px" height="150px" class="btn-content-image">
                            <label class="text-image">Cocinero</label>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script language="javascript" type="text/javascript">
        function loginAdmin() { 
            console.log('admin');
            window.open("loginAdministrador.jsp","_self"); 
        }
        
        function loginMesero() { 
            window.open("loginMesero.jsp","_self"); 
        }
        
        function loginCocinero() { 
            window.open("loginCocinero.jsp","_self"); 
        }
    </script>
</html>
