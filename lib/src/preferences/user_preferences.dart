import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();
  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> getSharedPreferencesInstance() async {
    _prefs = await SharedPreferences.getInstance().catchError((e) {
      print("Shared Preferences Error : $e");
      return e;
    });
    return true;
  }

  Future setToken(String? value) async {
    await _prefs.setString('token', value!);
  }

  get token {
    return _prefs.getString('token');
  }

  Future clearToken() {
    return _prefs.clear();
  }
}
