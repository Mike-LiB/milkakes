<?php
    require("conexion.php");
    $consulta = mysqli_query($conexion,
    "SELECT id_producto,nombre_producto,precio,foto FROM producto");
    $producto=[];
    $n=mysqli_num_rows($consulta);
    if ($n>=1) {
        while ($datos= mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $id_tem = $datos["id_producto"];
            if ($id_tem!="1" && $id_tem!="2" && $id_tem!="3") {
                $producto[]=array("id_producto"=>$datos["id_producto"],"nombre"=>$datos["nombre_producto"],"precio"=>$datos["precio"],"foto"=>$datos["foto"]);
            }
            
        }
        echo json_encode($producto);
    }
    else
    {
        echo json_encode("noExisten");
    }
    
?>