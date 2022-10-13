<?php
    require("conexion.php");
    $consulta = mysqli_query($conexion,"SELECT * FROM mesa");
    $mesas=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $mesas[]=array("id_mesa"=>$datos["id_mesa"],"numero_mesa"=>$datos["numero_mesa"]);
        }
        echo json_encode($mesas);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>