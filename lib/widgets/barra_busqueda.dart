import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BarraBusqueda extends StatelessWidget {
  @override
  Widget build(BuildContext context){

    // ----------
    return Container(
      margin: const EdgeInsets.all(15.0),
      height: 40.0,
      child: TextField(
        restorationId: "buscador",
        autocorrect: true,
        keyboardType: TextInputType.text,

        // ---------
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Buscar",
          prefixIcon: const Icon(Icons.search),
          contentPadding: const EdgeInsets.all(5.0),
          focusColor: Colors.black,
        ),
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
    
  }
}