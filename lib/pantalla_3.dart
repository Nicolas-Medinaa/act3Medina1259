import 'package:flutter/material.dart';
import 'package:act3medina1259/pantalla_3.dart';

class PantallaTres extends StatefulWidget {
  const PantallaTres({Key? key}) : super(key: key);

  @override
  State<PantallaTres> createState() =>
      _PantallaTresState(); // ¡Corregí el nombre del State!
}

class _PantallaTresState extends State<PantallaTres> {
  final _items = <String>[]; // Especifica el tipo de los elementos de la lista
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(
      0,
      duration: const Duration(
          milliseconds: 300), // Reduje la duración para que sea más ágil
    );
  }

  void _removeItem(int index) {
    final removedItem = _items[index]; // Guarda el item que se va a remover
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Card(
            margin: const EdgeInsets.all(10),
            color: Colors.redAccent, // Un tono de rojo más suave
            child: ListTile(
              title: Text(
                "Borrando: $removedItem", // Muestra el item que se está borrando
                style: const TextStyle(
                    fontSize: 18, color: Colors.white), // Un estilo más legible
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ¡Envolví todo en un Scaffold para una estructura completa!
      appBar: AppBar(
        title:
            const Text('Pantalla Tres', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xff48ca37),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
            tooltip: 'Añadir item', // Añadí un tooltip para mejor usabilidad
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount:
                  _items.length, // Inicializa con la cantidad actual de items
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  key:
                      UniqueKey(), // Mantén la UniqueKey para la correcta animación
                  sizeFactor: animation,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    color: Colors.orangeAccent,
                    child: ListTile(
                      title: Text(
                        _items[index],
                        style: const TextStyle(
                            fontSize: 20), // Un tamaño de fuente un poco menor
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        tooltip: 'Borrar item', // Añadí un tooltip
                        onPressed: () {
                          _removeItem(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            // Añadí un Padding para separar un poco el botón
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ),
        ],
      ),
    );
  }
}
