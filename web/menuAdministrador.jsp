<%-- 
    Document   : menuAdministrador
    Created on : 6/05/2019, 09:19:43 PM
    Author     : Personal
--%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<ul class="nav nav-tabs navbarAdmin">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Catálogos</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="ListarAdministradores">Administradores</a>
            <a class="dropdown-item" href="ListarPlatillos">Platillos</a>
            <a class="dropdown-item" href="ListarClientes">Clientes</a>
            <a class="dropdown-item" href="ListarMeseros">Meseros</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="seccionReportesVentas.jsp">Ventas generales</a>
          <a class="dropdown-item" href="seccionReportesPlatillos.jsp">Platillos por ventas</a>
          <a class="dropdown-item" href="seccionReportesPlatillosTablaSinFechas.jsp">PlatillosPorVentasGeneral</a> 
          <a class="dropdown-item" href="seccionReportesPlatillosPorPuntaje.jsp">Platillos por puntuación</a>
        </div>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="seccionClaveAccesoCocina.jsp">Clave de acceso cocina</a>
    </li>
    <li class="nav-item dropdown" style="float: right">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
            <img src="css/imagenes/admin.PNG" height="20px" style="border-radius: 50%">
            <span><%  out.print(session.getAttribute("nombreMostrar")); %></span>
        </a>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#">
                <!--i class="fas fa-arrow-circle-right"></i-->
                <img src="css/imagenes/gear.png" height="15px">
                Configuración
            </a>
            <a class="dropdown-item" href="#">
                <img src="css/imagenes/star.png" height="15px">
                Algo más
            </a>
            <a class="dropdown-item" href="#">
                <img src="css/imagenes/plus.png" height="15px">
                Ver algo
            </a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="CerrarSesion">
                <img src="css/imagenes/logout.png" height="15px">
                Cerrar sesión
            </a>
        </div>
    </li>
</ul>