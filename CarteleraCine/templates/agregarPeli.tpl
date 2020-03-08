<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V13</title>
       
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="js/jquery-3.4.1.js" type="text/javascript"></script>
  <script src="js/funcion.js" type="text/javascript"></script>
  

<!--===============================================================================================-->	
	<link rel="icon" type="imagenes/png" href="imagenes/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor2/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #999999;">
    
    {include file="encabezado.tpl"}
    
    
	
	<div class="limiter">
		<div class="container-login100">
			<div class="login100-more" style="background-image: url('imagenes/bg-01.jpg');"></div>

			<div class="wrap-login100 p-l-50 p-r-50 p-t-72 p-b-50">
				<form method="POST" action="guardarPeli.php" id="formularioagregar" enctype="multipart/form-data">

					<div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtTitulo"></span>
                                            <br><br>
						<span class="label-input100">Título</span>
						<input class="input100" type="text" name="txtTitulo" id="txtTitulo" placeholder="Título...">
						
					</div>

					<div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtGenero"></span>
                                            <br><br>
						<span class="label-input100">Género</span>
						<select class="input100" id="txtGenero" name="txtGenero">
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
					</div>
                                    
                                    
					<div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtFecha"></span>
                                            <br><br>
						<span class="label-input100">Fecha Lanzamiento</span>
						<input class="input100" type="date" id="txtFecha" name="txtFecha" placeholder="Fecha...">
					</div>
                                    
                                       <div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtResumen"></span>
                                            <br><br>
						<span class="label-input100">Resumen</span>
                                                <textarea rows="4" cols="50" class="input100" id="txtResumen" name="txtResumen" placeholder="Resumen..."></textarea>
					</div>
                                    
                                        <div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtDirector"></span>
                                            <br><br>
						<span class="label-input100">Director</span>
						<input class="input100" type="text" id="txtDirector" name="txtDirector" placeholder="Director...">
					</div>
                                    
                                        <div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_txtElenco"></span>
                                            <br><br>
						<span class="label-input100">Elenco</span>
						<input class="input100" type="text" id="txtElenco" name="txtElenco" placeholder="Elenco...">
					</div>
                                    
                                        <div class="wrap-input100 validate-input">
                                            <span class="focus-input100" id="err_imgPoster"></span>
                                            <br><br>
						<span class="label-input100">Imágen</span>
						<input class="input100" type="file" id="imgPoster" name="imgPoster" placeholder="Imágen...">
					</div>
                                    
                                        
                                            <span class="focus-input100" id="err_txtVideo"></span>
                                            <br><br>
						<span class="label-input100">Video</span>
						<input class="input100" type="text" id="txtVideo" name="txtVideo" placeholder="Video(opcional)...">
					
                                    
                                    

					<div class="flex-m w-full p-b-33">
					</div>
                                   
                                    <span id="err_btnAgregar"></span>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
                                                     
							<div class="login100-form-bgbtn"></div>
                                                        <button class="login100-form-btn" type="button" id="btnAgregar">Agregar Película</button>
						</div>

						
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="vendor2/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/bootstrap/js/popper.js"></script>
	<script src="vendor2/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/daterangepicker/moment.min.js"></script>
	<script src="vendor2/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor2/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
