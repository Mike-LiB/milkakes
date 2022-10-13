import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';

import '../developer/agregados.dart' as global;

class Producto extends StatelessWidget {
  String url;

  final String nombre;

  final double precio;
  final String id_pro;
  Producto(this.url, this.nombre, this.precio,this.id_pro);

  @override
  Widget build(BuildContext context) {
    Uint8List bytes = Base64Codec().decode(url);
    // --------------
    final img = Container(
      // ------------
      width: 150,
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      margin: const EdgeInsets.only(
        top: 15.0,
        left: 15.0,
        right: 15.0,
      ),

      

      child: Image.memory(
        bytes,
        fit: BoxFit.cover,
      ),
    );

    // -----------
    final botonAdd = FloatingActionButton(
      heroTag: id_pro,
      onPressed: () {
        bool opc=false;
        for (var i = 0; i < global.idProducto.length; i++) {
          if (global.idProducto[i]==id_pro) {
            opc=true;
          }
        }
        if (opc==false) {
          global.idProducto.add(id_pro);
          global.productosAgregados.add(nombre);
          global.precioProductos.add(precio);
          global.cantidad.add(1);
        }
        
      },
      child: const Icon(Icons.add),
      backgroundColor: const Color(0xFFE9EDC9),
      mini: true,
      elevation: 1.0,
      focusElevation: 0.5,
      tooltip: "Agregar al carrito",
    );

    // --------------------
    return Container(
      // -------------
      padding: const EdgeInsets.all(2.0),
      width: MediaQuery.of(context).size.width * 0.5,
      clipBehavior: Clip.hardEdge,

      // --------
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFAEDCD),
        boxShadow: const [
          BoxShadow(
            color: Color(0x42C3C3C3),
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
      ),

      // -----------
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          img,

          // -----------
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 10.0,
                  right: 5.0,
                ),
                child: Text(
                  "$nombre \n\$$precio",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),

              // --------
              botonAdd
            ],
          )
        ],
      ),
    );
  }
}
