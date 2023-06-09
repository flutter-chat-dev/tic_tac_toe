import 'package:flutter/material.dart';
import 'package:tic_tac_toe/model/detect_winner.dart';
import '../widgets/game_view.dart';

typedef Board = List<List<CellState>>;
typedef Coordinates = ({int x, int y});

/// A game that holds board value named [board] and the next move value named [nextMove].
///
/// The game updates cell value using method [updateCellOnTap()]
/// The game returns the state of a cell using method [cellState()]
class Game {
  CellState nextMove = CellState.x;
  ValueNotifier<Coordinates?> lastMove = ValueNotifier(null);
  final Board board;

  Game(this.board);

  void updateCellOnTap(int x, int y) {
    if (cellState(x, y) == CellState.outside) {
      return;
    }
    if (!clickable) {
      return;
    }

    final result = nextMove;
    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[x][y] = result;
    lastMove.value = (x: x, y: y);

    winner = detectWinner(x, y, board);
  }

  void stepBack() {
    if (lastMove.value == null) return;

    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[lastMove.value!.x][lastMove.value!.y] = CellState.empty;
    winner = '1';

    lastMove.value = null;
  }

  CellState cellState(int x, int y) => board[x][y];
}

/// Holds cell state values and icons
enum CellState {
  x(Icons.close),
  o(Icons.circle_outlined),
  empty(null),
  outside(null),
  ;

  const CellState(this.icon);

  final IconData? icon;
}
