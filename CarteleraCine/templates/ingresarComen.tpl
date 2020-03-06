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
               <form method="POST" action="guardarComen.php" id="formulariocomentario">
                   <input type="hidden" name="idPelicula" value="{$idPelicula}"/>
                    <div class="tabla2"><table>
                        <tr>
                            <td><div class="form">Fecha</div><br><br></td> <td><input type="date" id="fechaComen" name="fechaComen" class="rellenar" placeholder="Ingrese fecha"/><span id="err_txtPuntuacion"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Puntuación</div><br><br></td> <td><input type="text" id="txtPuntuacion" name="txtPuntuacion" class="rellenar" placeholder="Ingrese puntuación"/><span id="err_txtPuntuacion"></span><br><br></td>
                        </tr>
                         <tr>
                            <td><div class="form">Comentario</div><br><br></td> <td><textarea rows="4" cols="50" class="rellenar" id="txtComentario" name="txtComentario" placeholder="Ingrese el comentario"></textarea><span id="err_txtComentario"></span><br><br></td>
                         </tr>
                         <tr>
                            <td colspan="2"> <div class="td2"><input class= "boton" type="button" value="Agregar" id="btnAgregarCom"><span id="err_btnAgregarCom">{if $error} Ya ha registrado un comentario, no puede volver a hacerlo {/if}</span></div></td>
                    </tr>
                        </table></div>
                </form>
    </body>
</html>