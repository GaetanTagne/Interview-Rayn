import 'package:flutter/material.dart';

import 'game_symbole.dart';

class Player {
  String name;
  int score;
  GameSymbols symboleType;

  @override
  String toString() {
    return name;
  }

  //On limite les comparaisons au "name", pour le besoin
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode ^ name.hashCode;

  Player({required this.symboleType, required this.name, required this.score});

  Icon get icon {
    return symboleType.icon;
  }

  void incermentScore() {
    score++;
  }

  void resetScore() {
    score = 0;
  }
}
