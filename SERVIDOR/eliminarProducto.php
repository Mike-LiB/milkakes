<?php
    require("conexion.php");
    $id = $_POST["id"];
    mysqli_query($conexion,"DELETE FROM productosXpedidos WHERE id_producto='$id'");
    mysqli_query($conexion,"DELETE FROM producto WHERE id_producto='$id'");
    
    //Codigo pendiente de allar la solucuion de no Eliminar de la tabla Orden  esta mesa
    echo "exito";
?>