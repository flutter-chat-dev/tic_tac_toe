import 'package:flutter/widgets.dart';

import 'cell.dart';
import '../model/game.dart';

/// This widget is a board that shows the game state.
///
/// It holds game value named [game].
class BoardView extends StatelessWidget {
  const BoardView({super.key, required this.game});
  final Game game;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final x in Iterable.generate(game.board.length))
              Row(
                children: [
                  for (final y in Iterable.generate(game.board[x].length))
                    CellView(x: x, y: y, game: game),
                ],
              ),
          ],
        )
      ],
    );
  }
}
