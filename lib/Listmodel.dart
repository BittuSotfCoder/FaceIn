// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:facein/Model/ModelUsers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ClassesLibrary/Res.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelUsers> mode = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetData(), // Assuming fetchData() returns a Future<List<String>>
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: mode.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.cyanAccent,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'signuptime: ${mode[index].signuptime}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Name: ${mode[index].name}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'email: ${mode[index].email}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'userid: ${mode[index].userid}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'password: ${mode[index].password}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                  ),
                );
              });
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // ignore: non_constant_identifier_names
  Future<List<ModelUsers>> GetData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'api-key': 'ndeweidjwekdiwwednddw'
    };
    var response = await http.get(
        Uri.parse('https://nodejsapidata.onrender.com/get-users'),
        headers: headers);
    Map<String, dynamic> responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in responseData['data']) {
        mode.add(ModelUsers.fromJson(index));
      }
      return mode;
    } else {
      return mode;
    }
  }
}
