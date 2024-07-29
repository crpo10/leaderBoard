import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/src/data/source_static_data.dart';
import 'package:leaderboard/src/models/source_model.dart';
import 'package:leaderboard/src/models/sources_model.dart';
import 'package:leaderboard/src/preferences/user_preferences.dart';

class DataController with ChangeNotifier {
  final _dio = Dio();
  List<SourceModel> allSources = [];
  final _prefs = UserPreferences();

  final List<SourceModel> _firstSources = [];
  final List<SourceModel> _secondSources = [];

  List<SourceModel> get firstSources => _firstSources;
  List<SourceModel> get secondSources => _secondSources;

  void assignDataToEachList() {
    _firstSources.clear();
    _secondSources.clear();

    if (allSources.length <= 8) {
      _firstSources.addAll(allSources);
    } else {
      _firstSources.addAll(allSources.sublist(0, 8));
      _secondSources.addAll(allSources.sublist(8));
    }

    print("First Source  $_firstSources");
    print(_secondSources);
  }

  Future<List<SourceModel>> getSources(int officeID) async {
    try {
      final response = await _dio.post('http://localhost:3000/sources/filter/',
          options: Options(
            headers: {'Authorization': 'Bearer ${_prefs.token}'},
          ),
          data: {
            "startDate": "2024/06/01",
            "endDate": "2024/07/30",
            "officeId": 1
          });

      allSources = sourcesFromJson(jsonEncode(response.data));
      assignDataToEachList();
      return allSources;
    } on DioException catch (e) {
      print(e.response);
      return [];
    }
  }
}
