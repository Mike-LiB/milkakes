<?php

    header("Access-Control-Allow-Origin: *");

    require("conexion.php");

    $usu = $_POST["usu"];
    $contra = $_POST["contra"];
    $consulta = mysqli_query($conexion,"SELECT * FROM usuario WHERE usuario='$usu' && password='$contra'");

    $nResul = mysqli_num_rows($consulta);

    if($nResul==1)
    {
        while ($dato = mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
            $admi = $dato["admin"];
            $empleado = $dato["Tipo_usuario"];
            if ($admi=="s") {
               echo "admi";
            }
            else if ($empleado=="mesero") {
                echo "mesero";
            }
            else if ($empleado=="chet") {
                echo "chet";
            }
            else
            {
                echo "mesa";
            }

            
        }
    }
    else
    {
        echo "noExiste";
    }
?>