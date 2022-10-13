import 'package:flutter/material.dart';
import 'package:milkakes/developer/agregados.dart';
import 'package:milkakes/developer/consultas.dart';
import 'package:milkakes/screens/cocina.dart';
import 'package:milkakes/widgets/producto.dart';
import '../screens/ordenes_mesero.dart';
//enum Estado { pendiente, proceso }

class Orden_chet extends StatefulWidget {
  String id_or;
  String id_mesa;
  
  Orden_chet(this.id_or,this.id_mesa);

  @override
  State<Orden_chet> createState() => _Orden_chetState();
}

class _Orden_chetState extends State<Orden_chet> {
  var productosOrden;
  var nombrePro=[];
  var cantidadPro=[];
  @override
  void initState() {
    super.initState();
    (() async {
      productosOrden = await productosOrdenChet(widget.id_or);
      if (productosOrden!="noExisten") {
        for (var i = 0; i < productosOrden.length; i++) {
          var resul = productosOrden[i];
          
          nombrePro.add(resul["nombre"]);
          cantidadPro.add(resul["cantidad"]);
        }
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    // ------------
    int fondo = 0xFFE9EDC9;
    

    final boton = IconButton(
      tooltip: "Confirmar Orden",
      onPressed: () {
        _confirmarOrden(context);
      },
      icon: const Icon(
        Icons.check_box_outline_blank_rounded,
        size: 25.0,
      ),
    );
    

    return Container(
      // -------------
      padding: const EdgeInsets.all(15.0),
      width: MediaQuery.of(context).size.width,

      // ----------
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide(color: Colors.white, width: 2.0),
        ),
        color: Color(fondo),
      ),

      // --------
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Orden de la Mesa "+widget.id_mesa,
                style: const TextStyle(fontSize: 18.0),
              ),
              Column(
                children: [
                  
                  
                  for (var i = 0; i <nombrePro.length; i++) Text(nombrePro[i]+"-----"+cantidadPro[i],style:TextStyle(fontSize: 14.0),),
                  
                ],
              )
              
              
            ],
          ),
          Row(
            children: [
              boton,
            ],
          )
          
          
          
          
        ],
        
      ),
      
    );
  }

  void _confirmarOrden(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            '¿Confirmar que la orden esta lista?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async{
                    var respuesta = await ordenLista(widget.id_or);
                    if (respuesta=="exito") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cocina()),
                      );
                      
                    }
                  },
                  child: const Text(
                    'Sí',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        );
      },
      barrierColor: Colors.black12,
      barrierDismissible: true,
    );
  }
}
