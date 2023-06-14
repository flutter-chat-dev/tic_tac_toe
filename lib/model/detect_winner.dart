import 'package:tic_tac_toe/model/game.dart';

import '../widgets/game_view.dart';

String detectWinner(int x, int y, Board board) {
  String winner = '';
  int m = y;
  int winXCount = 0;
  int winOCount = 0;

  // Vertical
  for (int n = (x - inRowValue + 1); n <= (x + inRowValue - 1); n++) {
    if (n >= 0 && n < board.length) {
      if (board[n][m] == CellState.x) {
        winXCount++;
      }
      if (board[n][m] == CellState.o) {
        winOCount++;
      }

      if (winXCount == inRowValue) {
        clickable = false;

        winner = !misere ? 'x' : 'o';
        return winner;
      } else if (winOCount == inRowValue) {
        clickable = false;

        winner = !misere ? 'o' : 'x';
        return winner;
      }
    } else {
      winXCount = 0;
      winOCount = 0;
    }
  }

  // Horizontal
  winXCount = 0;
  winOCount = 0;
  for (int n = (y - inRowValue + 1); n <= (y + inRowValue - 1); n++) {
    if (n >= 0 && n < board[x].length) {
      if (board[x][n] == CellState.x) {
        winXCount++;
      }
      if (board[x][n] == CellState.o) {
        winOCount++;
      }

      if (winXCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'x' : 'o';
        clickable = false;
        return winner;
      } else if (winOCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'o' : 'x';
        clickable = false;
        return winner;
      }
    } else {
      winXCount = 0;
      winOCount = 0;
    }
  }

  // Diagonal (top-left to bottom-right)
  winXCount = 0;
  winOCount = 0;
  for (int i = -inRowValue + 1; i < inRowValue; i++) {
    int n = x + i;
    int m = y + i;
    if (n >= 0 && n < board.length && m >= 0 && m < board[n].length) {
      if (board[n][m] == CellState.x) {
        winXCount++;
      }
      if (board[n][m] == CellState.o) {
        winOCount++;
      }

      if (winXCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'x' : 'o';
        return winner;
      } else if (winOCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'o' : 'x';
        return winner;
      }
    } else {
      winXCount = 0;
      winOCount = 0;
    }
  }

  // Diagonal (top-right to bottom-left)
  winXCount = 0;
  winOCount = 0;
  for (int i = -inRowValue + 1; i < inRowValue; i++) {
    int n = x + i;
    int m = y - i;
    if (n >= 0 && n < board.length && m >= 0 && m < board[n].length) {
      if (board[n][m] == CellState.x) {
        winXCount++;
      }
      if (board[n][m] == CellState.o) {
        winOCount++;
      }

      if (winXCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'x' : 'o';
        return winner;
      } else if (winOCount == inRowValue) {
        clickable = false;
        winner = !misere ? 'o' : 'x';
        return winner;
      }
    } else {
      winXCount = 0;
      winOCount = 0;
    }
  }

  return winner;
}
