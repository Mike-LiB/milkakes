<?php

    header("Access-Control-Allow-Origin: *");
    require("conexion.php");

    function convertir(String $dato)
    {
        $longitud =strlen($dato);//obtenemos la longitud del String
        $array=[];//almaceno los datos por separa ya en un array

        $datoTem="";
        for ($i=0; $i < $longitud; $i++) { 
       
            if ($dato[$i]!="[" && $dato[$i] !="]") {
                
                if ($dato[$i]!="," && $dato[$i]!=" ") {
                    
                   
                    
                    $datoTem="$datoTem$dato[$i]";
                   
                   
                  
                    if ($dato[$i+1]=="]") {
                        $array[]=$datoTem;
                        $datoTem="";
                    }
                }
                else if ($dato[$i]==",") {
                    $array[]=$datoTem;
                   
                    $datoTem="";
                   
                }
               
            }
        }
        return $array;
    }
  
   

    $id_mesa = $_POST["id_mesa"];
    $nombre_cliente = $_POST["nombre_cli"];
    $id_producto=$_POST["id_producto"];
    $cantidad=$_POST["cantidad"];
    $total=$_POST["total"];
    echo "$id_mesa $nombre_cliente $id_producto $cantidad $total";

  
  
    $id_orden;
    $id_mesa=intval($id_mesa);
    
    do {
        $id_orden = uniqid();
        $consulta = mysqli_query($conexion,"SELECT id_orden FROM orden WHERE id_orden = '$id_orden'");
        $nResultado = mysqli_num_rows($consulta);
       
    } while ($nResultado = 0);
    
    mysqli_query($conexion,
    "INSERT INTO orden(id_orden,id_mesa,nombre_cliente,Estado,facturado)VALUES('$id_orden',$id_mesa,'$nombre_cliente','Proceso','pendiente')");
    ///cambiar en la tabla producto el id_producto a char(13)

    //guardamos los producotos seleccionados
    
    //primero convierto el $id_producto y $cantidad  a array ya que actualmente viene como simple String

    $array_idProducto = convertir($id_producto);
    $array_cantidad=convertir($cantidad);
    //onbtengo la dimencion
    $dimension = count($array_idProducto);
    for ($i=0; $i < $dimension; $i++) {
        //genero el id
        $id_pedidos;

        do {
            $id_pedidos = uniqid();
            $consulta = mysqli_query($conexion,"SELECT id_pedidos FROM productosXpedidos WHERE id_pedidos = '$id_pedidos'");
            $nResultado = mysqli_num_rows($consulta);
            
        } while ($nResultado = 0);
        
        $canti = intval($array_cantidad[$i]);
     
        $idPro_tem=$array_idProducto[$i];
       
        mysqli_query($conexion,"INSERT INTO productosXpedidos(id_pedidos,id_orden,cantidad,id_producto)
        VALUES('$id_pedidos','$id_orden',$canti,'$idPro_tem')");
    }
   

    $id_factura;

    
    do {
        $id_factura = uniqid();
        $consulta = mysqli_query($conexion,"SELECT id_orden FROM orden WHERE id_orden = '$id_factura'");
        $nResultado = mysqli_num_rows($consulta);
       
    } while ($nResultado = 0);
    $total=doubleval($total);
    mysqli_query($conexion,"INSERT INTO factura(id_factura,total,id_orden)VALUES('$id_factura',$total,'$id_orden')");
    
?>