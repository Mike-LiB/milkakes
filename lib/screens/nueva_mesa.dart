// ignore_for_file: slash_for_doc_comments

/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'package:flutter/material.dart';
import 'package:milkakes/widgets/formulario_mesa.dart';

// ignore: use_key_in_widget_constructors
class NuevaMesa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: Colors.black,
            splashRadius: 20.0,
          ),
        ],

        // -------
        title: const Text(
          "Nueva Mesa",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
      ),

      // ---------
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 20.0,
                right: 20.0,
              ),
              
              padding: const EdgeInsets.all(15.0),
              child: const Text(
                "Ingresa los datos necesarios para agregar la nueva mesa",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),

            // -------
            const FormularioMesa()
          ],
        ),
      ),
    );
  }
}
