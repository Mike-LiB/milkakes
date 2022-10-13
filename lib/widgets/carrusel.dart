import 'package:flutter/material.dart';
import 'package:milkakes/widgets/img_carrusel.dart';

// ignore: use_key_in_widget_constructors
class Carrusel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // -----------
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 250,

      // -----------
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              
              ImgCarrusel("assets/images/frappe.jpg", "Frappe", 5.0,"1"),
              ImgCarrusel("assets/images/waffles.jpg", "Waffles", 6.50,"2"),
              ImgCarrusel("assets/images/quesadillas.jpg", "Quesadillas", 3.75,"3"),
            ],
            
          )
        ],
      ),
    );
  }
}
