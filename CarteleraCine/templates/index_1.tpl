<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>EJEMPLO AJAX</title>
        <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="js/funcion.js"></script>            
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <td>Titulo</td>
                    <td>Fecha</td>
                </tr>
            </thead>
            <tbody id="cuerpoTabla">
                {foreach from=$datos item=fila}
                    <tr>
                        <td>{$fila["titulo"]}</td>
                        <td>{$fila["fecha_lanzamiento"]}</td>                    
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <input type="button" value="<" id="btnAnterior">
        <input type="button" value=">" id="btnSiguiente">
    </body>
</html>