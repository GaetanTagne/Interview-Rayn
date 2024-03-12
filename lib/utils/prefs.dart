import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<SharedPreferences> get instance async {
    return await SharedPreferences.getInstance();
  }

  static Future<List<int>> getListOfInts(String key) async {
    return (await instance)
            .getStringList(key)
            ?.map((e) => int.parse(e))
            .toList() ??
        [];
  }

  static editListOfInts(String key, List<int> liste) async {
    return (await instance)
        .setStringList(key, liste.map((e) => e.toString()).toList());
  }

  static Future<Map<String, int?>> getInts(List<String> keys) async {
    SharedPreferences preferences = await instance;
    var data = <String, int?>{};
    for (var key in keys) {
      data[key] = preferences.getInt(key);
    }

    return data;
  }

  static setInts(Map<String, int?> data) async {
    SharedPreferences preferences = await instance;
    data.forEach((key, value) async {
      await preferences.setInt(key, value ?? 0);
    });
    return data;
  }

  static Future<String> getString(
      {required String key, required String defaut}) async {
    return (await instance).getString(key) ?? defaut;
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    return (await instance).setString(key, value);
  }

  static Future<bool> getBool({required String key}) async {
    return (await instance).getBool(key) ?? false;
  }

  static Future<int?> getInt({required String key}) async {
    return (await instance).getInt(key);
  }

  static setInt({required String key, required int value}) async {
    return (await instance).setInt(key, value);
  }

  static setBool({required String key, required bool value}) async {
    return (await instance).setBool(key, value);
  }

  static switchBool({required String key}) async =>
      await setBool(key: key, value: !(await getBool(key: key)));

  static deletePref({required String key}) async {
    return (await instance).remove(key);
  }
}
