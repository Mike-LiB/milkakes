import 'package:flutter/material.dart';
import '../widgets/formulario_producto.dart';

// ignore: use_key_in_widget_constructors
class NuevoProducto extends StatelessWidget {
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
        
        // ---------
        title: const Text(
          "Nuevo Producto",
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),

      // --------------------------------------Cuerpo de la sección-------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                padding: const EdgeInsets.all(15),

                // -----------
                child: const Text(
                  "Ingresa los datos necesarios para agregar el nuevo producto",

                  // ---------
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                  ),
                )),

            // --------------------------------Formulario-----------------------------------------------------------
            const FormularioProducto()
          ],
        ),
      ),
    );
  }
}
