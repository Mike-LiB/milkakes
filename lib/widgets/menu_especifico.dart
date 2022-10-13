import 'package:flutter/material.dart';
import 'package:milkakes/widgets/producto.dart';
import '../developer/consultas.dart';
import '../developer/categoria.dart' as global;
class MenuEspe extends StatefulWidget {
  

  @override
  State<MenuEspe> createState() => _MenuEspeState();
}

class _MenuEspeState extends State<MenuEspe> {
  var datos;
  var img = [];
  var precio = [];
  var nombre = [];
  var id_pro=[];
  @override
  void initState() {
    super.initState();
    (() async {

      if (global.categoria=="Desayunos") {
        datos=await productosEspecifico("33");
      }
      else if(global.categoria=="Dulces")
      {
        datos=await productosEspecifico("3");
      }
      else if(global.categoria=="Salados")
      {
        datos=await productosEspecifico("4");
      }
      else if(global.categoria=="Frias")
      {
        datos=await productosEspecifico("1");
      }
      else if(global.categoria=="Calientes")
      {
        datos=await productosEspecifico("2");
      }
      
      

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
