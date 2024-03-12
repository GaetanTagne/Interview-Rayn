import 'package:flutter/material.dart';

import '/models/game_symbole.dart';
import '/models/paire.dart';
import '/models/player.dart';
import '/services/player_service.dart';
import '/vue_models/grille_controller.dart';

class GrilleProvider extends ChangeNotifier {
  late Player p1;
  late Player p2;
  late Player currentPlayer;

  List<List<Player?>> grille = [
    [null, null, null],
    [null, null, null],
    [null, null, null]
  ];

  GrilleProvider({Player? firstP, Player? secondP}) {
    p1 = firstP ??
        Player(symboleType: GameSymbols.cercle, name: "Player 1", score: 0);
    p2 = secondP ??
        Player(symboleType: GameSymbols.croix, name: "Player 2", score: 0);
    currentPlayer = p1;
    loadHistory();
  }

  Player? winner;
  bool get partieEnCours => GrilleController(grille).continueGame;

  void loadHistory() async {
    p1.score = (await PlayerService.getScore(p1)) ?? 0;
    p2.score = (await PlayerService.getScore(p2)) ?? 0;
    currentPlayer = p1;

    notifyListeners();
  }

  resetHistory() async {
    resetGame();
    p1.resetScore();
    await PlayerService.savePlayer(p1);
    p2.resetScore();
    await PlayerService.savePlayer(p2);
  }

  void resetGame() {
    grille = [
      [null, null, null],
      [null, null, null],
      [null, null, null],
    ];
    notifyListeners();
  }

  saveGameWinner() async {
    winner?.incermentScore();
    if (winner != null) {
      await PlayerService.savePlayer(winner!);
    }
  }

  switchCurrentPlayer() {
    currentPlayer = (currentPlayer == p1) ? p2 : p1;
    notifyListeners();
  }

  onCellClicked(Pair cell) {
    if (GrilleController(grille).actionPossible(cell)) {
      grille[cell.first][cell.second] = currentPlayer;
      switchCurrentPlayer();
      winner = GrilleController(grille).getWinner();
      saveGameWinner();
    }

    notifyListeners();
  }
}
