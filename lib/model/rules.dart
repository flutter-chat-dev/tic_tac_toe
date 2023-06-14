/// Holds game rules for different game variations
const gameRules = <String, String>{
  'Traditional':
      'The first player places an X in any square on the board. Players take turns placing an X or an O in one of the squares. The first player to get three-in-a-row vertically, horizontally, or diagonally wins.',
  'Misere':
      'In misere tic-tac-toe, the player wins if the opponent gets three-in-a-row.',
  'Four-in-a-row & Five-in-a-row':
      'In Four-in-a-row or Five-in-a-rowtic-tac-toe, the first player to get four-in-a-row or five-in-a-row, vertically, horizontally, or diagonally, wins. It is unavaliable if the board is smaller than 4x4 or 5x5',
};
