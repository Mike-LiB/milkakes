import 'package:flutter/material.dart';
import 'package:milkakes/developer/consultas.dart';
import '../screens/ordenes_mesero.dart';
//enum Estado { pendiente, proceso }

class Orden extends StatelessWidget {
  String id_or;
  String id_mesa;
  String cancelar;
  String nombre;
  String estado;
  
  Orden(this.id_or,this.id_mesa,this.cancelar,this.nombre,this.estado);
  
  int fondo = 0xFFFFFFFF;

 

  @override
  Widget build(BuildContext context) {
    // ------------
    fondo = 0xFFE9EDC9;
    

    final boton = IconButton(
      onPressed: () {
        _confirmarpago(context);
       
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
                "Orden de la Mesa "+id_mesa,
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                "Estado: "+estado,
                style: const TextStyle(fontSize: 14.0),
              ),
              Text(
                "Cobrar: "+cancelar,
                style: const TextStyle(fontSize: 14.0),
              ),
             Text(
                "Cliente: "+nombre,
                style: const TextStyle(fontSize: 14.0),
              ),
            ],
          ),
          
          boton,
          
          
        ],
        
      ),
      
    );
  }

  void _confirmarpago(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            '¿Confirmar el Pago?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () async{
                    var respuesta = await confirmarPago(id_or);
                    if (respuesta=="exito") {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrdenesMesero()),
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
