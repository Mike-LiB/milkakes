<?php
require("conexion.php");

$numero_mesa=$_POST['mesa'];
$usuario = $_POST['usuario'];
$pass = $_POST['pass'];
$consulta = mysqli_query($conexion, "SELECT numero_mesa FROM mesa WHERE numero_mesa = '$numero_mesa'");
$n = mysqli_num_rows($consulta);


if ($n>=1) {
    echo'mesaExiste';
} else {
    $consulta_usuario = mysqli_query($conexion, "SELECT usuario FROM usuario WHERE usuario = '$usuario'");
    $usuario_existente = mysqli_num_rows($consulta_usuario);
    if ($usuario_existente>=1) {
        echo'existeUsu';
    } else 
    {
        

        $idUsuario;

        do {
            $idUsuario = rand(0,1000);
            $consulta = mysqli_query($conexion,"SELECT id_usuario FROM usuario WHERE id_usuario = '$idUsuario'");
            $nResultado = mysqli_num_rows($consulta);
           
        } while ($nResultado = 0);
        $idmesa=intval($numero_mesa);
        $ingresarMesa = mysqli_query($conexion,"INSERT INTO mesa(id_mesa,numero_mesa)VALUES($idmesa,'$numero_mesa')");
        $ingresarUsuario = mysqli_query($conexion,
        "INSERT INTO usuario(id_usuario,usuario,password,Tipo_usuario,Id_mesa)
        VALUES($idUsuario,'$usuario','$pass','mesa',$idmesa)");
        echo "exito";
    }
}

?>