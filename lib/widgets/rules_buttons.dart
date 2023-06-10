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
        TextButton(
          onPressed: rules == 4 ? _showGridValueList : null,
          child: Text(inRowValue.toString()),
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

  void _showGridValueList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('get-in-a-row'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  title: const Text('3'),
                  onTap: () {
                    setState(() {
                      inRowValue = 3;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('4'),
                  onTap: () {
                    setState(() {
                      inRowValue = 4;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('5'),
                  onTap: () {
                    setState(() {
                      inRowValue = 5;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
