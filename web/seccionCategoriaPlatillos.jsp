<%@page import="java.util.Collection"%>
<%@page import="modelo.CategoriaPlatillo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sección platillos</title>
        <link rel="stylesheet" href="css/stylesAdmin.css">
        <link rel="stylesheet" href="css/stylesCategorias.css">
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
        <div style="margin-top: 80px">
            <div class=" contCategorias">
                <h3 style="margin-bottom: 25px; text-align: center">Categorías</h3>
                <div class="agregarPlatillo"
                     onclick="focusInsert()"
                    data-toggle="modal" 
                    data-target="#modalAgregarCategoria">
                   <img src="css/imagenes/plus.png" height="45px" style="position: absolute; top: 13px; right: 28px">
                </div>
                <div class="maxSeccionCategorias"><!---->
                    <%
                    Collection<CategoriaPlatillo> categorias = null;
                    categorias = (Collection<CategoriaPlatillo>) request.getAttribute("Categorias");
                %>
                <%
                    int i = 1;
                    int size = categorias.size();
                    for (CategoriaPlatillo categoria : categorias) {
                %>
                <form action="" method="post" class="col-md-12">

                    <div class="categoria">
                      <%= categoria.getCategoria() %>
                      <a class="btn btn-sm btn-primary btn-edit-cat" href="#" id="edit<%=i%>"
                         onclick="focuss()"
                        data-toggle="modal" 
                        data-target="#modalEditarCategoria<%=i%>" data-sfid="<%= categoria.getId() %>">
                          <i class="fas fa-pencil-alt"></i>
                      </a>
                      <a class="btn btn-sm btn-danger btn-delete-cat" href="EliminarCategoriaPlatillo?id=<%= categoria.getId()%>" 
                         onclick="return confirm('¿Estás seguro de eliminar esta categoría?')"
                         id="delete<%=i%>"><i class="fas fa-trash-alt"></i></a>
                    </div>

                </form>
                    
                <!-- MODAL EDITAR PRODUCTO -->
                <div class="modal fade" id="modalEditarCategoria<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top:-60px">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
                        <%@ page import="modelo.*" %>
                        <form action="ActualizarCategoriaPlatillo" method="post" class="modal-content">
                            <div class="modal-header" >
                                <h4 class="modal-title" id="exampleModalCenterTitle">
                                    <span style="position: relative">
                                        Editar categoría
                                        <!--div style="position: absolute; top: 0; right: -50px">
                                            <span style="margin-top: 0px" class="badge badge-secondary">1</span>
                                        </div-->
                                    </span>

                                </h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="row" style="padding: 5px 10px">
                                    <div class="form-group col-md-12">
                                        <label for="categoria">Categoría</label>
                                        <input type="hidden" name="id" value="<%= categoria.getId() %>">
                                        <input type="text" class="form-control" 
                                               placeholder="Nombre de la categoría"
                                               id="categoria<%=i%>"
                                               name="categoria"
                                               value="<%= categoria.getCategoria() %>"
                                               autofocus
                                               required>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Modificar</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <%  i++;
                    }
                %>
                </div>
                
            </div>
        </div>
        <!--  / Contenido -->
        
        <!-- MODAL AGREGAR PRODUCTO -->
        <div class="modal fade" id="modalAgregarCategoria" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top:-60px">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <%@ page import="controlador.*" %><!--Se importan todos los servlet-->
                <%@ page import="modelo.*" %>
                <form action="RegistrarCategoriaPlatillo" method="post" class="modal-content">
                    <div class="modal-header" >
                        <h4 class="modal-title" id="exampleModalCenterTitle">
                            <span style="position: relative">
                                Nueva categoría
                                <!--div style="position: absolute; top: 0; right: -50px">
                                    <span style="margin-top: 0px" class="badge badge-secondary">1</span>
                                </div-->
                            </span>

                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="padding: 5px 10px">
                            <div class="form-group col-md-12">
                                <label for="categoria">Categoría</label>
                                <input type="text" class="form-control" 
                                       placeholder="Nombre de la categoría"
                                       id="categoriaInsertar"
                                       name="categoria"
                                       autofocus
                                       required>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-success">Añadir</button>
                    </div>
                </form>
            </div>
        </div>
       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
            /*var pass = document.getElementById("password");

            pass.addEventListener("keyup", function(event) {
                // Number 13 is the "Enter" key on the keyboard
                if (event.keyCode === 13) {
                    // Cancel the default action, if needed
                    event.preventDefault();
                    // Trigger the button element with a click
                    document.getElementById("change").click();
                }
            });*/
            function focusInsert() {
                window.setTimeout(onfocusInsert, 490);
            }
            
            function onfocusInsert() {
                var inputInsert = document.getElementById('categoriaInsertar');
                input.focus();
            }
    
            function focuss() {
                window.setTimeout(show, 490);
            }
            
            function show() {
                <%
                    for (int j = 1; j<=size; j++) {
                %>
                var input<%=j%> = document.getElementById('categoria<%=j%>');
                input<%=j%>.focus();
                input<%=j%>.select();
                <%
                    }
                %>
            }
        </script>
    </body>
    <!-- %
        if (request.getAttribute("resInsert") != null) {
            out.print("<script>alert(\"" + request.getAttribute("resClave").toString() + "\")</script>");
        }
    %-->
</html>
