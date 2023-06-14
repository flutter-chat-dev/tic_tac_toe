import 'package:flutter/material.dart';

import 'game_view.dart';

class RulesChangingButtons extends StatefulWidget {
  const RulesChangingButtons({super.key});

  @override
  RulesChangingButtonsState createState() => RulesChangingButtonsState();
}

class RulesChangingButtonsState extends State<RulesChangingButtons> {
  //int rules = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('get-in-a-row'),
        const SizedBox(width: 20),
        SizedBox(
          width: 65,
          height: 30, // Replace with the desired width
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(color: Colors.black), // Set the outline color
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(5.0), // Set the border radius
                ),
              ),
            ),
            child: DropdownButton<int>(
              value: inRowValue,
              items: [
                const DropdownMenuItem<int>(
                  value: 3,
                  child: Text('3'),
                ),
                if (boardSize > 3)
                  const DropdownMenuItem<int>(
                    value: 4,
                    child: Text('4'),
                  ),
                if (boardSize > 4)
                  const DropdownMenuItem<int>(
                    value: 5,
                    child: Text('5'),
                  ),
              ],
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    inRowValue = newValue;
                  });
                }
              },
              style: const TextStyle(
                color: Colors.black, // Set the text color
                fontSize: 16, // Set the font size
                fontWeight: FontWeight.normal, // Set the font weight
              ),
              underline: Container(), // Remove the underline
              icon: const Icon(Icons.arrow_drop_down), // Add the dropdown icon
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            Checkbox(
              value: misere,
              onChanged: (value) {
                setState(() {
                  misere = value ?? false;
                });
              },
            ),
            const Text('misere'),
          ],
        ),
      ],
    );
  }
}
