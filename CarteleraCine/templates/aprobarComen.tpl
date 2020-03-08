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
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>

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
    <body class="cuerpo">

        {include file="encabezado.tpl"}

        {if $error}
            <h1> No hay comentarios pendientes de aprobación </h1>
        {/if}

        <br><br>

        <div class="tabla2"><table>
                <span class="login100-form-title p-b-59">
                    Comentarios
                </span>
                {foreach from=$datos item=dat}  
                    <tr>
                        <td width="35%">Mensaje de {$dat.alias}:</td>
                        <td class="td2">"{$dat.mensaje}"</td>
                        <td class="td2">Puntaje:</td>
                        <td class="td2">{$dat.puntuacion}</td>
                        <td><a href="responder.php?id={$dat.id}&res=APROBADO&idPelicula={$dat.id_pelicula}"><img src="imagenes/okey.png" alt="aprobar" width="40"/></a></td>
                        <td></td>
                        <td><a href="responder.php?id={$dat.id}&res=RECHAZADO&idPelicula={$dat.id_pelicula}"><img src="imagenes/error.png" alt="rechazar" width="40"/></a></td>
                    </tr>
                    <tr>
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                    </tr>
                    <tr>
                        <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                    </tr>
                {/foreach}
            </table></div>
        </body></div>
</html>
