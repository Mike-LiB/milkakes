// ignore: slash_for_doc_comments
// ignore_for_file: prefer_const_constructors_in_immutables


import 'package:flutter/material.dart';
import '../developer/agregados.dart' as global;
class ImgCarrusel extends StatelessWidget {
  // ---------
  final String url;

  final String nombre;

  final double precio;
  // ignore: non_constant_identifier_names
  final String hero_id;
  // ignore: use_key_in_widget_constructors
  ImgCarrusel(this.url, this.nombre, this.precio,this.hero_id);

  @override
  Widget build(BuildContext context) {
    // -----------
    final imagen = Container(
      // -------------
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),

      // --------
      child: Image.asset(
        url,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    );

    // ------------
    final boton = Container(
      margin: const EdgeInsets.all(5.0),
      child: FloatingActionButton(
        heroTag: hero_id,
        onPressed: () {
          bool opc=false;
          for (var i = 0; i < global.idProducto.length; i++) {
            if (global.idProducto[i]==hero_id) {
              opc=true;
            }
          }
          if (opc==false) {
            global.idProducto.add(hero_id);
            global.productosAgregados.add(nombre);
            global.precioProductos.add(precio);
            global.cantidad.add(1);
          }
        },
        mini: true,
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFD4A373),
        tooltip: "Agregar a la orden",
      ),
    );

    // ----------
    final descripcion = Container(
      // -----------
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      height: 70,

      // ---------
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        color: Color(0x6E000000),
      ),

      /**
       * 
       */
      child: Text(
        "$nombre \n\$$precio",
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    );

    // -------------
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // ------------
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 325.0,
      height: 200.0,

      // -----------
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3.0),
            blurRadius: 5.0,
          ),
        ],
      ),

      // -----------
      child: Stack(
        // ----------
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.hardEdge,

        // ---------
        children: [
          imagen,
          descripcion,
          boton,
        ],
      ),
    );
  }
}
