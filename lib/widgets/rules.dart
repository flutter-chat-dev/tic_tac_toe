import 'package:flutter/material.dart';

import '../model/rules.dart';

/// This widget is a text container.
///
/// It shows game rules.
class GameRulesView extends StatelessWidget {
  const GameRulesView({super.key});

  final double lineSpacing = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose grid and choose the rules variation:',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Column(
              children: gameRules.entries
                  .map((entry) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: lineSpacing),
                          Text(entry.key,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: lineSpacing),
                          Text(entry.value),
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
