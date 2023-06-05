import 'package:flutter/material.dart';
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

    final result = nextMove;
    if (nextMove == CellState.x) {
      nextMove = CellState.o;
    } else if (nextMove == CellState.o) {
      nextMove = CellState.x;
    }

    board[x][y] = result;
    lastMove.value = (x: x, y: y);
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        board[x][y] == CellState.x &&
        board[x - 1][y] == CellState.x &&
        board[x - 2][y] == CellState.x) {
      winner = 'x';
    }
    if (x + 1 < board.length &&
        x + 2 < board.length &&
        board[x][y] == CellState.x &&
        board[x + 1][y] == CellState.x &&
        board[x + 2][y] == CellState.x) {
      winner = 'x';
    }
    if (y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.x &&
        board[x][y + 1] == CellState.x &&
        board[x][y + 2] == CellState.x) {
      winner = 'x';
    }
    if (y - 1 >= 0 &&
        y - 2 >= 0 &&
        board[x][y] == CellState.x &&
        board[x][y - 1] == CellState.x &&
        board[x][y - 2] == CellState.x) {
      winner = 'x';
    }
    //center
    if (x - 1 >= 0 &&
        x + 1 < board.length &&
        board[x][y] == CellState.x &&
        board[x - 1][y] == CellState.x &&
        board[x + 1][y] == CellState.x) {
      winner = 'x';
    }
    if (y - 1 >= 0 &&
        y + 1 < board.length &&
        board[x][y] == CellState.x &&
        board[x][y - 1] == CellState.x &&
        board[x][y + 1] == CellState.x) {
      winner = 'x';
    }
    if (x - 1 >= 0 &&
        y - 1 >= 0 &&
        x + 1 < board.length &&
        y + 1 < board.length &&
        board[x][y] == CellState.x &&
        board[x - 1][y - 1] == CellState.x &&
        board[x + 1][y + 1] == CellState.x) {
      winner = 'x';
    }
    if (x - 1 >= 0 &&
        x - 1 >= 0 &&
        x + 1 < board.length &&
        y + 1 < board.length &&
        board[x][y] == CellState.x &&
        board[x - 1][y + 1] == CellState.x &&
        board[x + 1][y - 1] == CellState.x) {
      winner = 'x';
    }
    //diagonals
    if (x + 1 < board.length &&
        x + 2 < board.length &&
        y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.x &&
        board[x + 1][y + 1] == CellState.x &&
        board[x + 2][y + 2] == CellState.x) {
      winner = 'x';
    }
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.x &&
        board[x - 1][y + 1] == CellState.x &&
        board[x - 2][y + 2] == CellState.x) {
      winner = 'x';
    }
    if (y - 1 >= 0 &&
        y - 2 >= 0 &&
        x + 1 < board.length &&
        x + 2 < board.length &&
        board[x][y] == CellState.x &&
        board[x + 1][y - 1] == CellState.x &&
        board[x + 2][y - 2] == CellState.x) {
      winner = 'x';
    }
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        y - 1 >= 0 &&
        y - 2 >= 0 &&
        board[x][y] == CellState.x &&
        board[x - 1][y - 1] == CellState.x &&
        board[x - 2][y - 2] == CellState.x) {
      winner = 'x';
    }

    // for 0
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        board[x][y] == CellState.o &&
        board[x - 1][y] == CellState.o &&
        board[x - 2][y] == CellState.o) {
      winner = 'o';
    }
    if (x + 1 < board.length &&
        x + 2 < board.length &&
        board[x][y] == CellState.o &&
        board[x + 1][y] == CellState.o &&
        board[x + 2][y] == CellState.o) {
      winner = 'o';
    }
    if (y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.o &&
        board[x][y + 1] == CellState.o &&
        board[x][y + 2] == CellState.o) {
      winner = 'o';
    }
    if (y - 1 >= 0 &&
        y - 2 >= 0 &&
        board[x][y] == CellState.o &&
        board[x][y - 1] == CellState.o &&
        board[x][y - 2] == CellState.o) {
      winner = 'o';
    }
    //center
    if (x - 1 >= 0 &&
        x + 1 < board.length &&
        board[x][y] == CellState.o &&
        board[x - 1][y] == CellState.o &&
        board[x + 1][y] == CellState.o) {
      winner = 'o';
    }
    if (y - 1 >= 0 &&
        y + 1 < board.length &&
        board[x][y] == CellState.o &&
        board[x][y - 1] == CellState.o &&
        board[x][y + 1] == CellState.o) {
      winner = 'o';
    }
    if (x - 1 >= 0 &&
        y - 1 >= 0 &&
        x + 1 < board.length &&
        y + 1 < board.length &&
        board[x][y] == CellState.o &&
        board[x - 1][y - 1] == CellState.o &&
        board[x + 1][y + 1] == CellState.o) {
      winner = 'o';
    }
    if (x - 1 >= 0 &&
        x - 1 >= 0 &&
        x + 1 < board.length &&
        y + 1 < board.length &&
        board[x][y] == CellState.o &&
        board[x - 1][y + 1] == CellState.o &&
        board[x + 1][y - 1] == CellState.o) {
      winner = 'o';
    }
    //diagonals
    if (x + 1 < board.length &&
        x + 2 < board.length &&
        y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.o &&
        board[x + 1][y + 1] == CellState.o &&
        board[x + 2][y + 2] == CellState.o) {
      winner = 'o';
    }
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        y + 1 < board.length &&
        y + 2 < board.length &&
        board[x][y] == CellState.o &&
        board[x - 1][y + 1] == CellState.o &&
        board[x - 2][y + 2] == CellState.o) {
      winner = 'o';
    }
    if (y - 1 >= 0 &&
        y - 2 >= 0 &&
        x + 1 < board.length &&
        x + 2 < board.length &&
        board[x][y] == CellState.o &&
        board[x + 1][y - 1] == CellState.o &&
        board[x + 2][y - 2] == CellState.o) {
      winner = 'o';
    }
    if (x - 1 >= 0 &&
        x - 2 >= 0 &&
        y - 1 >= 0 &&
        y - 2 >= 0 &&
        board[x][y] == CellState.o &&
        board[x - 1][y - 1] == CellState.o &&
        board[x - 2][y - 2] == CellState.o) {
      winner = 'o';
    }
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
