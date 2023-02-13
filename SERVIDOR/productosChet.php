<?php
    require("conexion.php");
    $id_orden = $_POST["id_orden"];
    $consulta = mysqli_query($conexion,
    "SELECT producto.nombre_producto,productosXpedidos.cantidad FROM producto 
    INNER JOIN productosXpedidos ON producto.id_producto=productosXpedidos.id_producto 
    WHERE productosXpedidos.id_orden='$id_orden'");

    $orden=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $orden[]=array("nombre"=>$datos["nombre_producto"],"cantidad"=>$datos["cantidad"]);
        }
        echo json_encode($orden);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>