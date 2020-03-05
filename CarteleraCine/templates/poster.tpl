<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
  <script src="js/funciones.js" type="text/javascript"></script>

  <title>Shop Item - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-item.css" rel="stylesheet">

</head>

<body>

{include file="encabezado.tpl"}

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">
        <h1 class="my-4">{$pelicula.titulo}</h1>
        <div class="list-group">
          <a href="#" class="list-group-item active">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>
      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div class="card mt-4">
          <img class="card-img-top img-fluid" src="{$pelicula.fotos}" alt="">
          <div class="card-body">
            <h3 class="card-title">{$pelicula.titulo}</h3>
            <h4>{$pelicula.fecha_lanzamiento}</h4>
            <p class="card-text">{$pelicula.resumen}</p>
            <p class="card-text">DIRECTOR: {$pelicula.director}</p>
            {foreach from=$elenco item=fila}
            <p class="card-text">ELENCO: {$fila["nombre"]}</p>
            {/foreach}
            <a href=“{$pelicula.youtube_trailer}”>Mirar trailer</a>
            <br>
            <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
            4.0 stars
          </div>
        </div>
        <!-- /.card -->

        <div class="card card-outline-secondary my-4">
          <div class="card-header">
            Comentarios
          </div>
          <div class="card-body" id="ajaxComentarios">
          </div>
        </div>
        <!-- /.card -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
  <input type="hidden" id="comentarioID" value="{$pelicula.id}"/>
  
        <input type="button" value="<" alt='' id="2at">
        <input type="button" value=">" alt='' id="2si">
    
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>