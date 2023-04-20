import 'package:flutter/material.dart';

import '../model/game.dart';
import '../styles/colors.dart';

/// This widget is an board icon's cell that can not change its state.
/// 
/// This widget holds a size named [_size] and the cell state named [state].
/// It calculates the cell border using method [_getBorderColor()], and
/// the cell background color using method [_getBackgroundColor()].
class CellIconView extends StatelessWidget {
  const CellIconView({super.key, required this.state});

  static const _size = 20.0;
  final CellState state;

  Color _getBorderColor() {
    switch (state) {
      case CellState.outside:
        return AppColors.general.transparent;
      default:
        return AppColors.card.grid;
    }
  }

  Color _getBackgroundColor() {
    switch (state) {
      case CellState.outside:
        return AppColors.general.transparent;
      default:
        return AppColors.card.cell;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _getBorderColor(), width: 0),
          color: _getBackgroundColor(),
        ),
        width: _size,
        height: _size,
        child: const Text(''),
      ),
    );
  }
}
