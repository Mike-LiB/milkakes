<?php 

    
    
   
   require("conexion.php");
    $consulta=mysqli_query($conexion,"SELECT * FROM usuarios");
    $usuarios=[];
   
   
    while ($datos = mysqli_fetch_array($consulta,MYSQLI_ASSOC)) {
        $usuarios[]=array("usu"=>$datos["usu"],"contra"=>$datos["contra"]); 
    }
   echo json_encode($usuarios);
  
   

?>