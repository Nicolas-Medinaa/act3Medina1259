import 'package:flutter/material.dart';
import 'package:act3medina1259/pantalla_1.dart';
import 'package:act3medina1259/pantalla_2.dart';
import 'package:act3medina1259/pantalla_3.dart';
import 'package:act3medina1259/pantalla_4.dart';
import 'package:act3medina1259/pantalla_5.dart';
import 'package:act3medina1259/pantalla_6.dart';

void main() => runApp(MiRutasApp());

class MiRutasApp extends StatelessWidget {
  const MiRutasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Entre paginas Routes",
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaUno(),
        '/pantalla2': (context) => const PantallaDos(),
        '/pantalla3': (context) => const PantallaTres(),
        '/pantalla4': (context) => const PantallaCuatro(),
        '/pantalla5': (context) => const PantallaCinco(),
        '/pantalla6': (context) => const PantallaSeis(),
      },
    );
  }
}
