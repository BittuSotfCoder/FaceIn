import 'package:flutter/material.dart' show Border, BorderRadius, BoxDecoration, BuildContext, Color, Colors, EdgeInsets, ElevatedButton, FontStyle, FontWeight, RoundedRectangleBorder, StatelessWidget, Text, TextButton, TextDecoration, TextStyle, VoidCallback, Widget;
import 'package:flutter/src/widgets/container.dart';

class TxtButton extends StatelessWidget{
  final String btnName;
  final double? btnSize;
  final Color? btnColor;
  final String? TxtFamily;
  final FontWeight? Txtfontweight;
  final FontStyle? TxtfontStyle;
  final VoidCallback? callback;

  const TxtButton(
      {super.key,
        required this.btnName,
        this.btnSize,
        this.btnColor=Colors.black,
        this.TxtFamily='RobotSlab',
        this.Txtfontweight,
        this.TxtfontStyle,
        required this.callback
      });

  @override
  Widget build(BuildContext context) {
    return TextButton
      (
      onPressed: () {
        callback;
        },
      child: Text(btnName ,
        style: TextStyle(
            decorationColor: btnColor, // Optional: Set underline color
            decorationThickness: 1,
            fontFamily:TxtFamily,
            fontWeight: Txtfontweight,
          color: btnColor,
          fontSize: btnSize
          // Optional: Set underline thickness
        ),
      ));


  }









}