<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
  <script src="js/funciones.js" type="text/javascript"></script>

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>
    {include file="encabezado.tpl"}

<<<<<<< Updated upstream
  <!-- Page Content -->   
=======
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" onclick="verInicio()" href="#inicio">Iniciar Sesion</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contact</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
   <div class="inicio">
                <form method="POST" action="procesoUpload.php" id="formularioinicio">
                    <div class="tabla2"><table>
                        <tr>
                            <td><div class="form">Correo</div><br><br></td> <td><input type="text" id="txtCorreo" name="txtCorreo" class="rellenar" placeholder="Ingrese su correo"/><span id="err_txtCorreo"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Contraseña   </div><br><br></td> <td><input type="password" id="txtContra" class="rellenar" placeholder="Ingrese su contraseña"/><span id="err_txtContra"></span><br><br></td>
                            
                        </tr>
                        <tr>
                            <td colspan="1"> <div class="td2"><input class= "boton" type="button" value="Iniciar Sesión" id="btnInicio"><span id="err_btnInicio"></span></div></td>
                    </tr>
                        </table></div>
                </form>
            </div>
      
>>>>>>> Stashed changes
  <div class="container2">
      

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">MOVIES PRO</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">Agregar Pelicula</a>
          <a href="#" class="list-group-item">Aprobar Comentarios</a>
        </div>

      </div>
   
      <!-- /.col-lg-3 -->
       
      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="imagenes/harry.jpg" alt="First slide">
             
            </div>
            <div class="carousel-item">
                
              <img class="d-block img-fluid" src="imagenes/thumb-1920-814011.png" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid"src="imagenes/coco.jpg" alt="Third slide">
            
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
           
          

        <div class="row" id ="ajax">
<!--
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[0]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[0]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[1]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[1]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[2]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[2]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[3]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[3]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[4]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[4]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="{$datos[5]["fotos"]}" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">{$datos[5]["titulo"]}</a>
                </h4>
                <h5>$24.99</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>

        </div>
        <!-- /.row -->
-->
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->
    <div id="btn">
        <input type="button" value="<" id="btnAnterior">
        <input type="button" value=">" id="btnSiguiente">
    </div>
  </div>
              
  <!-- /.container -->

  <!-- Footer -->
  <div class="container3">
  <footer class="py-5 bg-dark">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
