import 'package:flutter/material.dart';
import '../developer/consultas.dart';
import '../screens/lista_productos.dart';

class ProductoLista extends StatelessWidget {
  // --------
  String nombre;
  String id;

  ProductoLista(this.nombre, this.id);

  @override
  Widget build(BuildContext context) {
    // ---------
    final boton = IconButton(
      onPressed: () async {
        print(id);
        await eliminarProducto(id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListaProductos(),
          ),
        );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 25.0,
      ),
    );
    // ---------------
    return Container(
      // -------------
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,

      // ----------
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide(color: Colors.white, width: 2.0),
        ),
        color: Color(0xFFE9EDC9),
      ),

      // --------
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              nombre,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),

          // ----------
          boton
        ],
      ),
    );
  }
}
