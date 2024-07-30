// To parse this JSON data, do
//
//     final sources = sourcesFromJson(jsonString);

import 'dart:convert';

List<SourceModel> sourcesFromJson(String str) => List<SourceModel>.from(
    json.decode(str).map((x) => SourceModel.fromJson(x)));

String sourcesToJson(List<SourceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SourceModel {
  int id;
  String fullName;
  String sourceName;
  String phone;
  String email;
  dynamic deletedAt;
  TeamSource teamSource;
  Position position;
  int leadCount;
  String photo;
  int place;

  SourceModel({
    required this.id,
    required this.fullName,
    required this.sourceName,
    required this.phone,
    required this.email,
    required this.deletedAt,
    required this.teamSource,
    required this.position,
    required this.leadCount,
    required this.photo,
    required this.place,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        fullName: json["fullName"],
        sourceName: json["sourceName"],
        phone: json["phone"],
        email: json["email"],
        deletedAt: json["deletedAt"],
        teamSource: TeamSource.fromJson(json["teamSource"]),
        position: Position.fromJson(json["position"]),
        leadCount: json["leadCount"],
        photo: json["photo"],
        place: json["place"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "sourceName": sourceName,
        "phone": phone,
        "email": email,
        "deletedAt": deletedAt,
        "teamSource": teamSource.toJson(),
        "position": position.toJson(),
        "leadCount": leadCount,
        "photo": photo,
        "place": place,
      };
}

class Position {
  int id;
  String name;

  Position({
    required this.id,
    required this.name,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class TeamSource {
  int id;
  String name;
  dynamic deletedAt;

  TeamSource({
    required this.id,
    required this.name,
    required this.deletedAt,
  });

  factory TeamSource.fromJson(Map<String, dynamic> json) => TeamSource(
        id: json["id"],
        name: json["name"],
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deletedAt": deletedAt,
      };
}
