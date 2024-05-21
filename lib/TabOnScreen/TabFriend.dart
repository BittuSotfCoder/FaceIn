import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/FriendReqList.dart';
import '../widgets/FriendSearch.dart';
class TabFriend extends StatelessWidget{
  int dt=3;
  var arrName=['Rajababu','Raman Sah','Bittu Kumar','ramesh','suresh','byte','Pintu','Saho','Piyush','Swati Singh',
  ];
  var PostImg=['lib/assets/images/asus.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/th2.jpeg','lib/assets/images/bittu.jpg','lib/assets/images/bittuScotter.jpg'
    ,'lib/assets/images/gogle.png','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/th2.jpeg','lib/assets/images/bittu.jpg','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg'];
  var IconImg=['lib/assets/images/bittu.jpg','lib/assets/images/bittuScotter.jpg'
  ,'lib/assets/images/gogle.png','lib/assets/images/sc.jpg','lib/assets/images/th.jpeg',
    'lib/assets/images/th1.jpeg','lib/assets/images/th2.jpeg','lib/assets/images/bittu.jpg','lib/assets/images/bittuScotter.jpg','lib/assets/images/bittuScotter.jpg','lib/assets/images/th3.jpeg','lib/assets/images/th5.jpeg','lib/assets/images/asus.jpg',];



  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffa8edea), Color(0xfffed6e3)],
            )),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              // Stories Section
           FriendsSearch(),
              ...List.generate(arrName.length, (index) =>  FriendsReqList(IdName: arrName[index],IconImg:IconImg[index+1],PostImg:PostImg[index], DateOfPost: '${index+1}day',)),
            ],
          ),
        ),

      );
  }

}