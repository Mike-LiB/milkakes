// ignore: slash_for_doc_comments
/**
 * @author Luis Miguel Liborio
 */
import 'package:flutter/material.dart';
import 'package:milkakes/screens/carrito.dart';
import '../widgets/barra_busqueda.dart';
import '../widgets/carrusel.dart';
import '../widgets/menu.dart';
import '../widgets/menu_desplegable.dart';

// ignore: use_key_in_widget_constructors
class Inicio extends StatefulWidget {
  

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),

        // ----------
        backgroundColor: const Color(0xFFD4A373),

        // -----------
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
      drawer: Drawer(
        child: MenuDesplegable(),
      ),

      // -------
      body: SingleChildScrollView(
        clipBehavior: Clip.antiAlias,

        // --------
        child: Column(
          children: [
            // ----------
            BarraBusqueda(),

            // --------
            const Text(
              "Populares",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),

            // -----
            Carrusel(),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 20.0),

            // --------
            const Text(
              
              "Menú Principal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20.0),

            Menu()
          ],
        ),
      ),
    );
  }
}
