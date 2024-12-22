// To parse this JSON data, do
//
//     final fitness = fitnessFromJson(jsonString);

import 'dart:convert';

List<Fitness> fitnessFromJson(String str) =>
    List<Fitness>.from(json.decode(str).map((x) => Fitness.fromJson(x)));

String fitnessToJson(List<Fitness> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fitness {
  String id;
  String time;
  String location;
  String date;
  String trainingName;
  String trainer;
  String details;

  Fitness({
    required this.id,
    required this.time,
    required this.location,
    required this.date,
    required this.trainingName,
    required this.trainer,
    required this.details,
  });

  factory Fitness.fromJson(Map<String, dynamic> json) => Fitness(
        id: json["id"],
        time: json["time"],
        location: json["location"],
        date: json["date"],
        trainingName: json["trainingName"],
        trainer: json["trainer"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "location": location,
        "date": date,
        "trainingName": trainingName,
        "trainer": trainer,
        "details": details,
      };
}
