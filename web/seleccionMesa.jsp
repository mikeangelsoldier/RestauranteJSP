
<%@page import="modelo.GestorMeseroBD"%>
<%@page import="modelo.Mesero"%>
<%@page import="modelo.GestorSesionServicioBD"%>
<%@page import="java.util.List"%>
<%@page import="modelo.SesionServicio"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selección Mesa</title>
        <link rel="stylesheet" href="css/stylesSeleccionMesas.css">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
              integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
              crossorigin="anonymous">
    </head>
    <body>
        <%
            GestorMeseroBD gestorMesero = new GestorMeseroBD();
            List<Mesero> meserosConMesas = gestorMesero.getMeserosYCantidadMesasAsignadas2();

            // List<Mesero> todosLosMeseros = gestorMesero.getMeseros();

            int minimoNumMesas = 99;
            int idMeseroCantidato = 1;
            
            for (Mesero mesero : meserosConMesas) {
                if (mesero.getCantidadMesasAsignadas() < minimoNumMesas) {
                    minimoNumMesas = mesero.getCantidadMesasAsignadas();
                }
            }

            for (Mesero mesero : meserosConMesas) {
                if (mesero.getCantidadMesasAsignadas() == minimoNumMesas) {
                    idMeseroCantidato = mesero.getId();
                    break;
                }
            }


        %>


        <!-- h1> $ {usr.username} </h1-->
        <div class="container contMesas">
            <%
                Cliente cliente = (Cliente)request.getSession().getAttribute("usr");
                if (cliente.getClientId() == 1) {
            %>
            <h2>Bienvenido</h2>
            <%
                } else {
            %>
            <h2>Bienvenido ${usr.username}</h2>
            <%
                }
            %>
            <h3>Elige tu mesa</h3>

            <%                GestorSesionServicioBD gestorServicio = new GestorSesionServicioBD();
                List<SesionServicio> sesiones = gestorServicio.getMesasOcupadasEnSesionesActivas();
                for (int i = 1; i <= 10; i++) {
                    boolean mesaocupada = false;
                    for (SesionServicio sesion : sesiones) {
                        if (i == sesion.getNumMesa()) {
                            mesaocupada = true;
                            break;
                        } else {
                            mesaocupada = false;
                        }
                    }
                    if (!mesaocupada) {
            %>
            <div class="mesa mesaDisponible">
                <a class="link-mesa" href="CrearSesionServicio?mesa=<%= i%>&idMesero=<%= idMeseroCantidato%>"><%= i%></a>
            </div>

            <%
            } else {
            %>
            <div class="mesa mesaOcupada">
                <a class="link-mesa" ><%= i%></a>
            </div>

            <%
                    }
                }
            %>
        </div>
    </body>
</html>
