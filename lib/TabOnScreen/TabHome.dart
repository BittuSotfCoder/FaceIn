import 'dart:convert';
import 'package:facein/Model/ModelUsers.dart';
import 'package:facein/Page/splasg.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/PostPage.dart';
import '../widgets/StoryPage.dart';
import '../widgets/whatMind.dart';

class TabHome extends StatefulWidget {
  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  List<ModelUsers> mode = [];
  String st = '';
  var _FindID;
  int dt = 3;
  var arrName = [
    'Rajababu',
    'Raman Sah',
    'Bittu Kumar',
    'ramesh',
    'suresh',
    'byte',
    'Pintu',
    'Saho',
    'Piyush',
    'Swati Singh'
  ];

  var PostImg = [
    'lib/assets/images/asus.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/gogle.png',
    'lib/assets/images/th2.jpeg',
    'lib/assets/images/sc.jpg',
    'lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/th3.jpeg',
    'lib/assets/images/th5.jpeg'
  ];

  var IconImg = [
    'lib/assets/images/bittu.jpg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/gogle.png',
    'lib/assets/images/sc.jpg',
    'lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg',
    'lib/assets/images/th2.jpeg',
    'lib/assets/images/bittuScotter.jpg',
    'lib/assets/images/th3.jpeg',
    'lib/assets/images/th5.jpeg',
    'lib/assets/images/asus.jpg',
  ];
  void func() async {
    var sharedPref = await SharedPreferences.getInstance();
    _FindID = sharedPref.getString(SplashScreenState.KEY_LOGIN);
    GetData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffa8edea), Color(0xfffed6e3)],
      )),
      child: SingleChildScrollView(
        child: Column(
          children: [
              // Stories Section
               whatMind(
              IdName: st,
              IconImg: PostImg[0],
            ),
              Container(
                height: 180,
                color: Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) => StoryPage(
                            IdName: arrName[index],
                            IconImg: IconImg[index],
                            PostImg: PostImg[index])),
                ),
              ),
              // Create Post Section
              // Posts Feed Section
              ...List.generate(arrName.length, (index) => Postpage(
                IdName: arrName[index],
                IconImg: IconImg[index],
                PostImg: PostImg[index],
                DateOfPost: '7 Apr')),
            ],
        ),
      ),
    );
  }

  Future<void> GetData() async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'api-key': 'ndeweidjwekdiwwednddw'
      };

      // final Map<String, dynamic> data = {"userid": "$_FindID"};
      final http.Response response = await http.get(
        Uri.parse(
            'https://facebackend-0uvr.onrender.com/api/v1/posts/$_FindID'),
        headers: headers,
      );
      final Map<String, dynamic> responseData = json.decode(response.body);
      for (Map<String, dynamic> index in responseData['data']) {
        mode.add(ModelUsers.fromJson(index));
      }
      st = mode[0].name;

      setState(() {});
    } catch (e) {
      // CustomToast.showToast(message: "User not found");
    }
  }
}
