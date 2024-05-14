// To parse this JSON data, do
//
//     final modelUsers = modelUsersFromJson(jsonString);

import 'dart:convert';

ModelUsers modelUsersFromJson(String str) => ModelUsers.fromJson(json.decode(str));

String modelUsersToJson(ModelUsers data) => json.encode(data.toJson());

class ModelUsers {
    String srNo;
    DateTime signuptime;
    String name;
    DateTime dob;
    String email;
    String password;
    String userid;
    dynamic image;
    dynamic frameimg;
    dynamic description;

    ModelUsers({
        required this.srNo,
        required this.signuptime,
        required this.name,
        required this.dob,
        required this.email,
        required this.password,
        required this.userid,
        required this.image,
        required this.frameimg,
        required this.description,
    });

    factory ModelUsers.fromJson(Map<String, dynamic> json) => ModelUsers(
        srNo: json["SrNo"],
        signuptime: DateTime.parse(json["signuptime"]),
        name: json["name"],
        dob: DateTime.parse(json["DOB"]),
        email: json["email"],
        password: json["password"],
        userid: json["userid"],
        image: json["image"],
        frameimg: json["frameimg"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "signuptime": signuptime.toIso8601String(),
        "name": name,
        "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "email": email,
        "password": password,
        "userid": userid,
        "image": image,
        "frameimg": frameimg,
        "description": description,
    };
}
