import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/rules_buttons.dart';
import 'winner_display.dart';

import '../grids_page.dart';
import '../model/boards.dart';
import '../model/game.dart';
import '../styles/colors.dart';
import 'board.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  String winner = '';

  bool rowBuilderWins = true;
  int inRowValue = 3;
  late Game _game;
  final ValueNotifier<String> _grid = ValueNotifier<String>(initialGridName);

  @override
  void initState() {
    _createGame();

    _grid.addListener(() {
      _createGame();
    });

    super.initState();
  }

  void _createGame() {
    _game = Game(createBoard(_grid.value));

    _game.lastMove.addListener(() {
      setState(() {});
    });

    setState(() {});
  }

  void changeWinner(String newWinner) {
    setState(() {
      winner = newWinner;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          _grid.value,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        BoardView(game: _game),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _game.lastMove.value == null
                    ? null
                    : () {
                        _game.stepBack();
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button.stepBack),
                child: const Text('Step back')),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _createGame();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.button.reset),
              child: const Text('Reset'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GridsPage(grid: _grid)),
            );
          },
          child: const Text('Choose grid'),
        ),
        const SizedBox(height: 20),
        RulesChangingButtons(
          onRulesChanged: (inRowValue, rowBuilderWins) {
            setState(() {
              this.inRowValue = inRowValue;
              this.rowBuilderWins = rowBuilderWins;
            });
          },
        ),
        const SizedBox(height: 20),
        WinnerDisplay(winner: winner, rowBuilderWins: rowBuilderWins),
      ],
    );
  }
}
