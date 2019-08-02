import 'dart:convert';

class Player {
  int id;
  int teamId;
  String name;
  int number;
  DateTime createdAt;
  DateTime updatedAt;

  Player(
      {this.id,
      this.teamId,
      this.name,
      this.number,
      this.createdAt,
      this.updatedAt});

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"] == null ? null : int.parse(json["id"].toString()),
        teamId: json["team_id"] == null
            ? null
            : int.parse(json["team_id"].toString()),
        name: json["name"] == null ? null : json["name"].toString(),
        number: json["number"] == null
            ? null
            : int.parse(json["number"].toString()),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"].toString()),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"].toString()),
      );

  Map<String, dynamic> toMap() {
    final _map = Map<String, dynamic>();
    if (id != null) {
      _map["id"] = id;
    }
    if (name != null) {
      _map["name"] = name;
    }
    if (number != null) {
      _map["number"] = number;
    }

    if (teamId != null) {
      _map["team_id"] = teamId;
    }

    return _map;
  }

  String toJson() {
    return json.encode(toMap());
  }
}
