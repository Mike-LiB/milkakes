// ignore: slash_for_doc_comments
/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'package:flutter/material.dart';
import 'package:milkakes/widgets/detalle_bar.dart';
import '../widgets/pedido.dart';
import 'inicio.dart';
// ignore: use_key_in_widget_constructors
class Carrito extends StatefulWidget {
  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Inicio(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
        ),
        
        elevation: 2.0,

        // ----------
        title: const Text(
          "Su orden",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
      ),
      body: Pedido(),
      bottomNavigationBar: DetalleBar(),
    );
  }
}
