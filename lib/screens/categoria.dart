import 'package:flutter/material.dart';
import 'package:milkakes/screens/carrito.dart';
import '../widgets/barra_busqueda.dart';
import '../widgets/menu_especifico.dart';

// ignore: must_be_immutable
class Categoria extends StatelessWidget {
  String titulo;
  // ignore: use_key_in_widget_constructors
  Categoria(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: const Color(0xFFD4A373),

        // ----------
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Carrito(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),

      // ----------
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarraBusqueda(),
            const Divider(
              color: Colors.black26,
              height: 1.0,
            ),
            const SizedBox(height: 20.0),

            // --------
            Text(
              "Menú de $titulo",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),

            // -------
            MenuEspe(),
          ],
        ),
      ),
    );
  }
}
