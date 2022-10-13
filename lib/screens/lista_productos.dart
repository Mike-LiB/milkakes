import 'package:flutter/material.dart';
import 'package:milkakes/screens/nuevo_producto.dart';
import '../developer/consultas.dart';
import '../widgets/producto_lista.dart';
import 'home_admin.dart';

// ignore: use_key_in_widget_constructors
class ListaProductos extends StatefulWidget {
  @override
  State<ListaProductos> createState() => _ListaProductosState();
}

class _ListaProductosState extends State<ListaProductos> {
  // ignore: prefer_typing_uninitialized_variables
  var productos;
  var nombre = [];
  // ignore: non_constant_identifier_names
  var id_producto = [];
  @override
  void initState() {
    super.initState();
    (() async {
      productos = await getProductos();
      if (productos!="noExisten") {
        for (var i = 0; i < productos.length; i++) {
          var resul = productos[i];

          // ignore: non_constant_identifier_names
          var nom_tem = resul["nombre"];
          nombre.add(nom_tem);

          // ignore: non_constant_identifier_names
          var id_tem = resul["id_producto"];
          id_producto.add(id_tem);
        }
      }
      

      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---------
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeAdmin(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xffd4a373),
        title: const Text("Lista de productos"),
        centerTitle: true,
      ),

      // ---------
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ignore: todo
            // TODO arreglar el bug al no haber productos en la base de datos
            for (var i = 0; i < nombre.length; i++)
              ProductoLista(nombre[i], id_producto[i]),
          ],
        ),
      ),

      // ---------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => NuevoProducto()),
            ),
          );
        },
        backgroundColor: const Color(0xFFCCD5AE),
        child: const Icon(Icons.add),
      ),
    );
  }
}
