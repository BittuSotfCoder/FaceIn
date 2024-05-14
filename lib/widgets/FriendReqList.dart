// ignore: unused_shown_name
import 'package:flutter/material.dart' show BuildContext, CircleAvatar, Color, Colors, EdgeInsets, ElevatedButton, IconButton, Icons, InkWell, Material, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/widgets.dart';
import 'ButtonUsable.dart';

class FriendsReqList extends StatelessWidget{

  final String IdName;
  final String DateOfPost;
  final String? IconImg;
  final String? PostImg;
  FriendsReqList({super.key,
    required this.IdName,
    required this.DateOfPost,
    required this.IconImg,
    required this.PostImg
  }
      );


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(top: 1.0),
        child: Container(
          height: 110,
          width: double.infinity,
          child: Material(
            elevation: 4.0,
            //Conatiner
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35, // Adjust according to your preference
                              backgroundImage: AssetImage(PostImg!),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("${IdName}\t\t",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                            Icon(Icons.circle,size: 5,)
                                            ,Text('${DateOfPost} ago',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Color.fromRGBO(24, 119, 242, 1)),)
                                          ],
                                        )
                                        ,Padding(
                                          padding: EdgeInsets.only(top: 2.0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 10, // Adjust according to your preference
                                                backgroundImage: AssetImage(IconImg!),
                                              ),CircleAvatar(
                                                radius: 10, // Adjust according to your preference
                                                backgroundImage: AssetImage(PostImg!),
                                              ),
                                              Text('\t\t6 Mutual friends',style: TextStyle(color: Colors.black87),)
                                            ],
                                          )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 2.0),
                                            child: Row(
                                              children: [
                                                ButtonUsable(btnName: '    Confirm     '  ,btnColor:Color.fromRGBO(24, 119, 242, 1),txtColor: Colors.white,),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ButtonUsable(btnName: '      Delete      ',btnColor: Colors.white70),
                                              ],
                                            )
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Draw Line
                    
                          ],
                        ),
                    
                    
                    
                      ],
                    ),
                  ),
                )
              ],
            ),
            // Add elevation if needed
          ),
        ),
      )
      ;
  }





}