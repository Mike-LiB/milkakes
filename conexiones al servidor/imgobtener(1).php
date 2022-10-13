<?php
    header("Access-Control-Allow-Origin: *");
    require("conexion.php");

    $consulta=mysqli_query($conexion,"SELECT foto FROM producto");
    while ($datos = mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
       echo $datos["foto"];
    }
?>