// To parse this JSON data, do
//
//     final modelDetails = modelDetailsFromJson(jsonString);

import 'dart:convert';

ModelDetails modelDetailsFromJson(String str) =>
    ModelDetails.fromJson(json.decode(str));

String modelDetailsToJson(ModelDetails data) => json.encode(data.toJson());

class ModelDetails {
  String name;
  String dob;
  String email;
  String description;

  ModelDetails({
    required this.name,
    required this.dob,
    required this.email,
    required this.description,
  });

  factory ModelDetails.fromJson(Map<String, dynamic> json) => ModelDetails(
        name: json["name"],
        dob: json["DOB"],
        email: json["email"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "DOB": dob,
        "email": email,
        "description": description,
      };
}
