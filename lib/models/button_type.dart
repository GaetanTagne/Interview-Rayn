import 'package:flutter/material.dart';

import '/utils/strings.dart';

enum ButtonType { newGame, resetHistory }

extension ButtonTypeExtension on ButtonType {
  String get texte {
    switch (this) {
      case ButtonType.newGame:
        return AppStrings.gameButtonNewGame;
      case ButtonType.resetHistory:
        return AppStrings.gameButtonResetHistory;
    }
  }

  Color get bcgkdColor {
    switch (this) {
      case ButtonType.newGame:
        return const Color(0xff2197f3);
      case ButtonType.resetHistory:
        return const Color(0xfff44336);
    }
  }
}
