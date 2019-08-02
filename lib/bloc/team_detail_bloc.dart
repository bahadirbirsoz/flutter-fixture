import 'package:flutter/material.dart';
import 'package:fixture/config.dart';

import 'package:fixture/model/Team.dart';
export 'package:fixture/model/Team.dart';

import 'package:fixture/model/Player.dart';
export 'package:fixture/model/Player.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamDetailBloc extends ChangeNotifier {
  Team _team;
  Team get team => _team;

  bool _loading = true;
  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  List<Player> _playerList;
  List<Player> get playerList => _playerList;

  set team(Team value) {
    if (_team == null || value.id != _team?.id) {
      _team = value;
      _loadPlayers();
    }
  }

  _loadPlayers() {
    loading = true;
    http.get(BASE_URL + 'players?team_id='+ _team.id.toString() ).then((response) {
      _playerList = List<Player>.from(
          json.decode(response.body).map((item) => Player.fromJson(item)));
      loading = false;
    });
  }
}
