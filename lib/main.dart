// ignore_for_file: slash_for_doc_comments
/**
 * @author Luis Miguel Liborio
 */

/**
 * Estas son las librerías necesarias para poder mostrar la app, nativas de 
 * Flutter están las librerías "material", la cual se utiliza para
 * crear widgets estilo material (Andriod) y "services" es utilizada únicamente
 * para editar la barra de estado y navegación del sistema.
 * 
 * La otra librería es para mostrar la primer pantalla de la app.
 */
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:milkakes/screens/login.dart';
void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  /**
   * El método build es utilizado para construir el widget y poder mostrarla en pantalla.
   */
  @override
  Widget build(BuildContext context) {
    /**
     * Este bloque de código se utiliza para cambiar el color de la barra de notificaciones
     * y también la barra de navegación del dispositivo, la barra de notificaciones
     * se deja transparente y se le especifíca que el brillo sea light para así
     * poder ver los íconos en color negro.
     * 
     * Por otro lado, la barra de navegación se deja en color blanco para que haga juego
     * con lo demás.
     */
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white),
    );

    return MaterialApp(
      // Esta línea de código sirve para quitar la étiqueta de debug en la app.
      debugShowCheckedModeBanner: false,

      /**
       * En esta línea de código se especifíca el nombre de la app, funciona igual
       * que la etiqueta <Title> en HTML, solo que en este caso el nombre se muestra
       * en el administrador de tareas del móvil o en las aplicaciones abiertas
       * recientemente.
       */
      title: 'MilKakes',

      /**
       * Este es el tema de la app, aquí se agregan los colores que se estarán utilizando
       * dentro de esta, y también ciertos metadatos, por ejemplo: Si el título del App Bar 
       * estará centrado o no, el color de fondo del Scaffold, la fuente de la app,
       * el tamaño del título en el App Bar, el color de este y otros colores de la app.
       * 
       */
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFCCD5AE),
          secondary: const Color(0xFFD4A373),
          background: Colors.white,
        ),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,

        // *-------------------------------------Tema del App Bar-----------------------------------------------------
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 25.0,
          ),

          // *-----------------------------------Tema del título del App Bar------------------------------------------
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontFamily: "Philosopher",
          ),
        ),

        // *-------------------------------------Configuraciones adicionales------------------------------------------
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Philosopher",
        dialogBackgroundColor: Colors.white,
        errorColor: Colors.red[900],
        focusColor: const Color(0xFFCCD5AE),
      ),

      // Aquí se especifíca la pantalla que será mostrada al iniciar la app.
      home: Login(),
    );
  }
}
