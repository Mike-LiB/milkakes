import 'package:flutter/material.dart';
import '../developer/agregados.dart' as global;
import '../screens/carrito.dart';
class Pedido extends StatefulWidget {
  
  
  @override
  State<Pedido> createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
 
  final _scaffKey = GlobalKey<ScaffoldState>();
  
 
  List<dynamic> productoD = global.productosAgregados;
  List<dynamic> precio_Pr = global.precioProductos;
  List<dynamic> cantidad_producto = global.cantidad;
  @override
  Widget build(BuildContext context) {
    //para regoger todos los datos en automatico hay que añadir un ListView.buildeer
    return ListView.builder(
      
        itemCount: productoD.length,
        itemBuilder: (BuildContext context, index) {
          final nomb = productoD[index];
          final precio_producto = precio_Pr[index];
          var cantidad_pro=cantidad_producto[index];
          
          // --------
          return Column(
            
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                // -------
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nomb),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(precio_producto.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text(cantidad_pro.toString()),
                      Column(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_up,
                                size: 30,
                              ),
                              onPressed: () => setState(() {
                                    global.cantidad[index]++;
                                    Navigator.push(
                
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) => Carrito(),
                                      ),
                                    );
                                   
                                  })),
                          IconButton(
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                size: 30,
                              ),
                              onPressed: () => setState(() {
                                    if (global.cantidad[index]> 1) {
                                      global.cantidad[index]--;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => Carrito(),
                                        ),
                                      );
                                    }
                                  })),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          
                          setState(() {
                           
                            global.idProducto.removeAt(index);
                            global.productosAgregados.removeAt(index);
                            global.precioProductos.removeAt(index);
                            global.cantidad.removeAt(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Carrito(),
                              ),
                            );
                          });

                          confirmacion();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  )
                ],
              ),
              const Divider(),
            ],
          );
        });
  }

  void _eliminarPedido(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text(
              '¿Deseas cancelar este producto?',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          // _items.removeAt(index);
                        });
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Pedido()));*/
                      },
                      child: const Text('si')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('no'))
                ],
              )
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          );
        },
        barrierColor: Colors.black12,
        barrierDismissible: true);
  }

  void confirmacion() {
    SnackBar snackBar = const SnackBar(
      content: Text('Producto eliminado'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
