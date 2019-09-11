import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences _pref;
  static SharedPref _instance;

  SharedPref._();

  Future<void> _init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<SharedPref> getInstance() async {
    if (_instance == null) {
      _instance = SharedPref._();
      await _instance._init();
    }
    return _instance;
  }

  static const String SEEN = 'seen';

  void _setBool(String key, bool val) {
    _pref.setBool(key, val);
  }

  bool _getBool(String key) {
    return _pref.getBool(key);
  }

  void setSeen() {
    _setBool(SEEN, true);
  }

  bool getSeen() {
    return _getBool(SEEN);
  }
}
