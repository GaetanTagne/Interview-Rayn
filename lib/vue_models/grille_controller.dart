import '../models/paire.dart';
import '../models/player.dart';

class GrilleController {
  final List<List<Player?>> grille;

  GrilleController(this.grille);

  cleanGrille() {
    for (var line in grille) {
      for (var i = 0; i < grille.length; i++) {
        line[i] = null;
      }
    }
  }

  bool actionPossible(Pair paire) =>
      continueGame && grille[paire.first][paire.second] == null;

  bool get continueGame {
    return getWinner() == null &&
        grille.expand((element) => element).toList().contains(null);
  }

  Player? getWinner() {
    for (var line in grille) {
      if (line.toSet().length == 1 && line[0] != null) {
        return line[0];
      }
    }

    // Check les colonnes
    for (var i = 0; i < grille.length; i++) {
      if (grille.map((line) => line[i]).toSet().length == 1 &&
          grille[0][i] != null) {
        return grille[0][i];
      }
    }

    // Check la diagonale principale
    if (grille[0][0] == grille[1][1] &&
        grille[1][1] == grille[2][2] &&
        (grille[0][0] != null)) {
      return grille[0][0];
    }

    // Check la diagonale secondaire
    if (grille[0][2] == grille[1][1] &&
        grille[1][1] == grille[2][0] &&
        (grille[0][2] != null)) {
      return grille[0][2];
    }
    return null;
  }
}
