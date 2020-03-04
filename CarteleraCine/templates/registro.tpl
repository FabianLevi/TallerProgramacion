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
<div class="registro">
       <br><br>
                <form method="POST" action="guardarRegistro.php" id="formularioregistro">
                    <table class="tabla2">
                        <tr>
                            <td><div class="form">Alias</div><br><br></td> <td><input type="text" id="txtAliasReg" name="txtAlias" class="rellenar" placeholder="Ingrese su alias"/><span id="err_txtAliasReg"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Correo</div><br><br></td> <td><input type="text" id="txtCorreoReg" name="txtCorreoReg" class="rellenar" placeholder="Ingrese su correo"/><span id="err_txtCorreoReg"></span><br><br></td>
                        </tr>
                        <tr>
                            <td><div class="form">Contraseña</div><br><br></td> <td><input type="password" id="txtContraReg" name="txtContraReg" class="rellenar" placeholder="Ingrese su contraseña"/><span id="err_txtContraReg"></span><br><br></td>
                            
                        </tr>
                        <tr>
                            <td colspan="2"><div class="td2"><input class= "boton" type="submit" value="Registrarse" id="btnRegistro"><span id="err_btnRegistro"></span></div></td>
                    </tr>
                    </table>
                </form>
    </div>
</body>
</html>