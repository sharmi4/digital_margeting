import 'package:shared_preferences/shared_preferences.dart';
import '../model/statergy_model.dart';

class StrategyLocalStorage {
  static Future<void> saveBusinessInfo(StrategyInputModel model) async {
    final prefs = await SharedPreferences.getInstance();
    model.toJson().forEach((key, value) {
      prefs.setString(key, value);
    });
  }
}
