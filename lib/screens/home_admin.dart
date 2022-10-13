import 'package:flutter/material.dart';
import '../widgets/lista_ordenes.dart';
import 'login.dart';
import 'lista_mesas.dart';
import 'lista_productos.dart';

// ignore: use_key_in_widget_constructors
class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // -----------
    final adminMesas = InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ListaMesas(),
          ),
        );
      },

      // --------
      child: Container(
        // -------
        padding: const EdgeInsets.all(20.0),

        // ------------
        decoration: BoxDecoration(
            color: const Color(0xFFCCD5AE),
            borderRadius: BorderRadius.circular(15)),

        // ----------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          // ---------
          children: const [
            Icon(
              Icons.table_bar_rounded,
              size: 60.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              "Administrar \nmesas",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )
          ],
        ),
      ),
    );

    // ---------
    final adminProd = InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListaProductos(),
          ),
        );
      },

      // ----------
      child: Container(
        // -------
        padding: const EdgeInsets.all(20.0),

        // ------------
        decoration: BoxDecoration(
            color: const Color(0xFFCCD5AE),
            borderRadius: BorderRadius.circular(15)),

        // ----------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          // ---------
          children: const [
            Icon(
              Icons.bakery_dining_rounded,
              size: 60.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              "Administrar \nproductos",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            )
          ],
        ),
      ),
    );

    // -----------
    return Scaffold(
      // -----------
      appBar: AppBar(
        leading:           IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },

            // -------------
            icon: const Icon(
              Icons.logout_rounded,
              size: 30.0,
            ),
            tooltip: "Cerrar sesión",
          ),

        // ------
        centerTitle: true,
        backgroundColor: const Color(0xFFD4A373),
        iconTheme: const IconThemeData(color: Colors.white),

        // ------
        title: const Text(
          "Inicio",
          style: TextStyle(color: Colors.white),
        ),
      ),

      // -----------
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          // ---------
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  adminMesas,
                  adminProd,
                ],
              ),
            ),
            const SizedBox(height: 10.0),

            // ----------
            const Divider(
              color: Color(0x7A000000),
              thickness: 1.0,
              height: 1.0,
            ),
            const SizedBox(height: 20.0),

            const Text(
              "Lista de Órdenes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),

            ListaOrdenes()
          ],
        ),
      ),
    );
  }
}
