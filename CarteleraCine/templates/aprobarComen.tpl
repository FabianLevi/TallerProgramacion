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
            <div class="tabla2"><table>
                    {if $error}
                        <h1> No hay comentarios pendientes de aprobación </h1>
                    {/if}
                    {foreach from=$datos item=dat}  
                        <tr>
                            
                            
                            <td class="td2">{$dat.mensaje}</td> <td>{$dat.puntuacion}</td>
                            <td><a href="responder.php?id={$dat.id}&res=APROBADO&idPelicula={$dat.id_pelicula}"><img src="imagenes/okey.png" alt="aprobar" width="40"/></a></td>
                            <td></td>
                            <td><a href="responder.php?id={$dat.id}&res=RECHAZADO&idPelicula={$dat.id_pelicula}"><img src="imagenes/error.png" alt="rechazar" width="40"/></a></td>
                        </tr>
                    {/foreach}
                </table></div>
    </body>
</html>