

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
        <h1 class="title-puntuar">Puntuar platillos</h1>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-interval="0">
            <ol class="carousel-indicators indicadores">
                <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                <li data-target="#carouselExampleControls" data-slide-to="2"></li>
            </ol>
            <form class="carousel-inner">
                <div class="carousel-item active">
                    <h4 class="title-puntuar" style="margin-top: 20px">Platillo 1</h4>
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
                        <!--
                        <div class="star" id="e1"></div>
                        <div class="star" id="e2"></div>
                        <div class="star" id="e3"></div>
                        <div class="star" id="e4"></div>
                        <div class="star" id="e5"></div>
                        -->

                        <!--img src="css/imagenes/star-gris.png" height="60px"-->
                    </div>
                </div>
                <div class="carousel-item">
                    <h4 class="title-puntuar" style="margin-top: 20px">Platillo 2</h4>
                    <div class="w-100 content-platillo" >

                        <img src="css/imagenes/res_background.jpg" alt="..." height="300px">
                    </div>
                    <div class="stars">
                        <div class="rating">
                            <label>
                                <input type="radio" name="puntaje2" value="1" />
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje2" value="2" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje2" value="3" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>   
                            </label>
                            <label>
                                <input type="radio" name="puntaje2" value="4" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje2" value="5" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <h4 class="title-puntuar" style="margin-top: 20px">Platillo 3</h4>
                    <div class="w-100 content-platillo" >

                        <img src="css/imagenes/res_background.jpg" alt="..." height="300px">
                    </div>
                    <div class="stars">
                        <div class="rating">
                            <label>
                                <input type="radio" name="puntaje3" value="1" />
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje3" value="2" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje3" value="3" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>   
                            </label>
                            <label>
                                <input type="radio" name="puntaje3" value="4" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                            <label>
                                <input type="radio" name="puntaje3" value="5" />
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                                <span class="icon">★</span>
                            </label>
                        </div>
                    </div>
                </div>
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
    <script>
        $(':radio').change(function() {
            console.log('New star rating: ' + this.value);
        });
    </script>
</html>
