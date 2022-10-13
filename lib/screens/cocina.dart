import 'package:flutter/material.dart';
import 'package:milkakes/screens/login.dart';

import '../widgets/lista_ordenChet.dart';
// ignore: use_key_in_widget_constructors
class Cocina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.login_rounded,
              size: 30,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
            },
            tooltip: "Cerrar Sesión",
          )
        ],

        //titulo principal
        title: const Text(
          'Órdenes recibidas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFD4A373),
      ),

      // ---------
      body: SingleChildScrollView(
        child: ListaChet(),
      ),
    );
  }
}
