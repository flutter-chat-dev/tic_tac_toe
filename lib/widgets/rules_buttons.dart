import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/colors.dart';

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
        ElevatedButton(
          onPressed: () {
            setState(() {
              rules = 1;
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
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                rules == 4 ? AppColors.card.background : Colors.blue,
          ),
          child: const Text('Wild'),
        ),
      ],
    );
  }
}
