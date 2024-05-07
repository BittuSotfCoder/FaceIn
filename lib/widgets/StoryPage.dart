import 'package:flutter/material.dart' show BuildContext, CircleAvatar, Color, Colors, EdgeInsets, Icons, Material, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/widgets.dart';
class StoryPage extends StatelessWidget{
  final String IdName;
  final String? IconImg;
  final String? PostImg;



  StoryPage({super.key,
    required this.IdName,
    required this.IconImg,
    required this.PostImg
  }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Container(
        width: 100,

        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage(PostImg!),
            fit: BoxFit.cover, // Adjust this based on your needs
            ),
          color:   Color(0xff19e7b3),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: Colors.black, // Adjust the color of the border as needed
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(3.0),

              child: Container(
                margin:  EdgeInsets.only(right: 50),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 3.0,
                    color:  Color.fromARGB(0, 98, 2 , 105),
                  ),
                ),

                child:  Center(
                  child:  CircleAvatar(
                    radius: 50, // Adjust according to your preference
                    backgroundImage: AssetImage(IconImg!), // Replace with your image asset
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }





}