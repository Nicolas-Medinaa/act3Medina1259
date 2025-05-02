import 'package:flutter/material.dart';

class PantallaSeis extends StatefulWidget {
  const PantallaSeis({Key? key}) : super(key: key);

  static const List<String> listItems = <String>[
    'manzana',
    'banana',
    'melon',
  ];

  @override
  State<PantallaSeis> createState() => _PantallaSeisState();
}

class _PantallaSeisState extends State<PantallaSeis> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantalla seis',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        backgroundColor: Color(0xffff9200),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return PantallaSeis.listItems.where((String item) {
                  return item
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              onSelected: (String item) {
                setState(() {
                  _selectedItem = item;
                });
                print('Se seleccionó: $item');
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Items Disponibles:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...PantallaSeis.listItems.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(item, style: const TextStyle(fontSize: 16)),
                )),
            const SizedBox(height: 20),
            if (_selectedItem != null)
              Text(
                'Seleccionaste: $_selectedItem',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ],
        ),
      ),
    );
  }
}
