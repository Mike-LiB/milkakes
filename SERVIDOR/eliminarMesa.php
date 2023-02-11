<?php
    require("conexion.php");
    $mesa = $_POST["mesa"];
    mysqli_query($conexion,"DELETE FROM usuario WHERE Id_mesa=$mesa");
    mysqli_query($conexion,"DELETE FROM mesa WHERE Id_mesa=$mesa");
    //Codigo pendiente de allar la solucuion de no Eliminar de la tabla Orden  esta mesa
    echo "exito";
?>