// ignore_for_file: slash_for_doc_comments
/**
 * @author Miguel Liborio
 * @author Odair Goméz
 */
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milkakes/screens/lista_productos.dart';
import 'dart:async';
import 'dart:convert';
import '../developer/consultas.dart';

class FormularioProducto extends StatefulWidget {
  const FormularioProducto({Key? key}) : super(key: key);

  @override
  State<FormularioProducto> createState() => _FormularioProductoState();
}

//variables super
late String base64;
late String categoriaPrincipal;
late String subcategoriaFinal;

class _FormularioProductoState extends State<FormularioProducto> {
  File? image;
  var precio = TextEditingController();
  var nombreproducto = TextEditingController();

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });

      var bytes = await image.readAsBytes();
      var codigo = base64Encode(bytes);

      return codigo;
    }
  }

  // --------------------------------------------Variables------------------------------------------------------------
  /**
   * Primero creamos las listas de opciones para agregarlas en las listas desplegables.
   */
  final categoria = [
    "Bebidas",
    "Postres",
    "Platillos",
  ];
  List<String> subCategoria = [];

  final subPlatillos = ["Livianos", "Pesado"];
  final subPostre = ["Dulce", "Salado"];
  final subBebidas = ["Frías", "Calientes"];

  /**
   * Declaramos las variable que se utilizarán para cambiar la vista de la lista desplegable
   * en función a la opción que se escoge.
   */
  String opCat = "Categoría";

  String opSubCat = "Sub categoría";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // ------------------------------------Medidas del contenedor-----------------------------------------------
            width: 175,
            height: 175,
            alignment: Alignment.center,
            clipBehavior: Clip.antiAlias,

            // ------------------------------------Estilo del contenedor------------------------------------------------
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(0, 0),
                  blurRadius: 1.0,
                  blurStyle: BlurStyle.solid,
                ),
              ],
            ),

            // ------------------------------------Botón----------------------------------------------------------------
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null
                    ? Image.file(
                        image!,
                        width: MediaQuery.of(context).size.width,
                        height: 175,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.hide_image_outlined,
                        size: 70,
                        color: Colors.white,
                      ),
              ],
            ),
          ),

          // -----------
          InkWell(
            splashColor: Colors.white,
            onTap: () async {
              base64 = await pickImage();
            },
            child: Container(
              // ---------
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(2),
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,

              // --------
              decoration: BoxDecoration(
                color: const Color(0xFFCCD5AE),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 5.0,
                  )
                ],
              ),

              // --------
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Subir imagen",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.upload_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10.0),

          // ----------------------------------------ComboBoxes-----------------------------------------------------------
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // --------------------------------------Categoría------------------------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: listCat(),
            ),

            // --------------------------------------Sub Categoría--------------------------------------------------------
            Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: listSubCat()),
          ]),
          const SizedBox(height: 10.0),

          // ----------------------------------------Inputs de nombre y precio--------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ------------------------------------Nombre del producto--------------------------------------------------
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: inputNombre(context)),

              // ------------------------------------Precio del producto--------------------------------------------------
              Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: inputPrecio(context))
            ],
          ),
          const SizedBox(height: 10.0),

          // ----------------------------------------Botones--------------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --------------------------------------Botón de cancelar----------------------------------------------------
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: MediaQuery.of(context).size.width * 0.40,
                child: botonCancelar(),
              ),

              // --------------------------------------Botón de guardar-----------------------------------------------------
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: MediaQuery.of(context).size.width * 0.40,
                child: botonGuardar(),
              )
            ],
          ),
        ],
      ),
    );
  }

