<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
  <script src="js/funcion.js" type="text/javascript"></script>


  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
  
  

</head>

<body>
    {include file="encabezado.tpl"}


      

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">MOVIES PRO</h1>
        <div class="list-group">
          {if $admin eq "1"}
          <a href="agregarPeli.php" class="list-group-item">Agregar Pelicula</a>
          <a href="aprobarComen.php" class="list-group-item">Aprobar Comentarios</a>
          <br><br>
           {/if} 
            <input type="text" id="filtro" name="nombre"/>
            <input type="button" value="BUSCAR" id="buscar">
            <br>
            <span id="genero">GENERO:</span> <select id="selGenero" name="selGenero">
                <option value="Aventuras"> Aventuras </option>
                <option value="Acción"> Accion </option>
                <option value="Comedia"> Comedia </option>
                <option value="Drama"> Drama </option>
                <option value="Musicales"> Musicales </option>
                <option value="Terror"> Terror </option>
                <option value="Ciencia Ficción"> Ciencia Ficción </option>
                <option value="Suspenso"> Suspenso </option>
                <option value="Infantiles" selected="Infantiles"> Infantiles </option>
            </select>
            <input type="button" value="BUSCAR" id="buscarGenero">
     
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
      </div>
      <!-- /.col-lg-9 -->

    </div>
    </div>
    <!-- /.row -->
    <div class="btn">
        <table class="tabla2">
            <tr>
                <td class="ancho"></td>
                <td class="ancho"></td>
                <td class="ancho"> <input type="button" value="<" alt='' id="btnAnterior"></td>
                <td class="ancho"><input type="button" value=">" alt='' id="btnSiguiente"></td>
            </tr>
        </table>
    </div>
              
  <!-- /.container -->

  <!-- Footer -->
  <div class="container3">
  <footer class="py-5 bg-dark">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
  </footer>
    </div>
    <!-- /.container -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
