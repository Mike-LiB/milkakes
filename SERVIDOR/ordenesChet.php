<?php
    require("conexion.php");
    $consulta = mysqli_query($conexion,
    "SELECT id_orden,id_mesa,Estado FROM orden WHERE Estado='Proceso'");

    $orden=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $orden[]=array("id_orden"=>$datos["id_orden"],"nMesa"=>$datos["id_mesa"],"estado"=>$datos["Estado"]);
        }
        echo json_encode($orden);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>