import 'package:facein/TabOnScreen/TabHome.dart';
import 'package:facein/TabOnScreen/TabOption.dart';
import 'package:facein/TabOnScreen/TabProfile.dart';
import 'package:facein/TabOnScreen/TabWatch.dart';
import 'package:flutter/material.dart';
import '../TabOnScreen/TabFriend.dart';
class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {

  int dt=3;
  var arrName=['Rajababu','Raman Sah','Bittu Kumar','ramesh','suresh','byte','Pintu','Saho','Piyush','Swati Singh'
  ];
  var PostImg=['lib/assets/images/asus.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/th2.jpeg','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg'];
  var IconImg=['lib/assets/images/bittu.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/th2.jpeg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg','lib/assets/images/asus.jpg',];




  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 5, child:
    Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xffebefee),
        title:  Padding(
          padding: EdgeInsets.only(top: 8.0, right: 10.0),
          child: Text(
            'FaceIndia',
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Head2',
                color: Color.fromRGBO(24, 119, 242, 1)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon:  Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
          IconButton(
            icon:  Icon(Icons.notifications),
            onPressed: () {
              // Add your notification functionality here
            },
          ),
          IconButton(
            icon:  Icon(Icons.message),
            onPressed: () {
              // Add your notification functionality here
            },
          ),
        ],
        bottom: TabBar(tabs: [
        Tab(
          icon: Icon(Icons.home),

        ),
        Tab(
          icon: Icon(Icons.video_collection_sharp),
        ),
        Tab(
          icon: Icon(Icons.supervised_user_circle),

        ),
        Tab(
          icon: Icon(Icons.person),
        ),
        Tab(
          icon: Icon(Icons.list_outlined),
        ),
      ],),
      ),
      body: TabBarView(children: [
        TabHome(),
        TabWatch(),
        TabFriend(),
        TabProfile(),
        TabOption()
      ],),
    ),
    );
  }
}
