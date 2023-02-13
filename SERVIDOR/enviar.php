<?php
    require("conexion.php");

    $usu = $_POST["usu"];
    $con = $_POST["contra"];

    mysqli_query($conexion,"INSERT INTO usuarios(usu,contra)VALUES('$usu','$con')");
    
?>