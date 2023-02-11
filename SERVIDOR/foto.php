<?php
    header("Access-Control-Allow-Origin: *");
    require("conexion.php");
    $foto = $_POST["img"];
    //obtenemos la imagen que se subio temporalmente
    //$image =$_FILES[$foto]['tmp_name'];
    //guardamos el tipo de imagen para mostrarlo despues
    //$tipoimg =$_FILES[$foto]['type'];
    //obtenemos los binarios de la imagen
    //$imgfinal = addslashes(file_get_contents($image));
    mysqli_query($conexion,"INSERT INTO 
    producto(id_producto,nombre_producto,precio,foto,tipo)
    VALUES('1234','rueba',12.0,'$foto','imgae/png')");
?>