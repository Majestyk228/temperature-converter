import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_converter/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = list.first;

  // TextField controllers
  final TextEditingController _input = TextEditingController();
  final TextEditingController _output = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      body: Padding(
        padding: const EdgeInsets.only(left: 64.0, right: 64.0),
        child: Column(
          children: [
            Text(
              "Unité de départ",
              style: TextStyle(
                fontSize: 25, // Taille du texte en pixels
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280,
                  child: TextField(
                    controller: _input,
                    decoration: InputDecoration(
                      labelText: 'Entrez la valeur',
                    ),
                    keyboardType: TextInputType.number, // Clavier numérique
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter
                          .digitsOnly, // N'accepte que des chiffres
                    ],
                  ),
                ),
                DropdownMenu<String>(
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Unité de conversion",
              style: TextStyle(
                fontSize: 25, // Taille du texte en pixels
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 280,
                  child: TextField(
                    controller: _output,
                    decoration: InputDecoration(
                      labelText: 'Votre conversion',
                    ),
                    enabled: false,
                  ),
                ),
                DropdownMenu<String>(
                  initialSelection: list.first,
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  dropdownMenuEntries:
                      list.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, // Couleur de fond
                backgroundColor: Colors.white, // Couleur du texte
                padding: EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16), // Padding interne du bouton
                textStyle: TextStyle(
                  fontSize: 18, // Taille du texte
                  fontWeight: FontWeight.bold, // Style du texte
                ),
                shape: RoundedRectangleBorder(
                  // Forme du bouton
                  borderRadius: BorderRadius.circular(30), // Bordure arrondie
                ),
                elevation: 5, // Élévation (ombre)
              ),
              child: const Text('Calculer'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                _input.clear();
                _output.clear();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // Couleur de fond
                backgroundColor: const Color.fromARGB(
                    255, 115, 115, 115), // Couleur du texte
                padding: EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16), // Padding interne du bouton
                textStyle: TextStyle(
                  fontSize: 18, // Taille du texte
                  fontWeight: FontWeight.bold, // Style du texte
                ),
                shape: RoundedRectangleBorder(
                  // Forme du bouton
                  borderRadius: BorderRadius.circular(30), // Bordure arrondie
                ),
                elevation: 5, // Élévation (ombre)
              ),
              child: const Text('Annuler'),
            ),
          ],
        ),
      ),
    );
  }
}
