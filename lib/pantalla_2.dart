import 'package:flutter/material.dart';

class PantallaDos extends StatefulWidget {
  const PantallaDos({Key? key}) : super(key: key);

  @override
  State<PantallaDos> createState() =>
      _PantallaDosState(); // ¡Corregí el nombre del State!
}

class _PantallaDosState extends State<PantallaDos> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ¡Envolví todo en un Scaffold!
      appBar: AppBar(
        title: const Text(
          'Pantalla dos', // ¡Corregí el título!
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        backgroundColor: const Color(0xfff2d841),
        centerTitle: true,
      ),
      body: GestureDetector(
        // El GestureDetector ahora está dentro del body
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 200.0 : 100.0,
            height: selected ? 100.0 : 200.0,
            color: selected ? Colors.blueGrey : Colors.white,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(size: 75),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        // Agregué un Column dentro de bottomNavigationBar para organizar los elementos
        mainAxisSize: MainAxisSize
            .min, // Para que la columna ocupe el espacio mínimo necesario
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ),
          const SizedBox(
            height: 20, // Añadí un poco de espacio al final
          ),
        ],
      ),
    );
  }
}
