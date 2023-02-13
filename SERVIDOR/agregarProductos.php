<?php
    header("Access-Control-Allow-Origin: *");
    require("conexion.php");

    $nombre = $_POST["nombre"];
    $precio = $_POST["precio"];
    $foto = $_POST["img"];
    $subCategoria =$_POST["sub"];
    
    

    $precio = floatval($precio);
    $id;

    do {
        $id = rand(0,1000);
        $consulta = mysqli_query($conexion,"SELECT id_producto FROM producto WHERE id_producto = '$id'");
        $nResultado = mysqli_num_rows($consulta);
        echo "$nResultado";
    } while ($nResultado = 0);

    $consultaSubCate = mysqli_query($conexion,"SELECT idSubcategoria FROM sub_categoria WHERE nombre_subCategoria='$subCategoria'");
    echo mysqli_num_rows($consultaSubCate);
    $dato = mysqli_fetch_row($consultaSubCate);
    $sub = $dato["0"];
    mysqli_query($conexion,"INSERT INTO 
    producto(id_producto,nombre_producto,precio,foto,idSubcategoria)
    VALUES('$id','$nombre',$precio,'$foto',$sub)");
?>