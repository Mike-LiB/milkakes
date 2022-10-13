// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
//Libreria que nos permitira usar funciones async
import 'dart:async';
//Libreria que nos permitira decodificar los archivos JSON
import 'dart:convert';
//Libreria que nos permitira usar Colecciones (array y MAP)
// ignore: unused_import
import 'dart:collection';

// ignore: unused_import
import 'dart:io';

//consulta para el Login
Future<dynamic> ingresar(String usu, String contra) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/usuario.php"),
    body: <String, dynamic>{
      "usu": usu,
      "contra": contra,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}

//Consultas De mesas

Future<dynamic> id_mesa(String usu, String contra) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/id_usuario.php"),
    body: <String, dynamic>{
      "usu": usu,
      "contra": contra,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {

    return enviar.body;
  }
}
Future agregarMesa(var numer, var usuario, var contra) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/AgregarMesa.php"),
    body: <String, dynamic>{
      "mesa": numer,
      "usuario": usuario,
      "pass": contra,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return enviar.body;
  }
}

Future getMesas() async {
  http.Response mesas = await http
      .get(Uri.parse("https://milkake.000webhostapp.com/getMesas.php"));
  var resultado = jsonDecode(mesas.body);
  return resultado;
}

Future eliminarMesa(var nombre) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/eliminarMesa.php"),
    body: <String, dynamic>{
      "mesa": nombre,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return enviar.body;
  }
}
//CONSULTAS PARA PRODUCTOS
Future producto(var foto, var sub, var nombre, var precio) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/agregarProductos.php"),
    body: <String, dynamic>{
      "img": foto,
      "sub": sub,
      "nombre": nombre,
      "precio": precio
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return "exito";
  }
}
Future getProductos() async {
  http.Response mesas = await http.get(Uri.parse("https://milkake.000webhostapp.com/getProductos.php"));
  var resultado = jsonDecode(mesas.body);
  if (resultado=="noExiten") {
    return "noExisten";
  }
  else
  {
    return resultado;
  }
  
}

Future productosDataos() async {
  http.Response producto = await http
      .get(Uri.parse("https://milkake.000webhostapp.com/productosDatos.php"));
  var resultado = jsonDecode(producto.body);
  if (resultado=="noExisten") {
    return "noExisten";
  }
  else{
    return resultado;
  }
  
}
Future productosEspecifico(var idCap) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/productosEspecificos.php"),
    body: <String, dynamic>{
      "idCap": idCap,
      
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (resultado=="noExisten") {
    return "noExisten";
  }
  else{
   
    return resultado;
  }
  
}

Future eliminarProducto(var id) async {
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/eliminarProducto.php"),
    body: <String, dynamic>{
      "id": id,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
   
    return enviar.body;
    
  }
}

//CONSULTAS  DE LOS USUARIOS MESAS
Future pedido(var id_mesa, var nombre_cliente,var id_productos,var cantidades,var total) async
{
  
  http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/guardar_pedido.php"),
    body:{
     
      "id_mesa":id_mesa.toString(),
      "nombre_cli":nombre_cliente,
      "id_producto":id_productos.toString(),
      "cantidad":cantidades.toString(),
      "total":total.toString()
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    
    return "exito";
  }
}



Future obtenerOrdenes() async {
  http.Response ordenes = await http.get(Uri.parse("https://milkake.000webhostapp.com/obtenerOrdenes.php"));
  var resultado = jsonDecode(ordenes.body);
  if (resultado=="noExiten") {
    return "noExisten";
  }
  else
  {
    
    return resultado;
  }
  
}

Future confirmarPago(String id) async {
   http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/confirmarPago.php"),
    body: <String, dynamic>{
      "id_orden": id,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return "exito";
  }
  
}

Future OrdeneChet() async {
  http.Response ordenes = await http.get(Uri.parse("https://milkake.000webhostapp.com/ordenesChet.php"));
  var resultado = jsonDecode(ordenes.body);
  if (resultado=="noExiten") {
    return "noExisten";
  }
  else
  {
    
    return resultado;
  }
  
}

Future productosOrdenChet(String id) async {
   http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/productosChet.php"),
    body: <String, dynamic>{
      "id_orden": id,
    },
  );
  var resultado = jsonDecode(enviar.body);
  if (enviar.statusCode == 201) {
    return "error";
  } else {
    
    return resultado;
  }
  
}

Future ordenLista(String id) async {
   http.Response enviar = await http.post(
    Uri.parse("https://milkake.000webhostapp.com/confirmarOrdenLista.php"),
    body: <String, dynamic>{
      "id_orden": id,
    },
  );

  if (enviar.statusCode == 201) {
    return "error";
  } else {
    return "exito";
  }
  
}