// ignore_for_file: slash_for_doc_comments
/**
 * @author Luis Miguel Liborio
 */

import 'package:flutter/material.dart';
import 'package:milkakes/widgets/panel_list.dart';

/**
 * Este widget ha sido dividido en tres widgets diferentes para hacer el código más ordenado,
 * así es más fácil de leer y a la vez de mantener de ser necesario.
 * 
 * Este widget utiliza uno con sin estado (Stateless) y dos con estado (Statefull),
 * lo cual lo hace bastante complejo, es por eso que el código de este widget
 * contendrá más comentarios que código en sí.
 */

/** 
 * Empezamos creando el widget que encerrará todo para poder utilizarlo en cualquier parte de
 * la app.
 */
class MenuDesplegable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // --------
    return SingleChildScrollView(
      clipBehavior: Clip.hardEdge,
      child: Container(
        alignment: Alignment.bottomRight,
        height: MediaQuery.of(context).size.height,

        // -------
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,

          // -----
          children: [
            const SizedBox(height: 30),
            const ListTile(
              title: Text(
                "Bienenido/a",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(
                "¿Qué gusta ordenar?",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),

              // ---------
              style: ListTileStyle.drawer,
            ),
            const Divider(
              color: Colors.black26,
              height: 1.0,
            ),

            // ---------
            PanelList(),
          ],
        ),
      ),
    );
  }
}
