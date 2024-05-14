// ignore_for_file: unused_shown_name

import 'package:facein/widgets/whatMind.dart';
import 'package:flutter/material.dart' show AppBar, AssetImage, Axis, Border, BorderRadius, BottomNavigationBar, BottomNavigationBarItem, BottomNavigationBarType, BoxDecoration, BoxFit, BoxShape, BuildContext, Center, CircleAvatar, Color, Colors, Column, Container, CrossAxisAlignment, DecorationImage, EdgeInsets, Expanded, FontWeight, Icon, IconButton, Icons, Image, LinearGradient, ListView, MainAxisAlignment, Material, Padding, Row, Scaffold, SingleChildScrollView, SizedBox, State, StatefulWidget, Text, TextStyle, Widget;
import '../widgets/StoryPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  int dt=3;
  var arrName=['Rajababu','Raman Sah','Bittu Kumar','ramesh','suresh','byte','Pintu','Saho','Piyush','Swati Singh'
  ];
  var PostImg=['lib/assets/images/asus.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/th2.jpeg','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg'];
  var IconImg=['lib/assets/images/bittu.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/th2.jpeg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg','lib/assets/images/asus.jpg',];



  var _CurrentIndex = 0;
 final  tab = [

    Container(
      height: double.infinity,
      width: double.infinity,
      decoration:  BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xffa8edea), Color(0xfffed6e3)],
      )),
      child: ListView(
        children: [
          whatMind(IdName:'Bittu kuumar', IconImg: 'lib/assets/images/th1.jpeg',),
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
                      return StoryPage(IdName: 'Byte',IconImg:'lib/assets/images/gogle.png',PostImg:'lib/assets/images/bittuScotter.jpg');
                    }, itemCount: 10,
                  ),),
              )
          ),

          ],

      ),
      
    ),

    // Services







    const Center(
      child: Text('service'),
    ),
    const Center(
      child: Text('Scanner'),
    ),
    const Center(
      child: Text('History'),
    ),
    const Center(
      child: Text('Offers'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 8),
        //   child: const CircleAvatar(
        //     backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        //   ),
        // ),
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
      ),
      body: tab[_CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _CurrentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Color(0xffebefee),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_sharp),
            label: 'Watch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _CurrentIndex = index;
          });
        },
      ),
    );
  }
}
