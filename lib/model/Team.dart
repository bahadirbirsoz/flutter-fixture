import 'dart:convert';
class Team {
  int id;
  String team;
  int strength;
  DateTime createdAt;
  DateTime updatedAt;

  Team({this.id, this.team, this.strength, this.createdAt, this.updatedAt});


  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"] == null ? null : int.parse(json["id"].toString()),
    team: json["team"] == null ? null : json["team"].toString(),
    strength: json["strength"] == null ? null : int.parse(json["strength"].toString()),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"].toString()),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"].toString()),
  );

  Map<String,dynamic> toMap(){
    final _map = Map<String,dynamic>();
    if(id != null){
      _map["id"] = id;
    }
    if(team != null){
      _map["team"] = team;
    }
    if(strength != null){
      _map["strength"] = strength;
    }
    return _map;

  }

  String toJson(){
    return json.encode(toMap());
  }



}
