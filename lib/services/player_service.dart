import '/models/player.dart';
import '/utils/prefs.dart';

abstract class PlayerService {
  static savePlayer(Player player) async {
    await _saveScore(player);
  }

  static _saveScore(Player player) async {
    await Prefs.setInt(key: "${player.name}_SCORE", value: player.score);
  }

  static Future<int?> getScore(Player player) async {
    return await Prefs.getInt(key: "${player.name}_SCORE");
  }
}
