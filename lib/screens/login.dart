// ignore_for_file: slash_for_doc_comments
/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'package:flutter/material.dart';
import 'package:milkakes/screens/cocina.dart';
import 'package:milkakes/screens/ordenes_mesero.dart';
import '../developer/consultas.dart';
import 'home_admin.dart';
import 'inicio.dart';

import '../developer/id_usuarito.dart' as global;

// ignore: use_key_in_widget_constructors
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /**
   * Declaramos unas variables que utilizaremos para poder
   * controlar los datos que se ingresen en los Text Field.
   */
  final usuarioController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // *---------------------------------
    final fondo = Image.asset(
      "assets/images/fondo_login.png",
      width: MediaQuery.of(context).size.width,
    );
    final logo = Image.asset(
      "assets/images/app_logo_noBG.png",
      width: 175.0,
    );

    final inputUser = SizedBox(
      // -------------------------------
      
      height: 60,
      child: TextField(
        
        controller: usuarioController,
        restorationId: "usu",
        keyboardType: TextInputType.emailAddress,
        maxLength: 100,
        autofocus: false,

        // ------------
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10.0),
          labelText: "Usuario",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: const Icon(Icons.person),
          counterText: "",
        ),
        

        style: const TextStyle(fontSize: 18.0),
      ),
    );

    // -----------
    final inputPass = SizedBox(
    
      height: 60,
      child: TextField(
    
       controller: passwordController,
        restorationId: "contra",
        keyboardType: TextInputType.emailAddress,
        maxLength: 10,
        obscureText: true,
        autofocus: false,

        // ------------
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10.0),
          labelText: "Contraseña",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          prefixIcon: const Icon(Icons.lock),
          counterText: "",
        ),
        

        style: const TextStyle(fontSize: 18.0),
      ),
    );

    // ----------
    final botonIng = InkWell(
      
        onTap: () async {
          var usu = usuarioController.text;
          var contra = passwordController.text;

          // --------
          if (contra.isNotEmpty || usu.isNotEmpty) {
            dynamic respuesta = await ingresar(usu, contra);

            if (respuesta == "error") {
                _mensaje(context);

              //se produjo un error
            }
            if (respuesta == "noExiste") {
              //no hay usuario con ese nombre
              _mensajeUsu(context);
            } else {
              if (respuesta == "admi") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeAdmin()),
                );
              } else if (respuesta == "mesero") {
                //envio al mesero
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdenesMesero()),
                );
              } else if (respuesta == "chet") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cocina()),
                );
              } else if (respuesta == "mesa") {
                // ignore: non_constant_identifier_names
                var id_me = await id_mesa(usu, contra);

                global.id_usuario = id_me;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inicio()),
                );
              }
            }
          }
        },

        // -----------
        child: Container(
          // -----------
          padding: const EdgeInsets.all(10.0),
          width: 130.0,

          // -------------------
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFCCD5AE),
            ),
            borderRadius: BorderRadius.circular(20),
          ),

          // ------------
          child: const Text(
            "Ingresar",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFFCCD5AE),
            ),
          ),
        ));

    // ------------------
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                fondo,

                // ---------
                Center(
                  child: Container(
                    // --------------------------------Medidas del contenedor---------------------------------------------
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.symmetric(horizontal: 0.5),
                    padding: const EdgeInsets.only(
                      top: 100,
                      left: 15.0,
                      right: 15.0,
                    ),
                    alignment: Alignment.center,

                    // ------------
                    child: Column(
                      // --------------
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      // ----------------
                      children: [
                        logo,
                        const SizedBox(height: 10.0),

                        // ---------
                        const Text(
                          "Debes iniciar sesión para poder empezar a trabajar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 30.0,
                left: 40.0,
                right: 40.0,
                bottom: 15.0,
              ),
              child: Column(
                children: [
                  // ---------------
                  inputUser,
                  const SizedBox(height: 10.0),

                  inputPass,
                  const SizedBox(height: 10.0),

                  // -----------
                  botonIng,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _mensajeUsu(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Usuario no existe"),
            content: const Text(
                'Los datos ingresados no coinciden con alguna cuenta de usuario'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    usuarioController.clear();
                    passwordController.clear();
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }

  void _mensaje(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error de conexión"),
            content:
                const Text('Ocurrió un error al conectar con la base de datos'
                    'o consulta errónea.'),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                      usuarioController.clear();
                      passwordController.clear();
                    });
                  },
                  child: const Text('Aceptar'),
                ),
              )
            ],
          );
        });
  }
}
