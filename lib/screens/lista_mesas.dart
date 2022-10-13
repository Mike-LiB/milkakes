import 'package:flutter/material.dart';
import 'package:milkakes/screens/home_admin.dart';
import 'package:milkakes/screens/nueva_mesa.dart';
import '../developer/consultas.dart';
import '../widgets/mesa.dart';

// ignore: use_key_in_widget_constructors
class ListaMesas extends StatefulWidget {
  @override
  State<ListaMesas> createState() => _ListaMesasState();
}

class _ListaMesasState extends State<ListaMesas> {
  var nMesas = [];

  var dato = [];

  @override
  void initState() {
    super.initState();
    (() async {
      nMesas = await getMesas();

      for (var i = 0; i < nMesas.length; i++) {
        var resul = nMesas[i];

        var numero = resul["numero_mesa"];

        dato.add(numero);
      }

      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----------
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeAdmin(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xffd4a373),
        title: const Text("Lista de mesas"),
        centerTitle: true,
      ),

      // ----------
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(var i = 0; i < dato.length; i++) Mesa(dato[i]),
          ],
        ),
      ),

      // ---------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => NuevaMesa(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFFCCD5AE),
      ),
    );
  }
}
