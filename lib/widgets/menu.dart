import 'package:flutter/material.dart';
import 'package:milkakes/widgets/producto.dart';
import '../developer/consultas.dart';

class Menu extends StatefulWidget {
  //String id_usu;
  //Menu(this.id_usu);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  var datos;
 
  var img = [];
  var precio = [];
  var nombre = [];
  var id_pro=[];
  @override
  void initState() {
    super.initState();
    (() async {
      datos = await productosDataos();

      if (datos!="noExisten") {
          if (mounted) {
            setState(() {
              for (var i = 0; i < datos.length; i++) {
                var resul = datos[i];

                var imagen_temp = resul["foto"];
                var precio_temp = resul["precio"];
                var nom_temp = resul["nombre"];
                var id_tem=resul["id_producto"];
                img.add(imagen_temp);
                precio.add(double.parse(precio_temp));
                nombre.add(nom_temp);
                id_pro.add(id_tem);
              }
              
            });
          }

      }
      
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    if (img == null || img.isEmpty) {
      return const Text("vacio");
    } else {
      return SizedBox(
        // ---------
        width: MediaQuery.of(context).size.width,

        // -------------
        child: GridView.count(
          // Quitamos el scroll al GridView
          physics: const NeverScrollableScrollPhysics(),

          // ---------
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: .55,
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            bottom: 10.0,
          ),

          // -------------
          children: [
            for (var i = 0; i < img.length; i++)
              Producto(img[i], nombre[i], precio[i],id_pro[i]),
          ],
        ),
      );
    }
  }
}
