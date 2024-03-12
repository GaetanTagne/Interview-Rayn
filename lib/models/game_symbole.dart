import 'package:flutter/material.dart';

enum GameSymbols { croix, cercle }

extension GameSymbolsExtension on GameSymbols {
  Icon get icon => Icon(iconData, size: 60, color: iconColor);

  Color get iconColor {
    switch (this) {
      case GameSymbols.croix:
        return Colors.purple;

      case GameSymbols.cercle:
        return Colors.green;
    }
  }

  IconData get iconData {
    switch (this) {
      case GameSymbols.croix:
        return Icons.close;

      case GameSymbols.cercle:
        return Icons.circle_outlined;
    }
  }
}
