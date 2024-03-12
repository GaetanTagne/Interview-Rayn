import 'package:equatable/equatable.dart';

import '/models/player.dart';
import '/vue_models/grille_controller.dart';

abstract class GrilleState extends Equatable {
  final Player p1;
  final Player p2;
  final Player currentPlayer;
  final Player? winner;

  List<List<Player?>> get grille;
  bool get partieEnCours => GrilleController(grille).continueGame;

  const GrilleState(
      {required this.p1,
      required this.p2,
      required this.currentPlayer,
      required this.winner});

  @override
  List<Object?> get props => [currentPlayer.name];
}

class InitState extends GrilleState {
  const InitState({required super.p1, required super.p2})
      : super(
          currentPlayer: p1,
          winner: null,
        );

  @override
  List<List<Player?>> get grille => [
        [null, null, null],
        [null, null, null],
        [null, null, null]
      ];
}

class RunningState extends GrilleState {
  @override
  final List<List<Player?>> grille;

  const RunningState(
      {required this.grille,
      required super.currentPlayer,
      required super.winner,
      required super.p1,
      required super.p2});
}
