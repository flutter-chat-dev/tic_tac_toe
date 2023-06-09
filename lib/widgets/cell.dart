import 'package:flutter/material.dart';

import '../model/game.dart';
import '../styles/colors.dart';

/// This widget is a game board's cell.
///
/// It holds the current game and cell coordinates in [game], [x], [y] variables.
class CellView extends StatefulWidget {
  const CellView(
      {super.key, required this.game, required this.x, required this.y});

  final Game game;
  final int x;
  final int y;

  @override
  State<CellView> createState() => _CellViewState();
}

/// This widget is a subclass of CellView and it changes the call state.
///
/// This widget holds the cell's size named [_size] and the cell state named [_state].
/// It updates the cell state when the cell is being tapped.
/// It updates the cell's icon using method [_getIcon()]
/// and the cell's boarder using method [_getBorderColor()].
class _CellViewState extends State<CellView> {
  _CellViewState();

  static const _size = 40.0;

  void handleTap() {
    widget.game.updateCellOnTap(widget.x, widget.y);
    setState(() {});
  }

  CellState get _state => widget.game.cellState(widget.x, widget.y);

  Widget _getIcon() {
    switch (_state) {
      case CellState.x:
      case CellState.o:
        return Icon(_state.icon);
      case CellState.empty:
      case CellState.outside:
        return const Text('');
    }
  }

  Color _getBorderColor() {
    switch (_state) {
      case CellState.x:
      case CellState.o:
      case CellState.empty:
        return AppColors.board.grid;
      case CellState.outside:
        return AppColors.general.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _state == CellState.empty ? handleTap : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(), width: 0),
        ),
        width: _size,
        height: _size,
        child: _getIcon(),
      ),
    );
  }
}
