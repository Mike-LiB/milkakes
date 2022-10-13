// ignore_for_file: slash_for_doc_comments

/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'package:flutter/material.dart';
import 'package:milkakes/screens/lista_mesas.dart';
import '../developer/consultas.dart';

class FormularioMesa extends StatefulWidget {
  const FormularioMesa({Key? key}) : super(key: key);

  @override
  _FormularioMesaState createState() => _FormularioMesaState();
}

class _FormularioMesaState extends State<FormularioMesa> {
  var numero = TextEditingController();
  var usuario = TextEditingController();
  var contrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          // --------
          children: [
            const Text(
              "Número de mesa:",
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0),
              width: MediaQuery.of(context).size.width * 0.2,
              child: inputNum(context),
            )
          ],
        ),
        const SizedBox(height: 10.0),

        // ----------
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: inputUsu(context),
        ),
        const SizedBox(height: 10.0),

        // ---------
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: inputPass(context)),
        const SizedBox(height: 10.0),

        // ----------
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: MediaQuery.of(context).size.width * 0.4,
              child: botonCancelar(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: MediaQuery.of(context).size.width * 0.4,
              child: botonGuardar(),
            ),
          ],
        )
      ],
    );
  }

  // *-------------------------------------------Input del número-----------------------------------------------------
  inputNum(BuildContext context) {
    return TextField(
      controller: numero,
      autocorrect: true,
      restorationId: "num",
      keyboardType: TextInputType.number,
      autofocus: false,
      maxLength: 2,

      // ----------------------------------Estilo del input-----------------------------------------------------
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: "00",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.all(5.0),
        counterText: "",
      ),
      style: const TextStyle(fontSize: 18.0),
    );
  }

  // *-------------------------------------------Input del usuario-----------------------------------------------------
  inputUsu(BuildContext context) {
    return TextField(
      controller: usuario,
      restorationId: "usu",
      keyboardType: TextInputType.text,
      maxLength: 100,
      autofocus: false,

      // ----------------------------------Estilo del input-----------------------------------------------------
      cursorColor: const Color(0xFFccd5ae),
      decoration: InputDecoration(
        hintText: "Usuario",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.all(5.0),
        counterText: "",
      ),
      style: const TextStyle(fontSize: 18.0),
    );
  }

  // ----------
  inputPass(BuildContext context) {
    return TextField(
      controller: contrasena,
      restorationId: "pass",
      keyboardType: TextInputType.text,
      maxLength: 10,
      autofocus: false,

      // ----------------------------------Estilo del input-----------------------------------------------------
      cursorColor: const Color(0xFFccd5ae),
      decoration: InputDecoration(
        hintText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.all(5.0),
        counterText: "",
      ),
      style: const TextStyle(fontSize: 18.0),
    );
  }

  // *-------------------------------------------Botón Cancelar-------------------------------------------------------
  botonCancelar() {
    return Container(
      // --------------------------------------Estilo del botón-----------------------------------------------------
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.red[900],
      ),

      // --------------------------------------Medidas del botón----------------------------------------------------
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: TextButton(
        onPressed: () {
          setState(() {
            Navigator.pop(context);
          });
        },
        child: const Text(
          "Cancelar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: const ButtonStyle(splashFactory: null),
      ),
    );
  }

  // *-------------------------------------------Botón Guardar--------------------------------------------------------
  botonGuardar() {
    return Container(
      // --------------------------------------Estilo del botón-----------------------------------------------------
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFFccd5ae),
      ),

      // --------------------------------------Medidas del botón----------------------------------------------------
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      child: TextButton(
        onPressed: () async {
          var resul =
              await agregarMesa(numero.text, usuario.text, contrasena.text);
          if (resul == "mesaExiste") {
            //mesa existe
          } else if (resul == "existeUsu") {
            //usuario en uso
          } else if (resul == "exito") {
           //se creo
            setState(() {
              numero.clear();
              usuario.clear();
              contrasena.clear();
            });
          } else {
            //informar error
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListaMesas(),
            ),
          );
        },
        child: const Text(
          "Guardar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: const ButtonStyle(splashFactory: null),
      ),
    );
  }
}
