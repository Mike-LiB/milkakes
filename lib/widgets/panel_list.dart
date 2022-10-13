import 'package:flutter/material.dart';
import 'package:milkakes/screens/categoria.dart';

import '../developer/categoria.dart' as global;
class PanelList extends StatefulWidget {
  @override
  _PanelListState createState() => _PanelListState();
}

class _PanelListState extends State<PanelList> {
  @override
  Widget build(BuildContext context) {
    // ---------
    final boton = Expanded(
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(15.0),

        // -------
        child: IconButton(
          onPressed: () {
            print("3K");
          },
          alignment: Alignment.center,
          padding: const EdgeInsets.all(1.0),
          tooltip: "¿Quiénes somos?",

          // --------
          icon: const Icon(
            Icons.info,
            color: Colors.grey,
            size: 35.0,
          ),
        ),
      ),
    );

    return Expanded(
      child: Column(
        children: [
          // --------
          Column(
            children: [
              ListTile(
                onTap: () {
                  global.categoria="Desayunos";
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => Categoria("Desayunos")),
                  ));
                },

                // --------------
                title: const Text(
                  "Desayunos",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                trailing: const Icon(Icons.brunch_dining_rounded),
              ),

              // --------
              ExpansionTile(
                title: const Text(
                  "Postres",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),

                // ---------
                children: [
                  ListTile(
                    onTap: () {
                      global.categoria="Dulces";
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Categoria("Postres Dulces")),
                      ));
                    },

                    // --------------
                    title: const Text(
                      "Dulces",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: const Icon(Icons.cookie_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      global.categoria="Salados";
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Categoria("Postres Salados")),
                      ));
                    },

                    // --------------
                    title: const Text(
                      "Salados",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: const Icon(Icons.bakery_dining_rounded),
                  ),
                ],
              ),

              // --------
              ExpansionTile(
                title: const Text(
                  "Bebidas",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),

                // ---------
                children: [
                  ListTile(
                    onTap: () {
                      global.categoria="Frias";
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Categoria("Bebidas Frías")),
                      ));
                    },

                    // --------------
                    title: const Text(
                      "Frías",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: const Icon(Icons.local_bar_rounded),
                  ),
                  ListTile(
                    onTap: () {
                      global.categoria="Calientes";
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Categoria("Bebidas Calientes")),
                      ));
                    },

                    // --------------
                    title: const Text(
                      "Calientes",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    trailing: const Icon(Icons.local_cafe_rounded),
                  ),
                ],
              ),

              // --------
              
            ],
          ),

          boton
        ],
      ),
    );
  }
}
