import 'package:flutter/material.dart';
import 'package:leaderboard/src/data/source_static_data.dart';
import 'package:leaderboard/src/models/source_model.dart';

class DataController with ChangeNotifier {
  List<SourceModel> allSources = sources;

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

    print(_firstSources);
    print(_secondSources);

    notifyListeners();
  }
}
