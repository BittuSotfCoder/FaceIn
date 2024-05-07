import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, Color, Colors, EdgeInsets, ElevatedButton, RoundedRectangleBorder, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
import 'package:flutter/src/widgets/container.dart';

class RoundButton extends StatelessWidget{
   final String btnName;
  final Color? bgColor;
   final TextStyle? textStyle;
   final VoidCallback? callback;

   const RoundButton({super.key, required this.btnName,
     this.bgColor=Colors.deepPurple,
     this.textStyle,
     this.callback,});

  @override
  Widget build(BuildContext context) {
   return  Container(width: 220,
     decoration: BoxDecoration(
       color: bgColor,
       // color: Color(0xffa8edea),
       borderRadius: BorderRadius.circular(20.0),
       border: Border.all(
         width: 1.0,
         color: Colors.black, // Adjust the color of the border as needed
       ),
       // Adjust the value to change the circle size

     ),
     child: ElevatedButton(
       onPressed: () {
         callback!();
       },
       style: ElevatedButton.styleFrom(
         foregroundColor: const Color(0xffa8edea), // Text color
         backgroundColor:bgColor ,


         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20.0),


         ),
         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
       ),
       child: Text(
         btnName,
         style: textStyle,
       ),
     ),
   );
  }







  // @override
  // Widget build(BuildContext context) {
  //     return
  //       ElevatedButton(onPressed: (){
  //      callback!();
  //     },
  //     child: Row(
  //       children: [
  //         Text(btnName,style: textStyle,)
  //       ],
  //
  //     ),
  //     style: ElevatedButton.styleFrom(
  //         backgroundColor: bgColor,
  //       shadowColor: bgColor,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(11),
  //       )
  //     ),
  //     );
  // }

}