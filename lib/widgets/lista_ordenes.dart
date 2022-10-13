// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:milkakes/widgets/orden.dart';
import '../developer/consultas.dart';
class ListaOrdenes extends StatefulWidget {
  @override
  State<ListaOrdenes> createState() => _ListaOrdenesState();
}

class _ListaOrdenesState extends State<ListaOrdenes> {
  var ordenes;
  var numeroMesa = [];
  var pagar=[];
  var nombre = [];
  var estado=[];
  var id_orden=[];
  @override
  void initState() {
    super.initState();
    (() async {
      ordenes = await obtenerOrdenes();
      if (ordenes!="noExisten") {
        for (var i = 0; i < ordenes.length; i++) {
          var resul = ordenes[i];
          numeroMesa.add(resul["nMesa"]);
          pagar.add(resul["pagar"]);
          nombre.add(resul["nombre"]);
          estado.add(resul["estado"]);
          id_orden.add(resul["id_orden"]);
        }
      }
      

      setState(() {});
    })();
  }
  @override
  Widget build(BuildContext context) {
    return Column(ch
      // --------
      children: [
        // ------------

        for (var i = 0; i < nombre.length; i++) Orden(id_orden[i],numeroMesa[i],pagar[i],nombre[i],estado[i]),
        
      ],
    );
  }
}
