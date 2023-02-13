<?php
    require("conexion.php");
    $id = $_POST["id_orden"];
    mysqli_query($conexion,"UPDATE orden SET Estado='Orden Lista' WHERE id_orden='$id'");
    //Codigo pendiente de allar la solucuion de no Eliminar de la tabla Orden  esta mesa
    echo "exito";
?>