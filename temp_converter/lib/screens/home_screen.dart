import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_converter/constants/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownInputValue = list.first;
  String dropdownOutputValue = list.first;

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
              inputUnitTxt,
              style: TextStyle(
                fontSize: 25, // Taille du texte en pixels
              ),
            ),
            inputRow(),
            SizedBox(
              height: 40,
            ),
            Text(
              outputUnitTxt,
              style: TextStyle(
                fontSize: 25, // Taille du texte en pixels
              ),
            ),
            outputRow(),
            SizedBox(
              height: 32,
            ),
            calculusButton(),
            SizedBox(
              height: 16,
            ),
            cancelButton(),
          ],
        ),
      ),
    );
  }

  // ==========================================================================

  ElevatedButton cancelButton() {
    return ElevatedButton(
      onPressed: () {
        _input.clear();
        _output.clear();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // Couleur de fond
        backgroundColor:
            const Color.fromARGB(255, 115, 115, 115), // Couleur du texte
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
      child: const Text(cancelTxt),
    );
  }

  ElevatedButton calculusButton() {
    return ElevatedButton(
      onPressed: () {
        var inputValue = int.parse(_input.text);
        double outputValue = 0;

        outputValue = double.parse(
            performAction(dropdownInputValue, dropdownOutputValue, inputValue));

        _output.text = outputValue.toString();
      },
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
      child: const Text(calculusTxt),
    );
  }

  Row outputRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 280,
          child: TextField(
            controller: _output,
            decoration: InputDecoration(
              labelText: outpoutTextfieldTxt,
              labelStyle: TextStyle(color: Colors.black), // Couleur du label
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black), // Bordure normale (non grisée)
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            enabled: false,
          ),
        ),
        DropdownMenu<String>(
          initialSelection: list.first,
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownOutputValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        )
      ],
    );
  }

  Row inputRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 280,
          child: TextField(
            controller: _input,
            decoration: InputDecoration(
              labelText: inputTextfieldTxt,
              labelStyle: TextStyle(color: Colors.black), // Couleur du label
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.black), // Bordure normale (non grisée)
                borderRadius: BorderRadius.circular(8.0),
              ),
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
              dropdownInputValue = value!;
            });
          },
          dropdownMenuEntries:
              list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        )
      ],
    );
  }
}

String performAction(String var1, String var2, int value) {
  // Combinaison des deux variables dans une seule clé
  String key = '$var1-$var2';
  double result = 0;

  switch (key) {
    case 'Celsius (C°)-Fahrenheit (F°)':
      // TODO : appeler les fonctions adhéquates
      result = fromCtoF(value);
      return ("$result");
    case 'Celsius (C°)-Kelvin (K)':
      // TODO : appeler les fonctions adhéquates
      result = fromCtoK(value);
      return ("$result");
    case 'Fahrenheit (F°)-Celsius (C°)':
      // TODO : appeler les fonctions adhéquates
      result = fromFtoC(value);
      return ("$result");
    case 'Fahrenheit (F°)-Kelvin (K)':
      // TODO : appeler les fonctions adhéquates
      result = fromFtoK(value);
      return ("$result");
    case 'Kelvin (K)-Fahrenheit (F°)':
      // TODO : appeler les fonctions adhéquates
      result = fromKtoF(value);
      return ("$result");
    case 'Kelvin (K)-Celsius (C°)':
      // TODO : appeler les fonctions adhéquates
      result = fromKtoC(value);
      return ("$result");
    case 'Celsius (C°)-Celsius (C°)':
      return ("$value");
    case 'Fahrenheit (F°)-Fahrenheit (F°)':
      return ("$value");
    case 'Kelvin (K)-Kelvin (K)':
      return ("$value");
    default:
      return ("0");
  }
}

// =============================================================================
// ============================ FONCTIONS DE CALCUL ============================
// =============================================================================

double fromKtoC(int value) {
  return value - 273.15;
}

double fromKtoF(int value) {
  return (value - 273.15) * 9 / 5 + 32;
}

double fromFtoK(int value) {
  return (value - 32) * 5 / 9 + 273.15;
}

double fromFtoC(int value) {
  return (value - 32) * 5 / 9;
}

double fromCtoK(int value) {
  return value + 273.15;
}

double fromCtoF(int value) {
  return (value * 9 / 5) + 32;
}