// *---------------------------------------------Widgets--------------------------------------------------------------
/**
 * Los widgets se colocan fuera del ScrollView como métodos por cuestiones de orden 
 * y legibilidad en el código.
 */

  // *-------------------------------------------ComboBox Categoría---------------------------------------------------
  Container listCat() {
    return Container(
      // --------------------------------------Estilo del contenedor------------------------------------------------
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0)),

      // --------------------------------------Medidas del contenedor-----------------------------------------------
      padding: const EdgeInsets.symmetric(horizontal: 5.0),

      // --------------------------------------Lista desplegable----------------------------------------------------
      child: DropdownButton(
        hint: Text(opCat),
        isExpanded: true,

        // ----------------------------------Lista de opciones----------------------------------------------------
        items: categoria.map((String a) {
          return DropdownMenuItem(value: a, child: Text(a));
        }).toList(),

        // ----------------------------------Cambio de opción-----------------------------------------------------
        onChanged: (_value) {
          setState(() {
            opCat = _value.toString();
            categoriaPrincipal = opCat;
            opSubCat = "Sub categoría";
            if (categoriaPrincipal == "Bebidas") {
              subCategoria = subBebidas;
            } else if (categoriaPrincipal == "Postres") {
              subCategoria = subPostre;
            } else if (categoriaPrincipal == "Platillos") {
              subCategoria = subPlatillos;
            } else {
              subCategoria = [];
            }
          });
        },

        // ----------------------------------Estilo de la lista---------------------------------------------------
        iconEnabledColor: const Color(0xFFccd5ae),
        // focusColor: const Color(0xFFccd5ae),
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
        iconSize: 30.0,
        underline: const DropdownButtonHideUnderline(
          child: Text(""),
        ),
      ),
    );
  }

  // *-------------------------------------------ComboBox Sub Categoría-----------------------------------------------
  Container listSubCat() {
    return Container(
      // --------------------------------------Estilo del contenedor------------------------------------------------
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0)),

      // --------------------------------------Medidas del contenedor-----------------------------------------------
      padding: const EdgeInsets.symmetric(horizontal: 5.0),

      // --------------------------------------Lista desplegable----------------------------------------------------
      child: DropdownButton(
        hint: Text(opSubCat),
        isExpanded: true,

        // ----------------------------------Lista de opciones----------------------------------------------------
        items: subCategoria.map((String a) {
          return DropdownMenuItem(value: a, child: Text(a));
        }).toList(),

        // ----------------------------------Cambio de opción-----------------------------------------------------
        onChanged: (_value) {
          setState(() {
            opSubCat = _value.toString();
            subcategoriaFinal = opSubCat;
          });
        },

        // ----------------------------------Estilo de la lista---------------------------------------------------
        iconEnabledColor: const Color(0xFFccd5ae),
        // focusColor: const Color(0xFFccd5ae),
        style: const TextStyle(fontSize: 18.0, color: Colors.black),
        iconSize: 30.0,
        underline: const DropdownButtonHideUnderline(
          child: Text(""),
        ),
      ),
    );
  }

  // *-------------------------------------------Input del nombre-----------------------------------------------------
  inputNombre(BuildContext context) {
    return TextField(
      controller: nombreproducto,
      autocorrect: true,
      restorationId: "nombre",
      keyboardType: TextInputType.text,

      // ----------------------------------Estilo del input-----------------------------------------------------
      cursorColor: const Color(0xFFccd5ae),
      decoration: InputDecoration(
        hintText: "Nombre del producto",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        contentPadding: const EdgeInsets.all(5.0),
      ),
      style: const TextStyle(fontSize: 18.0),
    );
  }

  // *-------------------------------------------Input del precio-----------------------------------------------------
  inputPrecio(BuildContext context) {
    return TextField(
      controller: precio,
      restorationId: "precio",
      keyboardType: TextInputType.number,
      maxLength: 4,

      // ----------------------------------Estilo del input-----------------------------------------------------
      cursorColor: const Color(0xFFccd5ae),
      decoration: InputDecoration(
        hintText: "Precio",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
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
      height: 40.0,

      // ---------
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
        height: 40.0,

        // --------
        child: TextButton(
            onPressed: () async {
              String resultado = await producto(
                  base64, subcategoriaFinal, nombreproducto.text, precio.text);

              if (resultado == "exito") {
                setState(() {
                  image = null;
                  opCat = "Categoría";
                  opSubCat = "Sub categoría";
                  nombreproducto.clear();
                  precio.clear();
                });
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaProductos(),
                ),
              );
            },
            child: const Text(
              "Guardar",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: const ButtonStyle(splashFactory: null)));
  }
}
