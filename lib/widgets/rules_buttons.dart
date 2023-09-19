import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/dropdown.dart';

class RulesChangingButtons extends StatefulWidget {
  final void Function(int inRowValue, bool rowBuilderWins) onRulesChanged;

  const RulesChangingButtons({
    Key? key,
    required this.onRulesChanged,
  }) : super(key: key);

  @override
  RulesChangingButtonsState createState() => RulesChangingButtonsState();
}

class RulesChangingButtonsState extends State<RulesChangingButtons> {
  String selectedValue = '3';
  String winValue = 'Win';
  int inRowValue = 3;
  bool rowBuilderWins = true;

  static const String valueWin = 'Win';
  static const String valueLose = 'Lose';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Get'),
        const SizedBox(width: 7),
        SizedBox(
          width: 80,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: RulesDropdown(
                items: const ['3', '4', '5'],
                selectedValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value ?? '3';
                    inRowValue = int.tryParse(value ?? '0') ?? 0;
                    widget.onRulesChanged(inRowValue, rowBuilderWins);
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        const Text('in a row to'),
        const SizedBox(width: 7),
        SizedBox(
          width: 89,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: RulesDropdown(
                items: const [valueWin, valueLose],
                selectedValue: winValue,
                onChanged: (value) {
                  setState(() {
                    winValue = value ?? valueWin;
                    final rowBuilderWins = value == valueWin ? false : true;
                    widget.onRulesChanged(inRowValue, rowBuilderWins);
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
