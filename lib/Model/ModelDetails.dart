// To parse this JSON data, do
//
//     final modelDetails = modelDetailsFromJson(jsonString);

import 'dart:convert';

ModelDetails modelDetailsFromJson(String str) => ModelDetails.fromJson(json.decode(str));

String modelDetailsToJson(ModelDetails data) => json.encode(data.toJson());

class ModelDetails {
    String name;
    String email;
    String password;

    ModelDetails({
        required this.name,
        required this.email,
        required this.password,
    });

    factory ModelDetails.fromJson(Map<String, dynamic> json) => ModelDetails(
        name: json["name"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
    };
}
