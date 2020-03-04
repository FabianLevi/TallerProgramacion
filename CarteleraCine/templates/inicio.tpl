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
<div class="inicio">
       <br><br>
                <form method="POST" action="login.php" id="formularioinicio">
                    <table class="tabla2">
                        <tr>
                            <td><div class="form">Correo</div><br><br></td> <td><input type="text" id="txtCorreo" name="txtCorreo" class="rellenar" placeholder="Ingrese su correo"/><span id="err_txtCorreo"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Contraseña</div><br><br></td> <td><input type="password" id="txtContra" name="txtContra" class="rellenar" placeholder="Ingrese su contraseña"/><span id="err_txtContra"></span><br><br></td>
                            
                        </tr>
                        <tr>
                            <td colspan="1"> <div class="td2"><input class= "boton" type="submit" value="Iniciar Sesión" id="btnInicio"><span id="err_btnInicio"></span></div></td>
                    </tr>
                    {if ($error)}Usuario incorrecto{/if}
                        
                        
                        </table>
                </form>
    </div>
</body>
</html>