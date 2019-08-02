import 'package:flutter/material.dart';
import 'package:fixture/config.dart';

import 'package:fixture/model/Team.dart';
export 'package:fixture/model/Team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamListBloc extends ChangeNotifier {
  bool _loading;

  bool get loading {
    if (_loading == null) {
      _load();
      _loading = true;
    }
    return _loading;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Team> _teamList;
  List<Team> get teamList => _teamList;

  _load() {
    http.get(BASE_URL + "teams").then((response) {
      _teamList = List<Team>.from(
          json.decode(response.body).map((item) => Team.fromJson(item)));
      loading = false;
    });
  }
}
