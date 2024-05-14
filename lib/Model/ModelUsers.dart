// To parse this JSON data, do
//
//     final modelUsers = modelUsersFromJson(jsonString);

import 'dart:convert';

List<ModelUsers> modelUsersFromJson(String str) => List<ModelUsers>.from(json.decode(str).map((x) => ModelUsers.fromJson(x)));

String modelUsersToJson(List<ModelUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUsers {
    String name;
    DateTime dob;
    String email;
    String password;
    String userid;

    ModelUsers({
        required this.name,
        required this.dob,
        required this.email,
        required this.password,
        required this.userid,
    });

    factory ModelUsers.fromJson(Map<String, dynamic> json) => ModelUsers(
        name: json["name"],
        dob: DateTime.parse(json["DOB"]),
        email: json["email"],
        password: json["password"],
        userid: json["userid"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "email": email,
        "password": password,
        "userid": userid,
    };
}
