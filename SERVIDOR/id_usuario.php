<?php

    header("Access-Control-Allow-Origin: *");

    require("conexion.php");

    $usu = $_POST["usu"];
    $contra = $_POST["contra"];
    $consulta = mysqli_query($conexion,"SELECT Id_mesa FROM usuario WHERE usuario='$usu' && password='$contra'");
    while ($datos=mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
        echo $datos["Id_mesa"];
    }

    
?>