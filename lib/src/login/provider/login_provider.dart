import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/src/preferences/user_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final _dio = Dio();

  final _prefs = UserPreferences();

  bool _cargando = false;
  String? _errorMessage;

  bool get cargando => _cargando;
  String? get errorMessage => _errorMessage;

  set setCargando(value) {
    _cargando = value;
    notifyListeners();
  }

  Future login(String username, String password) async {
    setCargando = true;
    const url = 'http://localhost:3000/auth/login';

    try {
      final resp = await _dio.post(
        url,
        data: {
          "username": username,
          "password": password,
        },
      );

      _errorMessage = null;

      print(resp.data['access_token']);
      _prefs.setToken(resp.data['access_token']);
      setCargando = false;
    } on DioException catch (e) {
      setCargando = false;

      _errorMessage = e.response?.data ?? 'Log in Error ';

      print(e);
      return e;
    }
  }
}
