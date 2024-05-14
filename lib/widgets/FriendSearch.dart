// ignore_for_file: unused_shown_name

import 'package:facein/widgets/ButtonUsable.dart';
import 'package:flutter/material.dart' show BuildContext, CircleAvatar, Color, Colors, EdgeInsets, ElevatedButton, IconButton, Icons, InkWell, Material, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/widgets.dart';
class FriendsSearch extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Container(
        height: 130,
        color: Colors.cyan,
        width: double.infinity,
        child: Material(
            elevation: 4.0, // Add elevation if needed
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0,left:15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Friends',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      IconButton(
                        icon:  Icon(Icons.search),
                        onPressed: () {
                          // Add your search functionality here
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                    ButtonUsable(btnName: 'Suggestion'),
                      SizedBox(width: 10,),
                      ButtonUsable(btnName: 'Yours Friends'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                      Text('Friends Request\t',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700))
                       ,Text('187',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.redAccent),)
                  ]

                      ),
                      InkWell(
                          onTap: (){},
                          child: Text('See all',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17,color:Color.fromRGBO(24, 119, 242, 1) ),))
                    ],
                  ),
                ],
              )
            )
        ),
      ),
    );
  }





}