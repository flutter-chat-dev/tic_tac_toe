import 'package:flutter/material.dart';

import 'game_view.dart';

class RulesChangingButtons extends StatefulWidget {
  const RulesChangingButtons({super.key});

  @override
  RulesChangingButtonsState createState() => RulesChangingButtonsState();
}

class RulesChangingButtonsState extends State<RulesChangingButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Get'),
        const SizedBox(width: 20),
        SizedBox(
          width: 90,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButton<int>(
                value: inRowValue,
                items: List<DropdownMenuItem<int>>.generate(
                  8,
                  (index) => DropdownMenuItem<int>(
                    value: index + 3,
                    child: Text((index + 3).toString()),
                  ),
                ),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      inRowValue = newValue;
                    });
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        const Text('in a row to'),
        const SizedBox(width: 20),
        SizedBox(
          width: 90,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: DropdownButton<int>(
                value: whoWins,
                items: const [
                  DropdownMenuItem<int>(
                    value: 0,
                    child: Text('Win'),
                  ),
                  DropdownMenuItem<int>(
                    value: 1,
                    child: Text('Lose'),
                  ),
                ],
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    setState(() {
                      whoWins = newValue;
                    });
                  }
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
                underline: Container(),
                icon: const Icon(Icons.arrow_drop_down),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
