// ignore: slash_for_doc_comments
/**
 * @author Luis Miguel Liborio
 */

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotonNav extends StatelessWidget {
  // ignore: slash_for_doc_comments
  /**
   * Creamos las variables que utilizaremos dentro del widget para poder personalizarlo
   * y usarlo en cualquier sección de la app.
   */
  String nombre;
  int fondo = 0xFFccd5ae;
  int border = 0xFFFFFFFF;

  // ignore: slash_for_doc_comments
  /**
   * Utilizamos el método constructor para así poder utilizar las variables establecidas
   * y poder cambiar su contenido cuando y cómo se necesite.
   */
  // ignore: use_key_in_widget_constructors
  BotonNav(this.nombre, this.fondo, this.border);

  @override
  Widget build(BuildContext context) {
    /**
       * EL widget InkWell se utiliza para crear una región de la app que puede ser interactiva,
       * se utiliza principalmente para crear botones muy diferentes a Material Design (Android) y
       * Cupertino Design (IOS).
       */
    return InkWell(
      // ----------------------------------------Acción del botón-----------------------------------------------------
      /**
         * Dentro de las llaves se define lo que hará el botón al ser presionado.
         */
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Holiwis"),
          ),
        );
      },

      // ----------------------------------------Contenido del botón--------------------------------------------------
      child: Container(
        // --------------------------------------Medidas y espacios---------------------------------------------------
        padding: const EdgeInsets.all(10.0),
        width: 130.0,

        /**
           * En lugar de colocar entre comillas el contenido del texto, se remplaza por la variable que 
           * declaramos arriba para que así el contenido de este pueda cambiar si se necesita.
           */
        child: Text(
          nombre,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),

        // ----------------------------------------Estilo del botón-----------------------------------------------------
        /**
           * En este caso, la propiedad Color sirve para cambiar el fondo del botón,
           * al igual que el texto, este se ha cambiado por la variable que se define arriba para
           * que pueda cambiarse a la hora de crear un nuevo botón. Así mismo, el color
           * del borde usa la misma lógica.
           */
        decoration: BoxDecoration(
          color: Color(fondo),
          border: Border.all(
            style: BorderStyle.solid,
            color: Color(border),
          ),

          /**
               * Le agregamos un radio al borde para hacer las puntas redondeadas y darle un estilo más
               * original.
               */
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
