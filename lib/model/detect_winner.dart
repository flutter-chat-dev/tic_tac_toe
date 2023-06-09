import 'package:tic_tac_toe/model/game.dart';

String detectWinner(int x, int y, Board board) {
  String winner = '';
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
  return winner;
}
