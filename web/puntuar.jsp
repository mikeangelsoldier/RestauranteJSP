

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Mesero"%>
<%@page import="modelo.GestorMeseroBD"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Platillo"%>
<%@page import="modelo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puntuar platillos</title>
        <!--link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="css/stylesPlatillosSesion.css"-->
        <link rel="stylesheet" href="css/styles-puntuacion-platillos.css">
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
            String totalSesion = request.getParameter("totalSesion");
            System.out.println("totalSesionDesdeJSP = "+totalSesion);
            int idMesero = (int)request.getSession().getAttribute("sesionIdMesero");
            Cliente cliente = (Cliente)request.getSession().getAttribute("usr");
            ArrayList<Platillo> listaPlatillosSinRepetir = null;
            listaPlatillosSinRepetir = (ArrayList<Platillo>) request.getAttribute("listaPlatillosDeLaSesion");
            
            GestorMeseroBD gestorMesero = new GestorMeseroBD();
            Mesero mesero = gestorMesero.getMesero(idMesero);
            
            session.setAttribute("listaPlatillosSinRepetir", listaPlatillosSinRepetir);
            // request.setAttribute("listaPlatillosSinRepetir", listaPlatillosSinRepetir);
            // request.setAttribute("totalSesion", totalSesion);
        %>
        
        <h1 class="title-puntuar">Puntuar platillos</h1>
        
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="0">
            
            <ol class="carousel-indicators indicadores">
                <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                <%
                    for (int i = 0; i < listaPlatillosSinRepetir.size(); i++) {
                %>
                <li data-target="#carouselExampleControls" data-slide-to="<%=i+1%>"></li>
                <%
                    }
                %>
            </ol>
            <form action="ProcesarPuntuaciones" method="post" class="carousel-inner">
              
                <input type="hidden" name="totalSesionForm" value="<%= totalSesion %>">
                <div class="carousel-item active">
                    <h4 class="title-puntuar" style="margin-top: 20px">Mesero <%= mesero.getNombre()%> <%= mesero.getApellidos()%></h4>
                    <div class="w-100 content-platillo" >
                        <img src="css/imagenes/res_background.jpg" alt="..." height="300px">
                    </div>
                    <div class="stars">
                        <div class="rating">
                            <label>
                                <input type="radio" name="puntaje1" value="1" />
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje1" value="2" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje1" value="3" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>   
                            </label>
                            <label>
                                <input type="radio" name="puntaje1" value="4" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje1" value="5" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                        </div>
                    </div>
                </div>
                
                
                <!-- iterar con foreach los platillos -->
                <%
                    for (int i = 0; i < listaPlatillosSinRepetir.size(); i++) {
                %>
                
                <div class="carousel-item">
                  <h4 class="title-puntuar" style="margin-top: 20px"><%= listaPlatillosSinRepetir.get(i).getNombre() %></h4>
                    <div class="w-100 content-platillo" >

                      <img src="ObtenerImagenes?id=<%=listaPlatillosSinRepetir.get(i).getId()%>" alt="..." height="300px" width="450px">
                    </div>
                    <div class="stars">
                        <div class="rating">
                            <label>
                                <input type="radio" name="puntaje<%= i+2 %>" value="1" />
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje<%= i+2 %>" value="2" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje<%= i+2 %>" value="3" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>   
                            </label>
                            <label>
                                <input type="radio" name="puntaje<%= i+2 %>" value="4" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje<%= i+2 %>" value="5" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                        </div>
                    </div>
                </div>
                
                <%
                    }
                %>
                <button type="submit"  class="btn btn-primary" style="position: fixed; bottom: 40px; right: 40px;">Guardar puntuaciones</button>
                
            </form>
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Siguiente</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Atrás</span>
            </a>
                
                
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
</html>
