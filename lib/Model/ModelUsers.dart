// To parse this JSON data, do
//
//     final modelUsers = modelUsersFromJson(jsonString);

import 'dart:convert';

List<ModelUsers> modelUsersFromJson(String str) => List<ModelUsers>.from(json.decode(str).map((x) => ModelUsers.fromJson(x)));

String modelUsersToJson(List<ModelUsers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelUsers {
    String name;
    String email;
     String userid;
    String password;
    ModelUsers({
        required this.name,
        required this.email,
        required this.userid,
        required this.password
    });

    factory ModelUsers.fromJson(Map<String, dynamic> json) => ModelUsers(
        name: json["name"],
        email: json["email"],
        userid: json["userid"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
         "userid": userid,
        "password": password,
    };
}
