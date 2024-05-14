import 'package:f'
    'acein/widgets/PostPage.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget{
  @override
  State<TestPage> createState() => _SplashState();
}

class _SplashState extends State<TestPage> {
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

    return Scaffold(
      body:ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Postpage(IdName: arrName[index],IconImg:IconImg[index],PostImg:PostImg[index], DateOfPost: '7 x',);
        }, itemCount: arrName.length,
      )

      );

  }
}