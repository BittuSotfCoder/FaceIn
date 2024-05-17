import 'dart:convert';

import 'package:facein/ClassesLibrary/Res.dart';
import 'package:facein/Page/splasg.dart';
import 'package:facein/widgets/CustomToast.dart';
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
  String st = '';
  var _FindID, USERDATA;
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
  
    setState(() {
    });
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
            whatMind(
              IdName: st,
              IconImg: PostImg[0],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  height: 150,
                  color: Colors.cyan,
                  width: double.infinity,
                  child: Material(
                    elevation: 4.0, // Add elevation if needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return StoryPage(
                            IdName: arrName[index],
                            IconImg: IconImg[index],
                            PostImg: PostImg[index]);
                      },
                      itemCount: arrName.length,
                    ),
                  ),
                )),
            Postpage(
                IdName: arrName[0],
                IconImg: IconImg[0],
                PostImg: PostImg[0],
                DateOfPost: '7 Apr'),
            Postpage(
                IdName: arrName[1],
                IconImg: IconImg[1],
                PostImg: PostImg[1],
                DateOfPost: '7 Mar'),
            Postpage(
                IdName: arrName[2],
                IconImg: IconImg[2],
                PostImg: PostImg[2],
                DateOfPost: '7 Dec'),
            Postpage(
                IdName: arrName[3],
                IconImg: IconImg[3],
                PostImg: PostImg[3],
                DateOfPost: '7 Jan'),
            Postpage(
                IdName: arrName[4],
                IconImg: IconImg[4],
                PostImg: PostImg[4],
                DateOfPost: '7 Feb')
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
      final Map<String, dynamic> data = {
        "userid": "$_FindID"
      };
      final http.Response response = await http.post(
        Uri.parse(Res().getString('get-user-details')),
        headers: headers,
        body: jsonEncode(data),
      );
      final Map<String, dynamic> responseData = json.decode(response.body);

      USERDATA = responseData['data'];
      st = USERDATA['name'];
      setState(() {});
    } catch (e) {
      // CustomToast.showToast(message: "User not found");
    }
  }
}
