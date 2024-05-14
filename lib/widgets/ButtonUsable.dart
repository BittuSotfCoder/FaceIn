import 'dart:ui';
// ignore: unused_shown_name
import 'package:flutter/material.dart' show Border, BorderRadius, BorderSide, BoxDecoration, BuildContext, ButtonStyle, Center, Color, Colors, EdgeInsets, ElevatedButton, MaterialStateProperty, RoundedRectangleBorder, StatelessWidget, Text, TextStyle, VoidCallback, Widget;
class ButtonUsable extends StatelessWidget{
  final String btnName;
  final Color? btnColor;
  final Color? txtColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const ButtonUsable({super.key, required this.btnName,
    this.btnColor=Colors.white24,
    this.textStyle,
    this.callback, this.txtColor=Colors.black
    ,});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
        onPressed: () {
          // Add your onPressed functionality here
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btnColor!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
        child: Text(btnName,style: TextStyle(fontWeight: FontWeight.w500,color: txtColor),),
      ),
    );
  }


}