import 'package:flutter/material.dart';

import '/models/paire.dart';
import '/models/player.dart';
import '/utils/size_config.dart';

class GameTableView extends StatelessWidget {
  final List<List<Player?>> gridData;
  final Function(Pair) onTapCell;

  const GameTableView({
    Key? key,
    required this.gridData,
    required this.onTapCell,
  }) : super(key: key);

  double get cellSize => SizeConfig.safeBlockHorizontal * 30;

  gameTableCell({
    required int idxRow,
    required int idxCol,
  }) {
    final value = gridData[idxRow][idxCol]?.icon ?? const Center();

    return GestureDetector(
      onTap: () => onTapCell(Pair(idxRow, idxCol)),
      child: Container(
        width: cellSize,
        height: cellSize,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        3,
        (rowIndex) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            3,
            (colIndex) => gameTableCell(
              idxRow: rowIndex,
              idxCol: colIndex,
            ),
          ),
        ),
      ),
    );
  }
}
