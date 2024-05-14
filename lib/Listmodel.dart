import 'dart:convert';
import 'package:facein/Model/ModelUsers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                    child: Column(children: [
                      Text(
                        'id :${mode[index].email}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 10),
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

  Future<List<ModelUsers>> GetData() async {
     Map<String, String> headers = {
        'Content-Type': 'application/json',
        'api-key': 'ndeweidjwekdiwwednddw'
      };
    var response =
        await http.get(Uri.parse('http://192.168.1.40/API/jsonDataInsert.php?action=get-users'),headers: headers);
    var data = jsonDecode(response.body.toString());
    // ignore: avoid_print
    print(data);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        mode.add(ModelUsers.fromJson(index));
      }
      return mode;
    } else {
      return mode;
    }
  }
}
