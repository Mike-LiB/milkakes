<?php
    $db_host="localhost";
    $db_nombre="id18879051_milkake";
    $db_usuario="id18879051_admi3k";
    $db_contraseña="3kbaseDatoo?";

    $conexion = mysqli_connect($db_host,$db_usuario,$db_contraseña,$db_nombre);

    if (mysqli_connect_errno()) {
        echo "No se pudo conectar con la Base de Datos";
        exit();
    }
   
    mysqli_set_charset($conexion,"utf8");
?>