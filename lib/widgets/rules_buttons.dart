import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/colors.dart';

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
        ElevatedButton(
          onPressed: () {
            setState(() {
              rules = 1;
              misere = false;
              inRowValue = 3;
              wildClicked = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                rules == 1 ? AppColors.card.background : Colors.blue,
          ),
          child: const Text('Traditional'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              rules = 2;
              misere = false;
              inRowValue = 4;
              wildClicked = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                rules == 2 ? AppColors.card.background : Colors.blue,
          ),
          child: const Text('Four-in-a-row'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              rules = 3;
              misere = true;
              inRowValue = 3;
              wildClicked = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                rules == 3 ? AppColors.card.background : Colors.blue,
          ),
          child: const Text('Misere'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              rules = 4;

              wildClicked = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                rules == 4 ? AppColors.card.background : Colors.blue,
          ),
          child: const Text('Wild'),
        ),
        const SizedBox(width: 10),
        Text(
          'get-in-a-row',
          style: TextStyle(
            color: rules == 4 ? Colors.black : Colors.grey,
          ),
        ),
        SizedBox(
          width: 65,
          height: 30, // Replace with the desired width
          child: OutlinedButton(
            onPressed: null,
            child: DropdownButton<int>(
              value: inRowValue,
              items: const [
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('3'),
                ),
                DropdownMenuItem<int>(
                  value: 4,
                  child: Text('4'),
                ),
                DropdownMenuItem<int>(
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
              underline: Container(), // Remove the underline
              icon: const Icon(Icons.arrow_drop_down), // Add the dropdown icon
            ),
          ),
        ),
        if (rules == 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('misere?'),
              Checkbox(
                value: misere,
                onChanged: (value) {
                  setState(() {
                    misere = value ?? false;
                  });
                },
              ),
            ],
          ),
      ],
    );
  }
}
