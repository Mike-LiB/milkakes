// ignore: slash_for_doc_comments
/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'package:flutter/material.dart';
import 'package:milkakes/screens/lista_mesas.dart';
import '../developer/consultas.dart';

class Mesa extends StatelessWidget {
  // ---------
  String nombre;
  
  Mesa(this.nombre);

  @override
  Widget build(BuildContext context) {
    // -----------
    final boton = IconButton(
      onPressed: () async{
          await eliminarMesa(nombre);
          Navigator.of(context).push
          (
            MaterialPageRoute
            (
              builder: ((context) => ListaMesas()),
            ),
          );
      },
      icon: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 25.0,
      ),
    );

    // ------------
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
              "Mesa $nombre",
              style: const TextStyle(fontSize: 18.0),
            ),
          ),

          // ---------
          boton
        ],
      ),
    );
  }
}
