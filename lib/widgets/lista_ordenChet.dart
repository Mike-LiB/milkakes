
import 'package:flutter/material.dart';
import 'orden_chet.dart';
import '../developer/consultas.dart';
// import 'dart:ffi';
class ListaChet extends StatefulWidget {
  @override
  State<ListaChet> createState() => _ListaChetState();
}

class _ListaChetState extends State<ListaChet> {
  // ignore: prefer_typing_uninitialized_variables
  var ordenes;
  var numeroMesa = [];
  // ignore: non_constant_identifier_names
  var id_orden=[];
  @override
  void initState() {
    super.initState();
    (() async {
      ordenes = await OrdeneChet();
      if (ordenes!="noExisten") {
        for (var i = 0; i < ordenes.length; i++) {
          var resul = ordenes[i];
          numeroMesa.add(resul["nMesa"]);

          id_orden.add(resul["id_orden"]);
        }
      }
      

      setState(() {});
    })();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      // --------
      children: [
        // ------------

        for (var i = 0; i < id_orden.length; i++) Orden_chet(id_orden[i],numeroMesa[i]),
        
      ],
    );
  }
}
