import 'package:flutter/widgets.dart';

import 'cell_icon.dart';
import '../model/game.dart';

/// This widget is a board icon.
///
/// It holds board value named [board].
class BoardIconView extends StatelessWidget {
  const BoardIconView({super.key, required this.board});
  final Board board;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (final x in Iterable.generate(board.length))
              Row(
                children: [
                  for (final y in Iterable.generate(board[x].length))
                    CellIconView(state: board[x][y]),
                ],
              ),
          ],
        )
      ],
    );
  }
}
