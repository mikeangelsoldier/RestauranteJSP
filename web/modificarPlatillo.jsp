<%@page import="java.util.Collection"%>
<%@page import="modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar platillo</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/modal-styles.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
          crossorigin="anonymous">
    </head>
    <body style="background-color: #444">
        <%
            GestorPlatilloBD gestor = new GestorPlatilloBD();

            Platillo platillo = gestor.getPlatillo(Integer.parseInt(request.getParameter("id")));
        %>
        <div class="container">
            <div>
                <form action="ActualizarPlatillo" 
                      method="post" enctype="multipart/form-data" class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <span style="position: relative">
                                Editar platillo
                                <div style="position: absolute; top: 0; right: -50px">
                                    <input type="hidden" name="id" value="<%=platillo.getId()%>">
                                    <span style="margin-top: 0px" class="badge badge-secondary">
                                        <%=platillo.getId()%> </span>
                                </div>
                            </span>

                        </h4>
                    </div>

                    <div class="modal-body">
                        <div class="row" style="padding: 5px 10px">
                            <div class="col-md-12" style="position: relative">
                                <label>Imagen </label>
                                <br>
                                <img id="imgg" src="ObtenerImagenes?id=<%=platillo.getId()%>" width="120px" height="75px">
                                <label class="upload" for="foto2">
                                    <img src="css/imagenes/upload.png" height="55px"> Cambiar foto
                                </label>
                                <input class="fileUpload" type="file" id="foto2" name="foto2" onchange="document.getElementById('imgg').src = window.URL.createObjectURL(this.files[0])">
                            </div>

                            <div class="form-group col-md-12">
                                <label for="nombre2">Nombre</label>
                                <input type="text" class="form-control" placeholder="Nombre del platillo" id="nombre2" 
                                       name="nombre2" value="<%=platillo.getNombre()%>" required>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="categoria2">Categoría</label>
                                <select class="form-control" name="categoria2" id="categoria2">
                                    <%!
                                        String selectOutput() {
                                            return "\"selected\"";
                                        }
                                    %>
                                    <option value="Comida" <% if (platillo.getCategoria().equals("Comida")) selectOutput(); %>>Comida</option>
                                    <option value="Bebida" <% if (platillo.getCategoria().equals("Bebida")) selectOutput(); %>>Bebida</option>
                                    <option value="Postre" <% if (platillo.getCategoria().equals("Postre")) selectOutput(); %>>Postre</option>
                                </select>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="precio2">Precio</label>
                                <input type="number" class="form-control" placeholder="Precio" id="precio2" 
                                       name="precio2" step="0.01" min="1" value="<%=platillo.getPrecio()%>" required>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="descripcion2">Descripción</label>
                                <textarea class="form-control" name="descripcion2" id="descripcion2" placeholder="Descripción" required><%=platillo.getDescripcion()%></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <a href="ListarPlatillos" 
                           class="btn btn-secondary">Cancelar</a>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
