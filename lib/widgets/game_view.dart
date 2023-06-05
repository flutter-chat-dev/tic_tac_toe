import 'package:flutter/material.dart';

import '../grids_page.dart';
import '../model/boards.dart';
import '../model/game.dart';
import '../styles/colors.dart';
import 'board.dart';

var tapState = [0, 0];
var winner = '1';

late final Game game1;

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
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
    winner = '';
    setState(() {});
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
        // For test
        // Text(tapState[0].toString() + '. ' + tapState[1].toString()),
        Visibility(
            visible: winner != '',
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    winner == 'x'
                        ? 'Winner:  '
                        : (winner == 'o' ? 'Winner:  ' : ''),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (winner == 'x')
                    const Icon(
                      Icons.close,
                      color: Colors.white,
                    )
                  else if (winner == 'o')
                    const Icon(
                      Icons.circle_outlined,
                      color: Colors.white,
                    )
                ],
              ),
            ))
      ],
    );
  }
}
