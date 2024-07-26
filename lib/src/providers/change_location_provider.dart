import 'package:flutter/material.dart';

class ChangeLocationProvider with ChangeNotifier {
  List<String> locations = [
    'TPIH Global',
    'TPIH Miami',
    'TPIH Orlando',
  ];

  int _currentIndex = 0;

  String get location => locations[_currentIndex];

  int get locationId => _currentIndex;

  void nextLocation() {
    if (_currentIndex < locations.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousLocation() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }
}
