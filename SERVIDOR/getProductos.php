<?php
    require("conexion.php");
    $consulta = mysqli_query($conexion,
    "SELECT id_producto,nombre_producto FROM producto");
    $producto=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $producto[]=array("id_producto"=>$datos["id_producto"],"nombre"=>$datos["nombre_producto"]);
        }
        echo json_encode($producto);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>