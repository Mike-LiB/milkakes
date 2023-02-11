<?php
    require("conexion.php");
    $idCap=$_POST["idCap"];
    $idCap=intval($idCap);
    if ($idCap==33) {
        $consulta = mysqli_query($conexion,
        "SELECT id_producto,nombre_producto,precio,foto FROM producto WHERE idSubcategoria=5 || idSubcategoria=6");
    }
   else
   {
        $consulta = mysqli_query($conexion,
        "SELECT id_producto,nombre_producto,precio,foto FROM producto WHERE idSubcategoria=$idCap");
   }
    

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