<?php
    require("conexion.php");
    $consulta = mysqli_query($conexion,
    "SELECT orden.id_orden,orden.id_mesa,orden.nombre_cliente,orden.Estado,factura.total FROM orden 
    INNER JOIN factura ON orden.id_orden=factura.id_orden WHERE orden.facturado='pendiente'");

    $orden=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $orden[]=array("id_orden"=>$datos["id_orden"],"nMesa"=>$datos["id_mesa"],"pagar"=>$datos["total"],"nombre"=>$datos["nombre_cliente"],"estado"=>$datos["Estado"]);
        }
        echo json_encode($orden);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>