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
        <title>Inicio</title>
        <link rel="stylesheet" href="css/styles1.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
    </head>
    <body>
        <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
        <%@ page import="modelo.*" %>
        <form action="LoginClientesInvitados" method="post" class="container">
            <h1 class="title"><i class="fas fa-drumstick-bite"></i> Bienvenido al sistema </h1>
            <button class="btn btn-login btn-block btn-primary" type="button" onclick="toLogin();" >
                <i class="fas fa-arrow-circle-right"></i>
                Iniciar sesión</button>
            <button class="btn btn-login btn-block btn-primary" type="submit">
                <i class="fas fa-arrow-circle-right"></i>
                Iniciar como cliente general</button>
        </form>
    </body>
    
    <script language="javascript" type="text/javascript">
        function toLogin() { 
            window.open("loginClientes.jsp","_self"); 
        }
        /*function toLoginAsInvited() { 
            window.open("pedidos.jsp","_self"); 
        }*/
    </script>
</html>
