// To parse this JSON data, do
//
//     final dashboardAllTaskModelResponse = dashboardAllTaskModelResponseFromJson(jsonString);

import 'dart:convert';

import 'package:todo_app/src/features/dashboard/domain/entities/response/dashboard_alltask_entity_response.dart';

DashboardAllTaskModelResponse dashboardAllTaskModelResponseFromJson(String str) => DashboardAllTaskModelResponse.fromJson(json.decode(str));

String dashboardAllTaskModelResponseToJson(DashboardAllTaskModelResponse data) => json.encode(data.toJson());

class DashboardAllTaskModelResponse extends DashboardAllTaskEntityResponse{
  DashboardAllTaskModelResponse.fromJson(Map<String, dynamic> json){
      count = json["count"] == null ? null : json["count"];
      data = json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    "count": count == null ? null : count,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => (x as Datum).toJson())),
  };
}

class Datum extends DatumEntity{
  Datum.fromJson(Map<String, dynamic> json){
      completed = json["completed"] == null ? null : json["completed"];
      id = json["_id"] == null ? null : json["_id"];
      description = json["description"] == null ? null : json["description"];
      owner = json["owner"] == null ? null : json["owner"];
      createdAt = json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]);
      updatedAt = json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]);
      v = json["__v"] == null ? null : json["__v"];
  }

  Map<String, dynamic> toJson() => {
    "completed": completed == null ? null : completed,
    "_id": id == null ? null : id,
    "description": description == null ? null : description,
    "owner": owner == null ? null : owner,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
  };
}
