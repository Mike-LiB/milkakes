// ignore_for_file: prefer_const_constructors
//Libreria que nos permitira usar funciones async
// ignore: unused_import
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:milkakes/developer/consultas.dart';
import '../developer/agregados.dart' as global;
import '../developer/id_usuarito.dart' as global;
import '../screens/inicio.dart';

// ignore: use_key_in_widget_constructors
class DetalleBar extends StatefulWidget {
  @override
  State<DetalleBar> createState() => _DetalleBarState();
}

class _DetalleBarState extends State<DetalleBar> {
  double total=0;
  var nombreUsu = TextEditingController();
  @override
  void initState() {
    
    super.initState();
    for (var i = 0; i < global.idProducto.length; i++) {
      total = (global.precioProductos[i]*global.cantidad[i])+total;
    }
    
  }
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      clipBehavior: Clip.hardEdge,
      color: const Color(0xFFCCD5AE),

      // -----------
      child: Container(
        // ---------
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        height: 60,

        // ------------
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total a pagar: \$"+total.toString(),
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),

            // ------------
            IconButton(
              onPressed: () {
                _confirmarPedido(context);
              },

              // ---------
              icon: const Icon(Icons.check_rounded),
              iconSize: 35.0,
              color: Colors.white,
              tooltip: "Confirmar Orden",
            ),
          ],
        ),
      ),
    );
  }

  void _confirmarPedido(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 65,
            child: Column(
              children: [
                Text(
                  '¿Está seguro de su orden?',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 40,
                  child: TextField(
                    restorationId: "nombre",
                    controller: nombreUsu,
                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      hintText: "Su nombre"
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async{
                  
                    var mensaje = await pedido(global.id_usuario, nombreUsu.text,global.idProducto, global.cantidad, total);
                    
                    if (mensaje=="exito") {
                      global.idProducto.clear();
                      global.productosAgregados.clear();
                      global.precioProductos.clear();
                      global.cantidad.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                      );
                    }
                  },
                  child: const Text(
                    'Sí',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
      },
      barrierColor: Colors.black12,
      barrierDismissible: true,
    );
  }
}
