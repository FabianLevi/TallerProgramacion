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
    <br><br>
    <form method="POST" action="guardarPeli.php" id="formularioagregar" enctype="multipart/form-data">
                    <div class="tabla2"><table>
                        <tr>
                            <td><div class="form">Título</div><br><br></td> <td><input type="text" id="txtTítulo" name="txtTítulo" class="rellenar" placeholder="Ingrese el título"/><span id="err_txtTítulo"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Género</div><br><br></td> <td><input type="text" id="txtGénero" name="txtGenero" class="rellenar" placeholder="Ingrese el género"/><span id="err_txtGénero"></span><br><br></td>
                            
                        </tr>
                        <tr>
                            <td><div class="form">Fecha Lanzamiento</div><br><br></td> <td><input type="date" id="txtFecha" name="txtFecha" class="rellenar" placeholder="Ingrese la fecha"/><span id="err_txtFecha"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Resumen</div><br><br></td> <td><textarea rows="4" cols="50" class="rellenar" id="txtResumen" name="txtResumen" placeholder="Ingrese el resumen"></textarea><span id="err_txtResumen"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Director</div><br><br></td> <td><input type="text" id="txtDirector" name="txtDirector" class="rellenar" placeholder="Ingrese el director"/><span id="err_txtDirector"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Poster</div><br><br></td> <td><input type="file" id="imgPoster" name="imgPoster" class="rellenar" placeholder="Ingrese la imagen"/><span id="err_imgPoster"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Video</div><br><br></td> <td><input type="text" id="txtVideo" name="txtVideo" class="rellenar" placeholder="Ingrese el link del video(opcional)"/><span id="err_txtVideo"></span><br><br></td>
                        </tr>
                        
                        <tr>
                            <td colspan="2"> <div class="td2"><input class= "boton" type="submit" value="Agregar Película" id="btnAgregar"><span id="err_btnAgregar"></span></div></td>
                    </tr>
                        </table></div>
                </form>
    
</body>
</html>