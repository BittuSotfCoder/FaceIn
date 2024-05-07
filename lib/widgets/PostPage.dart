import 'package:flutter/material.dart' show BuildContext, CircleAvatar, Color, Colors, EdgeInsets, ElevatedButton, IconButton, Icons, InkWell, Material, StatelessWidget, TableRowInkWell, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/widgets.dart';

import 'TxtButton.dart';
class Postpage extends StatelessWidget{
  final String IdName;
  final String DateOfPost;
  final String? IconImg;
  final String? PostImg;
  Postpage({super.key,
    required this.IdName,
    required this.DateOfPost,
    required this.IconImg,
    required this.PostImg
  }
      );

  @override
  Widget build(BuildContext context) {
   return  Padding(
     padding:  EdgeInsets.only(top: 4.0),
     child: Center(

       child:  SingleChildScrollView(
         child: Column(
           children: [
             Container(
               height: 90,
               color: Colors.green,
               width: double.infinity,
               child: Material(
                 elevation: 4.0,
                 //Conatiner
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
         
                           Row(
                             children: [
                               CircleAvatar(
                                 radius: 20, // Adjust according to your preference
                                 backgroundImage: AssetImage(IconImg!),
                               ),
                               Padding(
                                 padding: EdgeInsets.only(left: 15.0),
                                 child: Expanded(
                                   flex: 1,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Row(
                                             children: [
                                               Text(IdName,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),)
                                               ,Text('\t\t')
                                               ,Icon(Icons.circle,size: 7,)
                                               ,InkWell(
                                                   onTap: (){},
                                                   child: Text('\tFollow',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color.fromRGBO(24, 119, 242, 1)),))
                                             ],
                                           )
                                           ,Padding(
                                             padding: EdgeInsets.only(top: 2.0),
                                             child: Text(DateOfPost,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
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
         
                           Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               IconButton(
                                 icon:  Icon(Icons.more_vert),
                                 onPressed: () {
                                   // Add your search functionality here
                                 },
                               ),
                               IconButton(
                                 icon:  Icon(Icons.close),
                                 onPressed: () {
                                   // Add your search functionality here
                                 },
                               ),
                             ],
                           )
         
                         ],
                       ),
                     ),
                     Row(children:[ Padding(
                       padding: const EdgeInsets.only(left: 8.0),
                       child: Text('Hello brother how are you? I am The Best '),
                     )])
                   ],
                 ),
                 // Add elevation if needed
               ),
             ),
         
             ///Heading.........................................
             Image.asset(PostImg!),
             /// bottom..........................................
             Container(
               height: 45,
               color: Colors.green,
               width: double.infinity,
               child:  Material(
                 elevation: 4.0,
                 child:
                 Padding(
                   padding: EdgeInsets.only(left: 15.0,right: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: [
                           Icon(Icons.thumb_up_alt,size: 20,color: Color.fromRGBO(24, 119, 242, 1),),
                           Text('\t10K',style: TextStyle(fontSize: 15),)
                         ],
                       ),
                       Row(
                         children: [
                           Row(
                             children: [
                               Text('487',style: TextStyle(fontSize: 15),),
                               Text('\tComments',style: TextStyle(fontSize: 15),)
                             ],
                           ),
                           Text('\t\t\t'),
                           Icon(Icons.circle,size: 7,),
                           Row(
                             children: [
                               Text('7788',style: TextStyle(fontSize: 15),),
                               Text('\tShares',style: TextStyle(fontSize: 15),)
                             ],
                           )
                         ],
                       )
         
                     ],
                   ),
                 )
                 ,
               ),
         
             ),
             Container(
               height: 45,
               color: Colors.green,
               width: double.infinity,
               child:  Material(
                 elevation: 4.0,
                 child:
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     InkWell(
                       onTap: (){},
                       child: Row(
                         children: [
                           Icon(Icons.thumb_up_outlined,size: 20,),
                           Text('\tLike',style: TextStyle(fontSize: 15),)
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: (){},
                       child: Row(
                         children: [
                           Icon(Icons.comment,size: 20,),
                           Text('\tComment',style: TextStyle(fontSize: 15),)
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: (){},
                       child: Row(
                         children: [
                           Icon(Icons.send,size: 20,),
                           Text('\tSend',style: TextStyle(fontSize: 15),)
                         ],
                       ),
                     ),
                     InkWell(
                       onTap: (){},
                       child: Row(
                         children: [
                           Icon(Icons.share,size: 20,),
                           Text('\tShare',style: TextStyle(fontSize: 15),)
                         ],
                       ),
                     )
         
                   ],
                 )
                 ,
               ),
         
             )
           ],
         ),
       ),
     ),
   );
  }





}